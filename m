Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6832CC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 385A5405E0;
	Sat, 19 Sep 2026 16:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsYWgw5a7b80; Sat, 19 Sep 2026 16:02:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3A212405CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833756;
	b=eLzqjNQt9VN3eAmT0vRAROeQywE3KPlxqF6dLKoog38OmifWXYp5YR7Mj1ljYUACzOV8
	 R3ag66JhJ0xUZ1e0J9xafkALHqnxGY4ZYFo9aNoio8ssFhhFsjS9BmPH+OBIIvhd9ed4d
	 y78tBng40EafiK2uyLp2CcenQeoXUHkVsuk+tU8AmWb/RGDBxOt38AGn8k4MuOZUSpXck
	 LLRKq7TyEH0eM+sRn9c6oQFHJCETV+u1XkKbGAUAJKy3tIsBZPnAsQHbHtWu9hNwIY7Pa
	 IDjmqxg/MdQv3bIl1MItnZQb6cKsOWU6G+yXFh/y/oQWirIhNIGz5uTVcIbGYDygZ1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	b=ZNt+Ikb+vwV5ZtvfIKTkASyuOMNV7oVGvNwUYptdk8y8XAGCzw2HAxdmKRFN48nq2j8u
	 qsW+DmuOkrJ5XsEa2B8c0ElsVlgySclNjqCpPXfwuL5xDGcg5zhcvHWOSI/MuwBlz5Gi3
	 vlpzJgCd3/TnDuR8Do8OQo7MXVrZB6hLPDDVnR0ZHRZ21WADwjGnP1hZnL1ZcaIOr+NHt
	 M2dRYRbpVqyfEsUOZuZtuY+CMsIorJN9IHnq+fSlo5ennJiNeWhiOsMXbjZaVS4JIh/BF
	 rIcdZ6Asp2nzBy653GJDFW5C//WgcF5tBXh7LpAYAHjx2SWe9b2YducJmWa7jckRJHg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IbEYv4lQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833756;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ult8gc5G5cCFoZhRsCYEx49BPYqEpjjukTAYFvNrsP80Z7fDMmH7BKaiBL9ZfslXz
	 nENYRxV9aANzbUDd73c8wBiskXE0VdCu/T4B0FJTER8vXGoiW60Unp2rA/mCx+8u6D
	 vekY6/NN6xi1DzCui/zNDmKkOshYs7qdAjKcoyZdEmeZIKzCC/e1MkLE2LhJ1sQUVK
	 Hz+fbDJpqZeJHwKQBF2Dq1/KHofjx2Z+LyfssjimffXz2/o9BPEZTOb/LAQp/r2dVJ
	 ifQMuwW2cwU3vl8ASy60s9GxCKetpvA12rJn2tcZU5YwVW3mpZCXy9cE2rKtCBqC1i
	 CoFrn9RIcoWgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A212405CE;
	Sat, 19 Sep 2026 16:02:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25FE424D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C393405CE
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfRrCGrcMgLw for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:02:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1DED3405A2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833754;
 b=XD/wR8v7jIe8L0UrW9nQHsSSFjPcUA8f9GsrCSZjbd6mLtJzzCPfY5hUEKZPgydiZit5
 GfIkOQjUAhruwaxUqQx5mRf9Y4oGjatkMld3FVbl8JJd3eyiaB39qiFtMsvNIiNHPi7nz
 QldHL5YRTQpghJWXN31qFApQ/dsnwrynrLeXfm60GK9xrcS5THuQ+i4WNPTK8IBvyUQ+G
 4aknXI6hBzIso9eCApZGS14klDQM3F9iTDgZIU8/yDfIPSQl3mov1Stc/51zwjZVlyl4M
 CTW1SSkSDN/EATuQftucikBLunAN0RMDazF5KhIlEpR5NsEMufWXxbspfynhoVoY2SQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833754;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 b=NYnN2Ov8Jwk+jh8+xpVa4A1wsmH6/pwehpMNIEBl2B+wVD77NeZrWa3xK8EdJRIqbEv7
 Wl09rVw539K7W9GeYyuWybQrtagvFQszoSlcRCMN+tibV0s//C0zB3ndRUbQku094hGAL
 BGzohSqhYV3YMs3PevDsg35pIV6ZfLg7sF+INnHl5F33acPU0Jcptek0ClwyRXXi6V/Uy
 VBdXowHmso0ARQzlZXqFidmc2mFtKT20Zgzx9CUMXMqXprrU3GkQ6iJog4dnsGPofSmKi
 pU3DSREZSd5uoE73XjEJlYSOmQPqjhile+5hoXQFokDrLRtOLzCYbp96MVZfUzz9yUg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IbEYv4lQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IbEYv4lQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DED3405A2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833542;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IbEYv4lQepI0dr2lmoMsqmvX5uYw0bmMz58yPzc4+Cn81uB1W8M9YNwnP53OOdSOF
 mawvMgR+Y0ZoclzAcGV+PdmbRRGv18V/gGNQb/RYuSNWuy46uR9E2fJEqfkhUZBXuR
 YAJUilqHiKEEIXq1wRAlU/YeEm9krRXiQ7/scJdZhnxxva9NxHlYG2QUU48nN0CAl1
 UNcVMKndzNkLaqYHb15UKwRasCLO5Zd0BuLCG6bUMdQ8Q47Jt0fC0jhx/pXy/R5B0a
 h/7EpA/+BocYNRHlV6XZ82nktsxP+/kn9VeROovnNpfk4qCYezLab/7iEY4P8Exwmu
 ZYNS9CBFtc6CA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:Et+HVunn6dQpMK7+iPupHvbD+yVDGMnVYUEF5o3WWIvELk81L6gkZv/4K86Ob0sN6n86w6oYlyugvhc6NclKbpIh6RhnyTJnDVGJ2CtgcmtM5IDG6s1uUiQSwDK4580oBfqfxHXNf7182GgqR+kNOuUO3wtPPGyxvf9Ch8+eoLqMdyKdcFwQ8OZJELy9TVnDcbcVs+sXXzA3ixOxYD1Fqx52X/13WAM0seqeWR+4IGP1T/HRNmKAMxU+H2mzkBhq1Jfh3bAfn/XU1VWn8v95tp6WWcpzK20v50WI2m560kLGCTz9p83/rRinvUJPAYjc+D1P+d+gIQztppZ2mqC8B4hoLU+qEH969yVI8exWdszrdM0FdrgbyLoSnJSKdIYJ9S1qaH25cAordVAGkrxKCVXPXTh+XLmsBH6UXTT4pcBHi0J74OUMjKKTthAIOchN2M89+y89PfJV7ieZiatza5ETJ2y8YZktP1yq8Pd88TC4scVbH+zqQwvb0nppbzp5NVfAJYvO3sW8YZFEv9XwQMCBzWT+d2BLnLUPsvaIxgd3PC51DRzaio3jnwtLWZAqAnOYPn7qTBLvxv3MDLL6/r/uncAgCoslyFG6tYqOlYzaZ2
 Go/1jV8OJ8dgxOOacS+2p7NQqtucgokVSaIf0Rx32vpwyc4MnsApTBfp+LxnktdDNwlOiv
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 526CAA4C47B2;
 Sat, 19 Sep 2026 17:59:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSl-000000005Jx-3NVI;
 Sat, 19 Sep 2026 15:58:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:41 +0200
