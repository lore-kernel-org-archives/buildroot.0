From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 08:11:44 +0200
Subject: [Buildroot] [git commit] package/axel: fix link order
Message-ID: <20160816062550.1F82C8082A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=161746ca8fde099fa2994a00f89f829f02924897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libintl may use thread-related functions, so -lpthread must come after
-lintl.

Fixes:
    http://autobuild.buildroot.org/results/e9d/e9d89fd5b24a76a3c5ab9dc8f01f4643f7c13396/

[Peter: use -lpthread in comment as suggested by Arnout]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axel/axel.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 6328d99..25357a3 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -9,13 +9,14 @@ AXEL_SITE = http://sources.buildroot.net
 AXEL_LICENSE = GPLv2+
 AXEL_LICENSE_FILES = COPYING
 
-AXEL_LDFLAGS = -lpthread
-
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
 AXEL_DEPENDENCIES += gettext
 AXEL_LDFLAGS += -lintl
 endif
 
+# -lintl may use symbols from -lpthread
+AXEL_LDFLAGS += -lpthread
+
 ifneq ($(BR2_ENABLE_LOCALE),y)
 AXEL_DISABLE_I18N = --i18n=0
 endif
