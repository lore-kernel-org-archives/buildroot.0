From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Oct 2018 22:58:22 +0200
Subject: [Buildroot] [git commit] iproute2: fix build on glibc < 2.21 /
 uClibc
Message-ID: <20181027205754.B4A8682982@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d9fe18e97d98ba30998a11a3626c8851dd0ec2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/fc9/fc99b1ad49080f552ce611d5a7a2f9fe171b5a2c/
http://autobuild.buildroot.net/results/5f7/5f74c258a3adafa5aecd4abc378eef0573143764/

q_{etf,taprio}.c uses CLOCK_TAI, which isn't exposed by glibc < 2.21 or
uClibc, breaking the build. Provide a fallback definition like it is done
for IPPROTO_MPLS and others.

Patch submitted upstream:
https://lwn.net/ml/netdev/20181027153102.32302-1-peter%40korsgaard.com/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s.h-provide-fallback-CLOCK_TAI-definition.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch b/package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch
new file mode 100644
index 0000000000..c89db2b2eb
--- /dev/null
+++ b/package/iproute2/0001-utils.h-provide-fallback-CLOCK_TAI-definition.patch
@@ -0,0 +1,32 @@
+From 950bf78adc9a3290ed383eaeef01dee6543cfb97 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sat, 27 Oct 2018 17:25:31 +0200
+Subject: [PATCH] utils.h: provide fallback CLOCK_TAI definition
+
+q_{etf,taprio}.c uses CLOCK_TAI, which isn't exposed by glibc < 2.21 or
+uClibc, breaking the build. Provide a fallback definition like it is done
+for IPPROTO_MPLS and others.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ include/utils.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/utils.h b/include/utils.h
+index 258d630e..685d2c1d 100644
+--- a/include/utils.h
++++ b/include/utils.h
+@@ -126,6 +126,10 @@ struct ipx_addr {
+ #define IPPROTO_MPLS	137
+ #endif
+ 
++#ifndef CLOCK_TAI
++# define CLOCK_TAI 11
++#endif
++
+ __u32 get_addr32(const char *name);
+ int get_addr_1(inet_prefix *dst, const char *arg, int family);
+ int get_prefix_1(inet_prefix *dst, char *arg, int family);
+-- 
+2.11.0
+