Message-ID: <20260919155845.5776-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 16/77] package/asterisk: Fix build with
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
 ...of-bundled-libpjsip-with-OpenSSL-4.x.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch

diff --git a/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..28f9d4f281
--- /dev/null
+++ b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
@@ -0,0 +1,63 @@
+From 520061e78d1ec24d0d4b97555e11de01f4db8c2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 13:08:28 +0200
+Subject: [PATCH] Fix build of bundled libpjsip with OpenSSL 4.x
+
+Source of the patch:
+https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Upstream: https://github.com/asterisk/asterisk/pull/2162
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../pjproject/patches/0030-openssl4.patch     | 38 +++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+ create mode 100644 third-party/pjproject/patches/0030-openssl4.patch
+
+diff --git a/third-party/pjproject/patches/0030-openssl4.patch b/third-party/pjproject/patches/0030-openssl4.patch
+new file mode 100644
+index 0000000000..bfeefa2677
+--- /dev/null
++++ b/third-party/pjproject/patches/0030-openssl4.patch
+@@ -0,0 +1,38 @@
++From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
++From: Ravi Kant Sharma <rks1986@gmail.com>
++Date: Wed, 24 Jun 2026 11:30:40 +0200
++Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
++
++---
++ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
++ 1 file changed, 4 insertions(+), 7 deletions(-)
++
++diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
++index 000aabad61..93fcf10f14 100644
++--- a/pjlib/src/pj/ssl_sock_ossl.c
+++++ b/pjlib/src/pj/ssl_sock_ossl.c
++@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
++                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
++                         break;
++ 
++-                    if ((xn = X509_get_subject_name(x)) == NULL)
++-                        break;
++-
++-                    if ((xn = X509_NAME_dup(xn)) == NULL )
+++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
++                         break;
++ 
++ #if !USING_BORINGSSL
++@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
++     pj_parsed_time pt;
++     int i;
++ 
++-    utc = tm->type == V_ASN1_UTCTIME;
++-    p = (char*)tm->data;
++-    len = tm->length;
+++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
+++    p = (char*)M_ASN1_STRING_data(tm);
+++    len = M_ASN1_STRING_length(tm);
++     end = p + len - 1;
++ 
++     /* GMT */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
