From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  2 Nov 2017 11:45:19 +0100
Subject: [Buildroot] [PATCH 3/4] luajit: only available on x86(-64) hosts
In-Reply-To: <20171102104520.29257-1-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
Message-ID: <20171102104520.29257-4-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The -m32 compiler flag is used for 32bit builds and host-luajit has limited
architecture support, so limit to x86(-64) hosts.

Fixes:
http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 1a27c434e1..6b9c6e6ae8 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
+	# -m32 flag is used for 32bit builds and host-luajit has
+	# limited architecture support
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	default y if BR2_i386 || \
 		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
 		BR2_powerpc || BR2_arm || BR2_armeb || \
-- 
2.11.0
