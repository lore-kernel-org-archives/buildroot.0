From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 28 Apr 2015 17:42:27 +0200
Subject: [Buildroot] [PATCH] qt: QT_COORD_TYPE_DOUBLE should only be set on
	soft float
In-Reply-To: <874mo0zj0r.fsf@dell.be.48ers.dk>
References: <874mo0zj0r.fsf@dell.be.48ers.dk>
Message-ID: <1430235747-5775-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If QT_COORD_TYPE_DOUBLE is forced and hard float is used, Qt compilation
breaks because it can't find hard coded operations on double.

Moreover, QT_COORD_TYPE is float only if QT_NO_FPU is set.
(cf src/corelib/global/qglobal.h)

So, we can safely make the QT_COORD_TYPE_DOUBLE option depend on
BR2_SOFT_FLOAT.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/qt/Config.in | 1 +
 1 file changed, 1 insertion(+)

based on master 2a15ce89ac5a
Compiled for:
cortexA8 in hard float/soft float with and without QT_COORD_TYPE_DOUBLE
x86_64
arm926t with and without QT_COORD_TYPE_DOUBLE

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 83fdeec812bb..9568b7010cff 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -121,6 +121,7 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 	  file, which Buildroot will give to Qt at compile time.
 
 config BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE
+	depends on BR2_SOFT_FLOAT
 	bool "QT_COORD_TYPE to double"
 	help
 	  Set QT_COORD_TYPE to double. On ARM-based platforms, qreal
-- 
2.3.4
