From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 21:50:38 +0100
Subject: [Buildroot] [git commit] uclibc: do not use GENERATE_LOCALE
Message-ID: <20141121205146.758237FE1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b49c92c33f2f6d34ba6facb288656f4c458f295
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 33de7401701e5242196a86b0695ee4ae9a4c4082 ("Makefile:
convert "target-generatelocales" to a hook"), the GENERATE_LOCALE
variable is never defined when using uClibc. This means that setting
any value to the BR2_GENERATE_LOCALE option had no effect for uClibc
toolchains.

In this commit, we make sure the uclibc.mk logic re-creates its own
qstripped version of BR2_GENERATE_LOCALE, in a variable called
UCLIBC_GENERATE_LOCALES.

This fixes locale generation with uClibc in the internal toolchain
backend.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index ce416dd..2d95ce1 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -47,12 +47,14 @@ UCLIBC_KCONFIG_OPTS = \
 
 UCLIBC_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_TARGET_ARCH))
 
-ifeq ($(GENERATE_LOCALE),)
+UCLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
+
+ifeq ($(UCLIBC_GENERATE_LOCALES),)
 # We need at least one locale
 UCLIBC_LOCALES = en_US
 else
 # Strip out the encoding part of locale names, if any
-UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
+UCLIBC_LOCALES = $(foreach locale,$(UCLIBC_GENERATE_LOCALES),\
 		   $(firstword $(subst .,$(space),$(locale))))
 endif
 
