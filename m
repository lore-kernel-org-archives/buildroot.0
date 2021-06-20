Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD0FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:13:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3EB860EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3EB860EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B88E2605BF;
	Tue,  3 Aug 2021 23:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xt6JHHWSLol4; Tue,  3 Aug 2021 23:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B572C605BB;
	Tue,  3 Aug 2021 23:13:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D34EE1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B3A04068E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jpcyfn11s9VK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D36C44063A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2572088523; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:40:05 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75ad88b506c51f0082a5d2388d1dcc8aaea24038
X-Git-Newrev: 6e1106b4a9aee25d1556310d5cd1cb6dde2e6e3f
X-Patchwork-Hint: ignore
Message-Id: <20210803210954.2572088523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/qemu/sparc64-sun4u:
 avoid gcc-11 warning to build the kernel
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6e1106b4a9aee25d1556310d5cd1cb6dde2e6e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

gcc-11 warns about what appears to be an out-of-range array access but
stop the build due to -Werror added to cflags:

arch/sparc/kernel/mdesc.c: In function 'mdesc_node_by_name':
arch/sparc/kernel/mdesc.c:647:22: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
  647 |                 if (!strcmp(names + ep[ret].name_offset, name))
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
   77 |         struct mdesc_hdr        mdesc;
      |                                 ^~~~~
