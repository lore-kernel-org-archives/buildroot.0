Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260B5C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5D5E606EB;
	Sun, 20 Sep 2026 14:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3bv28kchdiO; Sun, 20 Sep 2026 14:17:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E69EE60623
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913860;
	b=hnYKnri3B8yG6vE2MXRv97W+BcD/D5RDxKgJnWcs1e7z/jRWjBigspC7pCB+u/tiFLiq
	 hzi0EklQAtk8cKkmTpf+pRdsyrwVkH7qkwTPLA12jZNgEnJmAhkptFrYVj+9MpE249c9l
	 xSAU3J1pGVZIaHPH8CB77bNhdsxPtdcpvImKnpG4Kl8FonkJJgxhBwLLSwYF9JG+0dVm2
	 sMeybPK3WDa+7wRE7s5Miq9Ol/L6JxPYcCLajXAfdsSGHDA0IEdzZN11nSEtXrFBv2CjD
	 esH8wAsRXbYGfV3pJLJXcfcRNDZBbGUF0A5XW9ENzNVzYEXGKzOTzsg8KRledPVd+mA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	b=LU5DYB1jLCy4Cm4HKFC5cIpn02EFzU8dF4WERuQqXW8xDIKxh+3hyrmDwRnOFxhGGQcx
	 reCJEZ3CDQ7jJm8aC+k3jrE/o1TIw71veqQybpqcw5VDwQ9DvtV3TAQTZD7X9KUDzSe5w
	 iT1RGUBvkgJ0XQLSJ4K8EFAD4bh1hWVrmvc3DJuWOVGZnYXMGaw7eoSY42ryGgRv0h07u
	 peg4WIw8BVL9nr/5g48zrrRSvHvb+5oOlGjIZB7pjemehLvO59mNo9v1XOtD/KdkQVNkt
	 RlrLT3JyyLxcBB0ISBLJstVYxFSaBE22eVMUtNdefFa+ywNZ5krR8jLp45Oz0iTCGxQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913860;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Gg59pZLPRRIsMaMHQFPJXZPIT9+S5ThcNQHz/nOiaI9GZvPEtgMR2YbM4rm99mOEw
	 56N5EZnRiK+q144i4YEyCG4A9sfSLEIIZmMwuUbzys/DvTnC1Brxv/PIWemOpDilPy
	 Hp+qad1h3RFOXkXiDuSwjavTWtB1LY069RtkCmxFva4dwjLNFPGyhWM+XeHi1Ur8dj
	 LKMTo7W0MxnlpTQ9ClM0T+EJUqyFMYMbLLkQeXYro3fSoNc1uMZjR9OC5QGD106PsW
	 XXFW6zCZAv6t8LLNsSMWT15Huze0R21xv5PvA6jaqmbEpV+ubhkK22LyJWSJSizBux
	 hw1zCg66lzaWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69EE60623;
	Sun, 20 Sep 2026 14:17:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5962224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBA9480868
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWB9AJcIOMO3 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:17:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CD9C880865
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913857;
 b=QSlnmlDB71txLRV1zcmW2czdqPSGpdGd2XHg8T9eb8zxF4lV/UmkLNwTLscJDWuF45I4
 m6oUQljcERE8r7/2jM8dbV6CLCEhE2xKdA9ZitQlYvwMZgN1p4MvpHM6icdIiEGg2jF4o
 WfhHumL3cYWDmJlyHSBFLc/M486NxGaE3q+Y1u+TWryW/5rOb4OF62XAvXbdZVt6JBdKP
 zfCUP9XPDrhkDllbElGctJtpaAe5wTfm9Ev4SXzaFZC5yfR/PfEDdJMZ6A7L7PWRXQwlj
 tUYG9GKuYLXpG63eo+2KOr+V86APut88c4wq1BHGAXHvn7g9Co4GjFCltTr6/4hoMQg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913857;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 b=bD8a0BJMTfCra6AcoFK5zj+h7JGohrTS4StsBTV9paIfgwcmbOgs+dhA3weEvR4r+WQF
 v0fbfyPQVcl2hEydBySWRv5u4bPZh/xIFX+yft/ni8kl6kAHJu+hHTD6KC4/UtNJ7+H/1
 YBioI8cjZnbBNmEuDrd8Dp3mXIk+xcUSWhspOXmXpZewRH7iJPNixE5507WWkPmeaPp6j
 k+zO+Ww2V9YLXIQUT68I8CwuyC6USUzuXx9p9mS/fc7X7NcvnHfB0StlEB2qzKsx3O+5N
 mgC10dH77z4TA4KxlZKQnMYv4x2u1inpiXUq7tXqOQRH2ED/bnHws2NLh2hT5HXAJUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IuPD2ovg; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IuPD2ovg
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD9C880865
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913242;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IuPD2ovglvkzos+4LAOv9jnYL1kSnYRgvSNjmf0HUbJt35JtPlv6xkd0XM/wOkN6o
 Db+tQLq7oABiJwzuc3sy7X4dOQlyl1+d3STSBiGywxEK5Kewi221KPPgmuDkCQtbDc
 mceXZN9cZ8ekVyBrB7AdT5TLmSxhKFz7C+L0aasqgB+qYSX4O2RWoG3s4AvzZrdcDY
 IfZwGnEks5zvqgDe2RO0SRFH24BNkETkKD45sBy36ipHONLvw/mr0zVCZKHuNgC8/8
 fCc7T25cx9cWcSkaKF0Dw5hFT3aD3pKzvWO/j1WqSukAs3KP9b0lKBWX4rtFk98Z/c
 OysJqjrpGmjdg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:f3eXLFeC9qz4WztRcYRFGzNmyj95vcFrwpJFhJF1+HWas4Y5Fx/GLRJrHv93273O7qoiUftSHcqc2zDLGFnkazxf8kFEQrCPYZgZhf6KbKQJTQ7W/VkXgHFJlkay8PFWZEATokIx9Y/ylHB69jVgjtOGFONeqKM35Ck6W89HOrtezFOoI8DaWkCLyJ0lITHb0i+xTmTb0F3EbT2w+h5WCGSMswTeDE5E3O1KzrksVaxDO0fa7pG7gjzVf/dLrMQ0N3SI98mg9Rf2hRPC3RUgPGdQPVvyEa8wjYSB80Oj0FdXUKEvp0WkDLvWOIWY1g/Khpo3VhAR79Y8WwZ7yjYPfQdoe5Cx19zJGjZj9VhogOso32pM8+ZMe2M4S5f4PzxEMTLhbFpoRtpsKoUUS2RV60GCXK1vCc2KFMyqeBaNP1QIEk2urAp4dYA6m6c0VNUC0KFzwDQMxLM15NufSO0qbDfKM9aJ8SNItw32gsI+QF12hQLfIqLO+F3UN7Fg/8Zp3563aUMRtueqGkBW9hqIv8f9NLRLwO39iz+F1szo7BJphSTUOmvixEdnpydfVxcbE6jyPtD15V+q3fTZDZCPBwWPuvOlsbxR6FpTMDRk0ClQbf
 b64ZF6N6ujD3c5umhzdhY0lnwY0Cxf1C1aXI9RG0PSUgjY9g+aWywWJYT6qp3aIeN9RyMNi8CNY5343lGTbCeEuyGfuAMBMrXzE+gmThhSULdntqNP4A==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08CCDA4C4886;
 Sun, 20 Sep 2026 16:07:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBK-000000002J9-49Pr;
 Sun, 20 Sep 2026 14:06:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:42 +0200
