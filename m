Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B5CC79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3389760B7B;
	Thu, 10 Sep 2026 19:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDQMHjiwxuAh; Thu, 10 Sep 2026 19:40:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2472560BB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069213;
	b=W2KtB/w+8+2qEN77vw89rayPMYC1MD7qrOB64BRFpUUkCr3kI2b+bRyz66k6U/YGhXke
	 9aSiNM6gGprz37bEJxlHZhOmJUd6XYBQjxNjSXGKJeSQEHiTbINnYzzor3FblxLi8v7Gj
	 EhxLOjfROGv84GC775yfN3I+rjtcmTwbW8iClzBuefdJdJjPuvkpLQq4fDTG1En68Ckao
	 Yvi/r2yW6JWG2pogcwq4AjaHSYO2z0yBzyFNn/GpfcVE1w4XPrNpLCEpEz9yi26qe17Kj
	 MASpq78wcF0k3BkDSvNX9H8B6ECiEdtF8paKZfOxu1KaLFTV89wO7onkwpAE03pffZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069213;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oSqx2tKIiIBLi5ucTGYc02xMYNDAOEDWRwJ+gJapzJU=;
	b=bYLBkH+yt6vyFoRr4mWAMVuAHTf3a6nVxh2Wdl2/5Eit4CMhmXAJLEdH/U5uJqRRhkr/
	 3QCgtD9MyAJMl2b9S1BN01TaFyxsu4EJZVPnkHIhM21TXCoD2c5yYWyZqxCtEnLVIZE/d
	 1DPjG2FVrA7k/ORYYMus1GrX598oP0ZvPDaobEDaiAl8cZWMcrfbsaj8Rc48BzcVVV8xg
	 D6wiAhqPTTthmC0QurZUabRKXoRZNGcu80uycIDWia8GKGpybqmF10DmheIrbWh8Sqa43
	 l4aQgjfSwIBmTWXSnarSGRYvai2Q6QXnxcWoh+lzhLJ9eqTMCEHkvGjYv3oEJWkPzWg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069213;
	bh=oSqx2tKIiIBLi5ucTGYc02xMYNDAOEDWRwJ+gJapzJU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FkxZL15WQ3JFz8KcmWbXqvmCIUQzOwwt6ZHchWfpFTfyBfk34NLMbDTKT60j+oYdQ
	 AVIpv7/EhkbSJWLHvFVE7bEQQqk6Wnx4H20t7Rg79wJjIE8fgIAC9wwPPgqJ7j7JL2
	 7/PaCyTFzXLxnMs3urzR4+UsUhZRLldfA9sHE2qX57u1BiwNXgjVr01d6S/zQBnsum
	 R9BVMwsGMip6aypO1EHGi9SwYqlDai4NKvtQ27nhOXCaqmxOejsHz8hV/9kxD8xHsD
	 qdFWBXeTbvxEFqa1fGBVqriexyx1dhOQpIaW8kxMKYSb0y7Jjk6npBik3qMH1gPk87
	 fOBR0oPors1Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2472560BB7;
	Thu, 10 Sep 2026 19:40:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4380343F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29FE0400AE
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeZQ1r-9tqV8 for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:40:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 52B5740077
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069210;
 b=rzWhV+HuXBqGoysTD3mgn6Sl+C9qk1/AnlTh9BOZy+fwZADquLfOND8kmJBl+uZOkSRM
 BmZxAxGtvjC4Y3MMsX9pBwf60XsSJDCNsgMscDb56bb69vmxqKjoRtMaiFkvf1xrD/LIS
 Ltvh9uIdxbCjzkYqHky9FwT1R0Y0ltZ+6YraKjUPm2cWqypekYqwaM251gbZKDmZtO3T9
 X+PSGHysl4Jt61hdXIy6FlK6Om5vHiZMov0xlYkwtU66o4QIRZp12EN5tSexHMPsSOPCd
 KTKN6mDFmb8FRKNx+RYUBkXirsS9eOajZuXCyVQE3r8UI90pRnf9dqFeh0iWMUgCEDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tv86E1ita2+k65vKXK2aE/Ff+ZgI5WVCJJP/tKk4H5c=;
 b=RSAy8ndLx4BgHk4cuxRyVpVc/+Mhk/NTHZS0KD2izsjcAaFpDKmTg2iVIM4WHudC94jU
 vfsXz0tVBOhBkutdq02eUu4dvSfZwoIFFv9YhxbA5CWgxPh5DVTn8VSU9VUvI++l6NdR6
 W6eaJ7HRzIAczVVYY3TofUiH+V0cJJfhpiS2QotN4V5Isanfl+MmRGdHhfAW5ep0Ff/E4
 PPb63Oj0pVTYaqNgShaVvBvxz+P6YQMV7hTWVrKtILD6UUaPoOApmbwQXg9an+aQKe6L7
 LYohNG0UVvu82kkBklQuiQfCcuqtmraEL4YltCzWTBW2PMYUFBi8xq/JaVcnMl23yMA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B5740077
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B62B992384; Thu, 10 Sep 2026 19:39:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:36:58 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: ef196be6e56f1dc7ccc31c61284b894d3f13b1ff
X-Git-Newrev: 4b06935cb01309f874806a173a10f2fccb1eeaa7
X-Patchwork-Hint: ignore
Message-Id: <20260910193906.B62B992384@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] CHANGES: Update for
 2026.05.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b06935cb01309f874806a173a10f2fccb1eeaa7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 97 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5edf0d2f4e..1fc1a2d40f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,100 @@
