From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2020 22:00:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/qpid-proton: bump to version 0.32.0
Message-ID: <20201004200050.1737235-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update site to get latest version
- Remove all patches (already in version)
- License file has been renamed and slightly updated to change paths
  since version 0.23.0 and
  https://github.com/apache/qpid-proton/commit/37136940e3077f25ce58c94775f48c66f666f4a8
- Add a patch to disable tests
- Remove BUILD_{JAVA,JAVASCRIPT,PERL,PHP} as those bindings don't exist
  anymore
- Disable go binding
- Disable fuzz testing
- Add new optional libuv and jsoncpp dependencies
- Update QPID_PROTON_REMOVE_USELESS_FILES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ....txt-allow-the-user-to-disable-tests.patch | 500 ++++++++++++++++++
 ...ON-1326-Modify-openssl-DH-code-to-wo.patch |  78 ---
 ...ore-anonymous-cyphers-by-lowering-Op.patch |  62 ---
 ...openssl-error-handling-causing-spuri.patch |  58 --
 ...l-openssl-add-libressl-compatibility.patch |  53 --
 package/qpid-proton/qpid-proton.hash          |   7 +-
 package/qpid-proton/qpid-proton.mk            |  28 +-
 7 files changed, 522 insertions(+), 264 deletions(-)
 create mode 100644 package/qpid-proton/0001-CMakeLists.txt-allow-the-user-to-disable-tests.patch
 delete mode 100644 package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch
 delete mode 100644 package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch
 delete mode 100644 package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch
 delete mode 100644 package/qpid-proton/0004-src-ssl-openssl-add-libressl-compatibility.patch

