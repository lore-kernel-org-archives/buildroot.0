Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A226EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5268560ADC;
	Wed, 19 Oct 2022 21:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5268560ADC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPDaYEyqwRlX; Wed, 19 Oct 2022 21:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D28360AE1;
	Wed, 19 Oct 2022 21:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D28360AE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0B7A1BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC7824016F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7824016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_k_k9iwHB3v for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:57:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA2D44013E
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA2D44013E
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:57:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id u10so31306270wrq.2
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yrH18fxtmXp36CbVNMyQqqX6JDESyhW548/bLkhLPC4=;
 b=Z/m6CbGCKIm8HA5WY55mXwQE93RETzZYmkFP2+0Xb/NPZrKPS7SjCT5cvLh5AZqEZJ
 SwyqseKeTWnTxGx81E7xVnXFYGIbyLf1uVj1jGp92rIRsrabM/7CItEsbe2NDMJZvNmw
 YL+yBP6v8OKvt8kgKzkUkwHAnYgBjtrdeXNnd6sHTOI5O49f5STS3pDdkC6vcN5MsHs2
 YrNTCUGzzbjptbeh6fpG+eWbZip0Vp6099QXuxxz2dKvcK2CQcaGH+btqEt8DwsdytA4
 kJjmMRmk+KSZZY3Y0FcncyfNjwf3r4HWUeDb6s+iSOKAuipmkTW/dGzOwystnMxODLB1
 O/5w==
X-Gm-Message-State: ACrzQf1rJVRDLxvoEGJGtX1++Jue/i0cniiNwzY//1WCsvIEVmzUZyY4
 HIM1YuyADoLZGdunaTyuvnPyS5GkGETNWQ==
X-Google-Smtp-Source: AMsMyM60cUhWKIX29pHKClYAM5oKJAAl5y5qDhsod++xi2D50RrSKP77pZUNYDrBqUBsg472ljwoZQ==
X-Received: by 2002:adf:e586:0:b0:22e:46f5:ed6e with SMTP id
 l6-20020adfe586000000b0022e46f5ed6emr6370848wrm.420.1666216674011; 
 Wed, 19 Oct 2022 14:57:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:8478:6e00:efb:6496:4749:9d6b])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b0022afce9ea93sm14639315wri.40.2022.10.19.14.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:57:53 -0700 (PDT)
From: Oguz Ozhan <oguz.ozhan@mind.be>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 23:57:41 +0200
Message-Id: <20221019215741.2854410-3-oguz.ozhan@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215741.2854410-1-oguz.ozhan@mind.be>
References: <20221019215741.2854410-1-oguz.ozhan@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yrH18fxtmXp36CbVNMyQqqX6JDESyhW548/bLkhLPC4=;
 b=a8grWJJBeOpLZZE+0n3T9dVKrFQbu35IEbLbliH90u2+zjyPMzmoLCZpcUJP5jMyEp
 TLq6gh/n1IEP36mOg+6CKChmSR7QNh43rScPO/XRgsaFoXWuRZChRMlwwViDEl9Kc/zG
 Lt74cldzfaDimuVI+uNft0ZSwIonqB+MqWngj8+ieoB0x+7Ryx9lQF5e7HS+Vq8ZS5op
 O0SlAOJicu3wbOTz/lN7lYm0njHWEHvcu5qkjaXZi4Cw3LK4NL3L+6+fis/i4YQMPnj9
 hEv33A01mIoJhirCrS3unRtmhdPyWTHaMOo69z66jFi7TXiR2ZRGV7SZGT2JH46qogNr
 lnDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a8grWJJB
Subject: [Buildroot] [PATCH 3/3] support/testing: replace nose2 with pytest
 - CI
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
Cc: Oguz Ozhan <oguz.ozhan@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
---
 support/scripts/generate-gitlab-ci-yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index aa43aac019..bb4dcbbb22 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -31,7 +31,6 @@ gen_tests() {
     defconfigs=( $(cd configs; LC_ALL=C ls -1 *_defconfig) )
 
     runtimes=( $(./support/testing/run-tests -l 2>&1 \
-                 | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
                  | LC_ALL=C sort)
              )
 
@@ -80,7 +79,6 @@ gen_tests() {
             ;;
           (*-tests.*)
             runtimes=( $(./support/testing/run-tests -l 2>&1 \
-                         | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
                          | LC_ALL=C sort \
                          | grep "^${CI_COMMIT_REF_NAME##*-}")
                      )
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
