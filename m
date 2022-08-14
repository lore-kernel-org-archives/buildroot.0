Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47606C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC3E8404BF;
	Sun, 14 Aug 2022 23:41:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC3E8404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nOUFZmptAF2; Sun, 14 Aug 2022 23:41:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2611940490;
	Sun, 14 Aug 2022 23:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2611940490
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82DAF1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B1BF81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1BF81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 43enT4Nle3oI for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B605381BF5
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com
 [IPv6:2607:f8b0:4864:20::a35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B605381BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:45 +0000 (UTC)
Received: by mail-vk1-xa35.google.com with SMTP id b81so3012931vkf.1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=JoszYzRXFh4GRloD0N7MNlZu65gw+mT+9XbgRjLzErg=;
 b=6U/qn7R3kYizM/NrlRaHw4Rs40k3L8Q6T4xXJBYkqAtSOkU/Mlbn7183qG7fUPuN+8
 mnvbc4lQoj1R2KizeyqoYrzcM2j4slOY8VSuew0OQPsYGmQC0O7CFkzVU54j/HD3MTUp
 DA+S5JMlEQxoDxlQKLcQiBq9NRp19fFQKH0x+j0YAzopRKM+XlXlMViVcNsVU0oTV8vG
 4cmUp60nxmvcBuxNp2ewJDVCkcmo8K9lgWiLoMLzwFax+/5rEdnGe2yqWxLo159MoCIZ
 xWDzmeiAOrosiF6O3w3BOrDYAxBCy/CBsq3E8bJubfMaLLyHCiPxFGsU6qszaWat1/jE
 3N1A==
X-Gm-Message-State: ACgBeo1o+EkLbXYVB0P0BNk4q26PwIU1nq/nurWdxojJGRvtGJCdCg2w
 3DiyBsEpnUeiSwpgA0509TxvbWiD9Ug=
X-Google-Smtp-Source: AA6agR6ZwSZYnOsujRZ5nP+awfDY6fLbfuRAglUE14/JIU/pbP5pBJLaTo4ytnGtB83mQ7S8GQSh/A==
X-Received: by 2002:a1f:a958:0:b0:378:d584:dd0e with SMTP id
 s85-20020a1fa958000000b00378d584dd0emr5650927vke.17.1660520385363; 
 Sun, 14 Aug 2022 16:39:45 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:44 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:23 -0300
Message-Id: <20220814233845.2247022-12-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=JoszYzRXFh4GRloD0N7MNlZu65gw+mT+9XbgRjLzErg=;
 b=REp4Y9Bi/myv0ZyS7cx2cIQt58Hs/0YkXcYdJwQE5RY16fdJd5Adc1VskoydoJyZ6t
 yjG3tRVCHbcEu6sPRFDcIc+aG62e5Q0O9//cRzYABDEG6bwI4SDel6+zkCt7s/+2cwPC
 rvCp2pBV62cY84Gzs9MhC0Bnu8x46uAFMk0QWiE5UFw3iRcWTvffYfknIBoPccVlPlvp
 fCfCAN2fc39yDv7MjmoWcFubQlGU/+mYmOCMM843+WglE4DzgEHxVfblEb2WA95OnQPq
 /F2zjymkK/Lxjc3eqhY4SlfbzPJQHNYieeHMoDSqGrsymr6muRKScS3uRazUUt2k9Lxy
 qWWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=REp4Y9Bi
Subject: [Buildroot] [PATCH 11/33] package/uclibc: drop old SPARC symbols
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_sparc_v7 was removed in 2013 in commit '16bcf46a63 arch/sparc: drop
old SUN-specific variants'.

BR2_sparc_sparchfleon and BR2_sparc_sparchfleonv8 were moved to legacy
handling in 2014 in commit '43b78e7285 arch: sparc: Add leon3 cpu type
and remove sparc{s,h}fleon{,v8}' and later removed from legacy handling
in 2020.

So drop the remaining references for these symbols.

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/uclibc/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index ba8b5885ec..2555487f06 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -159,8 +159,7 @@ config BR2_UCLIBC_SH_TYPE
 
 config BR2_UCLIBC_SPARC_TYPE
 	string
-	default "V7"	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
-	default "V8"	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+	default "V8"	if BR2_sparc_v8
 	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
 
 config BR2_UCLIBC_POWERPC_TYPE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
