Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7290C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B690740E94;
	Sun, 20 Sep 2026 14:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ae-QgSDSYes5; Sun, 20 Sep 2026 14:51:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E2B6B40D9B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915867;
	b=XNI3cKOcS1rZE0Q4ksZ8RbW8dZHALib+RWt1J0szrrtl71Ol+i7MhvR0W1CMkOxIUgS8
	 5k0XRjGwD23EtGjM7ojsUaVVReiENLb++k+qxgBORN5yge1KVg6H9o7clMJ+JTqBvX4um
	 +3NItHbw8yna0wkvntkm2KAorsTGqsDVzcXkDu+/Q9pBj/+w2QM8iNgveqQ8q2ZtX1r3y
	 8DnTagQsdfjDGvGmOTzCYxMWfVP9SyV/TlOLk/40oyQ75N2+60TgKmIRrMc04pTzTBUqZ
	 PcH8ZglXYad7yq4bxd6GdikX/YodikE7aZTRUkgp9DpNcZFLKAOfSRVTKvcM9O1Ae0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	b=JRhhlOON/pJP9WY0jkR0nEgMsMnSL8bsr8q1msA+41XRSw70NOPNVykISr+k/0bpyjzu
	 PzmyQyCE7djzzbWtPBHgKdRaHP39njIuMOUGYCBhA+HoF09QOu2EtTYkYrz8Mf8Ji01xR
	 f38CnD7QoM31m3uKbgm3MG9BG1zthkjTxHujm67zjQRcNjTYnr0PTHvV2ocArNYZ953mH
	 GM2+7xt8YVL1AOsEJjGc3N4or5vKBO1NJJ5S6wALM7ZQzq2KGcdWH5xY5vtkVKDDqugAg
	 6uYJO8E5JDqjR/QNRtskkO5GOylayvTcLEAxbOgZBcN8+mual9GIy3dJSwQ6acblp9g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915867;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8oM0qSBpyQ0Xsult5ycyaKhWu+KRxyzegF1RysqX73dO9DzfGszvbiGr4GpZ7/BQ
	 7gHW3oeu8oPfdJgKuNV2J3PfhT6mhop8ABAr/pv8sOnLls1yB3fJAYGy1K/pWtUoqs
	 H1BNoB3Hns4EKar0uFBxnZrr0UiBs9t0pC1SZtcC6hK/WRz8vKB2X1IRCbAcS2Vooo
	 rdz/JwWY+TK5Y6hFTSaexUjoe+S3jhqkNGRM9ono0/ISIXOFPwj059VuTIGwm8BR6M
	 OYnq+TwkYKSm7CnpTF2QrL+ffPD/DvkEsVtY2KWC8fdEiy9zGLcrYFFILdP83brYiK
	 GgpwjdpwKDBlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2B6B40D9B;
	Sun, 20 Sep 2026 14:51:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CDD937A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62F576073D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLt990QP8hBf for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:51:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7BA4560619
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915864;
 b=l9D449ClkTqoBXmhgBnznCiSpP+Sr5LdbG8fchKkup1/FHt7yAOwmmxC3TG6YRGr1AuF
 zDdfjPNl0Qu5sV0dNAxkfjIDi6wOtWA4/BJ90kxjofnBu09WKcEUZm2I1sJC6I4KRdUF0
 r4UTj3z3bRuBqvLFI6uf07wTHNaYNBO3qrAIUrvYixQkFojcytPAaTpwUq6kBPg2Dbx00
 espc9mYbunzAwwETrnRvQIG55Vpsa0gxyHZL3QSC9C8EiQWxJdI17/I6lfZyHET28Kx9j
 MGLZwXmJ/l9IHqrTw+qWD1r3WrF0350Y6Rso6qPxPnqlYKkl2xsnaoXDvcsmaW8QIgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915864;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 b=E3h09qWOfh+vF/YUP2Yl0h7sb2ra38HRmx+LyEqKvcRydD4pHEW6ddaZbjy2x8xVzz0q
 1pjl+2idRFQjfL+9P1ktzOQlfeXS58+K7edVxSq8u5MB+Bm7MJvGwFuuFOwfOFcSX2Ex4
 PA2u17S49gQJR4tJ2eJCyjGNR0xpe859fR/mSLqlo1d5QlQOMgFVKHZ1mtKeA3iaG55Ph
 euJ99M5ShRtaZ6O4Oui8ki451Di8e+pS96Ud+46QKutWrAiQOuOR/mxpT3npYd4LRqKaC
 nveb42wQAb4a2sFN5MNpTg/Vjh5/cpKgnxPykGC2NuDJKGt8QKVlAdmUKib85pPDHEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LAgur1rj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LAgur1rj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BA4560619
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915503;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LAgur1rjae3csxVapaVaTh2jq5fzoE7IjnHQbhL6ish91RWlMn1O+3Tag/EMFhK11
 ViICIFmnNIFG0Fat5Pc5pB6gpjD/lduOC52/UDf5gxxYWpDiUwUuoOB4DS2YZ59WU8
 e/aMNuDeJ0dr/j1UqpbuP92OvBdzXhHN+XQmefZhyFIL0Xr4WYPFi9U74QT6m24Bnb
 8cfONd+6l7xityb4SH8RmxMGt66ZL5OpmOFWGIgwYZdaRkIKPKgUdpIv+mafMPgRRh
 klB8jM2faNZUXTCvtcbGrCLQwDwjlZHl/7zIcEHGYh+LCogJgQoe9r074fOK5n4qhQ
 Y9jL4g3outggQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:Bx4FCv0KtiHGv6X2hbTmHRbF3yDF5+FQhnComlOUm1Y2ZRFT7KnrSIZScnnh77xn4tT3gBUqsDK8gC6lvo0bbVshTUXEQD43aTF0umWjEBKcMbFoDNFjPiP4RrfUWq8+KT+nXi7oqGq/B1lw69kHNeHj+5V0lZqFXyOorofBRFdbvmHpXFOeKubis3tB+6A0g8TLc33cFnPYdK0ASNYuRRV5iSY+kSZUCG3tRwizjZz5K5Oe/5cNRomoE4F/3px4cRjmuue+ba++TmFajMCAhX0xxsd5NhZVV1RMtjbgbH1sb5rBbYUSGzKsR9i/AfKiyM5qGmgvVySm7kOe3g4VOdH02VZzhAAEIwh7en2pfGWiriuMXvVIDa3NU45dN5FV/vtOku9Z4cyA2r+2BRSmQt2jn4CS3Ry089dHe1GlkyPuLE9V3eEJmrrQMRTCSmvXryUbUeGh5HrCCnSBiJGBbtMPpZ/DxudFd/8vOeetaPJHYxdANVFzdr5CGMKLTPAPJCceVwlbbzEDy/Gs62/Hj9YrSlaEyTHYZ25m//AvOeRGzcsWgFKmMCC00PIjnIAMxK4JsKGxzYRRtMgcr0SFuqRItUr8wt4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 372B9A4C4892
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-3JBD
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:54 +0200
Message-ID: <20260920144428.3009612-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 33/66] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
