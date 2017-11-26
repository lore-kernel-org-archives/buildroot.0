From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:20:17 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] luajit: only available on
 x86(-64) hosts
Message-ID: <20171126213855.3AC3E7FAD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df0447944c911eac68b4eafa4082a0866fdb1047
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

The -m32 compiler flag is used for 32bit builds and host-luajit has
limited architecture support. Building for a 32-bit target on a 32-bit
host should always work, but we haven't tested that and it's very
unlikely that someone needs it. So just limit to x86(-64) hosts.

Fixes:
http://autobuild.buildroot.net/results/5f5b5edb058efe976c003678e21bcc28a87cc828/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: clarify that it might work on 32-bit hosts for a 32-bit target]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

(cherry picked from commit 9b9347ee9f8e531dd177b437e8ea5387e29fc35e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 1a27c43..6b9c6e6 100644
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
