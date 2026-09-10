Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8824C79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81BC2403F1;
	Thu, 10 Sep 2026 19:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEHjSFDuKbog; Thu, 10 Sep 2026 19:21:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8A40D4041A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789068078;
	b=PhWH2A021LbIVFQ+sdS7kQ/AdGivEZa7DhDAfStZo43BvsqBf+ULPXJcTcIfQK5ngYgq
	 L5BftgZ3e51WtNyr/ZzwTIaHO96LpebXMAPhWtdQOcngW+76RxccTkMxY0jm6D3Gk+Nz7
	 bjD0aEpEJKp5zwMKa98uNY48Xm3WchKShflx6kWlKHOral1nRzBgJJLw8VmOk2I3TkrKr
	 dqPZF0UJtdsd+GQru+KZSfhFtz4BDkUGgFrDCs4Mob2IU9lFQRyY6zFjuYhEoTTwV5qFC
	 joSFt9GNvAUYpgAVoQfzoL/waHcLl7xumGVehljsfdAJPpqfoD8GuXsAL9/3+6UgLkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789068078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6e81KvhhrHNGB1eCpEXpKWGywa5wJbNeQazssnnju3Q=;
	b=mD1gQUxev60qiGMZlSAnAeaHbxWVjRroR9UaQFvi9MFGPw75JiCrsb5JpXNKlrhAOiJG
	 TKMYsDDzNx2M7hw/nDdtkQjzCJqGvu7CEEw3eLwF5vVJTFOHc4RdfQF5X5vvLMTX4HH2v
	 mEtNCzKhagPs6fot8fwcyQzWDuIM9Bexq4M6tnyW2whG3QEAITynxlr8N20qioxwl06CM
	 nBj3Mcugue58SfPXdRCCbZvfL36V614VFAe5tZCTQ2mGbP1hVurTLvOsPZhmvfkGFrIvi
	 tAiULi4gRVnVg8zcepeSb0unTdLgGNawH7paHbwhuz61NZn46XvISoTsA4lkNmPewdA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789068078;
	bh=6e81KvhhrHNGB1eCpEXpKWGywa5wJbNeQazssnnju3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ff1ot7la56OQ9T3VUnY6ItWP29vIpANHoxBz9/cqeMFpw/RirCXOl1JeB7j6sKRpv
	 AN3lWNpeZXoQbt5gLj2S/lDga6MsuUev8842d9aEgvrvu5KIqMDR9oJCx6VXdFVMZ5
	 /M2V2Ca49xLXaPIA9znxLPIvl1u7U08+6b/ZfhKA8ijUw7fnoxAMUSqO1T27rSvzcp
	 OkSx7GD/hIMHpV0LG+eU5QxUKC98yYkmkd7U51TXmcuDbvZYyFwYsbdUzHhRTiaEQM
	 imQgvtedPgAh7YKfrJlD6MU/y+VEtwlgcfCy6XhgWpil3xzv/u+YTTaeFidysD7MsO
	 wryBbCzK7UVsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A40D4041A;
	Thu, 10 Sep 2026 19:21:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5128A43F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37D5340083
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnMyS-y3Tp5S for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:21:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 551D040077
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789068076;
 b=VVDZqvQ1gtZorVNyyw2n6l3eb8VhXnAqGHc24TFrqdRyd+h2eG1j5LEr66vSU7uRehHc
 0n2FgL3V98g9HtC2WRaH+Yhrg+Cd7QVneps6863wRVtLOEru80+Fm5J/bRNj0j9ycmJDU
 e71SVMDt8BU6q9KjcI2jEN+7e/dcOut/mMEcWkWgQ11okvgKB4fy/QqMU+Ok7tYQYqAcB
 wO1j9fPCNjss2bm8IsHIUQw2Z230ZL8ZnoQkwRjD67G2AN3CqwyMXUHKoF4uSxP+FUqLZ
 oMiS/oy8rkrrEJHT004TKe9HskMheTHEkLRGuTI+CYoOcCI78xdHCbKdF6jidUCyJ6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789068076;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Qw18nugot0WtfT+lgJ5+GVVH80rVytcstFQUAHiNOTE=;
 b=qgNVWl0TdTBS99Dt5WuqZr5RQvwZIQunNSGC7o4NNXpHGr2HWkZYmA10H+gF6l0m/1lm
 n20tTK0POfX7LEcKhKv0/K0sbOQJVCAwHF36FsltHyk0siegFfbDRvd8zDrOj5BfD78zv
 TTGzsnW7EjVzWRysqkMoW9Qqx7P/k9a8vU/Ll2AUa6cs8jeDnknsEd/buC4mNSX5nV0Mp
 z0SJPC/aD8S6T/DtsxoMf1OW6h1sxrMfn1kBom4BDaGEYThD2PLyVuMa9/Kwv2sSDTu/U
 mk1hYd7EiOtRiMsCYvlsujYuFSSokRtSN9t3vT9NfA46fLX1edys3azP5wyMKvCFmsQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 551D040077
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:21:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6D7F92403; Thu, 10 Sep 2026 19:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:20:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c4238b9f121301464ae23b265f5da2ccae283e6
X-Git-Newrev: d705dc5d96125bdd54b9e7087145236ede07c4b4
X-Patchwork-Hint: ignore
Message-Id: <20260910192012.C6D7F92403@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2025.02.18
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d705dc5d96125bdd54b9e7087145236ede07c4b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit 0f81c9d8cdf53c27cdc019b87c6f4f0126d6323c)
---
 CHANGES | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/CHANGES b/CHANGES
