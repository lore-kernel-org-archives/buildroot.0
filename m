Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E27EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F0541E80;
	Fri, 13 Feb 2026 19:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHNoHBe2_zXF; Fri, 13 Feb 2026 19:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E75EE42278
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011610;
	bh=7TtfPx7afIiG/pEw1FzYRV2ET3uUrb7Fty1AYlNQd6I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I7VXGHt/KLDOBic2oHXmKx1p3qZs30uDB8Bg0uVbpN4jdR5+WWuwnBtDrEMlp1XNR
	 G9thD6rO0q3eGPPrQFB9E5jcWNeg1cj1byo9QiCerHEUiHnFHARVL47dFHCaKSa11j
	 Ex7Am6MbrIVhYsbPJcZUR85SczG3mrpf2wNyLRLNdEsiR9E+2fnvPWSQeBQB4lLUfv
	 ZLpkAyhRdwM7tSvwNMGQhACG6TAx0Wu6WylB72FLKWoDIhKw2KIt8EVN7aoEzZFLPw
	 6oieq2TrLR2niOXjgmxCUv2XJSRIpux/FC2jfmu4Niu2xKKJOXX4imcRw3/7jWYuHu
	 xPrlN7SJrPBSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E75EE42278;
	Fri, 13 Feb 2026 19:40:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41A2069
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47B7341337
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUkGir_BSHuo for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4580413CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4580413CF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8C2C825CC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:08 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 5fb22b1ee298742253ccf194ed0dfbf2552d2770
X-Git-Newrev: 3a32f607531032d55c516594c7734224dc8dae7c
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.B8C2C825CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libite: add
 dependency on MMU, requires fork()
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3a32f607531032d55c516594c7734224dc8dae7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Unfortunately, parts of the library is not very no-MMU friendly atm.
The below check fails due to runbg.c requiring fork().

$ ./utils/test-pkg -c libite.config -p libite
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: FAILED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK

The dependency was introduced in libite v2.6.0, so this patch should
be backported to v2025.02.x.

Fixes:

 https://autobuild.buildroot.net/results/6c6fd2ae410a82c44da54ee13a09a38a7ab220c1/

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e0b129e36e6d6b45de473bb59795001fddfcc0cc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libite/Config.in b/package/libite/Config.in
index 80d29791db..516d1bff98 100644
--- a/package/libite/Config.in
+++ b/package/libite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBITE
 	bool "libite"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Libite is a lightweight library of frog DNA. It can be used
 	  to fill the gaps in any dinosaur project. It holds useful
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
