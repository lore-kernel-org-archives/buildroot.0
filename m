Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE03C79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 06:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76B4080AEA;
	Mon,  7 Sep 2026 06:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tuahtTRufO8; Mon,  7 Sep 2026 06:04:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7D09880A7A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788761085;
	b=BGG1Bu+hgjeDICNF/N8qUoRfi9rmm00ALrTnrWQ6M7x/Fd6CkYoG4hMey1eMJTv+jgeN
	 RVeu4veoExzECiY5do85sFeYpheqKL82VppYdBeL7hAS1o1uWlo8nPnEhp6g+FaOrbKrO
	 dWoOlbENjj2qTgsMzjHC2TBUddgthfEZ5xkmjvlzl1ehUV+KNOC4fFmvaF175etMjt5hP
	 l4tv8LxKziOGRXNZ//hgvE9jxagYpjRDmhn2Fdfzdv0A0oJUkBi1+LbovNq4Ya8xnwE93
	 2vqbR64mv9fsVBsRA/YmotHqD/64Y3Qrm5mXjg4xQfrlY1bvpJK2jCAAi38q3cbXdiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788761085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+FzbsOWMKcYIdYkfMfpbsyBfYlrwFwFL02ZSjyEQVSA=;
	b=hUtFaTDkrpQwtplqKTei6G0SqwuPbfJ1YMp3DU6p5W1isbt0Hospbp/QrcEl//D+NNik
	 9IjEGye4dOw40hhiEdJL6qfJJHWwbG1qfJbuVhfTX5Js0Bl+j3W9F5g30Cn+ldg6AzRNV
	 ArMPSqYEgZOAYwEFifoVSN/vykjgG1VcVjHuC+ao2PnpXDpw3QS4RXam5VWH8S0t5OzlU
	 UybK/mjlDJmFl1k8UMPLm+1ROZETiQ4rSdg/dTqTyTlxDOj33cJ6hJ4EbzALaDe22HbEe
	 4+7TO5oU4jSbnOhD9crHlH2fbMgoSqNySRZErLSztlwIoOAMnqnOBXthkl1qGEIVTnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788761085;
	bh=+FzbsOWMKcYIdYkfMfpbsyBfYlrwFwFL02ZSjyEQVSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LRQBFB89Rq59J6n3wIsIj5K+DOdLkL44A2pIZKJAZ0eWy37mClJm588GnFgSfOvf8
	 auXl7rlda3bX17sx6cZAUcfYXRUsfG/9Kt02/l3YqOO4Xfr0Z4uDmeFaCGa24C3Ylh
	 dStLtGbQt1A/1MZSeTxslhK6qrRTxNUy/Ho1S2bbB0aiKzw0YR7yI2Uoz6iywKMiru
	 e59Mn36jEV756sq4XX4Bou2m0IzQflbEMH8AU4zf2HV2NT0ChKskuwCXGM6RdaqD+B
	 D3evoBlrA4CQkrJc6WGqLkw7dk7LtnZjRAMqiiFT+JoMcdxVqtsIXV6emNURMnSpab
	 8rpQCgu6eN+hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D09880A7A;
	Mon,  7 Sep 2026 06:04:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 21BD52C7
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 136A9400A4
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID76x6BuvHk6 for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 06:04:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3138940068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788761083;
 b=K3bMuRFU/Ggx4izLT7gXyN8CtyiTd9wNcjpcP5IEnZZp3PDdaeAwQIhs/AjDhP9dc5uH
 hMd+BD0Ac6WzBHCWyzDsT9nrjv8P0lryu+Q192PW6w2ptRYU3kR2F+tP93NhLOeKgKATh
 eI3Rc+g61iRrMT8zW0uLQigfNVkl6m/3ZQvUt0r8oX+jsi62yVD6d4O/8Ez6gC2hFvoAs
 VazB4e1Y9+U6RYuoj7ryX+bn/nodBgSz/nLYJpVwUknvtEROoGcSUV3TErIfwDl2Trfw+
 fdw16/kgRh7rBITXOaEwdbXqwMT6PIRBuKJaIqcNebVyMumajIFIOaD+OhQtSeyoVJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788761083;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yEJ8u+xwsYtq3Z+7ALTHL2ZYSDdHPHOvY2fsa1a4GQg=;
 b=CS1WwA0YsXzJdlbA7yONMOA3NQgkNxDVnv0TwhTgVZEiUkTYP3bpWYauP42etIRXRYo0
 +E7TlVA6I8Ezdx+wse1N/Q6f32Wb5ZjpM/ZcBFtxvcN6hQr9n9AX2otZJSiLUFuPSheXv
 1MK6IwCYc3vg3+rvldKC54bjS2YCFN01cfBKLENa1Rn55BPPGWf7ezrVQZGyEwn8FxJLj
 qJTCgAsHmI9Lvi1vW21hVMeIhRdFHOwEUpebDNn2hFzPF6vGFxmck+ESkP9RMKljnfyK8
 qErfe+ZCy2DTQhAUA5KWTQ/1vUeKXKjIKLqaptw7+QIKmbA43RVbEvTekVzF8EPMHPw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3138940068
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41274952BE; Mon,  7 Sep 2026 06:03:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 08:04:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 531be778bd4bfc98142f372d1f4136d8a0759d8d
X-Git-Newrev: 87e95b9877ffd29ce9a02399b8a008266a1f5971
X-Patchwork-Hint: ignore
Message-Id: <20260907060341.41274952BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/passt: disable on uclibc
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87e95b9877ffd29ce9a02399b8a008266a1f5971
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream lists uClibc-ng support as a "nice-to-have, eventually", and
tracks the required build fixes as an enhancement:

https://bugs.passt.top/show_bug.cgi?id=5

passt relies on interfaces and definitions missing from uClibc,
resulting in build failures such as:

qrap.c:145:25: error: 'ARG_MAX' undeclared
tcp.c:2926:34: error: storage size of 'wnd' isn't known
tcp.c:3321:47: error: 'TCP_SEND_QUEUE' undeclared

Disable passt for uClibc toolchains and propagate the dependency to
Podman's passt backend.

Fixes:
 - http://autobuild.buildroot.org/results/7e4/7e4434e01baece4d090e44b4b3713f2eeefc1e27/
 - http://autobuild.buildroot.org/results/3f6/3f60889b4599f1bc42a69076f6fe469517ea9ab5/

Signed-off-by: Joseph Kogut <joseph@anodize.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/passt/Config.in  | 7 +++++--
 package/podman/Config.in | 6 ++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index fca1dff7c5..d21bb6d5d2 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
+	# lacks ARG_MAX, struct tcp_repair_window, TCP_SEND_QUEUE
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 	help
 	  passt: Plug A Simple Socket Transport
@@ -19,5 +21,6 @@ config BR2_PACKAGE_PASST
 
 	  https://passt.top/passt/about/
 
-comment "passt needs a toolchain w/ headers >= 5.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
+comment "passt needs a glibc or musl toolchain w/ headers >= 5.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 7884171380..bbcb15691d 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,11 +72,13 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC  # passt
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
-comment "passt/pasta backend needs a toolchain w/ headers >= 5.9"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
+comment "passt/pasta backend needs a glibc or musl toolchain w/ headers >= 5.9"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_9
 
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