+2026.05.3, released September 10, 2026
+
+	Important / security related fixes:
+
+	avro-c: (no CVE assigned)
+	dnsmasq: CVE-2026-12725, CVE-2026-12969
+	erlang: CVE-2026-21620, CVE-2026-23941, CVE-2026-23942, CVE-2026-23943,
+	  CVE-2026-28810, CVE-2026-32147, CVE-2026-42789, CVE-2026-42790
+	exiv2: CVE-2026-49275, CVE-2026-68546, CVE-2026-68547,
+	  GHSA-3695-mjv8-3r52, GHSA-9v3x-mhg4-wwv2, GHSA-fgw8-p7pr-37cp,
+	  GHSA-hxph-pv7w-8649, GHSA-jcgh-p9v3-pw6j, GHSA-vg6c-9f6h-4x5q
+	expat: CVE-2026-66046, CVE-2026-76641, CVE-2026-76956, CVE-2026-76957
+	glibc: CVE-2026-18374, CVE-2026-19499, CVE-2026-77117, CVE-2026-80489
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
+	  CVE-2026-54874, CVE-2026-54876, CVE-2026-63072, CVE-2026-63073,
+	  CVE-2026-63074, CVE-2026-63075, CVE-2026-63076, CVE-2026-75803
+	libssh2: CVE-2025-15661, CVE-2026-66032, CVE-2026-66033,
+	  CVE-2026-66034, CVE-2026-66035
+	localedef: CVE-2026-18374, CVE-2026-19499, CVE-2026-77117,
+	  CVE-2026-80489
+	mongoose: CVE-2026-63626, CVE-2026-73251, CVE-2026-73252,
+	  CVE-2026-73260, CVE-2026-73261
+	nodejs: CVE-2026-56846, CVE-2026-56847, CVE-2026-56848, CVE-2026-56850,
+	  CVE-2026-58039, CVE-2026-58040, CVE-2026-58042, CVE-2026-58043,
+	  CVE-2026-58044, CVE-2026-58045
+	openvpn: CVE-2026-84732
+	proftpd: CVE-2026-44331
+	putty: (no CVE assigned)
+	python-avro: (no CVE assigned)
+	redis: CVE-2026-62356
+	rsyslog: CVE-2026-19654
+	udisks: CVE-2026-7867, GHSA-j42g-v9jw-6ph3
+	unbound: CVE-2026-14586, CVE-2026-32665, CVE-2026-40622,
+	  CVE-2026-40691, CVE-2026-41637, CVE-2026-42955, CVE-2026-44621,
+	  CVE-2026-44687, CVE-2026-44690, CVE-2026-46582, CVE-2026-50045,
+	  CVE-2026-50046, CVE-2026-50243, CVE-2026-50248, CVE-2026-50251,
+	  CVE-2026-50252, CVE-2026-52863, CVE-2026-54478, CVE-2026-55708,
+	  CVE-2026-55717, CVE-2026-55973, CVE-2026-55990, CVE-2026-55991,
+	  CVE-2026-56416, CVE-2026-56444
+	wget: CVE-2026-58469, CVE-2026-58470, CVE-2026-58471
+	wireshark: CVE-2026-15163, CVE-2026-15164, CVE-2026-15166,
+	  CVE-2026-15167, CVE-2026-15168, CVE-2026-15169, CVE-2026-15170,
+	  CVE-2026-15171, CVE-2026-15172, CVE-2026-15174, CVE-2026-76879,
+	  CVE-2026-76880, CVE-2026-76881, CVE-2026-76882, CVE-2026-76883,
+	  CVE-2026-76884, CVE-2026-76885, CVE-2026-76886, CVE-2026-76887,
+	  CVE-2026-76888, CVE-2026-76889, CVE-2026-76890, CVE-2026-76891,
+	  CVE-2026-76917, CVE-2026-76918, CVE-2026-76919, CVE-2026-76920,
+	  CVE-2026-76921, CVE-2026-76922, CVE-2026-76923, CVE-2026-76924,
+	  CVE-2026-76926, CVE-2026-76927, CVE-2026-76928, CVE-2026-76929
+
+	Toolchain:
+
+	- linux-headers: bump to 5.10.269, 5.15.220, 6.1.187, 6.6.156,
+	  6.12.109, 6.18.50
+	- powerpc: correctly track libquadmath
+
+	Infrastructure updates/fixes:
+
+	- Fix setting of stack size for FLAT binaries
+	- Various fixes to the runtime tests
+	- manual: document the LTS release cadence correctly
+	- manual: document move of patchwork to patchwork.buildroot.org
+
+	Updated defconfigs: qemu_xtensa_lx60*
+
+	Updated / fixed packages: avro-c, bind, bpftrace, clamav, collectd,
+	  dahdi-linux, dejavu, distribution-registry, dnsmasq, dpdk, dracut,
+	  enscript, erlang, exiv2, expat, gdb, glibc, go, haproxy, hostapd,
+	  igh-ethercat, jpeg-turbo, libbpf, libcurl, libde265, libgit2,
+	  libheif, libldns, libnfs, libopenssl, libssh2, libxkbcommon,
+	  libxml-parser-perl, libxml2, linux, linux-headers, linux-tools,
+	  localedef, mesa3d, mongoose, netsnmp, newt, nodejs, olsr, opencv4,
+	  openssh, openvpn, passt, perl, powerpc, proftpd, putty, python-avro,
+	  python-charset-normalizer, python-gobject, qt5knx, qt6, qt6base,
+	  qt6declarative, redis, rsyslog, taglib, toolchain-external-bootlin,
+	  uclibc, udisks, uhttpd, unbound, vim, webkitgtk, wget, wine,
+	  wireless-regdb, wireshark, xilinx-embeddedsw
+
+
 2026.05.2, released August 23, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
