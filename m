From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 10:28:14 +0100
Subject: [Buildroot] [git commit] netsniff-ng: fix build with kernel headers
	v4.10+
Message-ID: <20170310092852.58EED80E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d9161f863c8425dd6b0b4145a6f3ab6f83dfc27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch removing use of GENL_ID_GENERATE that was dropped in kernel
version 4.10.

Fixes:
http://autobuild.buildroot.net/results/58d/58d7809cae739f728c58291f2111684d6c0578f3/
http://autobuild.buildroot.net/results/65c/65ce9807116ca70908e0aabae59a36c7774dfa7a/
http://autobuild.buildroot.net/results/64b/64b3f8af2ebc5a14ecbef72039ef527b5d71f12c/

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch b/package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch
new file mode 100644
index 0000000..4ccf9d6
--- /dev/null
+++ b/package/netsniff-ng/0001-netsniff-ng-nlmsg-Drop-dissection-of-GENL_ID_GENERAT.patch
@@ -0,0 +1,48 @@
+From 88ec2ad37cabb3d3b7ca0e8e5ea3d682c083618d Mon Sep 17 00:00:00 2001
+From: Tobias Klauser <tklauser@distanz.ch>
+Date: Mon, 6 Mar 2017 12:22:57 +0100
+Subject: [PATCH] netsniff-ng: nlmsg: Drop dissection of GENL_ID_GENERATE type
+
+After kernel commit a07ea4d9941a ("genetlink: no longer support using
+static family IDs"), GENL_ID_GENERATE is no longer exposed to userspace
+(and actually should never have been). Change the genl nlmsg dissector
+to only consider the nlctrl family and the two other static family IDs
+needed for workarounds. All other family IDs are considered dynamically
+generated.
+
+Fixes #171
+Reported-by: Jaroslav ??karvada <jskarvad@redhat.com>
+Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit 88ec2ad37cabb
+
+ proto_nlmsg.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/proto_nlmsg.c b/proto_nlmsg.c
+index f8993e794a54..f2064059be08 100644
+--- a/proto_nlmsg.c
++++ b/proto_nlmsg.c
+@@ -242,9 +242,15 @@ static const char *nlmsg_rtnl_type2str(uint16_t type)
+ static const char *nlmsg_genl_type2str(uint16_t type)
+ {
+ 	switch (type) {
+-	case GENL_ID_GENERATE:	return "id gen";
+-	case GENL_ID_CTRL:	return "id ctrl";
+-	default:		return NULL;
++	case GENL_ID_CTRL:	return "nlctrl";
++#if defined(GENL_ID_PCMRAID)
++	case GENL_ID_PCMRAID:	return "pcmraid";
++#endif
++#if defined(GENL_ID_VFS_DQUOT)
++	case GENL_ID_VFS_DQUOT:	return "vfs dquot";
++#endif
++	/* only dynamic family IDs should be used starting with Linux 4.10 */
++	default:		return "dynamic";
+ 	}
+ }
+ 
+-- 
+2.11.0
+
