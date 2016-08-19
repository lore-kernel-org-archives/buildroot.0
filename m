From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 11:33:53 +0200
Subject: [Buildroot] [git commit] package/aircrack-ng: drop a
	musl-compatibility patch
Message-ID: <20160819093441.C608382273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93120632f034b20caa80132e8c1b7f16e10e7e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We now always have a sys/cdefs.h, so we can drop this patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aircrack-ng/0004-fix-musl-build.patch | 53 ---------------------------
 1 file changed, 53 deletions(-)

diff --git a/package/aircrack-ng/0004-fix-musl-build.patch b/package/aircrack-ng/0004-fix-musl-build.patch
deleted file mode 100644
index cc093d3..0000000
--- a/package/aircrack-ng/0004-fix-musl-build.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From da6e87670ad4639371da056f9e36201a9236dfa2 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 29 Jul 2015 19:38:46 +0200
-Subject: [PATCH] fix musl build
-
-aircrack-ng doesn't build with a musl toolchain due to
-cdefs.h internal glibc header being used in internal
-ethernet.h [1].
-
-[1] http://wiki.musl-libc.org/wiki/FAQ
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- src/include/ethernet.h | 20 +++++++++++---------
- 1 file changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/src/include/ethernet.h b/src/include/ethernet.h
-index 72d5e81..e9d9236 100644
---- a/src/include/ethernet.h
-+++ b/src/include/ethernet.h
-@@ -389,18 +389,20 @@ void	ether_vlan_mtap(struct bpf_if *, struct mbuf *,
- 
- #else /* _KERNEL */
- 
--#include <sys/cdefs.h>
--
- /*
-  * Ethernet address conversion/parsing routines.
-  */
--__BEGIN_DECLS
--struct	ether_addr *ether_aton(const char *);
--int	ether_hostton(const char *, struct ether_addr *);
--int	ether_line(const char *, struct ether_addr *, char *);
--char 	*ether_ntoa(const struct ether_addr *);
--int	ether_ntohost(char *, const struct ether_addr *);
--__END_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+	struct	ether_addr *ether_aton(const char *);
-+	int	ether_hostton(const char *, struct ether_addr *);
-+	int	ether_line(const char *, struct ether_addr *, char *);
-+	char 	*ether_ntoa(const struct ether_addr *);
-+	int	ether_ntohost(char *, const struct ether_addr *);
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif /* !_KERNEL */
- 
--- 
-2.4.3
-
