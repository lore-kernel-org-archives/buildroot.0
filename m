Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C7FC77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 15:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD434060F;
	Sun, 16 Apr 2023 15:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD434060F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id meBKcaznX1FC; Sun, 16 Apr 2023 15:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B0441BAE;
	Sun, 16 Apr 2023 15:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B0441BAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB4F81BF27C
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 15:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4ADA8207D
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 15:13:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4ADA8207D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyYVo_zew9Xs for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 15:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E919181E8A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E919181E8A
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 15:13:02 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fw30so5041958ejc.5
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 08:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681657980; x=1684249980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rhc8VauKrC330/NOSZMPXk2OZn4LRor1YlfbRqdK64I=;
 b=YOOUrCbbxCV+6DgP/HzcMupeJk2TxyAXlV+ssU8JYdcqT9Lk593tEPiG8gOBuhxoqo
 22PG7hVCRAbq/7nZ1lUcxx//nZfQWMAa3ai0Fhb8I03NMnmiP8xpxORToHGxQsPsajdx
 Hvu5kw4pF9/oNMnNLFBaV6sTBoScBdgOZQifximF87M0NABsaMxcSv1XNnIOCohdVDNg
 O6VXM/cwjVpQ+b02US7tMZ+EQt8T7gD3kIiulgSayhZfvKFrWDS0dddnNLk+FipTvLd+
 hioTDydfCQxKPLs+jPwxC2FDXbUtmELDxEbau4tsyqjPWCQpI83VLLm5ZpBQJsyDTaxp
 Mo8w==
X-Gm-Message-State: AAQBX9eegK8/7GeoPLyYl3xfEa0VYVKkr3+IusPYnjTQjwmdzgJTAoxH
 jwcqiD22VI3pOlOBgDXwq1ekq29iIas=
X-Google-Smtp-Source: AKy350Y/KUo5/RzWu3DdYTT/8ZnAPRo4noWeQXWOKEC5LbMBW8s/Rm7fF0g9xd52mJNssvVC36A79A==
X-Received: by 2002:a17:906:abd2:b0:930:f953:962c with SMTP id
 kq18-20020a170906abd200b00930f953962cmr4800608ejb.1.1681657980497; 
 Sun, 16 Apr 2023 08:13:00 -0700 (PDT)
Received: from goliat.isc.local (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 m5-20020a1709062ac500b0094a84462e5fsm5154440eje.37.2023.04.16.08.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 08:12:59 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 17:13:10 +0200
Message-Id: <20230416151310.2698912-2-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416151310.2698912-1-marcus.folkesson@gmail.com>
References: <20230416151310.2698912-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681657980; x=1684249980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rhc8VauKrC330/NOSZMPXk2OZn4LRor1YlfbRqdK64I=;
 b=KqLYCX5+q5vpViS0JJBcmO8bNettVQUI2smkaN8PE6aAfhlgk8k9F3ialb9tYoJUnu
 YbwVmDoHtiiTd0FrqIGVzWx5ZNfiaIZxJVUy7SXUXamicvINaOWVAc95ILfcglw4m91L
 EYhFyBQiwxuhAmtR5s49yW4h9zLrwtmecQ7XZzQjgbsiECIcuaJ/1rzylnZyM1Hupz2S
 UpxldQgoQ84QiiLztPq5SNZyYGhO34WFKd65Yec5+FsG2RD/28BM22d51JhkcGic4iRm
 /l7jHtOHbUS6vC5VKeSpsOqcb/CVviCed+6f/c75aYl4xlSHYAztw9FaMAWNjoF1D/Xr
 NWHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KqLYCX5+
Subject: [Buildroot] [RESEND PATCH v2 2/2] docs/manual: update pkg-kconfig
 doc about <pkg>-show-fragment
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Describe this new target.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 docs/manual/adding-packages-kconfig.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-kconfig.txt b/docs/manual/adding-packages-kconfig.txt
index a35681775f..b67430c85f 100644
--- a/docs/manual/adding-packages-kconfig.txt
+++ b/docs/manual/adding-packages-kconfig.txt
@@ -45,9 +45,11 @@ This snippet creates the following make targets:
 
 * +foo-diff-config+, which outputs the differences between the current
   configuration and the one defined in the Buildroot configuration for
-  this kconfig package. The output is useful to identify the
-  configuration changes that may have to be propagated to
-  configuration fragments for example.
+  this kconfig package. The output is useful to identify
+  configuration changes.
+
+* +foo-show-fragment+, Similiar to +foo-diff-config+, but with an output
+  format more suitable to be used in fragment files.
 
 and ensures that the source configuration file is copied to the build
 directory at the right moment.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