index 4cb4c095ef..f59febf60a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1775,6 +1775,95 @@
 	- netsnmp: unexpected header length in /proc/net/snmp...
 	  https://gitlab.com/buildroot.org/buildroot/-/issues/110
 
+2025.02.18, released September 10, 2026
+
+	Important / security related fixes:
+
+	avro-c: (no CVE assigned)
+	clamav: CVE-2026-20031, CVE-2026-20213, CVE-2026-20214, CVE-2026-20215,
+	  CVE-2026-20216, CVE-2026-20217, CVE-2026-20243, CVE-2026-20244,
+	  CVE-2026-20339, CVE-2026-20345, CVE-2026-20346, CVE-2026-20347,
+	  CVE-2026-20348
+	dnsmasq: CVE-2026-12725, CVE-2026-12969
+	erlang: CVE-2026-21620, CVE-2026-23941, CVE-2026-23942, CVE-2026-23943,
+	  CVE-2026-28810, CVE-2026-32147, CVE-2026-42789, CVE-2026-42790
+	exiv2: CVE-2026-49275, CVE-2026-68546, CVE-2026-68547,
+	  GHSA-3695-mjv8-3r52, GHSA-9v3x-mhg4-wwv2, GHSA-fgw8-p7pr-37cp,
+	  GHSA-hxph-pv7w-8649, GHSA-jcgh-p9v3-pw6j, GHSA-vg6c-9f6h-4x5q
+	expat: CVE-2026-66046, CVE-2026-76641, CVE-2026-76956, CVE-2026-76957
+	glibc: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435, CVE-2026-6238,
+	  CVE-2026-6368, CVE-2026-6791, CVE-2026-77117, CVE-2026-80489
+	go: CVE-2026-33818, CVE-2026-39821, CVE-2026-46600, CVE-2026-56853,
+	  CVE-2026-56858, CVE-2026-56859, CVE-2026-56860, CVE-2026-56862,
+	  CVE-2026-56864, CVE-2026-56865
+	haproxy: (no CVE assigned)
+	hostapd: CVE-2026-58374
+	libcurl: CVE-2026-13608, CVE-2026-18924, CVE-2026-19931,
+	  CVE-2026-80229, CVE-2026-80230, CVE-2026-80231, CVE-2026-80255,
+	  CVE-2026-82208, CVE-2026-82209
+	libde265: GHSA-mm7m-v26f-wf8x, GHSA-xp3h-6f5r-8cxp
+	libgit2: CVE-2026-5917
+	libheif: CVE-2026-84450, CVE-2026-84451, GHSA-24wx-9w62-c96w,
+	  GHSA-2jg2-4ch7-h545, GHSA-4h82-g446-83fm, GHSA-4jqm-2x34-6f6r,
+	  GHSA-73p7-m7gg-w2jv, GHSA-8857-r8x5-7499, GHSA-8fmq-r4pf-7m57,
+	  GHSA-9rj8-5mp5-26c9, GHSA-g89c-p67h-r497, GHSA-gh5q-69gg-c964,
+	  GHSA-hh47-fhqr-cj2r, GHSA-j264-xvrp-5v7q, GHSA-jc8f-p23p-5hjg,
+	  GHSA-mw6f-29j3-76f4, GHSA-p58j-h3vm-3fp5, GHSA-w7mc-p8jc-p853,
+	  GHSA-x8r2-mggj-j6wr, GHSA-x8xm-cm2c-cfc8, GHSA-xw34-mjcp-jqh8
+	libldns: CVE-2026-10846
+	libopenssl: CVE-2026-14456, CVE-2026-14457, CVE-2026-18798,
+	  CVE-2026-54874, CVE-2026-63072, CVE-2026-63073, CVE-2026-63074,
+	  CVE-2026-63075, CVE-2026-63076, CVE-2026-75803
+	libssh2: CVE-2025-15661, CVE-2026-66032, CVE-2026-66033,
+	  CVE-2026-66034, CVE-2026-66035
+	libxml2: CVE-2026-11979
+	localedef: CVE-2026-18374, CVE-2026-19499, CVE-2026-5435,
+	  CVE-2026-6238, CVE-2026-6368, CVE-2026-6791, CVE-2026-77117,
+	  CVE-2026-80489
+	mongoose: CVE-2026-63626, CVE-2026-73251, CVE-2026-73252,
+	  CVE-2026-73260, CVE-2026-73261
+	nodejs: CVE-2026-56846, CVE-2026-56847, CVE-2026-56848, CVE-2026-56850,
+	  CVE-2026-58039, CVE-2026-58040, CVE-2026-58042, CVE-2026-58043,
+	  CVE-2026-58044, CVE-2026-58045
+	openvpn: CVE-2026-84732
+	proftpd: CVE-2026-44331
+	python-avro: (no CVE assigned)
+	redis: (no CVE assigned)
+	rsyslog: CVE-2026-19654
+	udisks: CVE-2026-7867
+	unbound: CVE-2026-14586, CVE-2026-32665, CVE-2026-40622,
+	  CVE-2026-40691, CVE-2026-41637, CVE-2026-42955, CVE-2026-44621,
+	  CVE-2026-44687, CVE-2026-44690, CVE-2026-46582, CVE-2026-50045,
+	  CVE-2026-50046, CVE-2026-50243, CVE-2026-50248, CVE-2026-50251,
+	  CVE-2026-50252, CVE-2026-52863, CVE-2026-54478, CVE-2026-55708,
+	  CVE-2026-55717, CVE-2026-55973, CVE-2026-55990, CVE-2026-55991,
+	  CVE-2026-56416, CVE-2026-56444
+	wget: CVE-2026-58469, CVE-2026-58470, CVE-2026-58471
+
+	Toolchain:
+
+	- linux-headers: bump to 5.10.269, 5.15.220, 6.1.187, 6.6.156, 6.12.109
+	- powerpc: correctly track libquadmath
+
+	Infrastructure updates/fixes:
+
+	- Various fixes to the runtime tests
+	- manual: document move of patchwork to patchwork.buildroot.org
+	- manual: document the LTS release cadence correctly
+	- Fix setting of stack size for FLAT binaries
+
+	Updated defconfigs: qemu_xtensa_lx60*
+
+	Updated / fixed packages: avro-c, bind, clamav, collectd, dejavu,
+	  dnsmasq, dpdk, dracut, erlang, exiv2, expat, gcc-bare-metal, gdb,
+	  glibc, go, haproxy, hostapd, libcurl, libde265, libgit2, libheif,
+	  libldns, libopenssl, libssh2, libxkbcommon, libxml-parser-perl,
+	  libxml2, linux, linux-headers, linux-tools, localedef, mongoose,
+	  mosquitto, newt, nodejs, opencv4, openssh, openvpn, perl, powerpc,
+	  proftpd, python-avro, python-charset-normalizer, qt5knx,
+	  qt6declarative, redis, rsyslog, taglib, uclibc, udisks, unbound, vim,
+	  webkitgtk, wget, wine, wireless-regdb
+
 2025.02.17, released August 23, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
