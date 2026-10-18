Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC80CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C37F74060E;
	Sun, 18 Oct 2026 10:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxyWCWgHLyHX; Sun, 18 Oct 2026 10:39:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F053C406B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792319958;
	b=BAsyodfWtGYZPFAu0QacdS0xRWKmFY31EVpZCyh5T0KHbfhEXDzl6GC8+MmNgUa2nSZQ
	 tDfghk7BPLZGgB6pAeGgJyOhmVi2yaDfMc8EFcUFxuLmuMfsGt2Eo849Je/aXWcdttl/8
	 hqIwrahl1SJvI4er9qsD7RMFiF8xMC9uCNT0A5JRo5QDiB/JoWZKB3yQShRrKQIeZaSwh
	 bZO7a8Q1v1m6IUGExe9BUv/KcOfEs2o2ahr9aMPq89otOZWyFBsjO4MkPatu0pGHE/Lvo
	 ov9naVuqYcfGnr9nWKbmsWhumvGkwozhKi+d44EpM6joITs/ZVOwbb/vlrLNilhkmDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792319958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yS/ZK0YxWiadQpeZ/o9/n1jHO0R25mY0ZMZ2v8I6IFk=;
	b=WhIicdBxeLLBw46HHXdk5Yn78XlmG9J+9e+ucxsVA8Ttg2PZTqdxtbkQoZaM+C+qniCd
	 eVMGauDv85P/v98q/Sxad32vwrhTJF4k3KOg9lTietZH+w+DEnGTRNEesTVVS/S6C2Uz+
	 DJdFx8cPeuDHCWD70Lg9aL0nmMwj1uQzMfAXVyMng1mLlYagbpggqCaPlwpo+TP/YZYG7
	 bMNBdoHqfbqOsOabE6zXUssamjwX3bcDPr1oQ2Fopd2L9+asJZQEAQZN24Guiiuw6NO9Y
	 CZP9FqaHDMu6mxibxh7UXKA3RcrfNAbfWytWUfapI16ykBgRoIgMvxn4Tuute1729ZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792319958;
	bh=yS/ZK0YxWiadQpeZ/o9/n1jHO0R25mY0ZMZ2v8I6IFk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rUNY4Sj3vwhEOaFLi/Tj3OL3W72rw2TuiznlL7Ws45RcAsv6MnoIyg9yeL229E2B2
	 ia2q3zTHXBqmg0MT5H18sMdcng/3tfIAipffg3d2x6//5UOFS/7ALMe25u3KNQakM8
	 4D3cl/mdeFqXf38Kis7VOV1L/sGTdPb4FqIYohz/x796pF5D1ouuqoMbyevTX65K6u
	 gG5SRZgfgc2bzYYo3GFEdIU4zBqtSS6upex7/YwCySZUy2A/o0N0KywUCDbkPAPPor
	 bFyKo/8Enp28orfV9jsOPOSE4qHdluacM/eVVACvFJJg35uq9XxVI88m4Vca9k3gBk
	 cENaN4If5UE8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F053C406B2;
	Sun, 18 Oct 2026 10:39:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F107255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CE9A406B2
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qbKHUi3yk1gM for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:39:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BA3F04060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792319955;
 b=SK5nJNHgZsWrDzOMsZQwLe8IobD1wHodgIwuTbg0IA+o/yRb0B0Xojzi7n3lgfBMCjvh
 wrAPCqSXOq0YY9ozcVmHuI43GVNfjhba9504T96kemiOx8asMoPsy/+2YRX2NWUZtDE7O
 uR04i7h+N4bHVTVJD4/9k8LWOqfPMh3x8xJUn+gd2a6WwA8X45VV7LhE48TWiTaQQhDPy
 P04qJvf0k5U2QGwFqCHSch9BZTwZdOOdYUVGn6lKgPLYPbZjnsS4RIrW1Ti4XkCABf11q
 QxlQ0Fsd2H0yB8AmjshuSmOFFadWXS3E9sjHi4Sk756+bMOQNv/h2qyf1dG836csmeQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792319955;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5zqvhg2DTwD188ds1UvrC8wM/S0tH7jJz4yxAaSv0Ds=;
 b=HqLTlo2eHYq/S0/JnqMs6WHSg2YMZelJjuRLsJPGCZqFzLqc5p5RmCoNp6znHWqC2rkQ
 3uZTlVPStCYy15l5i4uTz1eKUSBp3BX45aWJOjzdz1SAn9rlmnO9vvgLJOU65A+f/aHTK
 hKFhX16UOYBD7y+UTDFTKKSTZxxqGDH1PqIGugLEeHFmdo1s6zTCypH8uVCG5E7D/x/hb
 2cD6hqePO6qpppa3qPxSLY2zDuQp4KgPWwoGx+BBMZSuX7YpY925UDRaslQO6KIqy+5+C
 qQHKOpOkBYlDpa/nC3TEfJkAIyNWEG/TjIibaCwmbMEgDnbN6ZJq95usy1dM6ar/aOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA3F04060E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:39:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8EC896AF0; Sun, 18 Oct 2026 10:37:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:38:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 13a2060ae802260b47597aee66f623083e08a87a
X-Git-Newrev: ea4388b3b09ab34513582d01ddd6a524212a971e
X-Patchwork-Hint: ignore
Message-Id: <20261018103753.A8EC896AF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Yegor Yefremov for
 libmicrohttpd and libwebsockets
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ea4388b3b09ab34513582d01ddd6a524212a971e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 349fb1d26a..0dda356bf7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3591,6 +3591,7 @@ F:	package/libaec/
 F:	package/libftdi1/
 F:	package/libical/
 F:	package/libmbim/
+F:	package/libmicrohttpd/
 F:	package/libndp/
 F:	package/libnftnl/
 F:	package/libqmi/
@@ -3599,6 +3600,7 @@ F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
+F:	package/libwebsockets/
 F:	package/libxmlb/
 F:	package/libxmlrpc/
 F:	package/linux-firmware/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
