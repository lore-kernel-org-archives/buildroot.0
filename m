From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:43:02 +0100
Subject: [Buildroot] [PATCH 11/16] package infrastructure: add
	LD_LIBRARY_PATH
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <14420c94fda9f27c457b671f0da2a278cba23ac6.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the compilation of target packages, host tools might be used,
and in turn, they might use host libraries installed in
$(HOST_DIR)/usr/lib. Therefore, we pass a LD_LIBRARY_PATH variable
when building packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index bc0ac7c..d976481 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -236,7 +236,11 @@ TARGET_CONFIGURE_ENV=\
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
+# During the compilation of target packages, host tools might be used,
+# and in turn, they might use host libraries installed in
+# $(HOST_DIR)/usr/lib
+TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
-- 
1.6.3.3
