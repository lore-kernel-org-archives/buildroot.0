Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D674ECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 21:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CABB417E5;
	Thu,  1 Sep 2022 21:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CABB417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iR5ai9nS02s; Thu,  1 Sep 2022 21:24:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5210B41773;
	Thu,  1 Sep 2022 21:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5210B41773
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06FCF1BF3C9
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 21:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D696781BFA
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 21:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D696781BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBmW_XeGkg2p for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 21:24:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 730C581BF4
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 730C581BF4
 for <buildroot@buildroot.org>; Thu,  1 Sep 2022 21:24:27 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r4so330344edi.8
 for <buildroot@buildroot.org>; Thu, 01 Sep 2022 14:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=BYHbrcmOKiOg2WKVVcNw+xEADtDpXOpV10rlPUFecjU=;
 b=C2GZL+3j4nyON36qbHf9DNZlzNuq9MYOgOSYcyC9cpTfQqOJ3NGJ7aGHJgm+wzBxx0
 xVcBL109mCZrxPpvyS4PTm25Jpo0m6NgEmI7cg6lr2SX/twWcLlY51BdgZuhZQsEdco6
 oR6/7J0+5H9H4EPW3L7zn05bX+omt7KzaHcdTdlOvty+OOlKZS/0ScpZ7fS4p+8NrYOv
 FzDzJ4CK9OLBbb/MtzaPc1HfBsoYwkGhmlSflUpR1Lz16jmcE2mHGyzy6S0vDBUOqfKW
 bZzw2ZxwHfOCHaI/5IV6pwaOr1/PoliXBHvOlGXD3SJMrhrODbA6cFtunRIgOFZI4F2T
 sr/A==
X-Gm-Message-State: ACgBeo2ZBR3WlrQniGTs1Y4GSgDByEa9k97B1Vz29j90Zp9hY1juRGdL
 SLMyOROOn+E038wRa9wxa7r8985kSQBobw==
X-Google-Smtp-Source: AA6agR4sOTTWdfuUa6k3yl547JR0UL0rWFiILijw4mMAKArgA+C8BDofW1ELKChSa9Ghsx3mS7Fk2Q==
X-Received: by 2002:aa7:c84f:0:b0:446:2bfb:5a63 with SMTP id
 g15-20020aa7c84f000000b004462bfb5a63mr199340edt.172.1662067465419; 
 Thu, 01 Sep 2022 14:24:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170906305500b0073d6ab5bcaasm156296ejd.212.2022.09.01.14.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 14:24:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  1 Sep 2022 23:24:15 +0200
Message-Id: <20220901212415.2737731-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=BYHbrcmOKiOg2WKVVcNw+xEADtDpXOpV10rlPUFecjU=;
 b=edolYcKELl6mIsQ/vAAWc+nfj8NqLRErWaPWlzMeIwc+JtDJTABGmqiPv09RqMeMp1
 RtdF00OnOfFC4YGsZTlNY9aCDucehmqD2ZrVk5UIM/YrQEA1t1LSLlXPVfcDtK5uq6AA
 NtjH98wFMQC0i932Sr7rcUScjugjTIswyT4f4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=edolYcKE
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.4.243
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The hash of README.md has changed because the link to the zstd license
has been added:

- ``
+ `- zstd (Dual BSD\GPLv2 Licenses) is from https://github.com/facebook/zstd`

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
I have already submitted a bump patch to version 1.4.240, but before it came
to mainline, version 1.4.243 was out. For this reason I submit this patch over
version 1.4.224 which is the one currently in mainline.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 4 ++--
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 7291f93c523e..de00c649b12b 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
+sha256  9fcfe317c379be1e274aae34c19e1fd57188107f8fd0cdd379fe4473aacc92b1  uuu_source-1.4.243.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
-sha256  52b1828ddb508a180cf9ad159b61e655c72dfb25ffce67eb0aef761d38a4398f  README.md
+sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 647254446fa6..7ed2599598c0 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.224
+UUU_VERSION = 1.4.243
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
