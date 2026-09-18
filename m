Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2998CC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F22C960E67;
	Fri, 18 Sep 2026 18:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWIPiJdYAkO6; Fri, 18 Sep 2026 18:57:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 190C260EB7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757864;
	b=FKKfyORc45C9YEZrmS/GyZVqX1jVYoeGz4a6P4YvpsYOVt5xKCTyHYrB6Bg2nmelwVWt
	 2PD9VQ/hVkIDX6QeH4opZD85QAgmD81uVfh1z7ugXWbEknLHfC2h031Cug3I0LJZMZf+V
	 1LNRH/uCh9TIxXLXs23IGa6quR+6kDiXU/gPlxlZ6R3pg5nteH+oQh9aZR9WWVduk56or
	 dqad/uQXHopUY6CvYEhOxK72zzQQHdI8WDni5ikwHVmz6+HofAlj1e8ggls3ZvZcdYHk+
	 UtxI4JIvnvTVVidGDS2gpjcVLDsFuNa9E3xLx1mrxcZ5Lhf1lNcSjzwNkP9uvLVlPOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757864;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	b=DILX+ghQXRYIsfs5w4K6q2nu/EUNtpdfX83qVTZkchoYMyf2BSjEZgLUsvUMCB9xL6TG
	 6Rzk4yKdWwsatyjrRn77jBWXknEcphc/STpOeJPzqflBcCaIijvgddqHDnyW6ji4p1rO2
	 bO07qJ9KR/MQO+wrFPZnN3Q6/a98nZ6n9sEN7L2qDdoamV2lFEf5O8zLpp5mPEKhEEhLQ
	 B+iAT4AUgPSE/07JxuDkt9S+FwzQCSc/iCXkW/JO6EKHK55BPUC2FLZgVAuAIFTMS7ux6
	 eJxI4MAnCmep+tTm62GHpqZoYBDkfL0XTBWpPeRXjSNfklIwh1OpzVPuxAgJrSMkx5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Jiw6PmEd;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757864;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LJk884kUiKZ3LOiV+7QqDC2D1GlXcbIvEnjYGbhVhuSBqeUXydENNqLnYOI/OIGPf
	 mjz3grISrx0hQSTqM1OERTU8Ae7AzuprjZNxbJFa0vhwFw0I+aLxHQ4R2g5vkXbD4T
	 D34+kW9z4A61z3Giz0rHIixOaCB15KBu4LoGhTRGFzjwz+lUJ2k7Xt3Y2FTHKZRNca
	 8SDrTHQrKleAMJaaNJxDC2XxzfpvX7NfG1yz1D3JI5VQjye+Uc5plhUg9osI8ARmys
	 S1E4XIc/smUP40LJhM0cIYvqw627SgM3E3c0a0j3pEkVwa8B57NJa9on4lIC58WWgv
	 97gWZxkfxmz5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 190C260EB7;
	Fri, 18 Sep 2026 18:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0981237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6BFF60EB8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c55jGV2aerPD for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:57:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BE0AA60E67
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757862;
 b=lWLEqDpuMlGJTRuwDwPEEFyuLxcIg9EAFKIk+6I5cpfxe+QlCIibfmIrH4rGftdhtip4
 59EpDB/xpOaSH0Nb08XaP+H5aOCa2MS41aDx8roVHXmM17NK+I3bQr9QH3+/Gy2kL0AhG
 47t/qQ8wHzAyAfy+j3P+Qv1A4Kp3FLkPc9xV3dGqwyy2tr42Dhkzp5kR3f8ec7SRdkV/k
 cHWsSKSab266no2NlO7TWBubclHRafEOddZukV7d4D9vo2o6mO8wAz1lE8/tGQgZkSe+B
 GNCu7d/QUVa5eGMCc22UEnIAFldXhnpFbIMAMl0BZMw0c56S55OgDhAqBbIm9HXFmIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757862;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 b=pcbSFbBLuFJutRU0qxwTQNtnieoTGcEkQsXSF67NQFZJr3VpWXdtzlC802UiVk+xzP1b
 RGzEJcDMeLdVeusf9UBx/tUZLlh2QjsTn4h1yj7JyMp3I/vQbnvUccX11pbt6wJotBntg
 CCwOvb31/WXx2xDr6zFjnhNBkFx80VluTfZnnvokUxKYyNLvGBAWZjEyMiLHgbkGdMdN0
 buS2untZZUIh/zzFspXdnTGTsYRaFnigLc9N7hk1bUlkQI/Uoylb78IAYGE3C/jkGu8W+
 SDvJOcrUc/JlvqYbbvQFIU6ZOeJUa35o02xrRKDLRY3Ag6SoihLFuAAz3mRvTvZ34Tw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Jiw6PmEd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Jiw6PmEd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE0AA60E67
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756946;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Jiw6PmEdEWGGm1eV8mlPfXf1EK4nV/83i+lYRjS37ddcAQCbIM6ECR9FU3l7HCBKI
 VfJ9U/t9YYOXTeDJf34GlJZUSShn8EkTtPl9Ai069YbZguC9Mv5pdD8WkqmC5SjmYN
 9NUfiGjsZYkr7cJJHn5N+D6VNP2yNPhUMD/tJQCl6EPRMPdoQjjXaDUvrPreThq70J
 FznAtpI0YMrX7/Wy/9xeOFuUACEvWq0Vf/zGiYJAuKnFVU7Ovro8oNSVI1FpLKXEZO
 Or0igaYEMZsGZaot1Gdwz50YqciA2CHi0QravWI4c8Pu4w7UHAo3MyOZxHsCmzgdqn
 a8IhTGO0uC1Vg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:syRbPiBCuLp+pYGVZyGEOr3vkVDHdOUhcKLpJ9RH4E5iPbufnANw3nR6uzxE5UgK9bshsS0pmbNzc/ufDAwx8MA0buoXP8QgAZUlWnDSOrPl5REdQb7XrFRGd1XyNnphXtmG6FORjP5TtsOkYwz2rrB7B93epeL6eK/Pu1XoCyoUg/dOKvohTtjH5IaGoJ5vWU5nDjxwrs4Ji/t+ENEnP444NRNqtyqu5LK5pmwkTScltQsSqxJUtAO007pitra9BKUATcvljh49ShpBoDTDMBmPl/T48liLWW/JXCVn5ncL58JNnuVPFakYni2d3sX//Nk2FS4vl2J8IaGc/GydZ4gaHBFlpTZsglMeDiCdXDzk0ZbmzNvy8fmDNg1PX79GNIfx/atqqYx9Va66yWI0PMEuT66ias2tM6Fo5JKVVYHpBOtMis7AQKHE17DwSeB/vMmp2oSb9pQbIxgZgijAnOqH9BdbCt6soxzWtxa43Qw9PiwGBat5/QhnPiHWhd8S0v+dNfVYSafTZWfU90QxKvYCvw8wuB62+Zr5+sPKJxOmC+/9h0p0yaKqVaGKA09W74y40A19PAUcZ6UpUS38dp+Iawvdo2rWXBe/SbHrDGMu4f
 HoMn6RIig8xhLN6kg93M0oBYeB40SFfSqXjxz6EtjcvjPEo8RvgvW98uQAK18NhQS+B81lbN2uJh7PBJdWPxqyQKKSCiMP8wSMMEY3zhGah9WgbVdq/A==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3731EA4C474D;
 Fri, 18 Sep 2026 20:42:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWy-000000007cB-1wfb;
 Fri, 18 Sep 2026 18:41:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:16 +0200
Message-ID: <20260918184140.3631274-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 54/77] package/omniorb: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
