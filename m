Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE141C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BC640AA6;
	Sun, 27 Sep 2026 10:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hldFZDrD19J; Sun, 27 Sep 2026 10:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8AAD840AC9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506455;
	b=ZdH85XYixMqvZTh0dqB33Dz00+0vtuVTx7OVQrkoVaNOUVcbqX8nkr21zBmjL2bKBVJB
	 fwsuo03S/4U3/eVNMV2Tubea1OeSNx7UcaLutWUbasxnS9qsQIFmfPVUhd7sjshQh2+kp
	 i24XFfU41CgvjPLxG5osOUPbtIizeiETeGMH7eCOG3R3H3KjYaDn4vI/hAtQ72U88G7UH
	 jVreHVBHXAXVyjHlqmMIuZ3dMItpG9PpPdwa50H4I5/kZ10C5pt8TIj/q5n6TSgurUYmy
	 agzcS+hkLQPGf1TWP83U71duz68FjwIgR1BK2xZCr6HkAEkCZ/1LrRPPHcVgMaAlQJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506455;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=BvBKYvqp2qWVarlCP3J8Qo3qmZEz2eb6FPQTYL1sdk4e08My4nBMd4Cyog2nMEZd1gzS
	 ACt3Hpahb/uDdRs9nyIDUW/rpe8S9XHBspGS8nkofI41MRELun5oKMmYYRw5xLZ3zVTz2
	 EpxTEiZyPukwTWABLU1cHt+wGzWPR3zBuQQ+Pw21M8DT74mGUaZuRXozpMuu3+wge1UGb
	 UMOsxNLlsHnqVVOo94TMRfQVBIgauzLi8c9LozFZCPAonzQqPYOoaQjppoQ0PcdeM6cE5
	 45T+O5PrkEj46cyfgEoq7CF3HCv/i1xKMnKxVtkMKx+mWtNdn0S4MKrFvGFIRlNDf0A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506455;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aZ5vPwzt7PsfLfx9GKUv5mC2GOBsQDqgu8NL6MYN2LFxcomrkhquCrYl1uCvdMpQf
	 vtFdeS/VQ5uc3IjmsNcnaYCSOQ5oYBAMvsnEJAkh8vSartp4MMiW0ND2C1uawwo9KS
	 OqClPXcfEOs1UmdEmh6y4PDqOTKzyVEFiX3yKap6an1ZHA9BHnWSnmWRv5rJ80H+uK
	 3uAHf+HQyhOAvvC/O1kmw5i3dC+dKhAb+VANsQRfljbxz3u30hTIbzupQZJql9w8BT
	 eAhyjSH5oEozrVmkKvTJj/M6z4J6ZHlN1wuy7s7hdXs69BiBx/MUUmYjzBIJL5/4AF
	 i6mxy/jR8uDuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AAD840AC9;
	Sun, 27 Sep 2026 10:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1408B335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED573810D0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3CMvZVW3AAU for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DA42F80E07
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506453;
 b=WpJlzTNdMbhb9B45PFgawGJrGyCaKtgJvY0dnVTG+hv+kfwKq72H4z6J7FxqE5Oa2sZt
 JI75h2uoeLm2Vs9EaLoR30Kpr63hrWcYUzZfcg+rwvY/IfBpkGWywe1v4R7HSQaaUb6zl
 xrqX6UrTokzAgGDQQAiF2HqALDVY8u88Ydwtdlf/GWFtRjYi0aqwmRry31/my8NsnzsLU
 Kw1JwnFcFXorbuLqCgeRN4u0dbqLQeU/o+u8Gwtb9dMjCl4pKntmCT4b3QluwL+pKd8RJ
 e+dRoSM9qtJbUq3DV1VmCS0CxFIfK+ATyYRKzc+t3P/1qN6eR3SVtKdr5vRL9ZS+iPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506453;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=KbMcfFFaz9RSfoAJkBXX4suJj0lDXKoJMNjhoRkc5aayKUfwptlsuSlSYNLrb4qW1BEe
 tWFg/XP7t24Kl/Cwgf431uCloW8jZ6DywiyraX3jBbUKrYkSOhXl3lFi/6l4XvSyL5DGe
 BVH+gDSEk75SQsRcWYG51qOPjz1rSv1FIoLraYwOZ3ADGSuX5Q9LFNX73hEHFKVEdnphk
 sVZTCDrEHOK27mVc/GLt5aIgPlZp5WxdghoMDaJEW0jG+VMIOVKCZBfQbDjqKKb0/VWiD
 VhmV/Qzlzk3cdKqzU+ljYcR9unpDH9iSq42joW04TDKTRpZ7F9109dBPtCB62uk6j2w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=thKTVbGn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=thKTVbGn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA42F80E07
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505856;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=thKTVbGnBybRgd7Lyj7fJbWT6b92pj3ww3mrChysHFhqdXcMROOYuautPW1LI3dom
 7bguA+1Xse29nksoglKXVpv8hsg4yjCncQqhuNof/AjDkFEgkoWiKKJWCenKSF8Ea1
 NRMNAHIq7ONYNU13jdu6X00mNnOrHj23035yuWES+pB3nPB1lMxGXVjIFXOkTpienU
 upSmktVu4SauaKE5b7W5hp3QIOA05Mu/UPePe9+iJ2I0vlEUJpKYoJxlA5i4jUsXjV
 q+xRqPQ+1PO9vG+fRvT7fOuKwXpmc09SOximjVnQHDfg2HR8QkziIo3cXVp4xwBaiT
 eUMTnovJOF8Qw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 2BYlxx9T3e4Zv+6NgyWvaFvzVS0M7f0iotjlJ9NnKWvLiE7TClOaiUa6oCDqadmDnwH1b113MCD
 nIlVC69ROEkfHNqs25ECoxK16+T6152tJFiMfPepxX+CdABKG34XflvCDr0mFG40TuR6p5VCpQe
 C0ySXdHpG7DKl0yB2aElXyoe+wL/fAsRxNrK8dr2qkCpiV2iIpQPacBJcFsbjj0yew+kVcKYNHW
 gCiP0dgOc2aZMZGwgs7fOOZ/UsaNRUW1L1GmStuFkCt34WNgt2nUjYJQylzNTFxwYFJmoMtCT64
 KLlK3/h1uYdeBlLrhIe+krb4DlYp29sKNBHMriGqCORRnGxSlXAgGPVnNLpJijsC3hnLuvRfoSu
 vz6DqPVnlJVbwiXYuqLAuVD7g4z3gKcOe6Idvky09C151+WSNtdCzv4b4qMnt3dMLwrCc4XKAKQ
 IbtwxIl/BVb4wd/a8EAWhoSMIkTrZ6fCoZ4LGZJ702sCY9wlW0U0sVurO23PW//3/upESt/7dW0
 6nsQEnc9XMNEcpboeQF76aHv0vAzgyJ5cJwwaWORZMdTESDU4cSrQ6H2lZYNrqb9xSez57VbyWR
 MCqF8pXB4PNM1nVs0uPBSCEeFeBAX4Ri5j12RTOdpGars749SX/EUv0WrsMKfwlBTQg4s8PxzPh
 6CsuOBb/jaamW2KvTnLM=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F0F21A4C4FAB;
 Sun, 27 Sep 2026 12:44:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLa-0000000007a-0R5I;
 Sun, 27 Sep 2026 10:43:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:04 +0200
Message-ID: <20260927104301.1801638-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 26/82] package/nmap: bump version to 7.991
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...if-compiling-without-Lua-support.-Cl.patch | 29 +++++++++++++++++++
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
