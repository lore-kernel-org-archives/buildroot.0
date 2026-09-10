Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD85C79FBB
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A5040B95;
	Thu, 10 Sep 2026 19:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaRi39jP7JHr; Thu, 10 Sep 2026 19:44:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 91F7640B54
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789069490;
	b=ppqMvgmPk5171k6n7J7C9kdcg8Dz04nbSSBZRsjBMoDoKS/nVJmP+grZpaqokgtJJ3FU
	 MatVdK4sKbC7b2m4vjzhXJyD2ZqFwum69aWTP0jtaid7KY3hFeCCP517pSFuYDHcJ1Bfs
	 9PqqCoErl0oumEsyK+24PPyOVUcccXdKF1Pn6hVLYg6eb7BO4e6QVfHvwWPjWiCl4q1IU
	 bQc99Q3s8+CtJZjUfXQHjyYEVz+tiO8Du5Ei4q4UUNTc0rd6pTVB+uOwgt55ClEqb4Ifk
	 almO+MhBQKgSfLmd6r2MuKaTkehwb2uovDhaou3SKX6+0hwZEo2zYNUe6u1bg6Os2HA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789069490;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2tXs9o7whnQPKjKPUsUykRkqqyA1AxOM3aJeLuWQ1GE=;
	b=rysvT3nG/dv+2Gz8sbOsFQCw9uxtKa+XjsHAzkh0Tz02+Kv926udSt+mvSCtt+5sBJjr
	 lCGla/T4JTKgZuIv/A5j4ilOxHglyWTwwJNcH2RLpM2MCdiN9mO4PDmqa/Tn+QPiJuw0c
	 8Eard4bGbd5PBaCYWOnaoVTcFy2wHDpzgbfqS83u2duio2QPSJlt3KYkXTyOd9z+0sLSc
	 qPj83UDYUzsjpe120spbmhn+RkE22I4BTCv6p1SnO+HoDI74k0OqGD7RVMoAnIAKCxUCK
	 GYI2a99zCcOAPl3P7qHGwfAWIe2tOp3g2aRLeQWc39x8tPJJKVwHMwyMxzF6WeY1XCw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789069490;
	bh=2tXs9o7whnQPKjKPUsUykRkqqyA1AxOM3aJeLuWQ1GE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iDMW25z6gMRy1kVRuf65KFrKvcaeo4wmVDXAOwlqjvEjUeE4g5PKPRSZRQER/5Y7Z
	 fT3FUGtptiPNARDKXAK0XvqwlLArQbnCQnuMQ7zWvTxMCAFQPSn5qeV5FPH5qyBzGW
	 b4X+zmJRRpKT2EKUeFks5G6COHtXNyREU8lbFFMWx0IbstQH2LMxgjqpNtLN4gAjCf
	 jIJ6Ljz0EHOP0+cik/0asC5TB0AodNQM3kbNLv1ifTZva16pEsxxK3w36GTfEFRdKF
	 Q4TfQOe6A/YoeJaQw7qBwh5azYToSjqKIrzFd02eAAeD/jWBjbWys3A8skNGh6wEQW
	 y+rS52T1kb5lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91F7640B54;
	Thu, 10 Sep 2026 19:44:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 547DC493
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AE0B400AE
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QF4cVQB5dkmZ for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:44:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6579F40077
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789069486;
 b=g7rOXtNY6f/GVlfYyujFNZICklTnTnGeDRT2hg80lb1dbFoYTWJLZpeEmLmTp6lA5EVr
 doB1pvxDkn8JEnHejnWwXJzwf0QvG8Tqr46PHhGdkoBWmGhjePQT06otsX7Ls/tEZgZ6l
 HM3xGTfbcuLzqDjkNFjZQIMJF59vLX4a5/lk154M9dID/HQQDfffWl87/32Iy20w8Pu5k
 xNpNW331Ku//ztsNdcdEQwCJ+uZV8507iUkPIMW50bvR13CwF0di1pVRaLnyN5ZYffXix
 JtkJoPM3Lkh1f5eNh4FtFcHu4Z/3oPD6Mf8ED4gqUw7zh5owHlU8+9It8/mFn9EoyTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789069486;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=r1iFbgdLPM4/c7WRsvUo8Rt5w1XTeQrraPd56IZWkdo=;
 b=QrBXzyHbfNXEJm0m9JZEHozmsH9obUWYNKN3Y5v6wgauTG6beGIs/DeiAgm2/p/OuxuO
 0yibmcEsr0+n/DkJsCQ5+rnUSkxbddyXGQeSn/7BhcPDiRWyCIboHVxJh1n8z3dpHfsVH
 Yp4yjv1QMtjIbjD4JvUgfmQ7d8tTxExAwvzXXq68+eFyeZDBxGs5VkPBYIetg4Q0+r/qr
 1c/1yPqXR2OggbLJgiqdnmsYjIXnZsOtQO5YEcil1XRDlguGsLT6lZ6OdpspRXJ1VWDCy
 XESkdbKs5TTxraRuGC/Z1fmNRSPHDfbsoZmHp4PiGK+4YInCrAxymJ2IFogcu19+0hA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6579F40077
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:44:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFC1B9224D; Thu, 10 Sep 2026 19:43:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:43:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a22cd2d8433fbb6882228029f0e3bca9451530d
X-Git-Newrev: 2083b53b320faeecf18381e1a281cf5118da5987
X-Patchwork-Hint: ignore
Message-Id: <20260910194342.CFC1B9224D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: Update for 2026.05.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2083b53b320faeecf18381e1a281cf5118da5987
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

(cherry picked from commit 4b06935cb01309f874806a173a10f2fccb1eeaa7)
---
 CHANGES | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/CHANGES b/CHANGES
index f59febf60a..71f3fd7139 100644
--- a/CHANGES
+++ b/CHANGES
@@ -69,6 +69,102 @@
 
 	Removed packages: argparse, ts4900-fpga
 
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
 2026.05.2, released August 23, 2026
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
