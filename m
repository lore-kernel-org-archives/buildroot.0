From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 19:46:25 +0100
Subject: [Buildroot] [git commit] package/opentracing-cpp: fix build if
 clang-tidy is installed on the host
Message-ID: <20210126182647.F1577835E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aede6dd7b67a47ce8182cf04168506080e5ae33b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opentracing-cpp fails to build if clang-tidy is installed:

...
-- clang-tidy found: /usr/lib/llvm/11/bin/clang-tidy
-- Configuring done
-- Generating done
...

[ 25%] Building CXX object CMakeFiles/opentracing.dir/src/propagation.cpp.o
.../buildroot/output/build/opentracing-cpp-1.5.1/include/opentracing/string_view.h:5:10: error: 'algorithm' file not found [clang-diagnostic-error]
         ^
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:3:11: warning: '__llvm_libc' needs to be the outermost namespace [llvmlibc-implementation-in-namespace]
namespace opentracing {
          ^
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:11:3: warning: use '= default' to define a trivial default constructor [hicpp-use-equals-default,modernize-use-equals-default]
  PropagationErrorCategory() {}
  ^                          ~~
                             = default;
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:13:15: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
  const char* name() const noexcept override {
  ~~~~~~~~~~~ ^
  auto                              -> const char*
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:13:15: warning: method 'name' can be made static [readability-convert-member-functions-to-static]
  const char* name() const noexcept override {
              ^      ~~~~~~
  static
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:17:24: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
  std::error_condition default_error_condition(int code) const
                       ^
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:37:15: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
  std::string message(int code) const override {
              ^
.../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp:58:28: warning: use a trailing return type for this function [modernize-use-trailing-return-type]
const std::error_category& propagation_error_category() {
                           ^
226 warnings and 1 error generated.
Error while processing .../buildroot/output/build/opentracing-cpp-1.5.1/src/propagation.cpp.
Suppressed 218 warnings (218 in non-user code).
Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
Found compiler error(s).
make[3]: *** [CMakeFiles/opentracing.dir/build.make:83: CMakeFiles/opentracing.dir/src/propagation.cpp.o] Error 1
make[3]: *** Waiting for unfinished jobs....
.../buildroot/output/build/opentracing-cpp-1.5.1/include/opentracing/string_view.h:5:10: error: 'algorithm' file not found [clang-diagnostic-error]
         ^
.../buildroot/output/build/opentracing-cpp-1.5.1/src/dynamic_load.cpp:4:

Disable the 'ENABLE_LINTING' option to avoid this influence.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opentracing-cpp/opentracing-cpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
index d466a80237..0605cd5d96 100644
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -22,4 +22,6 @@ else ifeq ($(BR2_SHARED_LIBS),y)
 OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
 endif
 
+OPENTRACING_CPP_CONF_OPTS += -DENABLE_LINTING=OFF
+
 $(eval $(cmake-package))
