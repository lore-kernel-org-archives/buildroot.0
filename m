Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2AEC79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 832C740B87;
	Thu, 10 Sep 2026 19:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EL6zdySe1-wJ; Thu, 10 Sep 2026 19:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8417B40B8A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789067754;
	b=qYsJAMEh9H64dv3tMA9hjZg1KEIB4opxei/TtBNCkh80/NgfN3wMmmk8oSqePEfZE0u3
	 eIZbSHcoLc5AjCEWndZcjCJACCq2o8Rib2g/MThivbYZhikgGkKvPWJJWxarwx2u8D5aR
	 22ZcHr6m1KMFmE5UIUHwHoxV+TzdUrbv5p4+uQWgwk3rNnHJHEkBnUEzHsFiCJ6Cd/jxg
	 4HU7/qS1kISETQu53Vnka+rgCVq7Wb600l/+EmdjzB9UOoU8XnZlor59kxzyJ2LbtqXgY
	 ek+YxOHSgpvvy9UiPvNfW12eWt88SLmV9iwPayEFcYznzaw9wF9htaBiIIKSD8PWgAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789067754;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KHaaGMDGbWeIrCKUZxv+Myd+iWMRlP5LjslMMYJ1enM=;
	b=Qc/0zdirLXmd21i6hvIafq2V1loqd+96PHjogsBoNS6fRA+Mfqi/Eug4fYBTWBx2Xm7k
	 fLj+Uoi9U9tsVbbeak7NAILe0k+4rJa5WWiGR6JC9h2souu6Sii5HNWSD0qSywEdrsrev
	 82tx2rzaZvMeN0jvol1/SxYNeh6+O2p2gf7KDwuTkEJnhfoH9pEQXLLO/OhRuM8SQK1fe
	 R0sBv2nfSpHtOTkL/6i21Ma/17bItw6Kd8zeEwzDcoyEYxKcyzfDAKXIvWyDtTab699Ib
	 8PH7ftEbuImd3WDNymwC3mpTxLcHnlzJnm8jRMCdVOUJQHTu8avCJZVnLGv1fHVkveg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789067754;
	bh=KHaaGMDGbWeIrCKUZxv+Myd+iWMRlP5LjslMMYJ1enM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=niSDPpWTFeMji+otVX0o9Tk+OvTca1RJD+aPO/DXu2jVp0VyA7rPLsjU6nuPwsT5V
	 6u5Utk/8qi0kXNaoS1KVWwhc6MSfBewI8zhx0bj1mUu8Du6+9g3Kjl18bZ6ONPLe3N
	 ypS4odfn9+QdYlSbY7fjXvyNrpclveoV0hbbjYv2tn/GPuWD402GvDujbF3gXVaIC5
	 TNLw9R91nsehvCi47Ddln7KHKitQHXUvdnYFFNrKfYe7k1gKw/u/FXSUZbh0CuzuQs
	 p2Lt6XVw09/ZyYYoGUAPnZ0+7gmMYxaridJbmfN5/OnG7ObL41mqlY5+nccgyk8ms9
	 MciLQVK0G84ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8417B40B8A;
	Thu, 10 Sep 2026 19:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC83543F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D3D0811D9
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HY2ZpowFj4V for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:15:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8D362811D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789067750;
 b=LIVSmc8tugW/UtRRwkus7uFFGAePj3U4iaY1sy+b7+KNQCepGkS6SXG3tKOuW3ug/ZGP
 EPvuxP4MSVlG7K7xuvBpkCx60YsFX/Cm/h/iwrCcdFoOjlkS+qZVl2yomj5blfNl0B1if
 KY6XiRUHypE9lbdPA7AOOQPRALYPYLluMeYdQiAAzhkLL2oHYO1iFdOzZRYNPLaUdAZif
 EEBk0pnUEuAb6ZHQjmb5cyfP+9qp+CAU32rsmqPoh9yrqoFc4OIIEhNzBWXdp8NKUWahy
 k8wwUWEWfznq7qTJ9KoFjvu+p5DubESGGTvbGSr9+Ri49ZXWwtusBYZXD8T3coZ0f5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789067750;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AHnaDaWPScdAyFo+degCfJQj4x+gMh+y9+o2/GWfEwA=;
 b=Ki5ewj/uWgAIGsBYyl+CZt647M8uYOEeDtAZHYKbUBko3iJAkffHTgLDk72r2iiBOmwu
 OYimdzi6uO7Gd8GvFfa2j1ES7nG7Z5oQTB5pPCM9ucYn26nKLFjDIT4P32AXrUQjyMnZJ
 BNP5knx7lLpy0SiaP/6mYYnEAcd659lxeBM9ugjfM3FXoPfyr3WIEZJqYLrIaHChoALdY
 jl7PKPNAEXbvhFcyTB7dZ76KgrAk9mAKZRaHNRxr6cg+GOBCvx6CDJJmNM8EEAmwhs0Ke
 jAo0K9Opw3faW/lOLM38yv8Hyhs1hPiEmf1QZoYqwz7OCHKGhAI9aZ8BchaQotbjtdQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D362811D3
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:15:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F113F9358A; Thu, 10 Sep 2026 19:14:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 20:58:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2fa3f30ad7a6204c90e881646c9fe26cafc4bfd1
X-Git-Newrev: 0f81c9d8cdf53c27cdc019b87c6f4f0126d6323c
X-Patchwork-Hint: ignore
Message-Id: <20260910191446.F113F9358A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: Update for
 2025.02.18
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f81c9d8cdf53c27cdc019b87c6f4f0126d6323c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/CHANGES b/CHANGES
index 0243e84af7..3fa203de0e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,93 @@
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
+
 2025.02.17, released August 23, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
