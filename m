From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 31 Jan 2015 20:34:53 +0100
Subject: [Buildroot] [PATCH v1] madplay: add explicitly link against
	phthread library in case of alsasound support
Message-ID: <1422732893-5156-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]: configure check for libasound failed because of missing
pthread linkage.

[1] http://autobuild.buildroot.net/results/f3a/f3a0b3ff15e729d223c8c8ee6af75c425cd344b6/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/madplay/madplay.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
index 1907eb5..49c3e5d 100644
--- a/package/madplay/madplay.mk
+++ b/package/madplay/madplay.mk
@@ -16,6 +16,8 @@ MADPLAY_DEPENDENCIES = libmad libid3tag $(if $(BR2_PACKAGE_GETTEXT),gettext)
 ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
 MADPLAY_CONF_OPTS += --with-alsa
 MADPLAY_DEPENDENCIES += alsa-lib
+# explicitly link against pthread library, fixes libasound configure check
+MADPLAY_CONF_ENV = LIBS=-lpthread
 endif
 
 $(eval $(autotools-package))
-- 
2.1.2
