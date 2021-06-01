From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:40:05 +0200
Subject: [Buildroot] [git commit] package/zmqpp: don't set CONFIG=debug
Message-ID: <20210607144659.0305B814BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47c26b3e5fcda164ffdf6b9e4be8057367203af9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Below are the flags set by zmqpp depending on the specified CONFIG variable:

CONFIG_FLAGS =
ifeq ($(CONFIG),debug)
        CONFIG_FLAGS = -g -fno-inline -ftemplate-depth-1000
endif
ifeq ($(CONFIG),valgrind)
        CONFIG_FLAGS = -g -O1 -DNO_DEBUG_LOG -DNO_TRACE_LOG
endif
ifeq ($(CONFIG),max)
        CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions \
            -fomit-frame-pointer -DNDEBUG
endif
ifneq (,$(findstring $(CONFIG),release loadtest))
        CONFIG_FLAGS = -O3 -funroll-loops -ffast-math -finline-functions \
            -fomit-frame-pointer -DNO_DEBUG_LOG -DNO_TRACE_LOG -DNDEBUG
endif

For the flags added with CONFIG=debug, '-g' is to be steered by the core
infrastructure (could be '-g1', '-g2' etc.)
The flag '-ftemplate-depth' is only a protection against incorrect code and
not really needed in Buildroot context.
Finally, the flag '-fno-inline' may be useful when really stepping through
zmqpp code, but is a very specific use case.

With the above in mind, not passing CONFIG=debug may actually be better.
Use 'CONFIG=buildroot' instead.

Note that we don't pass an empty 'CONFIG' to avoid confusion, as this
variable is also passed through to the variable BUILD_ENV, even though it is
currently unused.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zmqpp/zmqpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 3cd19d644a..c629f14920 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -19,7 +19,7 @@ ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 # -ffast-math -finline-functions -fomit-frame-pointer are disabled,
 # so only set CONFIG for the non-affected cases.
 ifneq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
-ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),debug,release)
+ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),buildroot,release)
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
