Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C93C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 22:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2BB460F8D;
	Sun, 19 Feb 2023 22:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2BB460F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ZwraFTYWVsF; Sun, 19 Feb 2023 22:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2231260F7B;
	Sun, 19 Feb 2023 22:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2231260F7B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 948D51BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D95B41635
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D95B41635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCUbRMWQRZN3 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 22:20:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B4C1415E7
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B4C1415E7
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 22:20:56 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bp6so1902158lfb.0
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CfL7CS0fUHC4ooSh6QS/HUU46Z1apvUlDMBmm+UFiE0=;
 b=h2rCkgKXVbBuHAvw+VixO3SkYC678MSOE8dNG5qhZF2SssBKJPLPrvmOIw4TqKvubD
 NEE5iZRqAESjYDmtfIXMxMbt7fSg1CbM91w3gjGV5wtnZ60v9MYHOT/KknV9KtIj82Wt
 e4C64c8iDN48xQdY6/SuihOznzT/77lni1kDfulAGwpo3dNdCRC9DLdbanKQkKMLQIUr
 4HQsV+e0MCdiIKTylwdA+lBvz7Gu/FSNp47vZmZnjPKLlaTfsiZxUO0jkGdHrVzSr9QT
 qnyiqyxKUlv8XwKAm1Qk/Ul/bjOmYeXvTPShBoKJjAPNThbSeMQfuBwQFDq9rH3ucFc7
 X+PQ==
X-Gm-Message-State: AO0yUKVgeSpzluJD9DjtEnwD1ZJx2/tKIhOpqstzoOfVAVhqtrm7ojLu
 XEPnoyFk12aqMNBnj08M1paG86VZWlQ=
X-Google-Smtp-Source: AK7set/hxeCaN6Qhyq+JfUqm138t0yLUMDmX1LP9Pv1NLnECy/9dXwbzH9imY2xvh0wp0lW0Ral8GQ==
X-Received: by 2002:ac2:46cb:0:b0:4d5:a689:e53b with SMTP id
 p11-20020ac246cb000000b004d5a689e53bmr528870lfo.27.1676845253534; 
 Sun, 19 Feb 2023 14:20:53 -0800 (PST)
Received: from luthien.lan ([98.128.186.100]) by smtp.gmail.com with ESMTPSA id
 u6-20020ac243c6000000b004db3900da02sm151498lfl.73.2023.02.19.14.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 14:20:53 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 23:20:47 +0100
Message-Id: <20230219222048.22093-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230219222048.22093-1-troglobit@gmail.com>
References: <20230219222048.22093-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CfL7CS0fUHC4ooSh6QS/HUU46Z1apvUlDMBmm+UFiE0=;
 b=BdL2I3qidboTAJfmZb6SiPkdPuKxl9FMt8SEsazKlaPqQqvWqm0LNUhRu1wdQM3jJZ
 QY0yxfuHogfydijgpris5oEG6wpA8iEYIT/bhJRFjbl745IKacCy+D5YvDR4RdVoQPnL
 wp5RjWdhhknTDMw8xka01MalI046vB5Hnm0v1VINfA9R3bBO69GGO4yLu5swWa8LYyDm
 E9I4Hg9iifQwMlLgGEMtNu+9Ye8c//+opIyRdCPMlOCjkc23Z8Vr1W1gdNdOAyVWIbEb
 +Q3oDNxLsUWY2p5ZaTtzeRPtY7iOS9Z2AiU2q510MnPtXz9k5qdmtB+3UvNs4MdOAhl0
 Retw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BdL2I3qi
Subject: [Buildroot] [PATCH 1/1] package/ssdp-responder: bump to v2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ChangeLog:
 - https://github.com/troglobit/ssdp-responder/releases/tag/v2.0
 - https://github.com/troglobit/ssdp-responder/blob/v2.0/ChangeLog.md

Critical Fixes:
 - Fix periodic busy loop causing intermittent 100% CPU load
 - Fix invalid <UDN>uuid:uuid:...</UDN> in description.xml (dup uuid:)

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/ssdp-responder.hash | 2 +-
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
index 425ad86e08..8b4f3e4e45 100644
--- a/package/ssdp-responder/ssdp-responder.hash
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
+sha256  d8888f2ac59febfb3b2473a1402041014052ad4dc1eeb4168c78aeca1692aae3  ssdp-responder-2.0.tar.gz
 sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 5193966908..20e7219386 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSDP_RESPONDER_VERSION = 1.9
+SSDP_RESPONDER_VERSION = 2.0
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