diff --git a/package/qpid-proton/0001-CMakeLists.txt-allow-the-user-to-disable-tests.patch b/package/qpid-proton/0001-CMakeLists.txt-allow-the-user-to-disable-tests.patch
new file mode 100644
index 0000000000..24d3ffa467
--- /dev/null
+++ b/package/qpid-proton/0001-CMakeLists.txt-allow-the-user-to-disable-tests.patch
@@ -0,0 +1,500 @@
+From 47d5366c40773c681486a243f50b290ebeca6753 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 26 Sep 2020 23:04:38 +0200
+Subject: [PATCH] CMakeLists.txt: allow the user to disable tests
+
+Disable tests if the user sets the standard cmake BUILD_TESTING option
+to OFF:
+https://cmake.org/cmake/help/v3.8/command/add_test.html#command:add_test
+
+Fixes:
+ - https://issues.apache.org/jira/browse/PROTON-2170
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ c/CMakeLists.txt      |   4 +-
+ cpp/CMakeLists.txt    | 162 ++++++++++++++++++++--------------------
+ python/CMakeLists.txt | 168 +++++++++++++++++++++---------------------
+ ruby/CMakeLists.txt   |  88 +++++++++++-----------
+ 4 files changed, 215 insertions(+), 207 deletions(-)
+
+diff --git a/c/CMakeLists.txt b/c/CMakeLists.txt
+index d86eab44..6fa3d580 100644
+--- a/c/CMakeLists.txt
++++ b/c/CMakeLists.txt
+@@ -583,7 +583,9 @@ endif (ENABLE_BENCHMARKS)
+ 
+ add_subdirectory(docs)
+ add_subdirectory(examples)
+-add_subdirectory(tests)
++if (BUILD_TESTING)
++  add_subdirectory(tests)
++endif (BUILD_TESTING)
+ add_subdirectory(tools)
+ 
+ install (DIRECTORY examples/
+diff --git a/cpp/CMakeLists.txt b/cpp/CMakeLists.txt
+index bd926df0..44830aeb 100644
+--- a/cpp/CMakeLists.txt
++++ b/cpp/CMakeLists.txt
+@@ -231,90 +231,92 @@ install (FILES
+   ${CMAKE_CURRENT_BINARY_DIR}/ProtonCppConfigVersion.cmake
+   DESTINATION ${LIB_INSTALL_DIR}/cmake/ProtonCpp)
+ 
+-set(testdata "${CMAKE_CURRENT_BINARY_DIR}/testdata")
+-set(test_env "")
+-
+-# SASL configuration for tests
+-if(CyrusSASL_Saslpasswd_EXECUTABLE)
+-  configure_file("${CMAKE_CURRENT_SOURCE_DIR}/testdata/sasl-conf/proton-server.conf.in"
+-    "${testdata}/sasl-conf/proton-server.conf")
+-  execute_process(
+-    COMMAND echo password
+-    COMMAND ${CyrusSASL_Saslpasswd_EXECUTABLE} -c -p -f "${testdata}/sasl-conf/proton.sasldb" -u proton user
+-    RESULT_VARIABLE ret)
+-  if(ret)
+-    message(WARNING "${CyrusSASL_Saslpasswd_EXECUTABLE}: error ${ret} - some SASL tests will be skipped")
+-  else()
+-    set(test_env ${test_env} "PN_SASL_CONFIG_PATH=${testdata}/sasl-conf")
++if (BUILD_TESTING)
++  set(testdata "${CMAKE_CURRENT_BINARY_DIR}/testdata")
++  set(test_env "")
++
++  # SASL configuration for tests
++  if(CyrusSASL_Saslpasswd_EXECUTABLE)
++    configure_file("${CMAKE_CURRENT_SOURCE_DIR}/testdata/sasl-conf/proton-server.conf.in"
++      "${testdata}/sasl-conf/proton-server.conf")
++    execute_process(
++      COMMAND echo password
++      COMMAND ${CyrusSASL_Saslpasswd_EXECUTABLE} -c -p -f "${testdata}/sasl-conf/proton.sasldb" -u proton user
++      RESULT_VARIABLE ret)
++    if(ret)
++      message(WARNING "${CyrusSASL_Saslpasswd_EXECUTABLE}: error ${ret} - some SASL tests will be skipped")
++    else()
++      set(test_env ${test_env} "PN_SASL_CONFIG_PATH=${testdata}/sasl-conf")
++    endif()
+   endif()
+-endif()
+ 
+-if (CMAKE_SYSTEM_NAME STREQUAL Windows)
+-  set(test_env ${test_env} "PATH=$<TARGET_FILE_DIR:qpid-proton>")
+-endif()
++  if (CMAKE_SYSTEM_NAME STREQUAL Windows)
++    set(test_env ${test_env} "PATH=$<TARGET_FILE_DIR:qpid-proton>")
++  endif()
+ 
+-macro(add_cpp_test test)
+-  add_executable (${test} src/${test}.cpp)
+-  target_link_libraries (${test} qpid-proton-cpp ${PLATFORM_LIBS})
+-  pn_add_test(
+-    EXECUTABLE
+-    NAME cpp-${test}
+-    APPEND_ENVIRONMENT ${test_env}
+-    COMMAND $<TARGET_FILE:${test}>
+-    ${ARGN})
+-endmacro(add_cpp_test)
+-
+-add_cpp_test(codec_test)
+-add_cpp_test(connection_driver_test)
+-add_cpp_test(interop_test ${CMAKE_SOURCE_DIR}/tests)
+-add_cpp_test(message_test)
+-add_cpp_test(map_test)
+-add_cpp_test(scalar_test)
+-add_cpp_test(value_test)
+-add_cpp_test(container_test)
+-add_cpp_test(reconnect_test)
+-add_cpp_test(link_test)
+-add_cpp_test(credit_test)
+-if (ENABLE_JSONCPP)
+-  add_cpp_test(connect_config_test)
+-  target_link_libraries(connect_config_test qpid-proton-core) # For pn_sasl_enabled
+-  set_tests_properties(cpp-connect_config_test PROPERTIES WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")
+-  # Test data and output directories for connect_config_test
+-  file(COPY  "${CMAKE_CURRENT_SOURCE_DIR}/testdata" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
+-endif()
++  macro(add_cpp_test test)
++    add_executable (${test} src/${test}.cpp)
++    target_link_libraries (${test} qpid-proton-cpp ${PLATFORM_LIBS})
++    pn_add_test(
++      EXECUTABLE
++      NAME cpp-${test}
++      APPEND_ENVIRONMENT ${test_env}
++      COMMAND $<TARGET_FILE:${test}>
++      ${ARGN})
++  endmacro(add_cpp_test)
++
++  add_cpp_test(codec_test)
++  add_cpp_test(connection_driver_test)
++  add_cpp_test(interop_test ${CMAKE_SOURCE_DIR}/tests)
++  add_cpp_test(message_test)
++  add_cpp_test(map_test)
++  add_cpp_test(scalar_test)
++  add_cpp_test(value_test)
++  add_cpp_test(container_test)
++  add_cpp_test(reconnect_test)
++  add_cpp_test(link_test)
++  add_cpp_test(credit_test)
++  if (ENABLE_JSONCPP)
++    add_cpp_test(connect_config_test)
++    target_link_libraries(connect_config_test qpid-proton-core) # For pn_sasl_enabled
++    set_tests_properties(cpp-connect_config_test PROPERTIES WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}")
++    # Test data and output directories for connect_config_test
++    file(COPY  "${CMAKE_CURRENT_SOURCE_DIR}/testdata" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
++  endif()
+ 
+-# TODO aconway 2018-10-31: Catch2 tests
+-# This is a simple example of a C++ test using the Catch2 framework.
+-# See c/tests/ for more interesting examples.
+-# Eventually all the C++ tests will migrate to Catch2.
+-
+-include_directories(${CMAKE_SOURCE_DIR}/tests/include)
+-add_executable(cpp-test src/cpp-test.cpp src/url_test.cpp)
+-target_link_libraries(cpp-test qpid-proton-cpp ${PLATFORM_LIBS})
+-# tests that require access to pn_ functions in qpid-proton-core
+-add_executable(cpp-core-test src/cpp-test.cpp src/object_test.cpp)
+-target_link_libraries(cpp-core-test qpid-proton-cpp qpid-proton-core ${PLATFORM_LIBS})
+-
+-macro(add_catch_test tag)
+-  pn_add_test(
+-    EXECUTABLE
+-    NAME cpp-${tag}-test
+-    APPEND_ENVIRONMENT ${test_env}
+-    COMMAND $<TARGET_FILE:cpp-test> "[${tag}]")
+-  set_tests_properties(cpp-${tag}-test PROPERTIES  FAIL_REGULAR_EXPRESSION ".*No tests ran.*")
+-endmacro(add_catch_test)
+-
+-macro(add_core_catch_test tag)
+-  pn_add_test(
+-          EXECUTABLE
+-          NAME cpp-${tag}-test
+-          APPEND_ENVIRONMENT ${test_env}
+-          COMMAND $<TARGET_FILE:cpp-core-test> "[${tag}]")
+-  set_tests_properties(cpp-${tag}-test PROPERTIES  FAIL_REGULAR_EXPRESSION ".*No tests ran.*")
+-endmacro(add_core_catch_test)
+-
+-add_catch_test(url)
+-add_core_catch_test(object)
++  # TODO aconway 2018-10-31: Catch2 tests
++  # This is a simple example of a C++ test using the Catch2 framework.
++  # See c/tests/ for more interesting examples.
++  # Eventually all the C++ tests will migrate to Catch2.
++
++  include_directories(${CMAKE_SOURCE_DIR}/tests/include)
++  add_executable(cpp-test src/cpp-test.cpp src/url_test.cpp)
++  target_link_libraries(cpp-test qpid-proton-cpp ${PLATFORM_LIBS})
++  # tests that require access to pn_ functions in qpid-proton-core
++  add_executable(cpp-core-test src/cpp-test.cpp src/object_test.cpp)
++  target_link_libraries(cpp-core-test qpid-proton-cpp qpid-proton-core ${PLATFORM_LIBS})
++
++  macro(add_catch_test tag)
++    pn_add_test(
++      EXECUTABLE
++      NAME cpp-${tag}-test
++      APPEND_ENVIRONMENT ${test_env}
++      COMMAND $<TARGET_FILE:cpp-test> "[${tag}]")
++    set_tests_properties(cpp-${tag}-test PROPERTIES  FAIL_REGULAR_EXPRESSION ".*No tests ran.*")
++  endmacro(add_catch_test)
++
++  macro(add_core_catch_test tag)
++    pn_add_test(
++            EXECUTABLE
++            NAME cpp-${tag}-test
++            APPEND_ENVIRONMENT ${test_env}
++            COMMAND $<TARGET_FILE:cpp-core-test> "[${tag}]")
++    set_tests_properties(cpp-${tag}-test PROPERTIES  FAIL_REGULAR_EXPRESSION ".*No tests ran.*")
++  endmacro(add_core_catch_test)
++
++  add_catch_test(url)
++  add_core_catch_test(object)
++endif (BUILD_TESTING)
+ 
+ if (ENABLE_BENCHMARKS)
+   add_subdirectory(benchmarks)
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index bdd2b4c5..a460c8e6 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -221,92 +221,94 @@ if (SETUPTOOLS_MODULE_FOUND)
+   endif ()
+ endif ()
+ 
+-# python test: python/tests/proton-test
+-set (py_src "${CMAKE_CURRENT_SOURCE_DIR}")
+-set (py_bin "${CMAKE_CURRENT_BINARY_DIR}")
+-set (py_dll "$<TARGET_FILE_DIR:_cproton>")
+-set (py_bld "$<TARGET_FILE_DIR:qpid-proton-core>") # For windows
+-set (py_tests "${py_src}/tests")
+-set (tests_py "${py_src}/../tests/py")
+-
+-set (py_path ${CMAKE_BINARY_DIR}/c/tools ${py_bld} $ENV{PATH})
+-set (py_pythonpath ${py_tests} ${py_src} ${py_bin} ${py_dll} ${tests_py} $ENV{PYTHONPATH})
+-to_native_path ("${py_pythonpath}" py_pythonpath)
+-to_native_path ("${py_path}" py_path)
+-
+-if (CMAKE_BUILD_TYPE MATCHES "Coverage")
+-  set (python_coverage_options -m coverage run --parallel-mode)
+-endif(CMAKE_BUILD_TYPE MATCHES "Coverage")
+-
+-pn_add_test(
+-  INTERPRETED
+-  NAME python-test
+-  PREPEND_ENVIRONMENT
+-    "PATH=${py_path}"
+-    "PYTHONPATH=${py_pythonpath}"
+-    "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}"
+-  COMMAND ${PYTHON_EXECUTABLE} ${python_coverage_options} -- "${py_tests}/proton-test")
+-set_tests_properties(python-test PROPERTIES PASS_REGULAR_EXPRESSION "Totals: .* 0 failed")
+-
+-if(PYTHON_VERSION_MAJOR EQUAL 2 AND PYTHON_VERSION_MINOR LESS 7)
+-  execute_process(COMMAND "${PYTHON_EXECUTABLE}" "-c" "import unittest2"
+-          RESULT_VARIABLE UNITTEST_MISSING
+-          ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
+-  if(UNITTEST_MISSING)
+-    message(WARNING "unittest2 is not installed. ***some unit tests cannot be run***\ntry 'pip install unittest2' to install unittest2")
+-  else(UNITTEST_MISSING)
+-    set(PYTHON_TEST_COMMAND "-m" "unittest2")
+-  endif(UNITTEST_MISSING)
+-else(PYTHON_VERSION_MAJOR EQUAL 2 AND PYTHON_VERSION_MINOR LESS 7)
+-  set(PYTHON_TEST_COMMAND "-m" "unittest")
+-endif(PYTHON_VERSION_MAJOR EQUAL 2 AND PYTHON_VERSION_MINOR LESS 7)
+-
+-if (PYTHON_TEST_COMMAND)
++if (BUILD_TESTING)
++  # python test: python/tests/proton-test
++  set (py_src "${CMAKE_CURRENT_SOURCE_DIR}")
++  set (py_bin "${CMAKE_CURRENT_BINARY_DIR}")
++  set (py_dll "$<TARGET_FILE_DIR:_cproton>")
++  set (py_bld "$<TARGET_FILE_DIR:qpid-proton-core>") # For windows
++  set (py_tests "${py_src}/tests")
++  set (tests_py "${py_src}/../tests/py")
++
++  set (py_path ${CMAKE_BINARY_DIR}/c/tools ${py_bld} $ENV{PATH})
++  set (py_pythonpath ${py_tests} ${py_src} ${py_bin} ${py_dll} ${tests_py} $ENV{PYTHONPATH})
++  to_native_path ("${py_pythonpath}" py_pythonpath)
++  to_native_path ("${py_path}" py_path)
++
++  if (CMAKE_BUILD_TYPE MATCHES "Coverage")
++    set (python_coverage_options -m coverage run --parallel-mode)
++  endif(CMAKE_BUILD_TYPE MATCHES "Coverage")
++
+   pn_add_test(
+     INTERPRETED
+-    NAME python-integration-test
++    NAME python-test
+     PREPEND_ENVIRONMENT
+       "PATH=${py_path}"
+       "PYTHONPATH=${py_pythonpath}"
+       "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}"
+-    COMMAND
+-      ${PYTHON_EXECUTABLE}
+-        ${python_coverage_options}
+-        ${PYTHON_TEST_COMMAND} discover -v -s "${py_tests}/integration")
+-endif(PYTHON_TEST_COMMAND)
+-
+-check_python_module("tox" TOX_MODULE_FOUND)
+-if (NOT TOX_MODULE_FOUND)
+-  message(STATUS "The tox tool is not available; skipping the python-tox-tests")
+-else ()
+-  option(ENABLE_TOX_TEST "Enable multi-version python testing with TOX" ON)
+-
+-  set(tox_default "py26,py27,py35,py36,py37,py38")
+-  set(TOX_ENVLIST "" CACHE STRING "List of python environments for TOX tests" )
+-  mark_as_advanced(TOX_ENVLIST)
+-
+-  if (NOT TOX_ENVLIST)
+-    set (TOX_ENVLIST ${tox_default})
+-  endif()
+-  if (ENABLE_TOX_TEST)
+-    if (CMAKE_BUILD_TYPE MATCHES "Coverage")
+-      message(STATUS "Building for coverage analysis; skipping the python-tox-tests")
+-    else ()
+-      configure_file(
+-        "${CMAKE_CURRENT_SOURCE_DIR}/tox.ini.in"
+-        "${CMAKE_CURRENT_BINARY_DIR}/tox.ini")
+-      pn_add_test(
+-        INTERPRETED
+-        NAME python-tox-test
+-        PREPEND_ENVIRONMENT
+-          "PATH=${py_path}"
+-          "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}"
+-          "SWIG=${SWIG_EXECUTABLE}"
+-        COMMAND ${PYTHON_EXECUTABLE} -m tox)
+-      set_tests_properties(python-tox-test
+-        PROPERTIES
+-        PASS_REGULAR_EXPRESSION "Totals: .* ignored, 0 failed"
+-        FAIL_REGULAR_EXPRESSION "ERROR:[ ]+py[0-9]*: commands failed")
+-    endif ()
+-  endif (ENABLE_TOX_TEST)
+-endif (NOT TOX_MODULE_FOUND)
++    COMMAND ${PYTHON_EXECUTABLE} ${python_coverage_options} -- "${py_tests}/proton-test")
++  set_tests_properties(python-test PROPERTIES PASS_REGULAR_EXPRESSION "Totals: .* 0 failed")
++
++  if(PYTHON_VERSION_MAJOR EQUAL 2 AND PYTHON_VERSION_MINOR LESS 7)
++    execute_process(COMMAND "${PYTHON_EXECUTABLE}" "-c" "import unittest2"
++            RESULT_VARIABLE UNITTEST_MISSING
++            ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)
++    if(UNITTEST_MISSING)
++      message(WARNING "unittest2 is not installed. ***some unit tests cannot be run***\ntry 'pip install unittest2' to install unittest2")
++    else(UNITTEST_MISSING)
++      set(PYTHON_TEST_COMMAND "-m" "unittest2")
++    endif(UNITTEST_MISSING)
++  else(PYTHON_VERSION_MAJOR EQUAL 2 AND PYTHON_VERSION_MINOR LESS 7)
++    set(PYTHON_TEST_COMMAND "-m" "unittest")
++  endif(PYTHON_VERSION_MAJOR EQUAL 2 AND PYTHON_VERSION_MINOR LESS 7)
++
++  if (PYTHON_TEST_COMMAND)
++    pn_add_test(
++      INTERPRETED
++      NAME python-integration-test
++      PREPEND_ENVIRONMENT
++        "PATH=${py_path}"
++        "PYTHONPATH=${py_pythonpath}"
++        "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}"
++      COMMAND
++        ${PYTHON_EXECUTABLE}
++          ${python_coverage_options}
++          ${PYTHON_TEST_COMMAND} discover -v -s "${py_tests}/integration")
++  endif(PYTHON_TEST_COMMAND)
++
++  check_python_module("tox" TOX_MODULE_FOUND)
++  if (NOT TOX_MODULE_FOUND)
++    message(STATUS "The tox tool is not available; skipping the python-tox-tests")
++  else ()
++    option(ENABLE_TOX_TEST "Enable multi-version python testing with TOX" ON)
++
++    set(tox_default "py26,py27,py35,py36,py37,py38")
++    set(TOX_ENVLIST "" CACHE STRING "List of python environments for TOX tests" )
++    mark_as_advanced(TOX_ENVLIST)
++
++    if (NOT TOX_ENVLIST)
++      set (TOX_ENVLIST ${tox_default})
++    endif()
++    if (ENABLE_TOX_TEST)
++      if (CMAKE_BUILD_TYPE MATCHES "Coverage")
++        message(STATUS "Building for coverage analysis; skipping the python-tox-tests")
++      else ()
++        configure_file(
++          "${CMAKE_CURRENT_SOURCE_DIR}/tox.ini.in"
++          "${CMAKE_CURRENT_BINARY_DIR}/tox.ini")
++        pn_add_test(
++          INTERPRETED
++          NAME python-tox-test
++          PREPEND_ENVIRONMENT
++            "PATH=${py_path}"
++            "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}"
++            "SWIG=${SWIG_EXECUTABLE}"
++          COMMAND ${PYTHON_EXECUTABLE} -m tox)
++        set_tests_properties(python-tox-test
++          PROPERTIES
++          PASS_REGULAR_EXPRESSION "Totals: .* ignored, 0 failed"
++          FAIL_REGULAR_EXPRESSION "ERROR:[ ]+py[0-9]*: commands failed")
++      endif ()
++    endif (ENABLE_TOX_TEST)
++  endif (NOT TOX_MODULE_FOUND)
++endif (BUILD_TESTING)
+diff --git a/ruby/CMakeLists.txt b/ruby/CMakeLists.txt
+index 9dd7bc77..5987f692 100644
+--- a/ruby/CMakeLists.txt
++++ b/ruby/CMakeLists.txt
+@@ -113,53 +113,55 @@ install(DIRECTORY examples/
+         DESTINATION "${PROTON_SHARE}/examples/ruby"
+         COMPONENT Ruby
+         USE_SOURCE_PERMISSIONS)
+-## Tests
++if (BUILD_TESTING)
++  ## Tests
++
++  to_native_path("${src}/lib;${src}/tests;${src}/spec;${bin};${c_lib_dir};$ENV{RUBYLIB}" RUBYLIB)
++  to_native_path("${bin};${c_lib_dir};$ENV{PATH}" PATH)
++
++  if (CMAKE_BUILD_TYPE MATCHES "Coverage")
++    set(COVERAGE "COVERAGE=1")
++  endif ()
++
++  execute_process(COMMAND ${RUBY_EXECUTABLE} -r minitest -e ""
++    RESULT_VARIABLE result OUTPUT_QUIET ERROR_QUIET)
++  if (result EQUAL 0)  # Have minitest
++    set(test_env
++      "PATH=${PATH}"
++      "RUBYLIB=${RUBYLIB}"
++      "${COVERAGE}"
++      "COVERAGE_DIR=${CMAKE_CURRENT_BINARY_DIR}/coverage"
++      "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}")
++
++    macro(add_ruby_test script)
++      get_filename_component(name ${script} NAME_WE)
++      string(REPLACE "_" "-" name "ruby-${name}")
++      pn_add_test(
++        INTERPRETED
++        NAME ${name}
++        PREPEND_ENVIRONMENT ${test_env}
++        COMMAND ${RUBY_EXECUTABLE} -r${CMAKE_CURRENT_SOURCE_DIR}/tests/collect_coverage.rb ${script} -v
++        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}  # simplecov doesn't report on code not under $CWD
++        ${ARGN})
++    endmacro()
+ 
+-to_native_path("${src}/lib;${src}/tests;${src}/spec;${bin};${c_lib_dir};$ENV{RUBYLIB}" RUBYLIB)
+-to_native_path("${bin};${c_lib_dir};$ENV{PATH}" PATH)
+-
+-if (CMAKE_BUILD_TYPE MATCHES "Coverage")
+-  set(COVERAGE "COVERAGE=1")
+-endif ()
+-
+-execute_process(COMMAND ${RUBY_EXECUTABLE} -r minitest -e ""
+-  RESULT_VARIABLE result OUTPUT_QUIET ERROR_QUIET)
+-if (result EQUAL 0)  # Have minitest
+-  set(test_env
+-    "PATH=${PATH}"
+-    "RUBYLIB=${RUBYLIB}"
+-    "${COVERAGE}"
+-    "COVERAGE_DIR=${CMAKE_CURRENT_BINARY_DIR}/coverage"
+-    "SASLPASSWD=${CyrusSASL_Saslpasswd_EXECUTABLE}")
+-
+-  macro(add_ruby_test script)
+-    get_filename_component(name ${script} NAME_WE)
+-    string(REPLACE "_" "-" name "ruby-${name}")
+     pn_add_test(
+       INTERPRETED
+-      NAME ${name}
++      NAME ruby-example-test
+       PREPEND_ENVIRONMENT ${test_env}
+-      COMMAND ${RUBY_EXECUTABLE} -r${CMAKE_CURRENT_SOURCE_DIR}/tests/collect_coverage.rb ${script} -v
+-      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}  # simplecov doesn't report on code not under $CWD
+-      ${ARGN})
+-  endmacro()
+-
+-  pn_add_test(
+-    INTERPRETED
+-    NAME ruby-example-test
+-    PREPEND_ENVIRONMENT ${test_env}
+-    COMMAND ${RUBY_EXECUTABLE} testme -v
+-    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/examples)
+-
+-  file(GLOB TESTS tests/test_*.rb)
+-  file(GLOB SPECS spec/*_spec.rb)
+-  foreach(t ${TESTS} ${SPECS})
+-    add_ruby_test(${t})
+-  endforeach()
+-else()
+-  # No minitest
+-  message(STATUS "Ruby tests will not run, minitest is not installed")
+-endif()
++      COMMAND ${RUBY_EXECUTABLE} testme -v
++      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/examples)
++
++    file(GLOB TESTS tests/test_*.rb)
++    file(GLOB SPECS spec/*_spec.rb)
++    foreach(t ${TESTS} ${SPECS})
++      add_ruby_test(${t})
++    endforeach()
++  else()
++    # No minitest
++    message(STATUS "Ruby tests will not run, minitest is not installed")
++  endif()
++endif (BUILD_TESTING)
+ 
+ ## Documentation
+ 
+-- 
+2.28.0
+
diff --git a/package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch b/package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch
deleted file mode 100644
index 1085804f41..0000000000
--- a/package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From bc872440428073e86ce2631276dc8b7f62da4c33 Mon Sep 17 00:00:00 2001
-From: Andrew Stitcher <astitcher@apache.org>
-Date: Tue, 17 Jan 2017 02:10:48 -0500
-Subject: [PATCH] PROTON-1381, PROTON-1326: Modify openssl DH code to work with
- openssl 1.1 Modified patch from Volker Diels-Grabsch
-
-Upstream: https://github.com/apache/qpid-proton/commit/bc872440428073e86ce2631276dc8b7f62da4c33
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- proton-c/src/ssl/openssl.c | 37 +++++++++++++++++++++++++++----------
- 1 file changed, 27 insertions(+), 10 deletions(-)
-
-diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
-index 0b7d157..0c51c03 100644
---- a/proton-c/src/ssl/openssl.c
-+++ b/proton-c/src/ssl/openssl.c
-@@ -356,12 +356,22 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
-   return preverify_ok;
- }
- 
-+// This was introduced in v1.1
-+#if OPENSSL_VERSION_NUMBER < 0x10100000
-+int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
-+{
-+  dh->p = p;
-+  dh->q = q;
-+  dh->g = g;
-+  return 1;
-+}
-+#endif
- 
- // this code was generated using the command:
- // "openssl dhparam -C -2 2048"
- static DH *get_dh2048(void)
- {
--  static const unsigned char dh2048_p[]={
-+  static const unsigned char dhp_2048[]={
-     0xAE,0xF7,0xE9,0x66,0x26,0x7A,0xAC,0x0A,0x6F,0x1E,0xCD,0x81,
-     0xBD,0x0A,0x10,0x7E,0xFA,0x2C,0xF5,0x2D,0x98,0xD4,0xE7,0xD9,
-     0xE4,0x04,0x8B,0x06,0x85,0xF2,0x0B,0xA3,0x90,0x15,0x56,0x0C,
-@@ -385,17 +395,24 @@ static DH *get_dh2048(void)
-     0xA4,0xED,0xFD,0x49,0x0B,0xE3,0x4A,0xF6,0x28,0xB3,0x98,0xB0,
-     0x23,0x1C,0x09,0x33,
-   };
--  static const unsigned char dh2048_g[]={
-+  static const unsigned char dhg_2048[]={
-     0x02,
-   };
--  DH *dh;
--
--  if ((dh=DH_new()) == NULL) return(NULL);
--  dh->p=BN_bin2bn(dh2048_p,sizeof(dh2048_p),NULL);
--  dh->g=BN_bin2bn(dh2048_g,sizeof(dh2048_g),NULL);
--  if ((dh->p == NULL) || (dh->g == NULL))
--    { DH_free(dh); return(NULL); }
--  return(dh);
-+  DH *dh = DH_new();
-+  BIGNUM *dhp_bn, *dhg_bn;
-+
-+  if (dh == NULL)
-+    return NULL;
-+  dhp_bn = BN_bin2bn(dhp_2048, sizeof (dhp_2048), NULL);
-+  dhg_bn = BN_bin2bn(dhg_2048, sizeof (dhg_2048), NULL);
-+  if (dhp_bn == NULL || dhg_bn == NULL
-+      || !DH_set0_pqg(dh, dhp_bn, NULL, dhg_bn)) {
-+    DH_free(dh);
-+    BN_free(dhp_bn);
-+    BN_free(dhg_bn);
-+    return NULL;
-+  }
-+  return dh;
- }
- 
- typedef struct {
--- 
-1.9.1
-
diff --git a/package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch b/package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch
deleted file mode 100644
index 2adba9a591..0000000000
--- a/package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 8c54c62516671375de4068158ccaa0bc1dba0a4a Mon Sep 17 00:00:00 2001
-From: Cliff Jansen <cjansen@redhat.com>
-Date: Wed, 2 Aug 2017 16:34:39 -0700
-Subject: [PATCH] PROTON-1326: restore anonymous cyphers by lowering OpenSSL
- v1.1 security level just for the PN_SSL_ANONYMOUS_PEER verification mode
-
-Upstream: https://github.com/apache/qpid-proton/commit/8c54c62516671375de4068158ccaa0bc1dba0a4a
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- proton-c/src/ssl/openssl.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
-index 8cb4e7b..f37cf49 100644
---- a/proton-c/src/ssl/openssl.c
-+++ b/proton-c/src/ssl/openssl.c
-@@ -72,6 +72,9 @@ struct pn_ssl_domain_t {
-   char *trusted_CAs;
- 
-   int   ref_count;
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+  int default_seclevel;
-+#endif
-   pn_ssl_mode_t mode;
-   pn_ssl_verify_mode_t verify_mode;
- 
-@@ -524,6 +527,9 @@ pn_ssl_domain_t *pn_ssl_domain( pn_ssl_mode_t mode )
-   // Mitigate the CRIME vulnerability
-   SSL_CTX_set_options(domain->ctx, SSL_OP_NO_COMPRESSION);
- #endif
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+    domain->default_seclevel = SSL_CTX_get_security_level(domain->ctx);
-+#endif
- 
-   // by default, allow anonymous ciphers so certificates are not required 'out of the box'
-   if (!SSL_CTX_set_cipher_list( domain->ctx, CIPHERS_ANONYMOUS )) {
-@@ -647,6 +653,10 @@ int pn_ssl_domain_set_peer_authentication(pn_ssl_domain_t *domain,
-   case PN_SSL_VERIFY_PEER:
-   case PN_SSL_VERIFY_PEER_NAME:
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+    SSL_CTX_set_security_level(domain->ctx, domain->default_seclevel);
-+#endif
-+
-     if (!domain->has_ca_db) {
-       pn_transport_logf(NULL, "Error: cannot verify peer without a trusted CA configured.\n"
-                  "       Use pn_ssl_domain_set_trusted_ca_db()");
-@@ -685,6 +695,10 @@ int pn_ssl_domain_set_peer_authentication(pn_ssl_domain_t *domain,
-     break;
- 
-   case PN_SSL_ANONYMOUS_PEER:   // hippie free love mode... :)
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+    // Must use lowest OpenSSL security level to enable anonymous ciphers.
-+    SSL_CTX_set_security_level(domain->ctx, 0);
-+#endif
-     SSL_CTX_set_verify( domain->ctx, SSL_VERIFY_NONE, NULL );
-     break;
- 
--- 
-1.9.1
-
diff --git a/package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch b/package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch
deleted file mode 100644
index bbd3c7b810..0000000000
--- a/package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From c31ca95ac73d0da462f7e324e1c3a33b11c39f2c Mon Sep 17 00:00:00 2001
-From: Alan Conway <aconway@redhat.com>
-Date: Wed, 27 Sep 2017 18:37:24 -0400
-Subject: [PATCH] PROTON-1587: fix openssl error handling, causing spurious
- errors
-
-From the SSL_get_error() man page:
-
-       In addition  to ssl and ret, SSL_get_error() inspects the current thread's OpenSSL error
-       queue.  Thus, SSL_get_error() must be used in the same thread that performed the TLS/SSL I/O
-       operation, and no other OpenSSL function calls should appear in between.  The current
-       thread's error queue must be empty before the TLS/SSL I/O operation is attempted, or
-       SSL_get_error() will not work reliably.
-
-Proton was not clearing the error queue, so the "shutdown-during-init"
-error (which was introduced recently in OpenSSL) was left dangling, and was
-reported incorrectly when the thread was used to serve another transport.
-
-Upstream: https://github.com/apache/qpid-proton/commit/c31ca95ac73d0da462f7e324e1c3a33b11c39f2c
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- proton-c/src/ssl/openssl.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
-index 5c750b0..3a4e1a3 100644
---- a/proton-c/src/ssl/openssl.c
-+++ b/proton-c/src/ssl/openssl.c
-@@ -206,7 +206,7 @@ static int ssl_failed(pn_transport_t *transport)
-   // fake a shutdown so the i/o processing code will close properly
-   SSL_set_shutdown(ssl->ssl, SSL_SENT_SHUTDOWN|SSL_RECEIVED_SHUTDOWN);
-   // try to grab the first SSL error to add to the failure log
--  char buf[128] = "Unknown error.";
-+  char buf[256] = "Unknown error";
-   unsigned long ssl_err = ERR_get_error();
-   if (ssl_err) {
-     ERR_error_string_n( ssl_err, buf, sizeof(buf) );
-@@ -909,6 +909,7 @@ static ssize_t process_input_ssl( pn_transport_t *transport, unsigned int layer,
- 
-   do {
-     work_pending = false;
-+    ERR_clear_error();
- 
-     // Write to network bio as much as possible, consuming bytes/available
- 
-@@ -1058,6 +1059,8 @@ static ssize_t process_output_ssl( pn_transport_t *transport, unsigned int layer
- 
-   do {
-     work_pending = false;
-+    ERR_clear_error();
-+
-     // first, get any pending application output, if possible
- 
-     if (!ssl->app_output_closed && ssl->out_count < ssl->out_size) {
--- 
-1.9.1
-
diff --git a/package/qpid-proton/0004-src-ssl-openssl-add-libressl-compatibility.patch b/package/qpid-proton/0004-src-ssl-openssl-add-libressl-compatibility.patch
deleted file mode 100644
index f969671ffb..0000000000
--- a/package/qpid-proton/0004-src-ssl-openssl-add-libressl-compatibility.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 87c44b4ebc64c15f6324ed40852224b61fbe77a7 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Tue, 5 Feb 2019 06:10:16 -0600
-Subject: [PATCH] src/ssl/openssl: add libressl compatibility
-
-Similar to https://github.com/FreeRDP/FreeRDP/issues/5049
-libressl has `#define OPENSSL_VERSION_NUMBER ` defined the same as
-openssl 1.1.x which results in SSL_CTX_set_security_level() getting used.
-
-This patch prevents SSL_CTX_set_security_level() from being used with
-libressl.
-
-Upstream: https://github.com/apache/qpid-proton/pull/175
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- c/src/ssl/openssl.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
-index c2b5869..541d0ae 100644
---- a/proton-c/src/ssl/openssl.c
-+++ b/proton-c/src/ssl/openssl.c
-@@ -522,7 +522,7 @@ pn_ssl_domain_t *pn_ssl_domain( pn_ssl_mode_t mode )
-   // Mitigate the CRIME vulnerability
-   SSL_CTX_set_options(domain->ctx, SSL_OP_NO_COMPRESSION);
- #endif
--#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
-     domain->default_seclevel = SSL_CTX_get_security_level(domain->ctx);
- #endif
- 
-@@ -709,7 +709,7 @@ int pn_ssl_domain_set_peer_authentication(pn_ssl_domain_t *domain,
-    case PN_SSL_VERIFY_PEER:
-    case PN_SSL_VERIFY_PEER_NAME:
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
-     SSL_CTX_set_security_level(domain->ctx, domain->default_seclevel);
- #endif
- 
-@@ -749,7 +749,7 @@ int pn_ssl_domain_set_peer_authentication(pn_ssl_domain_t *domain,
-     break;
- 
-   case PN_SSL_ANONYMOUS_PEER:   // hippie free love mode... :)
--#if OPENSSL_VERSION_NUMBER >= 0x10100000
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
-     // Must use lowest OpenSSL security level to enable anonymous ciphers.
-     SSL_CTX_set_security_level(domain->ctx, 0);
- #endif
--- 
-1.9.1
-
diff --git a/package/qpid-proton/qpid-proton.hash b/package/qpid-proton/qpid-proton.hash
index 1ee72eef7a..d0fda4f534 100644
--- a/package/qpid-proton/qpid-proton.hash
+++ b/package/qpid-proton/qpid-proton.hash
@@ -1,4 +1,5 @@
-# Hash from: http://www.apache.org/dist/qpid/proton/0.9.1/qpid-proton-0.9.1.tar.gz.sha
-sha1  98008d90acd0d47cbd7ac1572a2bb50b452338ed  qpid-proton-0.9.1.tar.gz
+# Hash from: https://www.apache.org/dist/qpid/proton/0.32.0/qpid-proton-0.32.0.tar.gz.sha512
+sha512  4d1265308b685d5cdd28fd8746f13704c6e36a8dc35a2c121e07b9db21cabaf440da8dd1cf76892fc366845e7f472af2c29ae94dedee19d53756bba2bd4470b6  qpid-proton-0.32.0.tar.gz
+
 # Locally computed
-sha256  9fade5e12873678456137b36cfa4a5983c3793836d41c011f2c2abb02ca36a66  LICENSE
+sha256  52310e65489d30afeefc8589479fc02862a875349c19edd165658a915009da82  LICENSE.txt
diff --git a/package/qpid-proton/qpid-proton.mk b/package/qpid-proton/qpid-proton.mk
index c501e48c86..5421303280 100644
--- a/package/qpid-proton/qpid-proton.mk
+++ b/package/qpid-proton/qpid-proton.mk
@@ -4,32 +4,40 @@
 #
 ################################################################################
 
-QPID_PROTON_VERSION = 0.9.1
-QPID_PROTON_SITE = http://apache.panu.it/qpid/proton/$(QPID_PROTON_VERSION)
-QPID_PROTON_STRIP_COMPONENTS = 2
+QPID_PROTON_VERSION = 0.32.0
+QPID_PROTON_SITE = \
+	https://downloads.apache.org/qpid/proton/$(QPID_PROTON_VERSION)
 QPID_PROTON_LICENSE = Apache-2.0
-QPID_PROTON_LICENSE_FILES = LICENSE
+QPID_PROTON_LICENSE_FILES = LICENSE.txt
 QPID_PROTON_INSTALL_STAGING = YES
 QPID_PROTON_DEPENDENCIES = \
 	host-python \
 	util-linux \
+	$(if $(BR2_PACKAGE_LIBUV),libuv) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 
-# Language bindings are enabled when host-swig tool is present in HOST_DIR.
+# python and ruby language bindings are enabled when host-swig tool is present
+# in HOST_DIR.
+# go language binding is enabled when host-go is present
 # For now, disable all of them.
 QPID_PROTON_CONF_OPTS = \
-	-DBUILD_JAVA=OFF \
-	-DBUILD_JAVASCRIPT=OFF \
-	-DBUILD_PERL=OFF \
-	-DBUILD_PHP=OFF \
+	-DBUILD_GO=OFF \
 	-DBUILD_PYTHON=OFF \
 	-DBUILD_RUBY=OFF \
+	-DENABLE_FUZZ_TESTING=OFF \
 	-DENABLE_VALGRIND=OFF \
 	-DENABLE_WARNING_ERROR=OFF \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python2
 
+ifeq ($(BR2_PACKAGE_JSONCPP),y)
+QPID_PROTON_DEPENDENCIES += jsoncpp
+QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=ON
+else
+QPID_PROTON_CONF_OPTS += -DENABLE_JSONCPP=OFF
+endif
+
 define QPID_PROTON_REMOVE_USELESS_FILES
-	rm -fr $(TARGET_DIR)/usr/share/proton-*/
+	rm -fr $(TARGET_DIR)/usr/share/proton/
 endef
 
 QPID_PROTON_POST_INSTALL_TARGET_HOOKS += QPID_PROTON_REMOVE_USELESS_FILES
-- 
2.28.0
