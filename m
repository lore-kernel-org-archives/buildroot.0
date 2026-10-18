Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D942CCCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BAC80F75;
	Sun, 18 Oct 2026 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rW3UYCcd83S; Sun, 18 Oct 2026 18:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B6AAF80F81
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347920;
	b=SjwsYMOex3uEMTlOnLZxJNY1KqKU+WUs/bZmmWQWe89bgcpW/m4EgMSGKRk93J0q1gqD
	 fMhproxbYIJmb7EvNXCr2PzrJryYv2yi/wG2SmZc01vTg7gapoJY9Aa8bFa4wC6ADpHZu
	 IvImbNItx7GwZLwd/vnMQ3XxoE/g8J2FYfMBxJIX2925MeOw8DoX7jjwc+Ou8rVGr9o3k
	 yco3E/JIT9Jg3HnHmBsLQEe7fwYqK2zB46jXh+giEsPjjLzEkLB9RMY0Y0goBM/8y1iQX
	 9eteQHpZD2VpHIAION3vlqSUvYhm1tab71cCfYBXSEViIQD9miTPt9Tgs/6Dbpd4zLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347920;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/MRBCKiCN/goJHAaGrJUjFGYVX6xPacnpWXLeMmasYU=;
	b=EwFvt/j7Q2r2mcH4NqUp1KPXiOHS0lbEIaWasJE6HC57QTsYzKsyngaUOK07/uY6pvtT
	 mwEIzpTwBrA9ZmClLgrkpktcojLMhn0T5rr8cPEmRb5YfXXKlHHBc0x0sFQh5dLF4Y+eE
	 /yaq4/1a8RUTV8OpG/JzKdMb5jz27oz11VBss4d+vKJ9SsQSH7BdPQO6/9WQj4GNnygcz
	 K5JZa3c/JeEFLTX111kMt41U4vycCh74g9d802y+0f5PNHQ186kJ4Q5eBky/Hk/QEJRsD
	 exA6KEUkaD+r5kPgurKUTak+VmEFdzldYqOvvDOijadWUcwGg7x3t9nUW+jZrwiGY8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347920;
	bh=/MRBCKiCN/goJHAaGrJUjFGYVX6xPacnpWXLeMmasYU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=h/NqK8W2QN4jYTiRZnA81RHTglGyfmeXz2z6jRblQu6SSEJOKlZV6N3DYi3Iy7nLO
	 JI5p77TN343pspwKhy6jAZTkpeLQO7IarMXsfHtS/V/V8DU7rF/ryzjlGbLuK2ZZe8
	 lUNVH4EUzo/EDhkcnRq0sC6OW6Gsc/xLPPADE+In03dsJCI4qyCuX8OPy1keEjN8vE
	 AUTqRljTRr65aXjwMtX58hduzM0iJ5JC9akTF78B79Wg27bc8uk7uPAZsXgNsFAyZA
	 9PoHbZZRLoxZHsLif+dqmIZ9+kbK/sHJG36zWJuojA08zwHlKA/Vjn9k34xWaJNNiN
	 hWV5vWPbD6jMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6AAF80F81;
	Sun, 18 Oct 2026 18:25:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8558A1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC78406C3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTzBkvsOM1DK for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D09D40677
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::235"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347916;
 b=MztEW0FVk448H9O6GPLiBrXpHRbk3OyaP9u2Fni9rxhPI1LxFs33gJyiRed8L0uKEMYz
 TKuX4My8jnDgBZDFtR9Ot4UvAVBSb6xGWmE+qnnH20QF/Re2ybdW7k+YLUi9jlSyTTYja
 ApmTsPRi5Eg2wPcnZtnyTsvtjgRSbWwycJY9yYaGAMO7t07WETMNxjeyweKDoROzVlexW
 yVjQ4BmCA2OnXC8z1BJx6cL8+yi0Zg8qkVmYRCRzt+kdQShXcuektwHlazeZ74gan7QcR
 LxX9anVBWy3Jaeb5P6sEIeyX90OJIpEclYMOCMusJOHI3Mc2Q6AzcLHsSBefs9PjRTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347916;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Iq/5pDROk8vM8M160zSmb9pTMiIXVpeLwMwpdiNqcSw=;
 b=CKTpndEKVqpOt+7lGo5uD3zLHl6xK5yRyU9oz5Gbz96CRRlZEG5OsMijnFmF+pH79HnN
 +GfBrTTB9e9dcoGUz4weJDsFUy129nc7SuI+V/rs2o/mEOYc2DLVoVHod7wFtMA0ZhxK6
 kIw6Sxxy7vjhcbctjcfDt+GE4RIXg+Gf6rTa5bC6vnjSNSYKFCFqOfI0Izjjp4UnyNxBS
 hm0fOb8zbcB+kOd9OQ2G5IfhttCVVPmH/AZSeFy5Y5GCkSxIze6eFynLEd8y15UNTRBAH
 QDrNYox6Ujc5gvRLY/ntQpVcu0cortFAC0duLb23BLViUBBjcV48XTYJuCScBdac4nQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=eFJ7fgPP; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::235"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eFJ7fgPP
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D09D40677
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:16 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-53aa0802881so769876b6e.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347915; x=1792952715; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Iq/5pDROk8vM8M160zSmb9pTMiIXVpeLwMwpdiNqcSw=;
 b=eFJ7fgPPVjKxuwwupvmS5AX7wi5CCex7xJqUJAvGmj7bJPU1SND1z3rYsvWLHZzbdm
 qROcOm2Tbasfe/a9DlFBzEicfwmJWEbFqw6pDliCmnpoqU/mWXlAMPmI4GnMi19/peOY
 pQdVNR8fv0+9eXCTUwb3wAvMMZOnWP70YilKB4Pi75OVWCK67Zt58ekpxO7xWGSMBx4R
 vchFEqBiRiIA+fTVyz/eoikFZBrsDRfl2R/3u9uOAYLZO6Bom0CJ14FacGcC3K8IGnVe
 fZsLRbxX7k3ePk1mbQAwAFyn/ZQ0mlg6uolXn4r7V6/WY1aKgU4Dpr3M6Whq4CoJIF1F
 hMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347915; x=1792952715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Iq/5pDROk8vM8M160zSmb9pTMiIXVpeLwMwpdiNqcSw=;
 b=gykx3XDcOQr6LnDi4fptuO7gm5U2+jwvRxOEDB09b7b4Whls62H2kuTxqknY7y58Cn
 sMXZcE9Yck1ndqMF/Sb8oo41S4PoytuXgeyBNXIKZH/DofDUW99NhfGsqljZIwpsmVuw
 4dXx9egQGHgZ8parxBq+OXGiHp/9byg078zI0JaKRRH/34qSSsFwI/imgrY+J/23ojxx
 c4PuyjHRcwUMRW4Jdkc3/1jqqOnvuA+5kaiOs3BhHaVfbdrGB0g0FD/Pg6UyZ/PBxf7g
 zarsL0i79IbdUFCQh+Wv9QR+AxfOcif2GPv6dkJMdEXii+bjLoti/n66upGXMJW1fhrS
 nf4g==
