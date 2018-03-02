From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri,  2 Mar 2018 10:07:56 -0800
Subject: [Buildroot] [PATCH 2/2] apache: pass explicit sbindir
In-Reply-To: <20180302180756.14315-1-chrismcc@gmail.com>
References: <20180302180756.14315-1-chrismcc@gmail.com>
Message-ID: <20180302180756.14315-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The apache configure script help indicates that the sbindir is
PREFIX/sbin , but it actually uses PREFIX/bin.  Most people
probably expect httpd to be located in /usr/sbin/httpd

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/apache/apache.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e1b1a209cb..4fd5896d59 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -28,7 +28,10 @@ else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)
 APACHE_MPM = worker
 endif
 
+# Explicitly pass sbindir, because apache configure script defines it
+# to PREFIX/bin, which doesn't make much sense
 APACHE_CONF_OPTS = \
+	--sbindir=/usr/sbin \
 	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
-- 
2.14.3
