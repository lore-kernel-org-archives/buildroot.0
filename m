Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153CC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 22:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22343408CA;
	Sat,  2 Mar 2024 22:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_8XwDVXKNdt; Sat,  2 Mar 2024 22:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3427A408CE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3427A408CE;
	Sat,  2 Mar 2024 22:03:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BE2CE1BF2BA
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6CB340131
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4fS-YOwJEUo for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 22:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A77A5400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A77A5400C4
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 22:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7824387EC6; Sat,  2 Mar 2024 22:03:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 22:28:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2934a4692c4f1f3649b7781263ae655fcb3d780a
X-Git-Newrev: 953230e176ef4357d5cc28039eb913951b79f513
X-Patchwork-Hint: ignore
Message-Id: <20240302220334.7824387EC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust/rust.mk: add missing
 host-zlib dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=953230e176ef4357d5cc28039eb913951b79f513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several rust tools are linking against zlib, so add the depedency
explicitly in HOST_RUST_DEPENDENCIES.

For now, host-rust build system is not able to find zlib provided
by Buildroot in HOST_DIR due to at least two issues that will be
fixed in followup commits.

Note that host-zlib is already in the dependency chain, by way of
host-openssl, but since rust needs for itself, we need to add it
as an explicit dependency.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[yann.morin.1998@free.fr: add not about transitive dependency]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index f7a5c0fcd5..16a397407f 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -20,6 +20,7 @@ HOST_RUST_DEPENDENCIES = \
 	host-python3 \
 	host-rust-bin \
 	host-openssl \
+	host-zlib \
 	$(BR2_CMAKE_HOST_DEPENDENCY)
 
 HOST_RUST_VERBOSITY = $(if $(VERBOSE),2,0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
