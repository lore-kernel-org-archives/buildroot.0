Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A75CC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1141240D7A;
	Sun, 20 Sep 2026 14:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moVlWXzW8I6g; Sun, 20 Sep 2026 14:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1F05840607
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913366;
	b=Z52Ps68LgeWwnp0b/JAozBFCafCkTzCsOyXMjcO2gTuNius8MVbHILCxyWazuSIxdksi
	 +dpKJheGfUrnoH2XQ3w2o14hTyoG/9vdbLFOHJP5aNkLsH1ZRleRSuJA9hXjCdmzdF6fo
	 GKOehTwk/h0lcxOCQf1WIb/trz/zwTSr+SyNbvkrOTtyGH9BhUVJqzAPfaBI/Q/2qlWtf
	 GgoBrNPU6ZO1RTj/TK4ZDd2yLd6Tl2gtO7RVpIgl9JJcsBclT9CEwW7UgpFjaQpyRYQ+L
	 l69z9vBpo0No5XL4pfwDveEWDyQNlmsGQO3EYxyhxb4F3lORH40jrlBcbPAAKTL/J4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=kUlBZun/L5pdj8l7lMlQZC90vJTZjH6Geg/nFasVihjhpxMdhSK558vkHEmpEe4ioPaT
	 YiMA+FMa7FJdkV2pAsudZLsN/NC8g2M6NK/KrHCd04JocaSAeXj3NVRbLu6p0LK8RjW6B
	 Wl3S/IAo3UzdsRX4pn5oNfPxzcCr1QQcgkHBmg4L0Bg5v6NPH96zUPVVedMkVjXBZI/lR
	 ueR11byA3p+qGf/+g2zJo6zovYN5ondClZCGmw+ySDn5Q2C5QyR5AhBYeYWHzuhDQ/PPt
	 oZBnh+SPTdWvW3LBxGcYunDT6EO6JJKakCFhxzv0CEQuemXi3czo70w7JVpL0AFUu2w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913366;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TmP8ZHAVAgeihrDKN6kdWYUd+87tczzngxojBzmCV46u4BwafLNZ+ouLDYu7c0rH3
	 J6sAKPHEe/LC6bhdUFzrJF860HQ8+GB91rvjyiwu53aDpfSKaEN+Ji43n2y3UeCAGz
	 pO8325I0/KHUsHgShKPY7HdFRZsJ5OQGlmdY1Q0e2w0IWw2MCUzO+UbA07v4KSatzJ
	 EH1GKM2xZn8ldHtmWBdI7/DFReL/XXe6JslAbCeoqIZBAW5KrEU9f9rV/ry8QqwjMi
	 v/jmfpDUr8KOlfCLzCzsqqcsMjuiIyMRLy4peVx8wBT2Fr1VuqV2T9qnzVGCNMEvBj
	 gSlJRPg0FJbnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F05840607;
	Sun, 20 Sep 2026 14:09:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 932693AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9099A60621
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SxAE3WXM86vl for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:09:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AAF17605FD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913363;
 b=mmVFVm587d8hDbppHaDGtxCcyu7fFTylhWGA5spVwleUk66VC/NsJSEHT4G7VADvdjIw
 psjxjWavDdN34AJg/3o7lCwis252M42hU4DwTIPFbDvJVE1mJFjjbBVfqEXRIqThRs0bt
 rTaSWqgXzt3lUBqhGWv88AUVrxv4Btzt5xQFEsBOSMAg1uc254W7CGvyoId5Gcl16BJHB
 vXHCp8xLWsbl06E4J3PiSmL8mIOx7vDby6e7ry88nrSW37NitLVDMqv9co+LxWO3HYnDH
 dSnyzShd1PVN+LJsZ9dtlp4YIw6coRMT1H8mvzwJlhg4hyzBqxG1ROi9sgx7MLSEttA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913363;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=Z6GXzd4AVEzvbGU9iMXGFg/BavTREBiH9IS0AieVnKeJrbz/N0iPhIQLcEYyr2RIU2Us
 +9hfmMo84FhV5Zqyc+8XEcsIUVvNNGfvFyW73vjifOR5eONh2TEMbgyeDU7P5ZisE7e9R
 3vEn1vxxNgw9NsXizzccRmZWvm4XWHvvNIDvN0AcGvpLQuC45qblwU57OKQ7ESscgJVkq
 ucdMKOE1VAgBaFAs/QtBKvgOk3U9DRXr8mDzcXZufVzvB+ox479ywk6+Z1s7czU5v8f9V
 brF3BCWVj9HNkqq5eCuV7O+6CQd1cSVTVP5TBJyKI8c+AFUN1TX6ADcPk5OIExRyNOw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="l/6u2xhV"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=l/6u2xhV
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAF17605FD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913225;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=l/6u2xhVuX78gTI2/rtUfzELzqLsfqCvMyA/5Gih46B5cxjXSEzkG3y4JxWkpDXJn
 rBMH5BkXUVjHZOmtN3jpQwfVKuhC6np6R/amz5Xn5bWSVBhzN1Js4ysdYtVQzfMemf
 +rkIEx+4y6nkx7qjZvCGcAynOKTCzSeWbaqGkyTmcF3eU4e09K+j3B/NP54WkI2HVb
 HiyBqJFoR529o4B54eIrNR1BmnL7czZxsL1DJQba0C+Bnhqf+w+pjuAYgolvCU1Gd2
 0FfxXIm4XI2RgqsP24Yuu2eDA88Lq7MHS6WxjAsRGAwXR6qf3PoYZZDPZAVhLjBbXI
 GCCizpNWGkVow==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:lJvMDYE3qK5AGta02QXVn3b58TVa3ZJS6XLVHiQsMF7OnPPtiBby8QORhypQweCHAkkC7t/q3Vgq+hErq+RF6DoFMcB2PQKRjwgvH1bQoAzHk3eMgnbBb0zAqeeS0qa+sEiaY/T38nq2Acl7cw2CV/U1cHDzXnBiTHZPmcQOHJ2nc0wfVi9LHBUAwCB26xLtxuN10w5/XIjZBgOOQR007d6d8HBUVcOTOpae6c3JUJm3ZbPzIXMuZJAVguhhx+8UJYoe451yRyw7SVaGCpgZ5lJzNCCNUckY5P7Jwr25xPOEPSee6xrBU+0ZjPCGhpbVtoaYa9Ju/MTO7JEjKouvXwugCUmqeHkVmjznYEHB6briaLNSpbG/p+lXbUX/LJMuZtmZNsKCNyi+oWUWth0WX9Ab1n/cD4Uniw4Qsn4OFrOGyPeuHJcQLh5jvl1X7T+u7Mgq4ovL/LaA6bCEX6v+ZFnJnRJz3+qC6oNXVvQrsH2FkdcC4rGOObncDFBrd8QX/F2ai8HRK2B555IQf64J+s2Ukh3+ORprwOYgh4Az7J80tf4tDFocqN/T4SeSd/o1uyNeCmf9SMWqJznyPb0lA7W7JuMlmFaW3ULu7UvLxRi4Af
 4lp1wheEwhkPqE4Gxl9lE1JatrXOfQCD6iwKLpgE56ZfsMjUkK2XsU4lFGjIWhbie+Fuy4LMQd
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56E10A4C485A;
 Sun, 20 Sep 2026 16:07:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBP-000000002J9-1R1c;
 Sun, 20 Sep 2026 14:06:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:06:02 +0200
Message-ID: <20260920140605.3005461-65-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 64/66] package/xmrig: Add support for OpenSSL
 4.0.0
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
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
