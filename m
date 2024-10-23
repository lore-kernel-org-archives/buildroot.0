Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB2D0BB41
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB97401B0;
	Wed, 23 Oct 2024 22:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gkd5-xD_S-Uh; Wed, 23 Oct 2024 22:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B2E406EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B2E406EE;
	Wed, 23 Oct 2024 22:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7EDF972
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B508540A78
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XC4QmwiaSGcA for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A41D740A6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41D740A6C
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A41D740A6C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:20:14 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a3b6b281d4so1578155ab.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 15:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729722013; x=1730326813;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nE7mq0ovOglduAXPdP2xTKggErhb96dESvnLdX/uQ5c=;
 b=YosLbb0g9yEbZdzwMZP4PhWY3nMwTBX8Ys1u01S3bx05r6+Ar/NSRKU6VBSa05P7uD
 EWrSA89ri9NYTgD2/0m7WTJs+jppNEMn/4QNOQFznSw95rl6QRsvj3RXMzgA4rj3qqs8
 4V3AQZe0XNJfMMhipm6Klb06gFmt0dvMuLMM9+MfIJodyYeNtgd0LSjYjYLTcKO5t3GC
 /5cI8pBL8my6qQacZdUDhP/+ZyCSEtE5WF2ZurO8MCAgjdpUjbFoKkVmJ376OoWqeMEz
 DvqjsaJm/ND/C0bH5Ndr7ocmJ5g3K6I3AhHQQkCJkm7JEOZIEptN0zk/xE2n7syxN2Lr
 yu9w==
X-Gm-Message-State: AOJu0YzMc/Adut7PcPSW0cZHAdsWG9Hv6z/XugAkpgm8oIpZg3UcQTE+
 9TUuTgkjzqkdYDlm65t22cRWbH2QENp+FGh+AuYCQ0hZvH1BWK0qKCfrhg==
X-Google-Smtp-Source: AGHT+IEoQ6ujDWhHCgQPbaHhgcsQHQpsgdt0NyJrFMPZJHy4UJhmiIslSaQgxY7O7l++PyVOZRZjKA==
X-Received: by 2002:a05:6e02:12cd:b0:3a3:b439:5d09 with SMTP id
 e9e14a558f8ab-3a4d5982c4amr50359475ab.11.1729722013453; 
 Wed, 23 Oct 2024 15:20:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a66263asm2402348173.161.2024.10.23.15.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:20:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 16:20:11 -0600
Message-Id: <20241023222011.3331328-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729722013; x=1730326813; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nE7mq0ovOglduAXPdP2xTKggErhb96dESvnLdX/uQ5c=;
 b=SezAV5OmylkN8gBkTPbY8bIZPLrINnBW1//CoriZ011mp2L/lvUJrRFLuFpjWCwSDW
 TYc2LJxsrDFgc1W+uNOaG6JKX4pBNYWzVc59vD29pcFUEudfHNQagE9xbF6wMYZmJx+i
 0bHLWXH8LlK2+oz7ZqvRL/bLHjm20HmlGJy7ZY1SosvZ544raxZHIm4K9lbbp4d1cweS
 oQjLm4fiXA0F1X+DgPLRXFBkW8s9YNx/971nRDp1cF9mUykmmC7YtWzgFuvaBwvX07CY
 1MKtlySFCVUDurTgvNvklUkEKjHZQq0p567GJ/ihhtEV5fEBsY+5LkHXBXn6zQzUgW7y
 CrAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SezAV5Om
Subject: [Buildroot] [PATCH 1/1] package/python-iniconfig: use hatch setup
 type
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iniconfig/python-iniconfig.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 99e946f0ab..7c6cd14907 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -7,9 +7,9 @@
 PYTHON_INICONFIG_VERSION = 2.0.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
 PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/d7/4b/cbd8e699e64a6f16ca3a8220661b5f83792b3017d0f79807cb8708d33913
-PYTHON_INICONFIG_SETUP_TYPE = pep517
+PYTHON_INICONFIG_SETUP_TYPE = hatch
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
-PYTHON_INICONFIG_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_INICONFIG_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