Message-ID: <20260920140605.3005461-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 44/66] package/omniorb: Fix build with
 OpenSSL 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/omniorb/0001-openssl4.patch | 63 +++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/omniorb/0001-openssl4.patch

diff --git a/package/omniorb/0001-openssl4.patch b/package/omniorb/0001-openssl4.patch
new file mode 100644
index 0000000000..984d5dab25
--- /dev/null
+++ b/package/omniorb/0001-openssl4.patch
@@ -0,0 +1,63 @@
+From: Colin Watson <cjwatson@debian.org>
+Date: Mon, 1 Jun 2026 11:07:35 +0100
+Subject: OpenSSL 4.0.0 returns const pointers from X509 functions
+
+Origin: upstream, https://sourceforge.net/p/omniorb/svn/6818/
+Bug-Debian: https://bugs.debian.org/1138480
+Last-Update: 2026-06-01
+
+Downloaded from Debian:
+https://sources.debian.org/src/omniorb-dfsg/4.3.4%2Bds1-1/debian/patches/openssl-4.patch
+
+Upstream: https://sourceforge.net/p/omniorb/svn/6818/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/omniORB/orbcore/http/httpConnection.cc | 6 +++---
+ src/lib/omniORB/orbcore/ssl/sslConnection.cc   | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/omniORB/orbcore/http/httpConnection.cc b/src/lib/omniORB/orbcore/http/httpConnection.cc
+index 1e70f93..9da18cd 100644
+--- a/src/lib/omniORB/orbcore/http/httpConnection.cc
++++ b/src/lib/omniORB/orbcore/http/httpConnection.cc
+@@ -2554,14 +2554,14 @@ httpConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
+diff --git a/src/lib/omniORB/orbcore/ssl/sslConnection.cc b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+index f02f3f0..d29d2b8 100644
+--- a/src/lib/omniORB/orbcore/ssl/sslConnection.cc
++++ b/src/lib/omniORB/orbcore/ssl/sslConnection.cc
+@@ -548,14 +548,14 @@ sslConnection::setPeerDetails() {
+ 
+     int lastpos = -1;
+ 
+-    X509_NAME* name = X509_get_subject_name(peer_cert);
++    const X509_NAME* name = X509_get_subject_name(peer_cert);
+     lastpos = X509_NAME_get_index_by_NID(name, NID_commonName, lastpos);
+ 
+     if (lastpos == -1)
+       return;
+ 
+-    X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
+-    ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY* ne       = X509_NAME_get_entry(name, lastpos);
++    const ASN1_STRING*     asn1_str = X509_NAME_ENTRY_get_data(ne);
+ 
+     // Convert to native code set
+     cdrMemoryStream stream;
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
