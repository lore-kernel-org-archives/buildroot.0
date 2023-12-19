Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7AEC41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D68E343598;
	Tue, 19 Dec 2023 12:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D68E343598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LplgfuAww3Fa; Tue, 19 Dec 2023 12:15:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E28C54359A;
	Tue, 19 Dec 2023 12:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E28C54359A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D53FC1BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9369605EA
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9369605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IzwhQ8mrBrez for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:18 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D105860E7D
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D105860E7D
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-553a45208ffso607865a12.3
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988116; x=1703592916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eM8Xq7o4z3MnrPjoX3xkAjTPXZHrEU9LYISPjM8m3zk=;
 b=FkM00Tz81rj+mmRgwyzhI1K/0X0dQpoLMNjwpmBTfF3L2dBpdRYmZkjRUMLfJXKLUW
 H2Xo1HJIsDwiBZtUEwPe6/wKcAVvSvTsoZjUvdLlcYUuQduGPdoR5BIPlpETW+cibmzz
 8G7TnD/XKcvaIxryYRYntKMJrz02WVQ4VCo0lHkrxj+JyGna0e1noWSRQ5HnTy8vqNfN
 jIQQEiR+LlQkZVtZaw5DJJocwqJpMqXw4NVTQb+fFgd6azz59kgqImRjYWYQqPS2PHN+
 Y33ht/OaMe8sNwPklPhtB45pFQu60UHRx7y2lQY8RWKQ49Ak4kCFDFyCL79GTbZJJfss
 1Awg==
X-Gm-Message-State: AOJu0YyvfkXtHWIDVlD+qnNWsQ2RHEj5tVfBU4bCgK5S9RsAtIh25UWc
 uxWDEB9kgAORw/Ah2mLg0nWchS4xQ0eQlrPmuvU=
X-Google-Smtp-Source: AGHT+IGPbiBWKUyeCbc44Mfu7ePNphLFRTagbj+3a6s2nEnppDShHLxa6Hg2kEe1DOqYaDQ45t8tdQ==
X-Received: by 2002:a50:c102:0:b0:553:81d3:e025 with SMTP id
 l2-20020a50c102000000b0055381d3e025mr416709edf.136.1702988115904; 
 Tue, 19 Dec 2023 04:15:15 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:15 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:03 +0100
Message-Id: <20231219121508.1695768-3-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219121508.1695768-1-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988116; x=1703592916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eM8Xq7o4z3MnrPjoX3xkAjTPXZHrEU9LYISPjM8m3zk=;
 b=IJh6jKQCogVbmOlwu9VCQWQcaxf3Hixg5coD3MNPKiePTvOKfK1+mtm4E7viSrfKA1
 NuwDTYm3J/gLcCOUGA0zM16d/lwVyklR0IYwbHUkRoO8aTBVAN2wuwaESCDyTlEvVa2V
 xDiJbzDOWzqjZ+VyuvUUVz3z+8TeR9AOy9akTK46b+kVvV+wDUdYVR9KA5sSKkNwcDtX
 vn3QSTYCHUAj/8bAFFilg9UvEnsQftl6P13F+t86Tnk6gnar9s14s91kecQ2Sjb4icW7
 gB+u32Cm6cvilS4qyTAbZa0y5AwJxawjxvLNSMaXLLLbnrAyySSKeawYyoBIg7tYQH3z
 JSsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=IJh6jKQC
Subject: [Buildroot] [PATCH 2/7] board/stmicroelectronics: generalise
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES regex
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

The regex was a bit too strict in which characters it allowed. Thus,
if e.g. a file name appears in the
BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES string, it no
longer matches, and we end up with an empty ATF_VARIABLES. This makes
the subsequent grep fail, and the post-image.sh script fails without
any error message (thanks to the -e option).

Simplify the regex to match everything except the closing quotation
mark. Note that Kconfig doesn't allow quotation marks at all inside a
string (even escaped ones), so this regular expression is always OK.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 board/stmicroelectronics/common/stm32mp157/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/stmicroelectronics/common/stm32mp157/post-image.sh b/board/stmicroelectronics/common/stm32mp157/post-image.sh
index 65809e46a4..0cf52f4564 100755
--- a/board/stmicroelectronics/common/stm32mp157/post-image.sh
+++ b/board/stmicroelectronics/common/stm32mp157/post-image.sh
@@ -8,7 +8,7 @@
 #
 atf_image()
 {
-	ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([\/a-zA-Z0-9_=. \-]*\)"$/\1/p' ${BR2_CONFIG})"
+	ATF_VARIABLES="$(sed -n 's/^BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="\([^\"]*\)"$/\1/p' ${BR2_CONFIG})"
 	# make sure DTB_FILE_NAME is set
 	printf '%s\n' "${ATF_VARIABLES}" | grep -Eq 'DTB_FILE_NAME=[0-9A-Za-z_\-]*'
 	# extract the value
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
