From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 14 Aug 2020 23:19:40 +0200
Subject: [Buildroot] [PATCH 4/4] package/mpd: add libid3tag optional
 dependency
In-Reply-To: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
References: <20200814211940.1598502-1-fontaine.fabrice@gmail.com>
Message-ID: <20200814211940.1598502-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 8 ++++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f1f8d99465..fbde82ab58 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -395,6 +395,14 @@ config BR2_PACKAGE_MPD_UPNP
 	help
 	  Enable MPD UPnP client support.
 
+comment "Tag plugins"
+
+config BR2_PACKAGE_MPD_ID3TAG
+	bool "id3tag"
+	select BR2_PACKAGE_LIBID3TAG
+	help
+	  Enable ID3 support.
+
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 6"
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 566b105f61..65f9c6f2e0 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -110,6 +110,13 @@ else
 MPD_CONF_OPTS += -Dhttpd=false
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_ID3TAG),y)
+MPD_DEPENDENCIES += libid3tag
+MPD_CONF_OPTS += -Did3tag=enabled
+else
+MPD_CONF_OPTS += -Did3tag=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
 MPD_DEPENDENCIES += jack2
 MPD_CONF_OPTS += -Djack=enabled
-- 
2.27.0
