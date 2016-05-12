From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 12 May 2016 14:48:13 +0200
Subject: [Buildroot] [PATCH] libpjsip: disable parallel build
Message-ID: <1463057293-2833-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libpjsip package has build issues on the autobuilders that look
like parallel build issues. These issues seem to be extremely hard to
reproduce, so let's disable parallel build and see if this fixes the
issue.

The suspect error message is:
  ...-ld: cannot find -lpjsua
  collect2: error: ld returned 1 exit status

Some of the failures:
  http://autobuild.buildroot.org/results/d6b/d6bff569bc9238cdf07970e11b5535d570be59bf
  http://autobuild.buildroot.org/results/f72/f721d5390bc61274c224bfe3a675ee194172ac91
  http://autobuild.buildroot.org/results/b45/b45262971a7d7ce0604d124734223abca190c11e
  http://autobuild.buildroot.org/results/75e/75ee45b746ab8b80eb84297e2e4babbace1b5608
  http://autobuild.buildroot.org/results/873/873771fbcc859578ed40a3c81b69ac3a388ae585

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

No, this is _not_ the fix that I would like to see. But I'm still
unable to reproduce despite having attempted several builds, so this
is the best I could come up with... :-|
---
 package/libpjsip/libpjsip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 730d9fe..ebb5897 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -11,6 +11,7 @@ LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPLv2+
 LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_INSTALL_STAGING = YES
+LIBPJSIP_MAKE = $(MAKE1)
 
 LIBPJSIP_CONF_ENV = \
 	LD="$(TARGET_CC)" \
-- 
2.7.4
