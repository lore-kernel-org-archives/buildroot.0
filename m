From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 14:46:33 +0200
Subject: [Buildroot] [git commit] package/lshw: don't use NONLS when
	BR2_SYSTEM_ENABLE_NLS is not set
Message-ID: <20170715124252.E954A81801@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aac99867ce9c4b72e55bb886e9a6600c6407d3eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since [1], NONLS is added to LSHW_CFLAGS even for glibc based toolchain.
Previously it was not the case since BR2_ENABLE_LOCALE is always
selected for glibc based toolchain.

With NONLS, config.h try to redefine two Intl function (textdomain and
bindtextdomain) that are used by glibc internally.

This break the build with the following error:
sysroot/usr/include/libintl.h:82:52: error: expected unqualified-id before 'throw'
 extern char *textdomain (const char *__domainname) __THROW;

The NONLS mode is really for cases where the C library does not provide
*any* gettext implementation, as would be the case with uClibc without
intl stubs enabled.

But in the context of Buildroot, all C libraries provide a gettext
implementation. It might be full-featured or minimal, but it always
exists.

So, remove NONLS from CFLAGS to avoid the build issue with glibc
toolchains.

Build tested with a uClibc toolchain without locale enabled.

Fixes:
http://autobuild.buildroot.net/results/9bf/9bf5437b4348ea8077013b80a51ce05fa328247d

[1] 3acd9f845de0489071719d52d774aab48d7f9c33

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lshw/lshw.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 43b937b..9b52b09 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -9,13 +9,8 @@ LSHW_SITE = http://ezix.org/software/files
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
-LSHW_CFLAGS = $(TARGET_CFLAGS)
-ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
-LSHW_CFLAGS += -DNONLS
-endif
-
 LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
-	RPM_OPT_FLAGS="$(LSHW_CFLAGS)" all
+	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
 LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	LIBS=$(TARGET_NLS_LIBS)
