From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 29 Jul 2015 19:47:15 +0200
Subject: [Buildroot] [PATCH] package/aircrack-ng: fix musl build
Message-ID: <1438192035-20476-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport an upstream patch [1] and remove sys/cdefs.h from
ethernet.h as suggested by the musl wiki [2].

Fixes:
http://autobuild.buildroot.net/results/9721496871d104b4cfb68ce133b5f48612cb7e50/

[1] https://github.com/aircrack-ng/aircrack-ng/commit/42de9f800056601443ac12edbba7bd5802740db2
[2] http://wiki.musl-libc.org/wiki/FAQ

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...ide-ng-Use-termios-instead-of-sys-termios.patch | 27 +++++++++++
 package/aircrack-ng/0004-fix-musl-build.patch      | 53 ++++++++++++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
 create mode 100644 package/aircrack-ng/0004-fix-musl-build.patch

diff --git a/package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch b/package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
new file mode 100644
index 0000000..a10ee45
--- /dev/null
+++ b/package/aircrack-ng/0003-Wesside-ng-Use-termios-instead-of-sys-termios.patch
@@ -0,0 +1,27 @@
+From 42de9f800056601443ac12edbba7bd5802740db2 Mon Sep 17 00:00:00 2001
+From: Thomas d'Otreppe <tdotreppe@aircrack-ng.org>
+Date: Wed, 8 Apr 2015 01:25:07 +0000
+Subject: [PATCH] Wesside-ng: Use termios instead of sys/termios.
+
+git-svn-id: http://svn.aircrack-ng.org/trunk at 2533 28c6078b-6c39-48e3-add9-af49d547ecab
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/wesside-ng.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/wesside-ng.c b/src/wesside-ng.c
+index 711d8b7..f44438a 100644
+--- a/src/wesside-ng.c
++++ b/src/wesside-ng.c
+@@ -33,7 +33,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <sys/termios.h>
++#include <termios.h>
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+-- 
+2.4.3
+
diff --git a/package/aircrack-ng/0004-fix-musl-build.patch b/package/aircrack-ng/0004-fix-musl-build.patch
new file mode 100644
index 0000000..cc093d3
--- /dev/null
+++ b/package/aircrack-ng/0004-fix-musl-build.patch
@@ -0,0 +1,53 @@
+From da6e87670ad4639371da056f9e36201a9236dfa2 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 29 Jul 2015 19:38:46 +0200
+Subject: [PATCH] fix musl build
+
+aircrack-ng doesn't build with a musl toolchain due to
+cdefs.h internal glibc header being used in internal
+ethernet.h [1].
+
+[1] http://wiki.musl-libc.org/wiki/FAQ
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/include/ethernet.h | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/include/ethernet.h b/src/include/ethernet.h
+index 72d5e81..e9d9236 100644
+--- a/src/include/ethernet.h
++++ b/src/include/ethernet.h
+@@ -389,18 +389,20 @@ void	ether_vlan_mtap(struct bpf_if *, struct mbuf *,
+ 
+ #else /* _KERNEL */
+ 
+-#include <sys/cdefs.h>
+-
+ /*
+  * Ethernet address conversion/parsing routines.
+  */
+-__BEGIN_DECLS
+-struct	ether_addr *ether_aton(const char *);
+-int	ether_hostton(const char *, struct ether_addr *);
+-int	ether_line(const char *, struct ether_addr *, char *);
+-char 	*ether_ntoa(const struct ether_addr *);
+-int	ether_ntohost(char *, const struct ether_addr *);
+-__END_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
++	struct	ether_addr *ether_aton(const char *);
++	int	ether_hostton(const char *, struct ether_addr *);
++	int	ether_line(const char *, struct ether_addr *, char *);
++	char 	*ether_ntoa(const struct ether_addr *);
++	int	ether_ntohost(char *, const struct ether_addr *);
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* !_KERNEL */
+ 
+-- 
+2.4.3
+
-- 
2.4.3
