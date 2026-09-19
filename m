Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA50C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B7CE40CD8;
	Sat, 19 Sep 2026 16:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9yBeaK3_9ch; Sat, 19 Sep 2026 16:11:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 521AD40CC6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834273;
	b=A8jUy/3xAH+pP2vy0g9Ak4mVtbUfZ6orXlEdZzAvppLdiIaHcAIIL9IvbcsylNLXiYqV
	 a/uWXkfHenARNa2K1zOwZoVWJgm/ug4Q5f1/EjcBbvVdyPV+OR+u0i8ps7QatkP6eaInK
	 GJKnnsnoJswZ4EKxxsTrkEzY9B3TcmzzJXJ94DPM3f9Bjp3dhd4io6CoqmSf2sN/dAvn/
	 hu0+Zes/JjfogqzSaETvQ4UNWxFG1Jsskohw/hwAqqgolHvNcSmGso0xXso9SbX1lVdDv
	 ARHr9Gehs+3FGGMnarHu6x8ie3cvJxPN0pi+Vv2zVgL0LP4tu+EkXbuF5D2RrSJlMpw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	b=jjVwF6lVLlYlrakXmyCmbhFUn/S0MVFzj4jKY+30fOCCTo9U7cWzEdkVUKStuRHteNII
	 lcz2HNMESbqMkrzo1kwFCsgyoQRnR3P98AAS+G0MSh+lO9WJbPtuQRdQ6sYwqw1xfPNOE
	 P0qyRd51fNX7ye7UIttHMrCv/PQOaFewBj85D+6iXdNsezdQguOqT0KncyBvvhOqC3cuJ
	 kmXU1/w1gm0H8S8+vFFe0p/5HQXBf6hKH7XVFLpAOyNlFdQzfNEBs4pSTyozj1fx5OKBW
	 KLDYp8RtByh0bkA9OM/sQReJpjQsNkkABhrv4vJmkXaj4sNgwIsA78EWUyG75BgD+8Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834273;
	bh=guRaCbPWBF0MBPBHpqYbP9VcShwEfgdgODXqZv7pj+A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iuZunCjVouTTxacxgNmMdwjXhc+kHTJaldTZOHrE4mE4J+dE5fEBviyOUxmtTJX+a
	 +AfdbiNH+FV5lMT6ITss4VspJT/U/sgMMqrp+mc51QTV2rUtmRngU6d7+QPyMyPGvo
	 gYLXqWlxtJqZxp3BRbHwKCFbUsH6WQVv4eVBpIbDnfgccKqF9EzsuS1iYDQSE2oZkT
	 SC7zX/dFeQ/slWPvpc9SUv/J6gyhatDLkxW1LCdfadsp6wNN8m/X+LqiF8+OmVRSw+
	 1/usit36vrvSlM85MEgzHLuZYHSJ25Op3OhYF1hWA9KWJv6niMS+Nx0V+0ANAm0vaR
	 ZngCN8zOVjlMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 521AD40CC6;
	Sat, 19 Sep 2026 16:11:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B59FC24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79C280D99
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yebWn3JJfMCp for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:11:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 79FC080D7F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834271;
 b=ngMp82deYD9Ua2UT+eVuirtDjC3eOv+wgDVZJBnH1OauuOpBpieyekiws3qEhYvdXhoH
 XrVKIqx1leYY9vvOnuwH+JIQgtsi6ovD228NkFS5lzSf/4G/F9151AEcx31ku+RuvVyFW
 WRwF4uSoG5qT2OmCoE+YHnVSE6zeFkhUu+E3RCzb5c+i8gMUEmodfa9GJybN7X3E+j9X3
 wjqquq/5heNB+MKlviZaiD9tTUMMNy/aSEWq30jnFm3kZT4lprM7FBP+A3bYUaTahYEC0
 IkV/zAdOTRWCkqjzOK97nrP7KVTA63TS/u91INKO7yAbUJpV8T4B3BQkyhwebwJkS0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834271;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 b=X0kZsx797HmBDuJvL/O77fzmekNsnKVCucGqzHGmoya9wd8VXkMmKsdGUKjK0d2LVIwK
 E7dtndK18s9jahjxjecseWhM6i5BoRAwEAY9yX62qYYvzgRo4GYwGbLLc/Go/pndDcYu3
 Bgjb6f8gGP9OB041xcrNgEmfaRRQwK5I2kiuc7iMLTnUAB5lp2heeEA1w+MTP5Z3AuReG
 3/ZGuMlrzCi7kivyHmAWwwLmpQbbn10nV6gIeIi9w28YypKmUnVbXGMXYvKbiwjE9PVmY
 a2EdmuwuISGkdyRGMiMLQp+7+eFxewuXuFMoShXonRwyWOvQm/pR3C/tBMA1A48OxXQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HVNQSGLO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HVNQSGLO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79FC080D7F
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833554;
 bh=XhK/dpvVkxLyk/wa3SfzqUeYSLuuQjJ1v8ZuNGsD38c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HVNQSGLOkB0EnTIM/2uZZuG1ObnQ2LK9Su0UAcmtRlTQX81a77T4TBc0EICDGEqDh
 vLmHdqWd/CXt10g5qwu9dDC5ZJYafgNEq6ZEOCVj/9XFpAWsKLKupWiO+yujaQlroa
 rKBLza9BYCq+5p2ql7AhYzQawKeQ9CXvHD7LdloS+X1ubW9R2HdCEs4W9WKiQuvf1w
 9mT/aJn2eGcdSIekQwOIhK+28lFOtSrC4dD0a35vmzfYk0j66odiOoVIqtNptpVJ0d
 XeByQtg0U0AhvvT35uJSLv1gktqpmy/P2Shf9hLhSZPrvGJJ9SFM+48K/XlE1QHtlY
 1w6dFQ6PN+JCg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:oATsgr17Cdm+NUJrRkLkjLUe7qJc2qXy2FAMO5OfBwTSqCruCF8/Fgx13Ev1H8U1iszh8O98pU5AQNP0G0QpnakM5iy7OO3/3HIxGVxNhRsnaVJhy5Xda9wdtlEuBGhP94pccfMaf1U31PMa1RpNFSW9YNerffmZEJ3qBhPRvcQjxB0pXvl3912gFtShfoqwxJX7R7lSnUvrJRcRTfWmCvivlWZa3XN4jFEItegefvZtKOCFV8Jh8Q4whg10IzCB/QQ3naMPu4gAorj9D2FCdjRP4Pugk+b0i9pQrdd5HdMEtxi0dLQacrr+aZeBSl5gRRpwLOIJNZt2VCooq/ZtmnhLkxi4qmkWOXYr4YKiu5t+fyrlHCEPi3rvumHFusfs6uxG4Uoo4EIsUStuHqDnHQBnfHyKXhTkq7oGZUSqoXFimpvQsoMXDhJeU1CgfmKFMQFFUUYiadpmLcNoLWws5bPwS5d5Kiq8Wj0DJJuxSmsKHkktPqvc3L3DlIcUklIxsxDxg3g+wf/pinIS8qGLKaVHLiOH5Y15yROasO/WoKO88LG+nLrw5DgRukcsYF603xNJ0fL7JA4wLfvWWHtNGqstRXXxPNs3s14qvqACKa/rg2
 BAYvg+80K7diBhSbhI0qkD5aaHChEHSlTmSs58z/yRyuGVmuYeXaCcyUVHpLrz5lxFs+RJ015GcVoz3NjuIJ2l7hh1BW2iu0e6cJQbPvwVVK7bdA==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 198DDA4C484D;
 Sat, 19 Sep 2026 17:59:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSs-000000005Jx-3O3a;
 Sat, 19 Sep 2026 15:58:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:19 +0200
Message-ID: <20260919155845.5776-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 54/77] package/omniorb: Fix build with
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
