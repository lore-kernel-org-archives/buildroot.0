From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Apr 2014 10:58:53 +0200
Subject: [Buildroot] [git commit] acpid: add patch to fix build failure with
	external uClibc toolchains
Message-ID: <20140425085923.CA9519C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=909382c3572d083850d531490f4333c219dc5256
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/acpid-02-add-missing-defines.patch |   40 ++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/acpid/acpid-02-add-missing-defines.patch b/package/acpid/acpid-02-add-missing-defines.patch
new file mode 100644
index 0000000..a853159
--- /dev/null
+++ b/package/acpid/acpid-02-add-missing-defines.patch
@@ -0,0 +1,40 @@
+Add missing MSG_CMSG_CLOEXEC
+
+Unpatched uClibc toolchains, even using the latest 0.9.33.2, do not
+have the MSG_CMSG_CLOEXEC definition. Even though the Buildroot
+internal toolchain backend has a uClibc patch to provide it, it
+doesn't apply to external toolchains. This patch provides the
+definition of MSG_CMSG_CLOEXEC.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libnetlink.h
+===================================================================
+--- a/libnetlink.h
++++ b/libnetlink.h
+@@ -7,6 +7,10 @@
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ 
++#ifndef MSG_CMSG_CLOEXEC
++#define MSG_CMSG_CLOEXEC 0x40000000
++#endif
++
+ struct rtnl_handle
+ {
+ 	int			fd;
+Index: b/kacpimon/libnetlink.h
+===================================================================
+--- a/kacpimon/libnetlink.h
++++ b/kacpimon/libnetlink.h
+@@ -7,6 +7,10 @@
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ 
++#ifndef MSG_CMSG_CLOEXEC
++#define MSG_CMSG_CLOEXEC 0x40000000
++#endif
++
+ struct rtnl_handle
+ {
+ 	int			fd;
