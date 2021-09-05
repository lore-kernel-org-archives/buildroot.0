Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFB5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:26:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207B860F3A
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 207B860F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD2540228;
	Sun,  5 Sep 2021 19:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOQX4EbFT0Ry; Sun,  5 Sep 2021 19:26:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B59FF4010B;
	Sun,  5 Sep 2021 19:26:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B84781BF403
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B47EB60746
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UvZ-z0MLETy for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 19:26:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2111A606BD
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 19:26:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u16so6503161wrn.5
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 12:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRN4dCKNCtiIXKZ/wKRmXsf5ShImsnlg1D4eJe90QQ8=;
 b=Q+zUDibGzyzoz3YwRDwfQGfcFONhWcEoXbJ66qW8IpkVKoymVGTwbEJErSgaYwNjMW
 ne9K8Y9hsQQxwOIJv2mpEZcd5qg/vVVG/+U3qGKN3oulzyrHZhzRIWGPAh9vaMESeTVn
 jdUdCSxDCMOBNPOQN1yZHODqQLHDk0kaVeTs+2baMLzEqEbciwoAEvit2OD5FLUbJGtF
 v3kKUQEFBHoWEOkGA3lEqnWT5slqfvuserdn2yrf6Qoh/5i0UwGyXjL6fxJMwvdUIIoi
 kROeUejm+Fsximv0xDfU2+MYBiCqHiV7S6vKSsYGCA+mJaCO4A67ihFgNK6fru27++sd
 znAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nRN4dCKNCtiIXKZ/wKRmXsf5ShImsnlg1D4eJe90QQ8=;
 b=HekDiqcNNVRQIiCW81fWcBitkBfVh/ABBpqY66UZj7vnNs5d81eUv7UJhCpyuMj40Y
 yJfLIMIXhnjz9qBpAaHe731R5hHsWRnoQYl1JDtrOpTf8aSK39FdLp0J92lJ8OjyMkZ/
 jwaedpI/nRuHjp3P14+BFDXEodgLsFQEVkf30m9qSXHXobPUHAFvzFzklq9AfP6Dnj8z
 AP+/SX5i1F8ZaNckXJ4VMZssBiX59Rz2SP8sNcwgDkxUkjWPfLoBD9KWZStkoPscRxPI
 WE19onZvo84KmDpyDrFRGI6m3YvtW3RcYSFFgCmqfU61Fc9x8KvvnQ/AqCogO6AOBmTj
 IgOg==
X-Gm-Message-State: AOAM530bxOiwe+264N/myElcOaHtm0G8weaARQenR0HslyoEH28GwBLB
 iu+Dlp2u+ROgLbRaENnzNhK9w6dZjIWNIQ==
X-Google-Smtp-Source: ABdhPJwkEc148Pa1N6g3e4rQ3O619JG4LARTE4WaSRB2kRVlCC62guuQVWeQ/JotVeTDgW8cT9EgKA==
X-Received: by 2002:a5d:4ac2:: with SMTP id y2mr9648075wrs.296.1630869958995; 
 Sun, 05 Sep 2021 12:25:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id v13sm5928646wrf.55.2021.09.05.12.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 12:25:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 21:25:48 +0200
Message-Id: <20210905192548.1378588-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_package/libiio=3A_fix_C=23?=
 =?utf-8?q?=C2=A0build?=
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

C# build is broken since bump to version 0.23 in commit
50b6d7d69f880e940d7c281c493a6a6694d6ebe3:

/tmp/instance-0/output-1/build/libiio-0.23/bindings/csharp/Device.cs(211,32): error CS0106: The modifier `readonly' is not valid for this item

Fixes:
 - http://autobuild.buildroot.org/results/a26cce9760c75c44ebdcf21dfb4a69aad5702de4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...rs-setters-cannot-be-marked-readonly.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch

diff --git a/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
new file mode 100644
index 0000000000..a665d48363
--- /dev/null
+++ b/package/libiio/0001-C-public-fields-with-getters-setters-cannot-be-marked-readonly.patch
@@ -0,0 +1,32 @@
+From 85bf9cd32138539252ed01c355cf766612cf47c9 Mon Sep 17 00:00:00 2001
+From: Paul Cercueil <paul@crapouillou.net>
+Date: Thu, 2 Sep 2021 11:04:21 +0100
+Subject: [PATCH] C#: public fields with getters/setters cannot be marked
+ readonly
+
+MSVC would fail with the following error:
+error CS0106: The modifier 'readonly' is not valid for this item
+
+Reported-by: Raluca Chis <raluca.chis@analog.com>
+Signed-off-by: Paul Cercueil <paul@crapouillou.net>
+
+[Retrieved from:
+https://github.com/analogdevicesinc/libiio/commit/85bf9cd32138539252ed01c355cf766612cf47c9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ bindings/csharp/Device.cs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bindings/csharp/Device.cs b/bindings/csharp/Device.cs
+index 96214243f..6c8c8f4f3 100644
+--- a/bindings/csharp/Device.cs
++++ b/bindings/csharp/Device.cs
+@@ -208,7 +208,7 @@ public override void write(string str)
+         public readonly string name;
+ 
+         /// <summary>The label of this device.</summary>
+-        public readonly string label { get; private set; }
++        public string label { get; private set; }
+ 
+         /// <summary>A <c>list</c> of all the attributes that this device has.</summary>
+         public readonly List<Attr> attrs;
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
