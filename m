Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6BFC3F6B0
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 07:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5C6A83FBC;
	Fri, 29 Jul 2022 07:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5C6A83FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MD_abwXoSt1r; Fri, 29 Jul 2022 07:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9345983FB2;
	Fri, 29 Jul 2022 07:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9345983FB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80E181BF31B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65DAB402CE
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65DAB402CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5xuenRa64zl for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 07:33:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A364401F0
 for <buildroot@uclibc.org>; Fri, 29 Jul 2022 07:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A364401F0
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 3AEF885D32; Fri, 29 Jul 2022 07:19:19 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 29 Jul 2022 07:33:08 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wg@grandegger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14926-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14926] New: package/nodejs: build for host fails
 with GTEST errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14926

            Bug ID: 14926
           Summary: package/nodejs: build for host fails with GTEST errors
           Product: buildroot
           Version: 2022.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: wg@grandegger.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Since I updated Buildroot from 2022.02.1 to 2022.02.3, I get build
failures when building "host-nodejs" as shown below. This package was
not used with 2022.02.1 to build qt5webengine but is now required.
I have built under Debian 11 with GCC 10 and also Ubuntu 2022.04 LTS
with GCC 11. Any idea what's going wrong? I have attached my .config.

[7m>>> host-nodejs 14.18.3 Extracting[27m
xzcat /home/wolf/agco/qt-4.8/bd/downloads/nodejs/node-v14.18.3.tar.xz | tar
--strip-components=1 -C
/home/wolf/agco/qt-4.8/bd/agco_dcu_application/build/host-nodejs-14.18.3   -xf
-
[7m>>> host-nodejs 14.18.3 Patching[27m

Applying 0001-add-qemu-wrapper-support.patch using patch: 
patching file node.gyp
Hunk #1 succeeded at 281 (offset -210 lines).
Hunk #2 succeeded at 306 (offset -210 lines).
patching file tools/v8_gypfiles/v8.gyp

Applying 0001-check-if-uclibc-has-backtrace-support.patch using patch: 
patching file deps/v8/src/base/debug/stack_trace_posix.cc
[7m>>> host-nodejs 14.18.3 Configuring[27m
mkdir -p /home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/bin
ln -sf /home/wolf/app/qt-4.8/bd/app_application/host/bin/python3
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/bin/python
/usr/bin/sed -i -e "s%@MAYBE_WRAPPER@%%g"
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/node.gyp
/usr/bin/sed -i -e "s%@MAYBE_WRAPPER@%%g"
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/tools/v8_gypfiles/v8.gyp
(cd /home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3;
PATH="/home/wolf/app/qt-4.8/bd/app_application/host/bin:/home/wolf/app/qt-4.8/bd/app_application/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/wolf/app/qt-4.8/bd/app_application/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wolf/app/qt-4.8/bd/app_application/host/lib/pkgconfig:/home/wolf/app/qt-4.8/bd/app_application/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc"
GCC="/home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc"
CXX="/home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/g++"
CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/wolf/app/qt-4.8/bd/app_application/host/include" CFLAGS="-O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include" CXXFLAGS="-O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include"
LDFLAGS="-L/home/wolf/app/qt-4.8/bd/app_application/host/lib
-Wl,-rpath,/home/wolf/app/qt-4.8/bd/app_application/host/lib"
INTLTOOL_PERL=/usr/bin/perl
PATH=/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/bin:"/home/wolf/app/qt-4.8/bd/app_application/host/bin:/home/wolf/app/qt-4.8/bd/app_application/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PYTHON=/home/wolf/app/qt-4.8/bd/app_application/host/bin/python3
/home/wolf/app/qt-4.8/bd/app_application/host/bin/python3 ./configure
--prefix=/home/wolf/app/qt-4.8/bd/app_application/host --without-dtrace
--without-etw --shared-openssl
--shared-openssl-includes=/home/wolf/app/qt-4.8/bd/app_application/host/include
--shared-openssl-libpath=/home/wolf/app/qt-4.8/bd/app_application/host/lib
--shared-zlib --no-cross-compiling --with-intl=system-icu )
Node.js configure: Found Python 3.10.4...
INFO: configure completed successfully
[7m>>> host-nodejs 14.18.3 Building[27m
PATH="/home/wolf/app/qt-4.8/bd/app_application/host/bin:/home/wolf/app/qt-4.8/bd/app_application/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/wolf/app/qt-4.8/bd/app_application/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wolf/app/qt-4.8/bd/app_application/host/lib/pkgconfig:/home/wolf/app/qt-4.8/bd/app_application/host/share/pkgconfig"
PYTHON=/home/wolf/app/qt-4.8/bd/app_application/host/bin/python3 /usr/bin/make
-j21 -C /home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3
PATH="/home/wolf/app/qt-4.8/bd/app_application/host/bin:/home/wolf/app/qt-4.8/bd/app_application/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
PKG_CONFIG="/home/wolf/app/qt-4.8/bd/app_application/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/wolf/app/qt-4.8/bd/app_application/host/lib/pkgconfig:/home/wolf/app/qt-4.8/bd/app_application/host/share/pkgconfig"
AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld" NM="/usr/bin/nm"
CC="/home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc"
GCC="/home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc"
CXX="/home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/g++"
CPP="/usr/bin/cpp" OBJCOPY="/usr/bin/objcopy" RANLIB="/usr/bin/ranlib"
CPPFLAGS="-I/home/wolf/app/qt-4.8/bd/app_application/host/include" CFLAGS="-O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include" CXXFLAGS="-O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include"
LDFLAGS="-L/home/wolf/app/qt-4.8/bd/app_application/host/lib
-Wl,-rpath,/home/wolf/app/qt-4.8/bd/app_application/host/lib"
INTLTOOL_PERL=/usr/bin/perl CXXFLAGS="-O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include"
LDFLAGS.host="-L/home/wolf/app/qt-4.8/bd/app_application/host/lib
-Wl,-rpath,/home/wolf/app/qt-4.8/bd/app_application/host/lib"
NO_LOAD=cctest.target.mk
PATH=/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/bin:"/home/wolf/app/qt-4.8/bd/app_application/host/bin:/home/wolf/app/qt-4.8/bd/app_application/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
/usr/bin/make -C out BUILDTYPE=Release V=0
  /home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc -o
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/brotli/deps/brotli/c/common/constants.o
../deps/brotli/c/common/constants.c '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS' '-DOS_LINUX'
-I/home/wolf/app/qt-4.8/bd/app_application/host/include
-I../deps/brotli/c/include  -pthread -Wall -Wextra -Wno-unused-parameter -m64
-O3 -fno-omit-frame-pointer  -MMD -MF
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/.deps//home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/brotli/deps/brotli/c/common/constants.o.d.raw
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -c
  /home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc -o
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/brotli/deps/brotli/c/common/context.o
../deps/brotli/c/common/context.c '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS' '-DOS_LINUX'
-I/home/wolf/app/qt-4.8/bd/app_application/host/include
-I../deps/brotli/c/include  -pthread -Wall -Wextra -Wno-unused-parameter -m64
-O3 -fno-omit-frame-pointer  -MMD -MF
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/.deps//home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/brotli/deps/brotli/c/common/context.o.d.raw
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -c
  /home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/gcc -o
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/brotli/deps/brotli/c/common/dictionary.o
../deps/brotli/c/common/dictionary.c '-DV8_DEPRECATION_WARNINGS'
'-DV8_IMMINENT_DEPRECATION_WARNINGS' '-D__STDC_FORMAT_MACROS' '-DOS_LINUX'
-I/home/wolf/app/qt-4.8/bd/app_application/host/include
-I../deps/brotli/c/include  -pthread -Wall -Wextra -Wno-unused-parameter -m64
-O3 -fno-omit-frame-pointer  -MMD -MF
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/.deps//home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/brotli/deps/brotli/c/common/dictionary.o.d.raw
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -c
,,,
  /home/wolf/app/qt-4.8/bd/app_application/host/bin/ccache /usr/bin/g++ -o
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/torque_base/deps/v8/src/torque/types.o
../deps/v8/src/torque/types.cc '-DV8_GYP_BUILD'
'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=64' '-D__STDC_FORMAT_MACROS'
'-DV8_TARGET_ARCH_X64' '-DV8_EMBEDDER_STRING="-node.85"'
'-DENABLE_DISASSEMBLER' '-DV8_PROMISE_INTERNAL_FIELD_COUNT=1'
'-DENABLE_MINOR_MC' '-DOBJECT_PRINT' '-DV8_INTL_SUPPORT'
'-DV8_CONCURRENT_MARKING' '-DV8_ARRAY_BUFFER_EXTENSION'
'-DV8_ENABLE_LAZY_SOURCE_POSITIONS' '-DV8_USE_SIPHASH'
'-DDISABLE_UNTRUSTED_CODE_MITIGATIONS' '-DV8_WIN64_UNWINDING_INFO'
'-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATCH' '-DV8_SNAPSHOT_COMPRESSION'
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -I../deps/v8
-I../deps/v8/include  -pthread -Wno-unused-parameter -m64 -Wno-return-type
-fno-strict-aliasing -m64 -O3 -fno-omit-frame-pointer -fdata-sections
-ffunction-sections -O3 -fno-rtti -std=gnu++1y -fexceptions -MMD -MF
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/.deps//home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/torque_base/deps/v8/src/torque/types.o.d.raw
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -O2
-I/home/wolf/app/qt-4.8/bd/app_application/host/include -c
In file included from ../deps/googletest/src/gtest-port.cc:87:
../deps/googletest/src/gtest-internal-inl.h: In constructor
'testing::internal::GTestFlagSaver::GTestFlagSaver()':
../deps/googletest/src/gtest-internal-inl.h:141:47: error:
'also_run_disabled_tests' was not declared in this scope; did you mean
'also_run_disabled_tests_'?
  141 |     also_run_disabled_tests_ = GTEST_FLAG_GET(also_run_disabled_tests);
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~
      |                                               also_run_disabled_tests_
../deps/googletest/src/gtest-internal-inl.h:141:32: error: 'GTEST_FLAG_GET' was
not declared in this scope; did you mean 'GTEST_FLAG'?
  141 |     also_run_disabled_tests_ = GTEST_FLAG_GET(also_run_disabled_tests);
      |                                ^~~~~~~~~~~~~~
      |                                GTEST_FLAG
../deps/googletest/src/gtest-internal-inl.h:142:40: error: 'break_on_failure'
was not declared in this scope; did you mean 'break_on_failure_'?
  142 |     break_on_failure_ = GTEST_FLAG_GET(break_on_failure);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        break_on_failure_
../deps/googletest/src/gtest-internal-inl.h:143:40: error: 'catch_exceptions'
was not declared in this scope; did you mean 'catch_exceptions_'?
  143 |     catch_exceptions_ = GTEST_FLAG_GET(catch_exceptions);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        catch_exceptions_
../deps/googletest/src/gtest-internal-inl.h:144:29: error: 'color' was not
declared in this scope; did you mean 'color_'?
  144 |     color_ = GTEST_FLAG_GET(color);
      |                             ^~~~~
      |                             color_
../deps/googletest/src/gtest-internal-inl.h:145:40: error: 'death_test_style'
was not declared in this scope; did you mean 'death_test_style_'?
  145 |     death_test_style_ = GTEST_FLAG_GET(death_test_style);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        death_test_style_
../deps/googletest/src/gtest-internal-inl.h:146:43: error:
'death_test_use_fork' was not declared in this scope; did you mean
'death_test_use_fork_'?
  146 |     death_test_use_fork_ = GTEST_FLAG_GET(death_test_use_fork);
      |                                           ^~~~~~~~~~~~~~~~~~~
      |                                           death_test_use_fork_
../deps/googletest/src/gtest-internal-inl.h:147:33: error: 'fail_fast' was not
declared in this scope; did you mean 'fail_fast_'?
  147 |     fail_fast_ = GTEST_FLAG_GET(fail_fast);
      |                                 ^~~~~~~~~
      |                                 fail_fast_
../deps/googletest/src/gtest-internal-inl.h:148:30: error: 'filter' was not
declared in this scope; did you mean 'filter_'?
  148 |     filter_ = GTEST_FLAG_GET(filter);
      |                              ^~~~~~
      |                              filter_
../deps/googletest/src/gtest-internal-inl.h:149:47: error:
'internal_run_death_test' was not declared in this scope; did you mean
'internal_run_death_test_'?
  149 |     internal_run_death_test_ = GTEST_FLAG_GET(internal_run_death_test);
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~
      |                                               internal_run_death_test_
../deps/googletest/src/gtest-internal-inl.h:150:34: error: 'list_tests' was not
declared in this scope; did you mean 'list_tests_'?
  150 |     list_tests_ = GTEST_FLAG_GET(list_tests);
      |                                  ^~~~~~~~~~
      |                                  list_tests_
../deps/googletest/src/gtest-internal-inl.h:151:30: error: 'output' was not
declared in this scope; did you mean 'output_'?
  151 |     output_ = GTEST_FLAG_GET(output);
      |                              ^~~~~~
      |                              output_
../deps/googletest/src/gtest-internal-inl.h:152:29: error: 'brief' was not
declared in this scope; did you mean 'brief_'?
  152 |     brief_ = GTEST_FLAG_GET(brief);
      |                             ^~~~~
      |                             brief_
../deps/googletest/src/gtest-internal-inl.h:153:34: error: 'print_time' was not
declared in this scope; did you mean 'print_time_'?
  153 |     print_time_ = GTEST_FLAG_GET(print_time);
      |                                  ^~~~~~~~~~
      |                                  print_time_
../deps/googletest/src/gtest-internal-inl.h:154:34: error: 'print_utf8' was not
declared in this scope; did you mean 'print_utf8_'?
  154 |     print_utf8_ = GTEST_FLAG_GET(print_utf8);
      |                                  ^~~~~~~~~~
      |                                  print_utf8_
../deps/googletest/src/gtest-internal-inl.h:155:35: error: 'random_seed' was
not declared in this scope; did you mean 'random_seed_'?
  155 |     random_seed_ = GTEST_FLAG_GET(random_seed);
      |                                   ^~~~~~~~~~~
      |                                   random_seed_
../deps/googletest/src/gtest-internal-inl.h:156:30: error: 'repeat' was not
declared in this scope; did you mean 'repeat_'?
  156 |     repeat_ = GTEST_FLAG_GET(repeat);
      |                              ^~~~~~
      |                              repeat_
../deps/googletest/src/gtest-internal-inl.h:158:24: error:
'recreate_environments_when_repeating' was not declared in this scope; did you
mean 'recreate_environments_when_repeating_'?
  158 |         GTEST_FLAG_GET(recreate_environments_when_repeating);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        recreate_environments_when_repeating_
../deps/googletest/src/gtest-internal-inl.h:159:31: error: 'shuffle' was not
declared in this scope; did you mean 'std::shuffle'?
  159 |     shuffle_ = GTEST_FLAG_GET(shuffle);
      |                               ^~~~~~~
      |                               std::shuffle
In file included from /usr/include/c++/11/algorithm:62,
                 from ../deps/googletest/src/gtest-internal-inl.h:44,
                 from ../deps/googletest/src/gtest-port.cc:87:
/usr/include/c++/11/bits/stl_algo.h:3729:5: note: 'std::shuffle' declared here
 3729 |     shuffle(_RandomAccessIterator __first, _RandomAccessIterator
__last,
      |     ^~~~~~~
In file included from ../deps/googletest/src/gtest-port.cc:87:
../deps/googletest/src/gtest-internal-inl.h:160:41: error: 'stack_trace_depth'
was not declared in this scope; did you mean 'stack_trace_depth_'?
  160 |     stack_trace_depth_ = GTEST_FLAG_GET(stack_trace_depth);
      |                                         ^~~~~~~~~~~~~~~~~
      |                                         stack_trace_depth_
../deps/googletest/src/gtest-internal-inl.h:161:40: error: 'stream_result_to'
was not declared in this scope; did you mean 'stream_result_to_'?
  161 |     stream_result_to_ = GTEST_FLAG_GET(stream_result_to);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        stream_result_to_
../deps/googletest/src/gtest-internal-inl.h:162:40: error: 'throw_on_failure'
was not declared in this scope; did you mean 'throw_on_failure_'?
  162 |     throw_on_failure_ = GTEST_FLAG_GET(throw_on_failure);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        throw_on_failure_
../deps/googletest/src/gtest-internal-inl.h: In destructor
'testing::internal::GTestFlagSaver::~GTestFlagSaver()':
../deps/googletest/src/gtest-internal-inl.h:167:20: error:
'also_run_disabled_tests' was not declared in this scope; did you mean
'also_run_disabled_tests_'?
  167 |     GTEST_FLAG_SET(also_run_disabled_tests, also_run_disabled_tests_);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
      |                    also_run_disabled_tests_
../deps/googletest/src/gtest-internal-inl.h:167:5: error: 'GTEST_FLAG_SET' was
not declared in this scope; did you mean 'GTEST_FLAG_SAVER_'?
  167 |     GTEST_FLAG_SET(also_run_disabled_tests, also_run_disabled_tests_);
      |     ^~~~~~~~~~~~~~
      |     GTEST_FLAG_SAVER_
../deps/googletest/src/gtest-internal-inl.h:168:20: error: 'break_on_failure'
was not declared in this scope; did you mean 'break_on_failure_'?
  168 |     GTEST_FLAG_SET(break_on_failure, break_on_failure_);
      |                    ^~~~~~~~~~~~~~~~
      |                    break_on_failure_
../deps/googletest/src/gtest-internal-inl.h:169:20: error: 'catch_exceptions'
was not declared in this scope; did you mean 'catch_exceptions_'?
  169 |     GTEST_FLAG_SET(catch_exceptions, catch_exceptions_);
      |                    ^~~~~~~~~~~~~~~~
      |                    catch_exceptions_
../deps/googletest/src/gtest-internal-inl.h:170:20: error: 'color' was not
declared in this scope; did you mean 'color_'?
  170 |     GTEST_FLAG_SET(color, color_);
      |                    ^~~~~
      |                    color_
../deps/googletest/src/gtest-internal-inl.h:171:20: error: 'death_test_style'
was not declared in this scope; did you mean 'death_test_style_'?
  171 |     GTEST_FLAG_SET(death_test_style, death_test_style_);
      |                    ^~~~~~~~~~~~~~~~
      |                    death_test_style_
../deps/googletest/src/gtest-internal-inl.h:172:20: error:
'death_test_use_fork' was not declared in this scope; did you mean
'death_test_use_fork_'?
  172 |     GTEST_FLAG_SET(death_test_use_fork, death_test_use_fork_);
      |                    ^~~~~~~~~~~~~~~~~~~
      |                    death_test_use_fork_
../deps/googletest/src/gtest-internal-inl.h:173:20: error: 'filter' was not
declared in this scope; did you mean 'filter_'?
  173 |     GTEST_FLAG_SET(filter, filter_);
      |                    ^~~~~~
      |                    filter_
../deps/googletest/src/gtest-internal-inl.h:174:20: error: 'fail_fast' was not
declared in this scope; did you mean 'fail_fast_'?
  174 |     GTEST_FLAG_SET(fail_fast, fail_fast_);
      |                    ^~~~~~~~~
      |                    fail_fast_
../deps/googletest/src/gtest-internal-inl.h:175:20: error:
'internal_run_death_test' was not declared in this scope; did you mean
'internal_run_death_test_'?
  175 |     GTEST_FLAG_SET(internal_run_death_test, internal_run_death_test_);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
      |                    internal_run_death_test_
../deps/googletest/src/gtest-internal-inl.h:176:20: error: 'list_tests' was not
declared in this scope; did you mean 'list_tests_'?
  176 |     GTEST_FLAG_SET(list_tests, list_tests_);
      |                    ^~~~~~~~~~
      |                    list_tests_
../deps/googletest/src/gtest-internal-inl.h:177:20: error: 'output' was not
declared in this scope; did you mean 'output_'?
  177 |     GTEST_FLAG_SET(output, output_);
      |                    ^~~~~~
      |                    output_
../deps/googletest/src/gtest-internal-inl.h:178:20: error: 'brief' was not
declared in this scope; did you mean 'brief_'?
  178 |     GTEST_FLAG_SET(brief, brief_);
      |                    ^~~~~
      |                    brief_
../deps/googletest/src/gtest-internal-inl.h:179:20: error: 'print_time' was not
declared in this scope; did you mean 'print_time_'?
  179 |     GTEST_FLAG_SET(print_time, print_time_);
      |                    ^~~~~~~~~~
      |                    print_time_
../deps/googletest/src/gtest-internal-inl.h:180:20: error: 'print_utf8' was not
declared in this scope; did you mean 'print_utf8_'?
  180 |     GTEST_FLAG_SET(print_utf8, print_utf8_);
      |                    ^~~~~~~~~~
      |                    print_utf8_
../deps/googletest/src/gtest-internal-inl.h:181:20: error: 'random_seed' was
not declared in this scope; did you mean 'random_seed_'?
  181 |     GTEST_FLAG_SET(random_seed, random_seed_);
      |                    ^~~~~~~~~~~
      |                    random_seed_
../deps/googletest/src/gtest-internal-inl.h:182:20: error: 'repeat' was not
declared in this scope; did you mean 'repeat_'?
  182 |     GTEST_FLAG_SET(repeat, repeat_);
      |                    ^~~~~~
      |                    repeat_
../deps/googletest/src/gtest-internal-inl.h:183:20: error:
'recreate_environments_when_repeating' was not declared in this scope; did you
mean 'recreate_environments_when_repeating_'?
  183 |     GTEST_FLAG_SET(recreate_environments_when_repeating,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                    recreate_environments_when_repeating_
../deps/googletest/src/gtest-internal-inl.h:185:20: error: 'shuffle' was not
declared in this scope; did you mean 'std::shuffle'?
  185 |     GTEST_FLAG_SET(shuffle, shuffle_);
      |                    ^~~~~~~
      |                    std::shuffle
In file included from /usr/include/c++/11/algorithm:62,
                 from ../deps/googletest/src/gtest-internal-inl.h:44,
                 from ../deps/googletest/src/gtest-port.cc:87:
/usr/include/c++/11/bits/stl_algo.h:3729:5: note: 'std::shuffle' declared here
 3729 |     shuffle(_RandomAccessIterator __first, _RandomAccessIterator
__last,
      |     ^~~~~~~
In file included from ../deps/googletest/src/gtest-port.cc:87:
../deps/googletest/src/gtest-internal-inl.h:186:20: error: 'stack_trace_depth'
was not declared in this scope; did you mean 'stack_trace_depth_'?
  186 |     GTEST_FLAG_SET(stack_trace_depth, stack_trace_depth_);
      |                    ^~~~~~~~~~~~~~~~~
      |                    stack_trace_depth_
../deps/googletest/src/gtest-internal-inl.h:187:20: error: 'stream_result_to'
was not declared in this scope; did you mean 'stream_result_to_'?
  187 |     GTEST_FLAG_SET(stream_result_to, stream_result_to_);
      |                    ^~~~~~~~~~~~~~~~
      |                    stream_result_to_
../deps/googletest/src/gtest-internal-inl.h:188:20: error: 'throw_on_failure'
was not declared in this scope; did you mean 'throw_on_failure_'?
  188 |     GTEST_FLAG_SET(throw_on_failure, throw_on_failure_);
      |                    ^~~~~~~~~~~~~~~~
      |                    throw_on_failure_
make[3]: *** [deps/googletest/gtest.target.mk:95:
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/gtest/deps/googletest/src/gtest-port.o]
Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from ../deps/googletest/src/gtest-death-test.cc:86:
../deps/googletest/src/gtest-internal-inl.h: In constructor
'testing::internal::GTestFlagSaver::GTestFlagSaver()':
../deps/googletest/src/gtest-internal-inl.h:141:47: error:
'also_run_disabled_tests' was not declared in this scope; did you mean
'also_run_disabled_tests_'?
  141 |     also_run_disabled_tests_ = GTEST_FLAG_GET(also_run_disabled_tests);
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~
      |                                               also_run_disabled_tests_
../deps/googletest/src/gtest-internal-inl.h:141:32: error: 'GTEST_FLAG_GET' was
not declared in this scope; did you mean 'GTEST_FLAG'?
  141 |     also_run_disabled_tests_ = GTEST_FLAG_GET(also_run_disabled_tests);
      |                                ^~~~~~~~~~~~~~
      |                                GTEST_FLAG
../deps/googletest/src/gtest-internal-inl.h:142:40: error: 'break_on_failure'
was not declared in this scope; did you mean 'break_on_failure_'?
  142 |     break_on_failure_ = GTEST_FLAG_GET(break_on_failure);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        break_on_failure_
../deps/googletest/src/gtest-internal-inl.h:143:40: error: 'catch_exceptions'
was not declared in this scope; did you mean 'catch_exceptions_'?
  143 |     catch_exceptions_ = GTEST_FLAG_GET(catch_exceptions);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        catch_exceptions_
../deps/googletest/src/gtest-internal-inl.h:144:29: error: 'color' was not
declared in this scope; did you mean 'color_'?
  144 |     color_ = GTEST_FLAG_GET(color);
      |                             ^~~~~
      |                             color_
../deps/googletest/src/gtest-internal-inl.h:145:40: error: 'death_test_style'
was not declared in this scope; did you mean 'death_test_style_'?
  145 |     death_test_style_ = GTEST_FLAG_GET(death_test_style);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        death_test_style_
../deps/googletest/src/gtest-internal-inl.h:146:43: error:
'death_test_use_fork' was not declared in this scope; did you mean
'death_test_use_fork_'?
  146 |     death_test_use_fork_ = GTEST_FLAG_GET(death_test_use_fork);
      |                                           ^~~~~~~~~~~~~~~~~~~
      |                                           death_test_use_fork_
../deps/googletest/src/gtest-internal-inl.h:147:33: error: 'fail_fast' was not
declared in this scope; did you mean 'fail_fast_'?
  147 |     fail_fast_ = GTEST_FLAG_GET(fail_fast);
      |                                 ^~~~~~~~~
      |                                 fail_fast_
../deps/googletest/src/gtest-internal-inl.h:148:30: error: 'filter' was not
declared in this scope; did you mean 'filter_'?
  148 |     filter_ = GTEST_FLAG_GET(filter);
      |                              ^~~~~~
      |                              filter_
../deps/googletest/src/gtest-internal-inl.h:149:47: error:
'internal_run_death_test' was not declared in this scope; did you mean
'internal_run_death_test_'?
  149 |     internal_run_death_test_ = GTEST_FLAG_GET(internal_run_death_test);
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~
      |                                               internal_run_death_test_
../deps/googletest/src/gtest-internal-inl.h:150:34: error: 'list_tests' was not
declared in this scope; did you mean 'list_tests_'?
  150 |     list_tests_ = GTEST_FLAG_GET(list_tests);
      |                                  ^~~~~~~~~~
      |                                  list_tests_
../deps/googletest/src/gtest-internal-inl.h:151:30: error: 'output' was not
declared in this scope; did you mean 'output_'?
  151 |     output_ = GTEST_FLAG_GET(output);
      |                              ^~~~~~
      |                              output_
../deps/googletest/src/gtest-internal-inl.h:152:29: error: 'brief' was not
declared in this scope; did you mean 'brief_'?
  152 |     brief_ = GTEST_FLAG_GET(brief);
      |                             ^~~~~
      |                             brief_
../deps/googletest/src/gtest-internal-inl.h:153:34: error: 'print_time' was not
declared in this scope; did you mean 'print_time_'?
  153 |     print_time_ = GTEST_FLAG_GET(print_time);
      |                                  ^~~~~~~~~~
      |                                  print_time_
../deps/googletest/src/gtest-internal-inl.h:154:34: error: 'print_utf8' was not
declared in this scope; did you mean 'print_utf8_'?
  154 |     print_utf8_ = GTEST_FLAG_GET(print_utf8);
      |                                  ^~~~~~~~~~
      |                                  print_utf8_
../deps/googletest/src/gtest-internal-inl.h:155:35: error: 'random_seed' was
not declared in this scope; did you mean 'random_seed_'?
  155 |     random_seed_ = GTEST_FLAG_GET(random_seed);
      |                                   ^~~~~~~~~~~
      |                                   random_seed_
../deps/googletest/src/gtest-internal-inl.h:156:30: error: 'repeat' was not
declared in this scope; did you mean 'repeat_'?
  156 |     repeat_ = GTEST_FLAG_GET(repeat);
      |                              ^~~~~~
      |                              repeat_
../deps/googletest/src/gtest-internal-inl.h:158:24: error:
'recreate_environments_when_repeating' was not declared in this scope; did you
mean 'recreate_environments_when_repeating_'?
  158 |         GTEST_FLAG_GET(recreate_environments_when_repeating);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        recreate_environments_when_repeating_
../deps/googletest/src/gtest-internal-inl.h:159:31: error: 'shuffle' was not
declared in this scope; did you mean 'std::shuffle'?
  159 |     shuffle_ = GTEST_FLAG_GET(shuffle);
      |                               ^~~~~~~
      |                               std::shuffle
In file included from /usr/include/c++/11/algorithm:62,
                 from ../deps/googletest/src/gtest-internal-inl.h:44,
                 from ../deps/googletest/src/gtest-death-test.cc:86:
/usr/include/c++/11/bits/stl_algo.h:3729:5: note: 'std::shuffle' declared here
 3729 |     shuffle(_RandomAccessIterator __first, _RandomAccessIterator
__last,
      |     ^~~~~~~
In file included from ../deps/googletest/src/gtest-death-test.cc:86:
../deps/googletest/src/gtest-internal-inl.h:160:41: error: 'stack_trace_depth'
was not declared in this scope; did you mean 'stack_trace_depth_'?
  160 |     stack_trace_depth_ = GTEST_FLAG_GET(stack_trace_depth);
      |                                         ^~~~~~~~~~~~~~~~~
      |                                         stack_trace_depth_
../deps/googletest/src/gtest-internal-inl.h:161:40: error: 'stream_result_to'
was not declared in this scope; did you mean 'stream_result_to_'?
  161 |     stream_result_to_ = GTEST_FLAG_GET(stream_result_to);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        stream_result_to_
../deps/googletest/src/gtest-internal-inl.h:162:40: error: 'throw_on_failure'
was not declared in this scope; did you mean 'throw_on_failure_'?
  162 |     throw_on_failure_ = GTEST_FLAG_GET(throw_on_failure);
      |                                        ^~~~~~~~~~~~~~~~
      |                                        throw_on_failure_
../deps/googletest/src/gtest-internal-inl.h: In destructor
'testing::internal::GTestFlagSaver::~GTestFlagSaver()':
../deps/googletest/src/gtest-internal-inl.h:167:20: error:
'also_run_disabled_tests' was not declared in this scope; did you mean
'also_run_disabled_tests_'?
  167 |     GTEST_FLAG_SET(also_run_disabled_tests, also_run_disabled_tests_);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
      |                    also_run_disabled_tests_
../deps/googletest/src/gtest-internal-inl.h:167:5: error: 'GTEST_FLAG_SET' was
not declared in this scope; did you mean 'GTEST_FLAG_SAVER_'?
  167 |     GTEST_FLAG_SET(also_run_disabled_tests, also_run_disabled_tests_);
      |     ^~~~~~~~~~~~~~
      |     GTEST_FLAG_SAVER_
../deps/googletest/src/gtest-internal-inl.h:168:20: error: 'break_on_failure'
was not declared in this scope; did you mean 'break_on_failure_'?
  168 |     GTEST_FLAG_SET(break_on_failure, break_on_failure_);
      |                    ^~~~~~~~~~~~~~~~
      |                    break_on_failure_
../deps/googletest/src/gtest-internal-inl.h:169:20: error: 'catch_exceptions'
was not declared in this scope; did you mean 'catch_exceptions_'?
  169 |     GTEST_FLAG_SET(catch_exceptions, catch_exceptions_);
      |                    ^~~~~~~~~~~~~~~~
      |                    catch_exceptions_
../deps/googletest/src/gtest-internal-inl.h:170:20: error: 'color' was not
declared in this scope; did you mean 'color_'?
  170 |     GTEST_FLAG_SET(color, color_);
      |                    ^~~~~
      |                    color_
../deps/googletest/src/gtest-internal-inl.h:171:20: error: 'death_test_style'
was not declared in this scope; did you mean 'death_test_style_'?
  171 |     GTEST_FLAG_SET(death_test_style, death_test_style_);
      |                    ^~~~~~~~~~~~~~~~
      |                    death_test_style_
../deps/googletest/src/gtest-internal-inl.h:172:20: error:
'death_test_use_fork' was not declared in this scope; did you mean
'death_test_use_fork_'?
  172 |     GTEST_FLAG_SET(death_test_use_fork, death_test_use_fork_);
      |                    ^~~~~~~~~~~~~~~~~~~
      |                    death_test_use_fork_
../deps/googletest/src/gtest-internal-inl.h:173:20: error: 'filter' was not
declared in this scope; did you mean 'filter_'?
  173 |     GTEST_FLAG_SET(filter, filter_);
      |                    ^~~~~~
      |                    filter_
../deps/googletest/src/gtest-internal-inl.h:174:20: error: 'fail_fast' was not
declared in this scope; did you mean 'fail_fast_'?
  174 |     GTEST_FLAG_SET(fail_fast, fail_fast_);
      |                    ^~~~~~~~~
      |                    fail_fast_
../deps/googletest/src/gtest-internal-inl.h:175:20: error:
'internal_run_death_test' was not declared in this scope; did you mean
'internal_run_death_test_'?
  175 |     GTEST_FLAG_SET(internal_run_death_test, internal_run_death_test_);
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
      |                    internal_run_death_test_
../deps/googletest/src/gtest-internal-inl.h:176:20: error: 'list_tests' was not
declared in this scope; did you mean 'list_tests_'?
  176 |     GTEST_FLAG_SET(list_tests, list_tests_);
      |                    ^~~~~~~~~~
      |                    list_tests_
../deps/googletest/src/gtest-internal-inl.h:177:20: error: 'output' was not
declared in this scope; did you mean 'output_'?
  177 |     GTEST_FLAG_SET(output, output_);
      |                    ^~~~~~
      |                    output_
../deps/googletest/src/gtest-internal-inl.h:178:20: error: 'brief' was not
declared in this scope; did you mean 'brief_'?
  178 |     GTEST_FLAG_SET(brief, brief_);
      |                    ^~~~~
      |                    brief_
../deps/googletest/src/gtest-internal-inl.h:179:20: error: 'print_time' was not
declared in this scope; did you mean 'print_time_'?
  179 |     GTEST_FLAG_SET(print_time, print_time_);
      |                    ^~~~~~~~~~
      |                    print_time_
../deps/googletest/src/gtest-internal-inl.h:180:20: error: 'print_utf8' was not
declared in this scope; did you mean 'print_utf8_'?
  180 |     GTEST_FLAG_SET(print_utf8, print_utf8_);
      |                    ^~~~~~~~~~
      |                    print_utf8_
../deps/googletest/src/gtest-internal-inl.h:181:20: error: 'random_seed' was
not declared in this scope; did you mean 'random_seed_'?
  181 |     GTEST_FLAG_SET(random_seed, random_seed_);
      |                    ^~~~~~~~~~~
      |                    random_seed_
../deps/googletest/src/gtest-internal-inl.h:182:20: error: 'repeat' was not
declared in this scope; did you mean 'repeat_'?
  182 |     GTEST_FLAG_SET(repeat, repeat_);
      |                    ^~~~~~
      |                    repeat_
../deps/googletest/src/gtest-internal-inl.h:183:20: error:
'recreate_environments_when_repeating' was not declared in this scope; did you
mean 'recreate_environments_when_repeating_'?
  183 |     GTEST_FLAG_SET(recreate_environments_when_repeating,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                    recreate_environments_when_repeating_
../deps/googletest/src/gtest-internal-inl.h:185:20: error: 'shuffle' was not
declared in this scope; did you mean 'std::shuffle'?
  185 |     GTEST_FLAG_SET(shuffle, shuffle_);
      |                    ^~~~~~~
      |                    std::shuffle
In file included from /usr/include/c++/11/algorithm:62,
                 from ../deps/googletest/src/gtest-internal-inl.h:44,
                 from ../deps/googletest/src/gtest-death-test.cc:86:
/usr/include/c++/11/bits/stl_algo.h:3729:5: note: 'std::shuffle' declared here
 3729 |     shuffle(_RandomAccessIterator __first, _RandomAccessIterator
__last,
      |     ^~~~~~~
In file included from ../deps/googletest/src/gtest-death-test.cc:86:
../deps/googletest/src/gtest-internal-inl.h:186:20: error: 'stack_trace_depth'
was not declared in this scope; did you mean 'stack_trace_depth_'?
  186 |     GTEST_FLAG_SET(stack_trace_depth, stack_trace_depth_);
      |                    ^~~~~~~~~~~~~~~~~
      |                    stack_trace_depth_
../deps/googletest/src/gtest-internal-inl.h:187:20: error: 'stream_result_to'
was not declared in this scope; did you mean 'stream_result_to_'?
  187 |     GTEST_FLAG_SET(stream_result_to, stream_result_to_);
      |                    ^~~~~~~~~~~~~~~~
      |                    stream_result_to_
../deps/googletest/src/gtest-internal-inl.h:188:20: error: 'throw_on_failure'
was not declared in this scope; did you mean 'throw_on_failure_'?
  188 |     GTEST_FLAG_SET(throw_on_failure, throw_on_failure_);
      |                    ^~~~~~~~~~~~~~~~
      |                    throw_on_failure_
../deps/googletest/src/gtest-death-test.cc: In function 'bool
testing::internal::InDeathTestChild()':
../deps/googletest/src/gtest-death-test.cc:158:22: error: 'death_test_style'
was not declared in this scope
  158 |   if (GTEST_FLAG_GET(death_test_style) == "threadsafe")
      |                      ^~~~~~~~~~~~~~~~
../deps/googletest/src/gtest-death-test.cc:158:7: error: 'GTEST_FLAG_GET' was
not declared in this scope; did you mean 'GTEST_FLAG'?
  158 |   if (GTEST_FLAG_GET(death_test_style) == "threadsafe")
      |       ^~~~~~~~~~~~~~
      |       GTEST_FLAG
../deps/googletest/src/gtest-death-test.cc:159:28: error:
'internal_run_death_test' was not declared in this scope
  159 |     return !GTEST_FLAG_GET(internal_run_death_test).empty();
      |                            ^~~~~~~~~~~~~~~~~~~~~~~
../deps/googletest/src/gtest-death-test.cc: In function 'pid_t
testing::internal::ExecDeathTestSpawnChild(char* const*, int)':
../deps/googletest/src/gtest-death-test.cc:1357:40: error:
'death_test_use_fork' was not declared in this scope; did you mean
'kDeathTestUseFork'?
 1357 |   const bool use_fork = GTEST_FLAG_GET(death_test_use_fork);
      |                                        ^~~~~~~~~~~~~~~~~~~
      |                                        kDeathTestUseFork
../deps/googletest/src/gtest-death-test.cc:1357:25: error: 'GTEST_FLAG_GET' was
not declared in this scope; did you mean 'GTEST_FLAG'?
...
make[3]: *** [deps/googletest/gtest.target.mk:95:
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/out/Release/obj.target/gtest/deps/googletest/src/gtest.o]
Error 1
rm 4f7c1a89e04c50fcacd30a15d378b4faf6ad5a6b.intermediate
16593acc0303e927006aca117115752a4e2a6813.intermediate
make[2]: *** [Makefile:109: node] Error 2
make[1]: *** [package/pkg-generic.mk:293:
/home/wolf/app/qt-4.8/bd/app_application/build/host-nodejs-14.18.3/.stamp_built]
Error 2
make: *** [Makefile:23: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

