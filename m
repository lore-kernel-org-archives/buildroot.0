Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C8EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A09AC40DBC;
	Sun, 20 Sep 2026 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-p_CZLOApcY; Sun, 20 Sep 2026 14:13:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A024440D9C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913635;
	b=ZE9+xhsaSLN7BpH3uIL2FRKTIjCrr/6yX6pZkTu9Cg8j9HjZ+26ROxWsLwhrvXFl/vwu
	 ob2NhiPEiTyKiUs1Jn2pfzo7oy0W9O5WFEPMHuqxJLL9bcekCdVwcWaAVDIzad3xcRQLn
	 Z0wymkMUs/kj45kukwsxxW8PpzsHsF5KRgUE+FWmDLqCz51SxqYJ/lvxobAOFRtPQPhA2
	 1pDS5QLYbI50TjzmG3u4uTnJsnfmrIfHbVZpbeBYhzTSBaPWPw+fKwR67xGPUNFny0LJ3
	 +ftEj+r0hO7/A88sSjGneGmQzCkOvxN7nZr8UQhTJNlamg/JrbR9eMnS6lJK1ECKeyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	b=hED7LoZPkNYWPdmE10ZdjUNpOwTth1RGeg8kP4SDvUxZdn1AtsYesntZGhOLh8xMJawf
	 8f5KDxeqtKXqUhkHWpStu+mqlXn2kKM6JQ/eIvW+9O2AkBbXI9/xWAoJ1jBiYrhDlQR7l
	 yDVB2ZlDeseDHb0dP/mqvyfJ1R2daAOVU4Z2K/lMJ8Cmz/GRWqyehOwbyGrQDd/NvmFmA
	 3+uamebwgOadlavrTKMlgzCA40odz2E5shfoSZQJMwUyRZAEuBHfmn/tcxXB2El1/grID
	 lK7zP/CUMtw5StmeBehSct8/zTxvJ2dfQTht1ZK98SIZvYfxr6zMBxO+ljplOq0gqkA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913635;
	bh=TnW7QnnJGFHpzwovPj/MzrFcIsDVsmyzL9LIvI7KjoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZybKp/8dC69kIpXt+k8hdBOYL+5nOhPxZnEnypmpJcxll2zLuTD+r4l7ubU3F1Bnc
	 D3W17uosDbyj/w4oiQkN+wlICzSRiHsaWs6F1vQ8pmVfx60g55luVk0vk+zLJAO77c
	 Sshs/+2E79bprLth6UyQl9c4Gt1LoQPvlhXXwWt8vI7hQ/SaHfgS6LdBjQiJeyAMij
	 hs5Zcv5eGu95MiNdFwCouofxIfzafT+DUHBe1oL6gpH203m0YLPxUFckJpUy5JiqaJ
	 2GPFHO5vtSknWow0kVyBu+hLes9L+fitxBUosYalKPIwM9Rplg4gWL5rJNR2Hb2pZ/
	 p3lTwGnR2YiYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A024440D9C;
	Sun, 20 Sep 2026 14:13:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 005D637A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6AD360699
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJTLdbrPGMOy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:13:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C464E60639
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913633;
 b=QJJV0nac+7uDo5fcV0BUtBv9w4ODz1D51DRXjUiWbkiQxMi47jFM6VAjAaSDsrH8GXWp
 7VB86uVLOHX0tE8Ow0pQLs0xEKdHOp55jwePheL1vtXzL3fo8y0ZKZ9uH5rr5MDeBpbiJ
 3aD4clL1YViWbbri/3/4kS4XxzrBrTnTQ8d6y3mO5OO3wWwz5Ze3L3BD9ZQT/8VRlLcxL
 BbAXPVsLFGk7GzqtdfTN/Hewpn/YzwlHUuVyb4EWzmkuVcT0QUEeQ0q3BP6Irld5QGmiN
 ZCozhJtxI5ZydHwL05XLDJvcEJ+2Pi+XRU46PsoTC2vfs66iuxxHSAJMFih5YQ1hdTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913633;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 b=heFUrUdAK3QZEGNAgonR85RRv0IP+fQmuXRlbfwWjvL700CT5pzYb6m9ArHbKhYL294V
 nPEBOT1OLYMG2Yu13jRKCOz7dGxwP8DcC8OWA6hucdqnD9k3zMKinTIAU2MlBht84QFGA
 o4VsYzBzIOvj11cgfCVd1z8nl+/BTPrWYXu/3rsqQ+/hn2/MgyrN5p97Cid4mpQEfnVCt
 d1azWw0h/4JJH4tfJW5GRsHoh7ItpPgYL7ALttSEWJZTLciGo7M/MGXTKUudu3BdVMd0f
 tOFBWQ/GLFcrGsudFZJ984mKx6bIk5Gv/40OMoi7CexJbz+IVZFFEAt1i//5cyx6a8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="fIi/9ZNG"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fIi/9ZNG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C464E60639
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913234;
 bh=73jDUQh0xeWpwmS+ehtge8hew78j09XtI0zHFLemPX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fIi/9ZNGg2D6T6RweplLDWFstaZPVC0lIbdUjbysqSKKxMSpqBRda5wZ1kXxGHjD6
 kNiIEz6wE+Bv+Lt8ifXuGWehcz5WmlFGVYIMNhsaG0aIoBqhyOcA5sraO6iX4OH/LA
 w/QwUtICrltu7AAlCy7zm30jAengGHwgA3BhjFV1oOZP+bLKJMXrgz4XLuQKXyRL4V
 d0YPQAmp8yimtVkb7BvY9YyEpE2bYm8pYSXgsO1WMJoRccFyIFi39E5J6usyqn9apX
 6I8pCOihlYmGryrwSYo2AiktT5SL1LmQuWbEJp9c0udTAZwCioX5mG73lTUd8JSX25
 /ksfqegtpRYxA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:A3gMLzoEOgb7gH0raXVN4bgUeEJGpDnbo0QK3FP47fpPHsNauFrags+p7RNJkLquEjcxiTzgQr8OX3rqpM+M0n4neuI7923vrwXbr5DwEAALLuSTPEKv3yvEn8R10+3amo5wht6n2zl0RSd3Mpvba7jBKhZTR6ZHHkLg+vHxJ4B6dLtdMigmnV9XLmxLg5n8hcl4O15rzlSa4ibC4K5lL695oaMqK7fQcxUb/YxmVAMPeDhVKHUBDOVD5Oeynv1l88W56YgUD6AOsOsPnB8yuCXr1yVYl+MajvTlVJx3yX5oE+VHs+dDESDIXv53kui/GcKnuQfdZN1f7SLKo/QKWQeLivDH08pnYfhRupYbNWEXV2yG2d9xlQcQ+ZsNoZRrgOuvL860tQydHiQEZgGTQBYeaucN8U2pLA/eK/YpyL6w3Xdamcdmutu3+igeWlZ/1W/nSZ6MMlpT6WaP6SXCvHrESjR4EvxX6x477S3/Jh5R/Pg+CdoI7+ElGeqi6vDEeJbaJPEW1ACi4uRpXB+wgvv+FH+N4lWipOL4nmnOTjbbJ//j+vjBZLaj2rga7VFfEqcKBZKwcS0VP01CoG7JCo+twvrpS5PueMwFxudh3i27Lb
 q4L2BidmtqDmRYj/ay63FoJlQ5eRQTeOOyTLIl2nXo/ovVppBq/OJyLdoBbOsLMTblMP0h5uwB
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8680A4C4870;
 Sun, 20 Sep 2026 16:07:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-01SS;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:22 +0200
