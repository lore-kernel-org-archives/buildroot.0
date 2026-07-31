Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B983C55167
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 09:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC5260A8D;
	Fri, 31 Jul 2026 09:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GhaScGj6hFa5; Fri, 31 Jul 2026 09:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C096060825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785490479;
	bh=AZNhFAxMAx8ch7hOWN7uDADbypPrEQQWxGZjXbQ0+Mc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FRP37fgnESyi8rZJ7ZsOqwi3Cpto3QM1kWF3lG7ZLGQJtF4kAJaB1wz8tm+WPRnNT
	 aFdm10Zk1YYleB5AHFZuV+X+yxHaUsvMywR7fW1ouCu3/oAV2UGyA5UY0JVgf8t7Kp
	 2EeCA7awRtc98HOzwCSTgGbJxpv6bliSieovGQshCrNdLS1fr5kyEk0+8i+NWYytKm
	 COnKxSYCPOASkQj5IYUSkknPUg853XBOwxYKM1ZF9HaEbfjCeF/tBe11QJIFWB9JvY
	 ir8DkoQHPBestV2S8/ZRYQyLouOB2d3KF5sEAc87DBM8YdMzglh36qn8ykWdaS6gFD
	 kvQ0TXdpy3jtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C096060825;
	Fri, 31 Jul 2026 09:34:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6736723F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D8D240F33
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiBmgUzu9liY for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 09:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.146;
 helo=fout-a3-smtp.messagingengine.com; envelope-from=mcdev@playlinux.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B15140E7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B15140E7A
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B15140E7A
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 09:34:36 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 1AB31EC0114;
 Fri, 31 Jul 2026 05:34:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 05:34:36 -0400
X-ME-Sender: <xms:K2xsahOONr5Y7mW9rWhjCJjaR-s2ngRsyTg-f1IcAVkKbTCiVq1MBg>
 <xme:K2xsakER9X41r0xDgHL_bJb6hGF9ZmO1OYI5mqeAZUhDC39jnjfIWSQqIqHby5hcg
 -ziuqncbEjfY1LsFtEFpGocfyFKmGT930fB0WJBdaDSIiHWJQs9qGRn>
X-ME-Received: <xmr:K2xsaoPIl-_EnCqfk96_NhmuDRlZjV0L8OvlGCbCjq3x2lzO3l01K8PxlJltWdZWiQI0_1HWtGxMu30r0FRBCycnpOj1a8gsQFXx08w>
X-ME-Proxy-Cause: dmFkZTGvxJ8SZqWrjCqW10lsVZOzt8aqRZNBDpS2a858DkfYz/rswwQJShNKVBG+vCmmny
 QzAuC16GZ7IfbdF7TCOCn/ZIkcC98ae8lkT1yJv+remH0eO75aEMUWVgF0IGF4GuZEKazf
 UTB3i661S94X1jVqydUH7Pupg8WfyOBqKD02FmoO/hLS+uS3kQs0VvqL+5wRz4wzIyzSQG
 SjLGtmNMCYz+xtZ5i8c7ig07hAZAtVRa94t+vZ7zLNhq7Srz++ldaA7mRVQn6Tuxc/jAC5
 4xAVNUtz0Owh4Bd19Ir6SLpum1OeRStibn4zF2F2kb1L+n0yI1jXYfO6XAOgFa2BQEuhg7
 U2zjed0zIilHUu3+H6lQxGH9v+m8Ef+wmtbrfbHCiLDQJu3/+mIVLDpJkm6W4asetbOYfS
 i2oHEUq22Lgj7/wugM7+aOTNg45DW2RC2B/DyW7UImBVEcX336LbM9E98XetLtM+7A62Sf
 twuT7Sv1i1zk1CdlVy9HHHSjzVo0eoLj1HANFjXFMtN1j6lU5xAcOe2rtuPB4dg//ylB74
 +rbkOVq7XSsxITRHygXgPIU5nW7M4tP0bIE8wnHaHOl9ldcC78yCp9UWyG2l04sQ77Ceo5
 6JkvfDuOiXnglwnRPGoiCHfThN9yY3ghMvTzvvR4XaWzE5GuJR/lzOL+GYSA
