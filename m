Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3D2E95A6C
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:14:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CCCB407AD;
	Tue, 30 Dec 2025 11:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LzbDNy768t5W; Tue, 30 Dec 2025 11:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 283AE40519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767093286;
	bh=VEzwHp9eGXggXTJdNg45ySnc+x2T6NVeFYdyXnfok6E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rhh3a3TeYTIL8dmhTy5DMRL+3aVnKcwOUBw2bDpwiKPBWJuskvy3kvsrtJEaR0N90
	 3BQxJX5GefcmT3hgJbjTfSvwKJdld3jBE49ywS/JOh21El3TJK3C5AuKU67jKwa27I
	 SdVLl8GlBhL0llNZhPAr8xcHfF82PHxBy3iRP4iZTR3m4iqt3SPkd+cQfdJpmbUI0o
	 qqtLdhE6B+4wiDdFk1hCywAntlBEG/WfZqBZWftrrWGp0YNoAO1LfSRfRunvMpXAe7
	 gXQwRYSu1rYk1qLfox3SENGMW6ESOI5GQEy1fmHTpbG+s+cneNX0rJbI9/3f+6oLZZ
	 DKLquLITdWedQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283AE40519;
	Tue, 30 Dec 2025 11:14:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FBF335B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 525684039B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSVMxkPGRMoV for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96F57400E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96F57400E6
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93B5D87C27; Tue, 30 Dec 2025 11:14:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:57:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fa1d6981093c77c29bd1074dca8b898c0f3fea
X-Git-Newrev: 48c1e7cc6da96b12c8c8eb59c49cb917b0ae1a43
X-Patchwork-Hint: ignore
Message-Id: <20251230111444.93B5D87C27@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libupnp: disable blocking-tcp
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=48c1e7cc6da96b12c8c8eb59c49cb917b0ae1a43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Gerbera:
https://github.com/gerbera/gerbera/commit/fcf31472239705e7d28af81cbe326f8f416f7f7d

CMake Warning at CMakeLists.txt:583 (message):
  !! It is strongly recommended to build libupnp with --disable-blocking-tcp-connections !!
  Without this option non-responsive control points can cause libupnp to hang.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libupnp/libupnp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index f29275d2b5..cfa1136db3 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -17,6 +17,7 @@ LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
 LIBUPNP_CONF_OPTS += \
+	--disable-blocking-tcp-connections \
 	--disable-samples \
 	--enable-reuseaddr
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