X-Gm-Message-State: AFq9FYLTtODkin2wwjlj8hgK/zbMYDBIa+K6mtZun/UzNix8U38tiylq
 Fv5xFfRIBR8te19Hgw+7R9Op3YkpAnaXx1eSmsSCTJGVHxhs7ClZJMS00U/rKQ==
X-Gm-Gg: AYBFou17/Mv4/MDrCrTzSQbBBKBkteE96BAJr6YHqEho/mfYMEzFovxgsR46v56IcEW
 sjfJa91KhvO7JV4SHzrdBFy2Rv1dAg9DMoxfM3I0RktAg2SP/azcjsVcMtQN+L5LEfcmZsJL2xO
 IJGhuw7Y8Ot7NGFj0GxGBUIW//OkwCXue1jZUPUVC3hXWA+KwYzvoSplo4FnmPM26QvdIt5MYuD
 LWs+EtrphIavDYqJaKGxykT5LgsVfXI93M7FRGB/ir7si95DJxjnW6R4aF1wn65p3ChwiCOtgUN
 NskHpIfoet+eNJh0IX/eOqgbXfTfStfYoyxjZqQk01QI4L8k4RU0WYp4BFjE4vRm3bHmWnOKRiw
 UCVnjr5NCUDMcFXnxzqrkHvbSs8HaG1btT/6rQJ8bro+YJu38/dddpE1cLe1hmvKt9hsYOzoV5l
 VaYrHPvd3YAHZ8nOVcOtQFGr+gz2H4B8ulEciSCVse8Ab42Yya7Sg02LakLY77q0bCAKPQquT41
 AVaXrp6tRnb2UDqr/Uwiou4XStO3QVF2Bipi9GFPk9/QmRX/t+/5RX+piUVEkh7MnL6u1xce0h2
 p5obDaN11/wV5J7w0u9yJLr/KUmQY16httFP8j23zXKIwmlJddJl4DvrJwI/yi4h/PEgifHP30O
 m1+6WgrqJiWP/3jTo6RsS19x7V3hs0veFYFpbndD/WJQyX+DXnIY/h2g=
X-Received: by 2002:a05:6808:1715:b0:53a:9d3c:caad with SMTP id
 5614622812f47-53ccc475cd6mr4061818b6e.25.1792347915356; 
 Sun, 18 Oct 2026 11:25:15 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:44 -0600
Message-ID: <20261018182507.536698-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-distlib: bump to version 0.4.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index 8504366a0c..f1aa34beaf 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  6a6a1389a42f24634f06ab6978d5d96d  distlib-0.4.3.tar.gz
-sha256  f152097224a0ae24be5a0f6bae1b9359af82133bce63f98a95f86cae1aede9ed  distlib-0.4.3.tar.gz
+md5  027419d731f53771b20d66578c4abc13  distlib-0.4.4.tar.gz
+sha256  ca4175b4ac7f71223cc30ed7248c45d2b38c2439d8ee6e498ab67ed63cf3508d  distlib-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index 581c4ee4f8..2354d8bb33 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.4.3
+PYTHON_DISTLIB_VERSION = 0.4.4
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c9/02/bd72be9134d25ed783ecbbc38a539ffaefbf90c78418c7fb7229600dbac7
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/68/bc/d36966de7304047a1001a7559fbf266c464bb5d8cc85464536ef8c9bcc32
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
