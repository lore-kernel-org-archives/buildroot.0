Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F679CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26168810ED;
	Sat, 10 Oct 2026 17:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19ui8w4hUi4E; Sat, 10 Oct 2026 17:25:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 39089810F1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653134;
	b=fpz/Cxez9dyW5eldJ9e/BMnJc0TDcPGN2Xe/sPFkNXYRts9KnBfA594wtK6rNn62Bo0j
	 EKYQKTiwSogJQy+LTXL4HhfB+aYJyf96Yhq9itR/Z2VV3TnfQdx5dldre0SKHw8jisK2P
	 NW/paQSwBOmdN+df0E8nzPo52LQIzcm1rQaTagvRJK+HqWzEZyFjsi68ZHJPkrShB95Ya
	 ubXncBLf8mwGe1I+W9C1BpTEl0xAyEfMwNGA1MEVZuOINJulrvcuA6TJZK9+wFFXGf6qC
	 K9Lk9tYjabzst9lkpyj50YxYS2LUtNUXNTPjpKnX6UStD676qTXZJbPZb/2t3Jvu2zQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653134;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0HW/Er2VTLxu+8S6H1sNYI3KPRZZrQZ86cFWUCmDjKw=;
	b=gEb3Zr8UAWDOyyai1Ny5PMNfwrq2iUAvGGarJ9Q37Y+HPgDR8jpVhq3QC3a0MFt73o7S
	 tJTQOehts6nYo0zq1kUk0fQqY+WWL7e20B7KdWQZ72UtXayuwyYCXPoEfzlTGuVftd38c
	 4Sh9w7c+q/d/tG+txdzK64Y/Ot/7jT86Tgj49n5GTyRaxk2AdCvPFsJza0fqPFFbYq0T8
	 VUO2O4lvPDXrJ3K/7iIDuFasM1JW0KmBrG3cqRXDmKslPLwzGk2c61wK3AGq16uJkkYbK
	 a05xyYjw9fZrWlkLAcewxc2Y8SImi24m+aRcAq6ulWiSmH2sqhek5yDNr89NpxnLSzw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653134;
	bh=0HW/Er2VTLxu+8S6H1sNYI3KPRZZrQZ86cFWUCmDjKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G+1jYyiPqv6DndhKQ4y5RUbBM5/2dNnBFO2hbWrpu7tnRPDunuE2Cpd+TCr0EdZLZ
	 HRLmCIZJvbTzVXH4qhhNovcDp3/Lse2EiVXuHSsxyeZQiPyfWijq+B5VUi8tz+c/Io
	 /2fqG90SzaBJpziYWGhtQjdkyNUK6AdK4O4WBSXUbXzcHxI6xlIr4PfoQBvEV1rq95
	 QJkMy9auzB1mqTwdgOlqjm5CLq/8o2BZ1UtNEpSQbR0xXVT7U93m7iI8jjjzH2xmbL
	 NUayrT/oXdWzd/5hnaP4z/I5MQdynWWaAPQVBnAJCpzUI9PKWPri8QIZ4fZ+bQi7Ss
	 rbgUMQw5eYLlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39089810F1;
	Sat, 10 Oct 2026 17:25:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 489031A6
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AA024005E
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcrPX8lzVR6i for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:25:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7EA0240004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653132;
 b=EoTMeDgmfsZma4gG+EfaiS6Kof///N+lN/+sFVYj6u1uVz8DX5+ibErcN7gGumcDGj4O
 4uCPT7iJKSfbH1o31QOTleiJq3H97rV/HzyxjXRORVGp2cVFerGnsF3L8rSz2idhAkLWf
 URdUpcCix021Dgj3k3N0uSFIljVIvBc0nuvbyg/L66K8K8zGOYla4wiT1TXYiwfseaUmZ
 5v/PVrANclQNcnit3p+a0XcRTZz/kMWxS8nlisB3CgIKD5qXFGaQawjc3SUUgBnIMxAQX
 X6R4pCtcmiQwENgr3fxAzeL0ndgwlyFYaezPW2gtPfFSYwIjwMwhwGVA1htkER+fMpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653132;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FlDd41Uz/LJb4BmRV5i62hDpe4svrXrMP5cYBKRtlmE=;
 b=AWo69oc499MOdA/ZQCUIMxMtE5SMLYjnYDOfK46N0NOMpoWMRB9ckR4dbx+2Qbo1wQ/T
 WfIQ082UHPZJ0Swojs9fVkTA4ND+Pu0NdvXSgfjq3557ivm/ZnystHSbbAXMT6gkm1hF5
 VnASc6PwmfiSpGFPlxm6kTKO04vNXmxJTq5DYZ9f+3BVYXM1XIKMjA3KcAfInFzyymm3N
 f27hUvvSgOHeLt51Iibla3AHQ3exFsLh0ke0C/zGt6DUNzOw+T9xJEqlK3zLHq7KTgXs5
 fC13gURlz79oj8H2C7f+66QRCcbx7jJ8rsNuzqVbzFm2e86GRkFTne75HmN0mFvkf4A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EA0240004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FC2593485; Sat, 10 Oct 2026 17:24:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 19:24:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc23067ac65890428a85f71d604c816f560cb728
X-Git-Newrev: 1b8cd6665bdb6d8f67b71b859a0d78e3a2584875
X-Patchwork-Hint: ignore
Message-Id: <20261010172412.3FC2593485@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nnn: add BR2_TOOLCHAIN_HAS_THREADS
 dependency
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
Content-Type: multipart/mixed; boundary="===============3471678593245034725=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3471678593245034725==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b8cd6665bdb6d8f67b71b859a0d78e3a2584875
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

nnn links against pthread. Specify the dependency to avoid
unexpected build failures on toolchains lacking thread support (e.g.
br-arm-full-nothread).

Fixes:

  https://autobuild.buildroot.net/results/5cd2b7a288a1681068448de6715e731580908206/

Fixes: 7856e41685a179fdda7b21a10455e52fe5fa5cb0 ("package/nnn: new package")
Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nnn/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nnn/Config.in b/package/nnn/Config.in
index 64cfa8e0a5..555ab864d9 100644
--- a/package/nnn/Config.in
+++ b/package/nnn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NNN
 	bool "nnn"
 	depends on BR2_USE_MMU # fork
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# Building nnn without widechar/UTF support is theoretically
 	# possible, but in practice it leads to unstable builds.
 	# That’s why the WCHAR dependency is here.
@@ -15,6 +16,6 @@ config BR2_PACKAGE_NNN
 
 	  https://github.com/jarun/nnn
 
-comment "nnn needs a toolchain with wchar"
+comment "nnn needs a toolchain with wchar, threads"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS

--===============3471678593245034725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3471678593245034725==--
