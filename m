From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 20 Mar 2016 00:41:46 +0100
Subject: [Buildroot] [PATCH 3/3] package/multicat: fix build with external
	Blackfin uClibc toolchain
In-Reply-To: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
References: <1458430906-8291-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1458430906-8291-3-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

multicat uses clock_nanosleep() conditionally if HAVE_NANOSLEEP is defined. The
bad is that multicat does not check for clock_nanosleep(), but defines
HAVE_NANOSLEEP if __APPLE__ is not defined.

uClibc has clock_nanosleep() only if built with UCLIBC_HAS_ADVANCED_REALTIME.
and the external Blackfin toolchain has no support for clock_nanosleep().

As multicat does not has a configuration setup we add a hook for this toolchain
and undef the macro HAVE_NANOSLEEP in the sources.

Fixes:
http://autobuild.buildroot.net/results/84f/84f8302ee94e6e6849f6b26cb697c2f9986bafe5/
http://autobuild.buildroot.net/results/9e0/9e07a98e87755c992254295c46edb0dace967a21/
http://autobuild.buildroot.net/results/4b0/4b07d276d7c09f2fc2d63c8c37c92519cfe36dbc/
http://autobuild.buildroot.net/results/84f/84f8302ee94e6e6849f6b26cb697c2f9986bafe5/
and many more.

The issue has been reported upstream [1].

[1] https://mailman.videolan.org/pipermail/multicat-devel/2016-March/000127.html

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/multicat/multicat.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/multicat/multicat.mk b/package/multicat/multicat.mk
index cc6eb78..944cb4c 100644
--- a/package/multicat/multicat.mk
+++ b/package/multicat/multicat.mk
@@ -12,6 +12,18 @@ MULTICAT_LICENSE_FILES = COPYING
 
 MULTICAT_DEPENDENCIES = bitstream
 
+# multicat does not test for HAVE_CLOCK_NANOSLEEP, but sets it if __APPLE__ is
+# not defined. The external Blackfin toolchain is uClibc which has
+# clock_nanosleep() only if built with UCLIBC_HAS_ADVANCED_REALTIME.
+# Use a hool to overwrite the definition of HAVE_CLOCK_NANOSLEEP for this
+# toolchain.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX),y)
+define MULTICAT_FIXUP_HAVE_CLOCK_NANOSLEEP
+$(SED) 's#define HAVE_CLOCK_NANOSLEEP#undef HAVE_CLOCK_NANOSLEEP#g' $(@D)/util.h
+endef
+MULTICAT_POST_PATCH_HOOKS += MULTICAT_FIXUP_HAVE_CLOCK_NANOSLEEP
+endif
+
 MULTICAT_MAKE_ENV = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)
 
 define MULTICAT_BUILD_CMDS
-- 
2.7.4