X-ME-Proxy: <xmx:K2xsal_SuDeNvrXW9HjXhbHIhHaPobSELQKlVvH71I-breJsWHFgcA>
 <xmx:K2xsakT6MIZ9HSAf8r8gaFMi8sU0kCdIu3lZXvDC8-r2g9KpFf1V1A>
 <xmx:K2xsavm0g6sy3h7zGmTfqYnoqlteeqfcswOnH4UWAyJ9TrHjg6A3Xg>
 <xmx:K2xsasT5eMzj5dyH8WM-agxVJJaZAvQ5Zow7cE5y3oMFnvEkkB_NTw>
 <xmx:LGxsalLWN5fhKhVrpYNwmJfRDCuowBxgJN48jmmbJixWAAZUQ8RhFcXh>
Feedback-ID: i0df9467b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 05:34:34 -0400 (EDT)
From: Michele Comignano <mcdev@playlinux.net>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Will Newton <will.newton@gmail.com>,
 Michele Comignano <mcdev@playlinux.net>
Date: Fri, 31 Jul 2026 11:34:22 +0200
Message-ID: <20260731093425.81408-1-mcdev@playlinux.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=playlinux.net; 
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to; s=fm2; t=1785490476; x=1785576876; bh=XNxgSKu9gv
 xk+QEkXif6bf5diG/Y1ObpmHrqClL4+/Q=; b=eG4dQJBl7cO1Ecp5g+bxCzHBp/
 5xWUClav2IPb6OAYHZlsSDQDQM1DOnw/NcYz2SrThFpdKrvUV7YG7io/fF8oK2iJ
 5aGkrE+tLmVoZi17pfFZE9JRiaZqBrfpSeHOzwbbkmK/MekJSZY0RD+u7nqSFTam
 TfS+DLsOif9Ct1MJXeaGVxzH7qPFu+G+j4sLWuwx1QMBzvSLTLJ6qJDZMq/rtSZj
 Oow5bul3aJ0DCOIt6zRj4FcuaIiTcj2U9OZ33XZxK+qDdeiTI9HPpCOymtAhpAms
 +MvIP4t6EneVcMxjezLKvH+O8SU8jCn17yMKxX/8XVFKSz8YGkQriKORcVsg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1785490476; x=1785576876; bh=XNxgSKu9gvxk+QEkXif6bf5diG/Y1ObpmHr
 qClL4+/Q=; b=NOeyvqho1tvasXFP+FmDG3YsanhOpLEOVIBWRyEZ8unqG6gF5nR
 FxL3FU/d8+h3uY7eB1Mli2xLvjupyzOgjZocFPQf24/7SaOUgY9CjSYyCE+nytuM
 xG9KP71bNj7JwTViIyMS2sbfZMsShMCNlpcDsqhpGNticY4J/cFAeGmXXErOvvaN
 KFNV0OVBebU6c/7szF0wUH3u+fKINAOFs2XFBea4CerZuJHiTYNddTEcmW7MNwDG
 yUmrnNmJlkZsglPcipyxQShpCitLn/AvMZWRPEApnJA5rhtAhVKWZbFVuwDjizxE
 7EqY6AxG/yvyCgDRuv/XIuOg7/HEYNHzWkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=playlinux.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=playlinux.net
 header.i=@playlinux.net header.a=rsa-sha256 header.s=fm2 header.b=eG4dQJBl; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NOeyvqho
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version 1.0.9
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

Changelog since 1.0.7

- 1.0.9: This is a bugfix release, fixing minor vulnerabilities
and expanding the test suite.

- 1.0.8: This is a bugfix release, fixing minor security
vulnerabilities and expanding the test suite.

Signed-off-by: Michele Comignano <mcdev@playlinux.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index d342eddc9e..b1b943ce87 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  827250db649546cdb04bea01f5f0560f0edffde9130e256387d1f977242eaf98  libmicrohttpd-1.0.7.tar.gz
+sha256  6e9adc446b08083ec03d40317fb66ca6f2e03e4f6170aef33a6e59bb08db2012  libmicrohttpd-1.0.9.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 605291c046..c2e585adea 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.7
+LIBMICROHTTPD_VERSION = 1.0.9
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