arch/sparc/kernel/mdesc.c: In function 'mdesc_get_property':
arch/sparc/kernel/mdesc.c:692:22: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
  692 |                 if (!strcmp(names + ep->name_offset, name)) {
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
   77 |         struct mdesc_hdr        mdesc;
      |                                 ^~~~~
arch/sparc/kernel/mdesc.c: In function 'mdesc_next_arc':
arch/sparc/kernel/mdesc.c:719:21: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
  719 |                 if (strcmp(names + ep->name_offset, arc_type))
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
   77 |         struct mdesc_hdr        mdesc;
      |                                 ^~~~~
cc1: all warnings being treated as errors

The issue was initially reported to gcc [1] where it was analized.
As suggested, change the struct mdesc_elem * accesses from the end
of mdesc to those from the beginning of the data array.

Update the prototype of node_block(), name_block() and data_block()
since the code really seems to want to do is to compute the address
somewhere into the chunk pointed to by hp.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100262

Upstream status: Pending
https://www.spinics.net/lists/sparclinux/msg26385.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...id-stringop-overread-warning-to-access-Ma.patch | 154 +++++++++++++++++++++
 configs/qemu_sparc64_sun4u_defconfig               |   3 +
 2 files changed, 157 insertions(+)

diff --git a/board/qemu/sparc64-sun4u/patches/linux/0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch b/board/qemu/sparc64-sun4u/patches/linux/0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch
new file mode 100644
index 0000000000..c02704696d
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/patches/linux/0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch
@@ -0,0 +1,154 @@
+From 82d91965519c20639c24aadd022b2859461562bc Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 27 Apr 2021 14:54:28 +0200
+Subject: [PATCH] sparc64: avoid stringop-overread warning to access Machine
+ description datas
+
+gcc-11 warns about what appears to be an out-of-range array access but
+stop the build due to -Werror added to cflags:
+
+arch/sparc/kernel/mdesc.c: In function 'mdesc_node_by_name':
+arch/sparc/kernel/mdesc.c:647:22: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
+  647 |                 if (!strcmp(names + ep[ret].name_offset, name))
+      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
+   77 |         struct mdesc_hdr        mdesc;
+      |                                 ^~~~~
+arch/sparc/kernel/mdesc.c: In function 'mdesc_get_property':
+arch/sparc/kernel/mdesc.c:692:22: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
+  692 |                 if (!strcmp(names + ep->name_offset, name)) {
+      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
+   77 |         struct mdesc_hdr        mdesc;
+      |                                 ^~~~~
+arch/sparc/kernel/mdesc.c: In function 'mdesc_next_arc':
+arch/sparc/kernel/mdesc.c:719:21: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
+  719 |                 if (strcmp(names + ep->name_offset, arc_type))
+      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
+   77 |         struct mdesc_hdr        mdesc;
+      |                                 ^~~~~
+cc1: all warnings being treated as errors
+
+The issue was initially reported to gcc [1] where it was analized.
+As suggested, change the struct mdesc_elem * accesses from the end
+of mdesc to those from the beginning of the data array.
+
+Update the prototype of node_block(), name_block() and data_block()
+since the code really seems to want to do is to compute the address
+somewhere into the chunk pointed to by hp.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100262
+
+Upstream status: Pending 
+https://www.spinics.net/lists/sparclinux/msg26385.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/sparc/kernel/mdesc.c | 37 +++++++++++++++++++++----------------
+ 1 file changed, 21 insertions(+), 16 deletions(-)
+
+diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
+index 8e645ddac58e..3403555aa1e2 100644
+--- a/arch/sparc/kernel/mdesc.c
++++ b/arch/sparc/kernel/mdesc.c
+@@ -75,6 +75,7 @@ struct mdesc_handle {
+ 	refcount_t		refcnt;
+ 	unsigned int		handle_size;
+ 	struct mdesc_hdr	mdesc;
++	char			data[];
+ };
+ 
+ typedef int (*mdesc_node_info_get_f)(struct mdesc_handle *, u64,
+@@ -610,26 +611,30 @@ int mdesc_get_node_info(struct mdesc_handle *hp, u64 node,
+ }
+ EXPORT_SYMBOL(mdesc_get_node_info);
+ 
+-static struct mdesc_elem *node_block(struct mdesc_hdr *mdesc)
++static struct mdesc_elem *node_block(struct mdesc_handle *hp)
+ {
+-	return (struct mdesc_elem *) (mdesc + 1);
++	return (struct mdesc_elem *) hp + offsetof(struct mdesc_handle, data);
+ }
+ 
+-static void *name_block(struct mdesc_hdr *mdesc)
++static void *name_block(struct mdesc_handle *hp)
+ {
+-	return ((void *) node_block(mdesc)) + mdesc->node_sz;
++	struct mdesc_hdr *mdesc = &hp->mdesc;
++
++	return ((void *) node_block(hp)) + mdesc->node_sz;
+ }
+ 
+-static void *data_block(struct mdesc_hdr *mdesc)
++static void *data_block(struct mdesc_handle *hp)
+ {
+-	return ((void *) name_block(mdesc)) + mdesc->name_sz;
++	struct mdesc_hdr *mdesc = &hp->mdesc;
++
++	return ((void *) name_block(hp)) + mdesc->name_sz;
+ }
+ 
+ u64 mdesc_node_by_name(struct mdesc_handle *hp,
+ 		       u64 from_node, const char *name)
+ {
+-	struct mdesc_elem *ep = node_block(&hp->mdesc);
+-	const char *names = name_block(&hp->mdesc);
++	struct mdesc_elem *ep = node_block(hp);
++	const char *names = name_block(hp);
+ 	u64 last_node = hp->mdesc.node_sz / 16;
+ 	u64 ret;
+ 
+@@ -657,15 +662,15 @@ EXPORT_SYMBOL(mdesc_node_by_name);
+ const void *mdesc_get_property(struct mdesc_handle *hp, u64 node,
+ 			       const char *name, int *lenp)
+ {
+-	const char *names = name_block(&hp->mdesc);
++	const char *names = name_block(hp);
+ 	u64 last_node = hp->mdesc.node_sz / 16;
+-	void *data = data_block(&hp->mdesc);
++	void *data = data_block(hp);
+ 	struct mdesc_elem *ep;
+ 
+ 	if (node == MDESC_NODE_NULL || node >= last_node)
+ 		return NULL;
+ 
+-	ep = node_block(&hp->mdesc) + node;
++	ep = node_block(hp) + node;
+ 	ep++;
+ 	for (; ep->tag != MD_NODE_END; ep++) {
+ 		void *val = NULL;
+@@ -702,8 +707,8 @@ EXPORT_SYMBOL(mdesc_get_property);
+ 
+ u64 mdesc_next_arc(struct mdesc_handle *hp, u64 from, const char *arc_type)
+ {
+-	struct mdesc_elem *ep, *base = node_block(&hp->mdesc);
+-	const char *names = name_block(&hp->mdesc);
++	struct mdesc_elem *ep, *base = node_block(hp);
++	const char *names = name_block(hp);
+ 	u64 last_node = hp->mdesc.node_sz / 16;
+ 
+ 	if (from == MDESC_NODE_NULL || from >= last_node)
+@@ -728,7 +733,7 @@ EXPORT_SYMBOL(mdesc_next_arc);
+ 
+ u64 mdesc_arc_target(struct mdesc_handle *hp, u64 arc)
+ {
+-	struct mdesc_elem *ep, *base = node_block(&hp->mdesc);
++	struct mdesc_elem *ep, *base = node_block(hp);
+ 
+ 	ep = base + arc;
+ 
+@@ -738,8 +743,8 @@ EXPORT_SYMBOL(mdesc_arc_target);
+ 
+ const char *mdesc_node_name(struct mdesc_handle *hp, u64 node)
+ {
+-	struct mdesc_elem *ep, *base = node_block(&hp->mdesc);
+-	const char *names = name_block(&hp->mdesc);
++	struct mdesc_elem *ep, *base = node_block(hp);
++	const char *names = name_block(hp);
+ 	u64 last_node = hp->mdesc.node_sz / 16;
+ 
+ 	if (node == MDESC_NODE_NULL || node >= last_node)
+-- 
+2.30.2
+
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index cff0c2968a..6a999298eb 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -2,6 +2,9 @@
 BR2_sparc64=y
 BR2_sparc_v9=y
 
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/qemu/sparc64-sun4u/patches"
+
 # System
 BR2_SYSTEM_DHCP="eth0"
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
