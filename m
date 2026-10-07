Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18882CA6004
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 21:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D960040762;
	Wed,  7 Oct 2026 21:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJqTrIR-1TQB; Wed,  7 Oct 2026 21:25:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EEC75405DD
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791408345;
	b=gR3dextGFgtHUrXkDhSe7rLhngNIfBHmzRoU1TZxyIpgqq6YglwJv+v/QiMbk3LV+tM1
	 aleKjszwLcB1JHNrP/qTjz1TbsNj+hZf8qU6bYSqOIZATWtmVlu+lx6vayRMuzI5/QQDm
	 4wdeEi5yAg8xOd9JKkfuuH+GRJRHRUp0hrKg6dhyO7PUma4G6nKNPPOzK1ZCD+uXHfZzd
	 KYzOw5O9dFPgXs4I4Z7/FiwjamUq28w+NINIqQw4bMYKLZu2BpRJAeQ92TEqdzeXtbkAk
	 z4LEZRdFwLgL1DHYeds+S0nSn/3LnVbYmx5L144KBgKGVMODG54+EJ4OXpJbVeWG24g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791408345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qk3K0b06z6UprEq5s6GndO3vFTEzBhl/hZhr4qz5aw4=;
	b=DpG86DARjc4CqbnxDugsRcuScTBD6xSE0/zjq8Z3E/siIQ7OdaGTHf13ZKdmwycLOuBb
	 GHy2ELJR7QvUjAmQsmJmU6l+hAm7pRRXiRo1sW2s2BBBZuauthQRss2Zh6nekQnGybgyk
	 UV9eh9YpMlb35Ch9lPfiy7SSmLrkRS3la5xqHtIjzKZG9LfZ8y+WjsxN8wCEU5eKG3uBV
	 oKi0EXn4xuMlu5eorvjpvXXP6gjeABlzvRIk3mmcE4k44GlKLQf0p5so0IlOcfrpGlmoG
	 d9N/M1m2QxfHur2Vlat8A6k0qxC1T3g0X+mHUjAkh6Uinlsp9rHjeuIVw1W6duSscnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791408345;
	bh=qk3K0b06z6UprEq5s6GndO3vFTEzBhl/hZhr4qz5aw4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G3O6agDnH5NRFbWfW3cmFKOBVWEplJ8YHbDDE7ClojAEV+X/IVTki+D/h8uSvAMQq
	 xwv5aBnD5TqAVg4K2IFEyWF07uhuQjoxgegNuMvLhiG8u9IAw2j5PkQXG0dofFceOc
	 3BU2yYfVGpQaPoYggqTpOMDwt3ZucD8x/XfIJV90rcjMzOBYS98RFIf9IXDRDVuTJ9
	 lEgNS95malQ2jYMyUKujVPxW2RxZL07PTTzNw4JsZwYQfogNKl3PgJdediOjGpYoes
	 MEK8FFjYYPTtD8cHcg8TDOwBYggokYbo21RhkUkTh2TgSo0Bgi+2ArCbPGHXljDGPS
	 lyIfWqKnMwdqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC75405DD;
	Wed,  7 Oct 2026 21:25:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 07884338
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E229D608B3
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCmqGzfLMX5u for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 20:18:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0688F608C1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791404320;
 b=N04AdMcW4+Mo5gsM1lLBisq+MuYmseTapuzJD4K/+UB1m4ZcJNbnf6aICpYD417HaWTQ
 ve3Jmj17wgeiSJOCzNV5sqxnW9dEZxn1eGMthvHQgVfP2bRXZmgTqjDDMV3e77glmhwtF
 5B/W9uFscaPwWkrxoSqpkXXiQ1CoZDbGNmy/V0y+5K6pvErjwUMKipndyMIMr57GaKLZ/
 9N7FLaA+qBMPiPsPu4YJvgsw2TLNoeune+TATc/t+5kniOqNOPrNs6xfF6k8xOi052bOZ
 N4u43mrh3pEwiw6zVj9/Fk0GSF9cg6SdZZl6QwBhCCGBFJPNTbE2OraY2NafEFbEPPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791404320;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oBpPpJuWu9jhosrj8GedtAlzAD7nrdZbrSVSA1D9wBM=;
 b=qSpx4lbjwS+v7GB6TdJCwO8OHsqA3eX/9eClaxzX2ASbLo8B0lImvvtS1qve9fAXKI8c
 J2mTDzs1PJHEXYB7AP73XHyg/bSiwxX0WZArTCRA3xwak5dDMRlQIgi3LGiEolBbXfgsa
 ZZBD9v0zdkSeZy7iQMRuJNVaYVPTofiMES1S3LPwvp1IExuzsT60fEyIW6qU8X9GLPuUi
 zW53R5Qtir4Q0i5ylHeuDQuZC/cXqp5Xalv3y0Vv+dEwvK8JCeznwjSRXGHkrwKr8jU1s
 wCLcN42GGKlfMmMiywF6tlRwAHRVYnBKSYJHLmTbntVMnmcM1A4998TcpV7uuX1mIaw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hdODEeen; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hdODEeen
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0688F608C1
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791404317;
 bh=oBpPpJuWu9jhosrj8GedtAlzAD7nrdZbrSVSA1D9wBM=;
 h=From:To:Subject:Date:From;
 b=hdODEeencNVFH/leFAUv+SzrknIrDdnnQmISqYvO6GoEU5iM9xrMDx9QgY99oWQif
 DIehdKksZrpri9glJO1aH5l4CFcwTG/oUoX5lHem07UDWGJ13dhutDdzZrnkxYuYOm
 bmqfpO2nraJmPVCZLseDvoCZj4r4M/ss36ZYA26WfIam6iOomwZXr0vBWF2q0OXDX8
 2To1ugegaJ3gBBDKFKVxx2OuSS5x4VGCekO+f3sVdSjiNPqxUsy9eCYkdIXTgx8Rcj
 RyjIRX/4ggLD1Rgw86Pa+iXpJ3h9+rFo36PLeZ0UjuB+wZOAz5SwftX1XKimG8Ef9G
 4tEKjOD9/XRjw==