Message-ID: <20260920140605.3005461-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 24/66] package/apache: Add support for
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
 .../0004-modules-md-Merge-from-icing-md.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/apache/0004-modules-md-Merge-from-icing-md.patch

diff --git a/package/apache/0004-modules-md-Merge-from-icing-md.patch b/package/apache/0004-modules-md-Merge-from-icing-md.patch
new file mode 100644
index 0000000000..b4f04ba47b
--- /dev/null
+++ b/package/apache/0004-modules-md-Merge-from-icing-md.patch
@@ -0,0 +1,57 @@
+From d534e42b07969755b27eff2892ea56cfd909f063 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 9 Jun 2026 06:44:42 +0000
+Subject: [PATCH] * modules/md: Merge from icing/md -
+
+https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21d4da75c
+
+Add OpenSSL 4.0 compatibility:
+
+* Use getters instead of direct member access.
+
+* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0.
+
+* Keep OpenSSL 1.0.2 compatibility.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1935161 13f79535-47bb-0310-9956-ffa450edef68
+
+Upstream: https://github.com/apache/httpd/commit/d534e42b07969755b27eff2892ea56cfd909f063
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/md/md_ocsp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
+index aee799a7b3..2e7f14dff3 100644
+--- a/modules/md/md_ocsp.c
++++ b/modules/md/md_ocsp.c
+@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTID *certid, apr_pool_t *p)
+     serial = issuer = key = "???";
+     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCSP_CERTID*)certid);
+     if (aname_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)aname_hash->length;
+         data.data = (const char*)aname_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(aname_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(aname_hash);
++#endif
+         md_data_to_hex(&issuer, 0, p, &data);
+     }
+     if (akey_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)akey_hash->length;
+         data.data = (const char*)akey_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(akey_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(akey_hash);
++#endif
+         md_data_to_hex(&key, 0, p, &data);
+     }
+     if (aserial) {
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
