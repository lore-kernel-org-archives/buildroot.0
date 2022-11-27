Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D35C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69832410D0;
	Sun, 27 Nov 2022 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69832410D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oUB1XC6iHOPo; Sun, 27 Nov 2022 13:09:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E879410C2;
	Sun, 27 Nov 2022 13:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E879410C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73A091BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9F181AAB
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E9F181AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYfN5i2aSv6B for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40CD81B23
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A40CD81B23
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so5359123otl.10
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yWzK7EU8yE8xymo8f/sTWxOVH9jxJl0h8b8Pml8F0hU=;
 b=Sej+5FBzsho43Eytn2O1KhP/49N/1h6hze0w3s/oTlHSXGaPqfMrlcunRlFETTa9uf
 29Da7dff3+L7Bvd7PnzG24St0nejduIu2Me0zJGoKTWCa+xcTCi/eapdiNI/b6D1QVOW
 LJhKekVBp9HQpFNwq2CIyHnpBIV0k+Hw2Hhqe1rJ9vl2KEaNfR//nEzqnvQZIjO7djeH
 I0tsYuyRhbVQky9ucLUcXiLVHchq1ip0YvjC9Q3VhkAOZCLOEdGlnDwT1cPIliwVoSqL
 4rBkwaWkUrTUKkBOTHhNzXKEQYd/8RSaC2ql9a01/vwoWFlkyhQoYk6bs+HS0x0locTm
 81xA==
X-Gm-Message-State: ANoB5pmgb3IRxn5mXVJb8V2laRcPa/uq3SkPb4hvlhf1fxjU4WyceEcb
 91zJ2sVp31xUIXUu6jwv3MQ2RxTkA/o=
X-Google-Smtp-Source: AA0mqf4a0uaduzSeyzdRCMifzyrsCuuUXSh8prK2OO+55ra+tETxmCMo5lRbqKPbKYR8hxRZq9BY4g==
X-Received: by 2002:a9d:1281:0:b0:66c:da9e:e801 with SMTP id
 g1-20020a9d1281000000b0066cda9ee801mr13402721otg.333.1669554492678; 
 Sun, 27 Nov 2022 05:08:12 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:11 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:20 -0300
Message-Id: <20221127130739.1862398-7-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yWzK7EU8yE8xymo8f/sTWxOVH9jxJl0h8b8Pml8F0hU=;
 b=i1ESSzxyarEyS8wJ1Eyt0dEx9hzuPN9Zh5DarDJKiannLY8OJy7ytt/Gq6HW+zchHL
 5jfjFEXi7PyMsaYSRW5m+ygFbGGuVbGKc4O+joUuv95eQnqJjsr91LJrr61GcrRnfpvO
 nisoei61q7lpkmB7x9ddEAzpFjIwFe4FbXHYCn3c+uwK9RzHXuZWgMZwwnMQ8IBIQ3c4
 kfq2Ot5P17VjhKV2SSgg7zkBEt74DhfUanp5NyrLOCOF0JlzlwumZXq5ZlJa/SmYPR1m
 W3/R8Db/G7Huw804GadZiGTY0uZSCctoVyie87eUxq3CMtoNlT4yBoPqhsnszcl8wHf9
 M+lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i1ESSzxy
Subject: [Buildroot] [next 06/25] package/fwts: use ifeq instead of ifdef
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The conditional code using ifdef was added in 2018 and works as
expected.
But there is no reason to use ifdef instead of ifeq.

For consistence, switch to use ifeq like almost all packages already do.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Erico Nunes <nunes.erico@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/fwts/fwts.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index b208aa0c14..f04c7a848f 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -15,7 +15,7 @@ FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
 
-ifdef BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE
+ifeq ($(BR2_PACKAGE_FWTS_EFI_RUNTIME_MODULE),y)
 FWTS_MODULE_SUBDIRS = efi_runtime
 $(eval $(kernel-module))
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
