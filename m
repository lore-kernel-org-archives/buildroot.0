Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61DBCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F5A60D98;
	Sat,  3 Oct 2026 02:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cicf9x2Bjdy9; Sat,  3 Oct 2026 02:33:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3F34460BD5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994830;
	b=r5yteuVMQQbY2ezss7BNSWY0NLNC4/mjy7DGCkVE2LX04uWwO2RlozeJpxehhkfvmzJU
	 U4ZpbozKmivZiypGDOIMs1t6+CicEOignrU2ZSEekzSD7Usczfj+MrfkyZxPi6zMPDiZX
	 ZAAnXJtF9Go0y/VomBK1lk+a3W9Ozt4dLfPwAAXsF+zcr9RKbq3iDa6WBd73Ak1PlEJll
	 HaZ7Oo5vi22PnefPZVuSDyuYny2sgYisEtxAJTD7uGSKm41Ru846hlUkurAKM5gfmx4aR
	 RAJEQbX5Rtpbpl7znxUJDOyqnuCVAnTZvKhxNytn16LfY3JUMRNHLHFDZ46qX5e4pWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=15oR9JxEdB0K4wAmywjInPJl1F63muhUOZsndwPcUkQ=;
	b=eze7WpibgboMv+1vCrSSZcrU9dZwpzzO61vjT4+lpLXVtrKIUEQo4nK3ar17ixP7sXqX
	 EW+37FujSJH3ohlxiGcjC1YkJc0APtY5QiqRgS2U3I4m6Zqg27A/lap7NQJIZrKaq3cVg
	 W9gmuKwBW+ci9Y6qTXuQ/Ig9eQHtT7NX5iNlWvBwlwJM1KQYgy347GM6aI3v/+7jU4NHT
	 LvzocgzSH9vOBmE/c0Pk4aKrKzTwn4wVQqGLx1eDXbquZyt9pEsJk/DmHKSGD3Yklutf1
	 MI2X6VMcbDZt48kMNumOZEx5FYGvOHB/03KRcc/ma9lO/9bRRVf6B5dYEidtmNGcPQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994830;
	bh=15oR9JxEdB0K4wAmywjInPJl1F63muhUOZsndwPcUkQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sPLHahPppIboM4DgOC07xYmF7Dhtuqjb/s8gR/bVpxktsiupAEwOndD5BaAAT60Ne
	 nTqn8aIDyKWbBHpHcD9VUN6gbLkp647cQlPv5Gs2bVZaL3m/YItExBzXRof4t3pG8l
	 pLIuHGXYj3oN6+PTQPor7r7208BEjo3M9A88MvH9U+T+D6+Ux+9KMCMvCDostSZNJ/
	 AJFwdG7kx04tuuhPyrRPNP1GVEasj8X/FzBNRsGhpiRX7aKEdqqs4ucY8WyyTC8Gfb
	 bK7XtxV0EUaqLzDTSKu8ix/0Pi8I+gTghcomnmv4n8kKC5f9n6LIqnlBaqmwtzw+U4
	 JRGLXu0RhiDoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F34460BD5;
	Sat,  3 Oct 2026 02:33:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7403E263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A39C40070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHXegMFYMHRm for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:33:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 41ECF40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:32::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994827;
 b=b2lgddfFZ/Wk+SIcOd+xmID+43ITrC2enZhEOSy3sbRPzVvZdhvRvaEoJfYNn809jDTV
 d+OplUKMDGI4U5jl9DyQYuZ4TnB/V1HJKeRBTmcaDNTXDbSF+K/fElqbC/g9HXVZz8KPf
 mjM722oGDg9WXwhRO9p7blZUec22xBxF3vNu4kbpmIT7HXGqQ62fi9JzEJDkiM8iwtRv5
 Z7a4LweVHsFwtp+Em1SIxTRufgHEx1V9n5+f1C2nDbL91cn15x8TH54uHC4CqIGWNe2Zw
 8cqNpQxgMecduk5zMW03I0IvD31llaJsWewOkeYFLbyQeK1GDQXVu7gvnjLBjAJRvfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994827;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=X3iYJdjGBPs3k/I/eMdm7m79ue+p0FNrpQA9Jz116rQ=;
 b=Jso8F2bydW5UFwM7gbi4ClDKoa0UJQ7iASCijkkm8FCGeLUUYU1vJrtmmpLJd/gSnXVk
 scp8vmZWhXgdmxo2Arc4Dg0aLos8OYm3gOJA24GGacgkPfJFo/3JRJ/kuiGmrQz1jWHbN
 SakvW+1PBRZ2dFYptzD0hb2lXBv73ltLp24ceW7LaQ1u6eAib3utREr71/UdRbRhSzKwQ
 7RSKjcUpp8EhsbVwzC0W9BmpaGlpCQEhzphNFO+xVFugyrdXuIBmrb6/aEDwAUZ7QXRoc
 +RbfNwxEUtarW5owC+rW94RIZ2bn5K1SPYuaSHWjb1fd2GyTj6VjQnT2ZM8y55EEywg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jQSiK4CU; 
 arc=none smtp.remote-ip="2607:f8b0:4864:32::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:32::11; helo=mail-oi2-x11.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jQSiK4CU