X-KAS-Sym: v3:f51bdf72230551df:l83EQHqCoL26zRq1gg0iqkfEInB87gnyJ8nPTVn2A3HZH
 GfyTWUtefovNF7CgMtkQziMUme2OzBGTnI6jqSrrFue2tFTDc/8LTG7rWIK9EmKdqa7MY4OyrJt
 f31fyTlWl01rSpMIvDUy8dgv9+wknygBxvAZF3bYgD5VQ5Rwebbb0HwseM0tRG6IIXLkEIm1PE/
 kx8K3WjGncpplc66Aj2kR0MnK0K7F3JLNvhKh8HO3qV+t/IieDbpwsq5ZmQAJn5KhwIA3gn5JVE
 qHVcFl90779+byDw5QvwtvZUUih8LJjEgZCcJste5zWxRRfxCDLW0ELe4ObfOQ5uV3k8GKww==:
 RsXAiFA4MHoYcPddWCn63KCqGJLnaPrYkGljRY1xEpdlCsusQdh7AbRPuEvhp+0m1yCnzxwQPDb
 KRLg4pCnS0P3W12VGYWs5Kgi8DVPF+99GXsyzLrbYmm8qQOlgZpPk6ZUnoH2CuyJvIg9SVocwf3
 TguRGaiC3tgFKua06UtU8kchGl96Iv4V5yIm6P83MAeyd7z/yybcr178bHag9f6sfzSwyODGheH
 KDjHK+AtcW1u5OkH8ttbXxKXhdL6QUKMiLXWyfN/8CV4J3FEAj0BMFCaWs3hH95rhV4IZUAid7X
 oJJEqxmYQ2HUhn4hAxreq/A2JUtdIM/M+VYDyABFaT8xolnkLip/RAfO0CgktYQhdJ/lGxPkJyX
 E+2QZ8fdHZj7l4eg5DR3IY1iK5cuzSkq3X1C0s+JHi9GdyIXsmxfcvyqVzrv38ietxtIW9bGkkD
 fNfBvDHLIxXQotgAGC6iQ8opa/F8TRVrLzvg1tfrzKBTGOjNYavWA194D1Dz9F+08F6MYiXuqVO
 D2auBT6N6Cy5+hnG79Wi/PZiO8wYSEExSKOCj8vTvXtMTV7soWwe/05a+BfjkpNos2q7sy4R90u
 c66akg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1FBADA4C4F96
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 22:18:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50008)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xEY61-000000001WC-0OBp
 for buildroot@buildroot.org; Wed, 07 Oct 2026 20:18:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  7 Oct 2026 22:18:36 +0200
Message-ID: <20261007201836.1696051-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/openvpn: security bump version to
 2.7.8
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

https://github.com/OpenVPN/openvpn/blob/v2.7.8/Changes.rst

Fixes CVE-2026-84790 & CVE-2026-88964.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/7447067c49ba9467bb5f924683b2b6cf5f7ad1bd

 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 947922f0c8..9274a853f1 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463  openvpn-2.7.7.tar.gz
+sha256  c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36  openvpn-2.7.8.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index d910802da7..01c049cd05 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.7
+OPENVPN_VERSION = 2.7.8
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
