Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F3FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9498360F48
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9498360F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E834404B7;
	Sat, 16 Oct 2021 10:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdCCCS3yayRP; Sat, 16 Oct 2021 10:26:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51263404A0;
	Sat, 16 Oct 2021 10:26:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F18901BF95F
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA97E401CE
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sMmewpM7R23h for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 10:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECE0A40010
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 10:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 32CF995C6E; Sat, 16 Oct 2021 10:22:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 12:16:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c57a432982f99440b46eb519625518633bea9823
X-Git-Newrev: 5dfe70377006b5b1031879ce69644c767049bd31
X-Patchwork-Hint: ignore
Message-Id: <20211016102249.32CF995C6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: disable debug build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5dfe70377006b5b1031879ce69644c767049bd31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nftbles' --with-debug option enables both debugging symbols (with -g)
and debugging macros (with -DDEBUG).

The former are globally driven by the BR2_ENABLE_DEBUG and BR2_DEBUG_n
set of options, and enforced in our toolchain wrapper; the latter should
be driven by the BR2_ENABLE_RUNTIME_DEBUG, but nftables only uses it to
activate an assert-like macro in its json output generator, so we can
well live without that.

So we just unconditionally disable debug in nftables.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: write a commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nftables/nftables.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 6a27975a53..2409eb0571 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -10,7 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NFTABLES_LICENSE = GPL-2.0
 NFTABLES_LICENSE_FILES = COPYING
-NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
+NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
 NFTABLES_SELINUX_MODULES = iptables
 
 ifeq ($(BR2_PACKAGE_GMP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
