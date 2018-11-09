From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Fri,  9 Nov 2018 13:35:03 -0600
Subject: [Buildroot] [PATCH v1 2/2] package/proftpd: add sendfile
In-Reply-To: <20181109193503.7984-1-jared.bents@rockwellcollins.com>
References: <20181109193503.7984-1-jared.bents@rockwellcollins.com>
Message-ID: <20181109193503.7984-2-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enables sendfile as a compile time option

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/proftpd/Config.in  | 6 ++++++
 package/proftpd/proftpd.mk | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 51c795501e..ab3f0d3bf3 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -73,4 +73,10 @@ config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
 	  Compile ProFTPD with tunable buffer size. Size in
 	  bytes. 0 uses default size.
 
+config BR2_PACKAGE_PROFTPD_SENDFILE
+	bool "sendfile support"
+	help
+	  Compile ProFTPD with sendfile. Sendfile implements
+	  zero-copy transfers.
+
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 5ff0bc17e5..45bc13eafa 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -125,4 +125,8 @@ ifneq ($(BR2_PACKAGE_PROFTPD_BUFFER_SIZE),0)
 PROFTPD_CONF_OPTS += --enable-tunable-buffer-size=$(BR2_PACKAGE_PROFTPD_BUFFER_SIZE)
 endif
 
+ifeq ($(BR2_PACKAGE_PROFTPD_SENDFILE),y)
+PROFTPD_CONF_OPTS += --enable-sendfile
+endif
+
 $(eval $(autotools-package))
-- 
2.18.0
