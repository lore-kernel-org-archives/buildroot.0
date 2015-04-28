From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Apr 2015 21:23:18 +0200
Subject: [Buildroot] [git commit] qt: QT_COORD_TYPE_DOUBLE should only be
	set on soft float
Message-ID: <20150428192346.B0C9E81829@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e07ec136ee3dd4bf16b18571623ac57f99136faa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If QT_COORD_TYPE_DOUBLE is forced and hard float is used, Qt compilation
breaks because it can't find hard coded operations on double.

Moreover, QT_COORD_TYPE is float only if QT_NO_FPU is set.
(cf src/corelib/global/qglobal.h)

So, we can safely make the QT_COORD_TYPE_DOUBLE option depend on
BR2_SOFT_FLOAT.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 83fdeec..9568b70 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -121,6 +121,7 @@ config BR2_PACKAGE_QT_CONFIG_FILE
 	  file, which Buildroot will give to Qt at compile time.
 
 config BR2_PACKAGE_QT_QT_COORD_TYPE_DOUBLE
+	depends on BR2_SOFT_FLOAT
 	bool "QT_COORD_TYPE to double"
 	help
 	  Set QT_COORD_TYPE to double. On ARM-based platforms, qreal