Received: from mail-oi2-x11.google.com (mail-oi2-x11.google.com
 [IPv6:2607:f8b0:4864:32::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41ECF40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:33:46 +0000 (UTC)
Received: by mail-oi2-x11.google.com with SMTP id
 5614622812f47-4c206dc8adcso15879b6e.0
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994826; x=1791599626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=X3iYJdjGBPs3k/I/eMdm7m79ue+p0FNrpQA9Jz116rQ=;
 b=jQSiK4CUTTK6S4wLPS25Nu4Ho+44oqPw3xID8ODfCHA8JvnEeAn+iRekaOLr6fuDAJ
 6xv5oRlWJtFepA+WOjvwD1ylC/Pk6vJUk2lO16D7m105KTig5GkHgWa+9DUoZzsKqBya
 XMqqwb5GDjRklkNMB2VFcmxgy/Lgeg90SVNwEn3at3GZAWiN/28yIfZCM0fPzs3gif7c
 aUH6yDmK251aK4IZeCRvzOM2QiHU7Ns6cU06vMHXhDUgZlQwjuKu3A/WiAbsBe12lTrv
 /0qkUEHK3z7zLz1bu3O+SnFJjYz4fa/+2k/B5J0u8A/hISDcTnuvTTveZ0abfR2iwDXX
 FZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994826; x=1791599626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=X3iYJdjGBPs3k/I/eMdm7m79ue+p0FNrpQA9Jz116rQ=;
 b=Jz3Jpc9JMwBGESCmvWRetbtpfIvp/ixyM0AYQJj8dqCttxENzk29gxFRgiz0QI+uBV
 3/+QmsOheKny4nn4hmol4BshLMkMLs8vlpNo5O2h5svYTjOdBdy+/sCfOBu3BDYPOd6m
 5KqrncC3A0fPw72IHeLyZvEWQQrZMRYrZ06WAiSkax+BfpRv2mz6k8VgRkwKZ/Kl3W8a
 B7nSjCG9HobLp0VEVhzf92z2Ol4qxZCFEvQJIHClF2xTN2kXC6wtN0HGiUzUIbNIXqNX
 SMFybRAw5icMRv/kINXaLhe2XFWtY5cfXGbiSd9w2sWJfJGaJnUx6BIpfbuOFUek/xgD
 aQpA==
X-Gm-Message-State: AFuF++nplXtHhkUzi/NlOgi67BXjNaqg95fGxiVV2Hgn4IRmQ/PdYm8s
 trGU4x/vOE4a9DPdWOY76voL2tvDHOFj5dZvmlJ4qFqox6psZ39W0JZZ9KNXpg==
X-Gm-Gg: AYBFou16Mxo5/yRHOaCqU33L3nIE2WX22dtK+dxg/VAeG7YwaSH2Gy3/E7EJOizDhm2
 q2h9OzERV38+KH3PaDm/00mUjKmSoE48C2kl8GlKOwl5N9LtqBBQ4Cz1DubDw/JM9tlzrNFKFPF
 GX8oQ+C3bxWleg/U5GHuAgf68igd41ynblA3WoU3kU5IX8Bvz4WlqWpfB+7ImNly8MMmxPlrelN
 11dNv/SAl3v3rf+63VuJV7iRf7nZOxaitFJDQtPv5IiLiHickdwvVv2NC4V+PA5wxu/Xb0M7Hoe
 LQ9eKOCdW8IQ76hR/0unFSgpUCgs1TauL9MCjwtvxWQpx4oW0FwiWsV6wU2al1b/2V+I6Lh7UUO
 yuaCD+CmGSJDd2AF1NeCCcKKgC/xZ0n2Yq1nTKEylwlpQox6Rh/docAUxUBEJIsCsA/14oS1ean
 35IypM4nMXEFn53m2gGMNoUjeC9ljjg7qozhkYWveNlnW12HVmt1H8vKk7tm9mzbApMlIozqVkI
 nTUCzHjr0PfVcBGgkir6RouzsXqWooW3Fa3wTahlFV8Sio0Ox0RIach758ozqpvM7wh0L0l41c4
 laE4PP1uCNAcLHbazzGbRqZect/MWgDe/NQBjhDwQcgAMJVkIlF99l7JRNPcfuXwI5x/7e8Wy3z
 f3CmYBE9eu9/XxaNbhkb+nCvO1lHrRfSVeNpqM/d3vzc=
X-Received: by 2002:a05:6808:f89:b0:4d3:6be7:c64a with SMTP id
 5614622812f47-4f523977146mr3124858b6e.0.1790994825729; 
 Fri, 02 Oct 2026 19:33:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5249d7c75sm3936069b6e.12.2026.10.02.19.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:33:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:33:41 -0600
Message-ID: <20261003023341.454213-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003023341.454213-1-james.hilliard1@gmail.com>
References: <20261003023341.454213-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to version
 0.142.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-opentelemetry-api runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/Config.in           | 1 +
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 01163c60f5..dcb403e385 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
+	select BR2_PACKAGE_PYTHON_OPENTELEMETRY_API # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 3882212eed..df667dca2e 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5e22f728ab9ea5c99a29a0137b4b8b55  fastapi-0.136.3.tar.gz
-sha256  e487fae93ad408e6f47641ee4dfe389864fd7bec92e547ea8498fc13f43e83ab  fastapi-0.136.3.tar.gz
+md5  8cfa79d6d32628b35a90ad95d4ae14aa  fastapi-0.142.2.tar.gz
+sha256  06366626f2e70576367714d9ab2fe8472e6c8456dba69b399f9f797ab5e92570  fastapi-0.142.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 60e0a83369..aeed93022f 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.136.3
+PYTHON_FASTAPI_VERSION = 0.142.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/81/2d/ff8d91d7b564d464629a0fd50a4489c97fcb836ac230bf3a7269232a9b1f
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/56/4f/f7c30a73127e0a8bbffe788369b8359e530b01ae06e2757936fa35bc5e6d
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
