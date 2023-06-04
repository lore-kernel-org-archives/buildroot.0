Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC29C77B73
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 11:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE27041B86;
	Sun,  4 Jun 2023 11:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE27041B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uvp54GOmlPt6; Sun,  4 Jun 2023 11:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959A341B87;
	Sun,  4 Jun 2023 11:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959A341B87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE7AA1BF2B1
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9000A41B87
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 11:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9000A41B87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqFAuzoMykr6 for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 11:06:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2996941B74
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2996941B74
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 11:06:54 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so4733071e87.3
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 04:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685876812; x=1688468812;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uXFWYPzuT6mbzeXkLkKJUvkp+KmxCPDv8ufMqVuTTs8=;
 b=bHSQii1WrdOz7dmTp6oBT+uoEUVEqxA3qRPvYF3Uk/k1lGIBpa1TKAvLAlzWL4alW4
 gqqfO4l6DSexLGuPmHGh9pe6Mx6hJny7c1MuIKbj2jeVSXigupboKO5zz0vocTHjjJ3Q
 uhK9FgOA2tVjtvR5/0hRO/BDJ3ugyflARiD3AoJi402dJjzBkU78jpUR7LuhIT42fGBT
 HmtdelHou3lCb1eUvFSZlFmORTabJZIsMd18RG8hewTVulkPGXhc6dSiSTxWJXL0j2ew
 w2RolfxnRm5Rf3nQavAc4/MwaxyYZqVD0BN2kxDeKREc6GdLubzziqtaS7/koVb6Gfse
 ssbw==
X-Gm-Message-State: AC+VfDyR9IY/NfiEHN2LMhWLE1jW1oJHFWloyYFGOcqj3wfM78jmRCDE
 HsVZCRPm+TTLgBWYuMaOqcYRjxuR+fM=
X-Google-Smtp-Source: ACHHUZ5woYo0QmeHblsGtwNERRDEfDkF222xB1g/zZ149fgxkldgbchbsr9wGcxO+wElIHiZOEj//w==
X-Received: by 2002:ac2:5206:0:b0:4f3:a87f:a87b with SMTP id
 a6-20020ac25206000000b004f3a87fa87bmr4005884lfl.39.1685876811450; 
 Sun, 04 Jun 2023 04:06:51 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac25606000000b004f39bb71ed2sm748799lfd.138.2023.06.04.04.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 04:06:51 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 13:06:46 +0200
Message-Id: <20230604110647.3418706-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604110647.3418706-1-troglobit@gmail.com>
References: <20230604110647.3418706-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685876812; x=1688468812;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uXFWYPzuT6mbzeXkLkKJUvkp+KmxCPDv8ufMqVuTTs8=;
 b=TpOaeiQQM79hlcogy1fg9ryj/0mVqmrZ9XLYIVvNSXSCdiIrrfWXCopVVDNSgyulAB
 NQDCxaylFFAbU1J31J7hyJqeGhFB9sYJi0kvaeoNY0m72NLtqkiCIo/1HZdbcDFSUXds
 9MA+2ln8GVJXwR/PSjtrdxBzJZ2DBfWvEJg4uFskaaM61NUskDmbXmY9XH7HLoUhAu12
 jvrFfZ+QGZfphheFEOgCF+eTlz2Qw2B3PY+ik6WzbKXiuMzAJeFV848sNXyIMgxXsmaF
 GOtVOVYVHKoxE8FtCkcp93VIOESFDz4vHqvsj3fNhkJb+J4k8iNzfWUUTZknCHIj2Aec
 emKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TpOaeiQQ
Subject: [Buildroot] [PATCH 1/2] package/ssdp-responder: bump to v2.1
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

Upstream ChangeLog, summary:

 - Add support for JSON output with 'ssdpd-scan -j'
 - Dump received data from devices in 'ssdp-scan -l debug'
 - Termios support for disabling '^C' output from 'ssdp-scan'
 - Update copyright years, LICENSE file hash change
 - Source '/etc/default/ssdpd' from systemd unit file
 - Add fallback if '/var/lib/misc' is missing on system
 - Fix truncated UUID when reading from cache file

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/ssdp-responder/ssdp-responder.hash | 4 ++--
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
index 8b4f3e4e45..7794c66643 100644
--- a/package/ssdp-responder/ssdp-responder.hash
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8888f2ac59febfb3b2473a1402041014052ad4dc1eeb4168c78aeca1692aae3  ssdp-responder-2.0.tar.gz
-sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
+sha256  75787cd9c0a88329dd39437eb28a188b54a3a0cab8472968e2713d90076f321f  ssdp-responder-2.1.tar.gz
+sha256  b66025f1e568a8d80264550d7bd7683780ac248f2baa1e85b4da4b15e28d55a7  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 20e7219386..ddd87bc599 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSDP_RESPONDER_VERSION = 2.0
+SSDP_RESPONDER_VERSION = 2.1
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
