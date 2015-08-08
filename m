From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:02 -0000
Subject: [Buildroot] [git commit branch/next] dhcpcd: bump to version 6.9.1
Message-ID: <20150808105636.80E237FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cdec668dcd56269d532dba6c0b715a1aed04b120
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch upstream so drop it.
Also use main dhcpcd.c file as license info (it's in the header).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...0001-fix-in6_pktinfo-build-issue-on-linux.patch |  162 --------------------
 package/dhcpcd/dhcpcd.hash                         |    2 +-
 package/dhcpcd/dhcpcd.mk                           |    5 +-
 3 files changed, 4 insertions(+), 165 deletions(-)

diff --git a/package/dhcpcd/0001-fix-in6_pktinfo-build-issue-on-linux.patch b/package/dhcpcd/0001-fix-in6_pktinfo-build-issue-on-linux.patch
deleted file mode 100644
index 69919d6..0000000
--- a/package/dhcpcd/0001-fix-in6_pktinfo-build-issue-on-linux.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-[PATCH] fix in6_pktinfo build issue on Linux
-
-From http://roy.marples.name/projects/dhcpcd/vpatch?from=e05490e2d12d03b1&to=c32714545158ca83
-
-Give up on _BSD_SOURCE and use _GNU_SOURCE for Linux. This is requires for
-newer Linux headers as there is no easy way to get at the in6_pktinfo
-structure, so we have to fallback to the glibc variant which requires
-_GNU_SOURCE being set.  This does have the advantage of no longer sprinkling
-_GNU_SOURCE around and no longer having to cast ipi.ipi_ifindex but may
-break compile on older Linux.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
-
-Index: common.c
-==================================================================
---- a/common.c
-+++ b/common.c
-@@ -23,15 +23,10 @@
-  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-  * SUCH DAMAGE.
-  */
- 
--/* Needed define to get at getline for glibc and FreeBSD */
--#ifndef _GNU_SOURCE
--#  define _GNU_SOURCE
--#endif
--
- #ifdef __APPLE__
- #  include <mach/mach_time.h>
- #  include <mach/kern_return.h>
- #endif
- 
-
-Index: configure
-==================================================================
---- a/configure
-+++ b/configure
-@@ -358,27 +358,25 @@
- 	echo "There is no fork"
- 	echo "CPPFLAGS+=	-DTHERE_IS_NO_FORK" >>$CONFIG_MK
- fi
- 
- case "$OS" in
--kfreebsd*)
-+freebsd*|kfreebsd*)
- 	echo "CPPFLAGS+=	-D_GNU_SOURCE" >>$CONFIG_MK
- 	echo "DHCPCD_SRCS+=	if-bsd.c" >>$CONFIG_MK
- 	;;
- linux*)
--	echo "CPPFLAGS+=	-D_BSD_SOURCE -D_XOPEN_SOURCE=700" >>$CONFIG_MK
-+	echo "CPPFLAGS+=	-D_GNU_SOURCE" >>$CONFIG_MK
- 	# Large File Support, should be fine for 32-bit systems.
- 	# But if this is the case, why is it not set by default?
- 	echo "CPPFLAGS+=	-D_FILE_OFFSET_BITS=64" >>$CONFIG_MK
- 	echo "CPPFLAGS+=	-D_LARGEFILE_SOURCE" >>$CONFIG_MK
- 	echo "CPPFLAGS+=	-D_LARGEFILE64_SOURCE" >>$CONFIG_MK
--	# glibc-2.20
--	echo "CPPFLAGS+=	-D_DEFAULT_SOURCE" >>$CONFIG_MK
- 	echo "DHCPCD_SRCS+=	if-linux.c" >>$CONFIG_MK
- 	# for RTM_NEWADDR and friends
--	echo "#include <asm/types.h> /* fix broken headers */" >>$CONFIG_H
--	echo "#include <linux/rtnetlink.h>" >>$CONFIG_H
-+	echo "#include		<asm/types.h> /* fix broken headers */" >>$CONFIG_H
-+	echo "#include		<linux/rtnetlink.h>" >>$CONFIG_H
- 	;;
- qnx*)
- 	echo "CPPFLAGS+=	-D__EXT" >>$CONFIG_MK
- 	echo "DHCPCD_SRCS+=	if-bsd.c" >>$CONFIG_MK
- 	;;
-@@ -592,11 +590,10 @@
- fi
- 
- if [ -z "$GETLINE" ]; then
- 	printf "Testing for getline ... "
- 	cat <<EOF >_getline.c
--#define _GNU_SOURCE
- #include <stdio.h>
- int main(void) {
- 	char *buf = NULL;
- 	size_t n = 0;
- 	getline(&buf, &n, stdin);
-
-Index: dhcp6.c
-==================================================================
---- a/dhcp6.c
-+++ b/dhcp6.c
-@@ -1149,11 +1149,11 @@
- 		return -1;
- 	cm->cmsg_level = IPPROTO_IPV6;
- 	cm->cmsg_type = IPV6_PKTINFO;
- 	cm->cmsg_len = CMSG_LEN(sizeof(pi));
- 	memset(&pi, 0, sizeof(pi));
--	pi.ipi6_ifindex = CAST_IPI6_IFINDEX(ifp->index);
-+	pi.ipi6_ifindex = ifp->index;
- 	memcpy(CMSG_DATA(cm), &pi, sizeof(pi));
- 
- 	if (sendmsg(ctx->dhcp_fd, &ctx->sndhdr, 0) == -1) {
- 		logger(ifp->ctx, LOG_ERR,
- 		    "%s: %s: sendmsg: %m", ifp->name, __func__);
-
-Index: eloop.c
-==================================================================
---- a/eloop.c
-+++ b/eloop.c
-@@ -23,13 +23,10 @@
-  * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-  * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-  * SUCH DAMAGE.
-  */
- 
--/* Needed for ppoll(2) */
--#define _GNU_SOURCE
--
- #include <sys/time.h>
- 
- #include <errno.h>
- #include <limits.h>
- #include <signal.h>
-
-Index: ipv6.h
-==================================================================
---- a/ipv6.h
-+++ b/ipv6.h
-@@ -27,18 +27,12 @@
- 
- #ifndef IPV6_H
- #define IPV6_H
- 
- #include <sys/uio.h>
--
- #include <netinet/in.h>
- 
--#if defined(__linux__) && defined(__GLIBC__)
--#  define _LINUX_IN6_H
--#  include <linux/ipv6.h>
--#endif
--
- #include "config.h"
- #include "dhcpcd.h"
- 
- #define ALLROUTERS "ff02::2"
- 
-Index: ipv6nd.c
-==================================================================
---- a/ipv6nd.c
-+++ b/ipv6nd.c
-@@ -293,11 +293,11 @@
- 		return;
- 	cm->cmsg_level = IPPROTO_IPV6;
- 	cm->cmsg_type = IPV6_PKTINFO;
- 	cm->cmsg_len = CMSG_LEN(sizeof(pi));
- 	memset(&pi, 0, sizeof(pi));
--	pi.ipi6_ifindex = CAST_IPI6_IFINDEX(ifp->index);
-+	pi.ipi6_ifindex = ifp->index;
- 	memcpy(CMSG_DATA(cm), &pi, sizeof(pi));
- 
- 	logger(ifp->ctx, LOG_DEBUG,
- 	    "%s: sending Router Solicitation", ifp->name);
- 	if (sendmsg(ctx->nd_fd, &ctx->sndhdr, 0) == -1) {
-
diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 1b7543f..98351a2 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	27b60cbf726a8319e6f1e7691132082c9cdac473317ea47cb093d0dd3d32af82	dhcpcd-6.8.1.tar.bz2
+sha256	c03b750e1fe2890b62ac0e7d7092a1698b598adb6f88b67916586a619f7c066f	dhcpcd-6.9.1.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 4056351..67ae69f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.8.1
-DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
+DHCPCD_VERSION = 6.9.1
+DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
 DHCPCD_LICENSE = BSD-2c
+DHCPCD_LICENSE_FILES = dhcpcd.c
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
