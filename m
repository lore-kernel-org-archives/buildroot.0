Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A46EC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B709E80D1E;
	Sun,  6 Sep 2026 10:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEbPgSRPcj-8; Sun,  6 Sep 2026 10:17:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5850480D1F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788689879;
	b=CAqRNgN8PlxA+Z6mnGXp0LEe8obGqhstcOFEp7sKoMfUSoz2+3x7rNTqh7YIuUfQDXJn
	 mxrsJHcm+2Vanql3di+03lMw0U3wumRfU8e7cZlbhRjaqHyBGaCQP570+g2sOkL0lJvM7
	 nq+KAiGb5qbePM6xftHdl4SyzZJj0RYGH8K5dHpUAS6bkS5s2DwyFN8epeABSSVYvXeWl
	 MYCNZhmNJ++cI7wf/dNdJ3jDeSszeflDo0Eoe0DFe/P6ZfSAylGRfgsmzpPpiL35m7gCp
	 rrE6l+RAk8ulhzjo1+63aXiZS138tiltp4nP6gfVXCJu7T1cSfbe0yCg2lbEWC0RYjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788689879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YVMjIVBN6z9hCKHl7kIqHsBl2q+CR1SZ45jOewY8gYA=;
	b=THvnnKY/FryOSRtTHZC7Dp4+/ZxKGa44+Ua057yhQZKsNqZxhssd7g7gUMaFqFKQVoBm
	 4FU8pXuVLpYwlQ+5WT8fS6hoBi82uijTwJyB14pUIvfjhhR0h/iFjf7E2LPM0gye6f0Yl
	 df20xIw6NgVTUz1vmcGfJ6fFObNiRMG9/PSYg7ebGj755u+/4XRMjf4okwPbjoumZMadI
	 oICoo57u2DX5kWxMsN5ANOz3KQOwLmLGuTfuXQ3gN9t8TIeB1DimAUyvgR/4c7td82JWh
	 P3dhHITSkeCaHWqAmWp0zmDHqellby+vQehUja99yBq8D49Pm2TfNId5o+k0F96xiig==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788689879;
	bh=YVMjIVBN6z9hCKHl7kIqHsBl2q+CR1SZ45jOewY8gYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hndmXAVtcb3bJ/v8nvldo0WkvKniX9hKWBR22vc2E33j1EhNksC61X7asCpR/PrN4
	 qrmtJkl6UaZBg66ui2sTM+6r21PxWQOuBEwowa1YZtm/vpSnV0DKpDnDA4E5bHOfid
	 tnPbW915U+ynNutXGtTLD54aZaG2rC3E1FWsklP1A1GoG01WttE+VKcajEfvHOYFR8
	 g+7jgyVQDor6j+/iahkj8Fuej6h0LGTwXrFv2izWey32PhsGYRKaTxi5Yew+/i4v7j
	 G14glq0xlfzcqbb+ntqidU5A8KnStnvw8nnBYqf+ZZncw7wE9wTACxglBz+U6u4zwC
	 N4YXPgnVVx+ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5850480D1F;
	Sun,  6 Sep 2026 10:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE08F990
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB743405DC
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tkLqz8W6l3x for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3310B405D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788689877;
 b=fveqLPB2eH7GjgeTZC08dgV9rH4MhsGCoJJj9g/S4mL7OzLU6PwzBbOS+EJtc2tCYPVN
 tbzAzg0r9ct373YuQTFjSVlhJtT8N0rrFkCnA35+8J7BcZrgTAyFYs4kXoRy60xEPyxNE
 S8e4xiM7Oa9W1ucJdHxO4sdc9fgv9y2kN82qYZF5nFc7xo/34dcZW1bfmt3PJSXI+VJQu
 jhjjoLE72ujd6LZIVkBjbn3QSLbaDzCzufcO71Aypuore+S1hgjQRYu7Xxx35W52DY6uP
 nXbjF2dLjIektmDZPly+UTOqkfxr/LZjVw2+ztvODXXPbGDX8AJPRQgytCCI6FXxo3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788689877;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=x0uJzII7ccdFIv73w5hVERVx4j12rXzT8hPxdC5n16o=;
 b=Rl9uNBBWhDibPLphYm1W7J6Xv3YJ4ThT8Acc+SavAsrVIQdyQJdA+jFy2t9xCcMnGrix
 7eU96y0+H92Ii855C4TwFUtsAJdE04Q52VhOlY29Vbj7aiTe/TJ7E7iVAbBre9fYzVKVf
 lZvBe8u1DOI1zF1EN/uyLAJkT5iz20Beoy480s1CecBa84eETFr+sUsMOq6PdTITz1irA
 aHPWZRXTyPCpVpWlI6MqkzDRpsRqUFHZhvW65pl5k91fJmlF3SCIQePyKRcPPUnh5HVci
 5q+lKcyuuVXkVqRklS1Et/dsdjeEFwHn28gPZ1W/Lj3OZz7LeBpoJqE0To3CJuf9gNQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3310B405D1
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:17:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B82679534D; Sun,  6 Sep 2026 10:16:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 12:15:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d148168e209fe07660d75f5e56ea00cb3e5f269c
X-Git-Newrev: e55cb3108531b9a983ecdd607114f644150bf9af
X-Patchwork-Hint: ignore
Message-Id: <20260906101655.B82679534D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump version to
 1.1.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e55cb3108531b9a983ecdd607114f644150bf9af
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libde265/releases/tag/v1.1.2

Security fixes:
(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-xp3h-6f5r-8cxp) Heap use-after-free and double free
 in multi-threaded (WPP) decoding. A crafted stream whose slice segments
 repeat or rewind their slice_segment_address within a picture re-ran
 CTB rows that were already marked finished, so the CABAC context handoff
 between rows was no longer ordered and the shared context table was
 released twice. Slice segments that do not follow the previous one in
 tile-scan order are now rejected with the new warning
 DE265_WARNING_SLICE_SEGMENT_ADDRESS_NOT_INCREASING, and the WPP row
 progress is reset for each slice segment. (medium)

CVE-2026-XXXXX (GHSA-mm7m-v26f-wf8x) Heap use-after-free after
 de265_reset(): the pointer to the previous slice header was left
 dangling when the DPB was cleared, and a dependent slice pushed after
 the reset copied from freed memory. (medium)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 0385364e2e..6f6d33840d 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.1.1
-sha256  fd48a927e94ed74fc7ce8829d222b9d8599fcbfe8b6448ba66705babc56ab219  libde265-1.1.1.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.2
+sha256  eaacd1943ab0c452c19f6136a36ca227e6b761b39a81eaca8454d48c147e1f67  libde265-1.1.2.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 81ffb39501..eabdd45939 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.1.1
+LIBDE265_VERSION = 1.1.2
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
