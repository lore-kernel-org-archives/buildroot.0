Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44475C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F21A940B76;
	Tue, 26 Apr 2022 16:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfpJ_56frhYg; Tue, 26 Apr 2022 16:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9DCC40B67;
	Tue, 26 Apr 2022 16:41:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4841BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E0BE83E31
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANP9IdpvatdJ for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:41:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79F0D83DF1
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:41:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e23so2041489eda.11
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scs5VqcfHQMtxTEFen7eHBJfpGC/481GBhBiRGd4DQg=;
 b=CkZhftnIsWJ9QHQDrNIh73SVQsVs1FXfsh6fcq9/5E+T/HaZXuLrVFIr4PJ0UeVdgK
 P249jCMADoz6ynUO0M1kvNNkVUrrMOCUB7iR8W5Wrx6kATOW7P6yoLA4psrplIWzs3gy
 8CbwnD5QaA7550zHsLg5LcvSNcai2x6DPIStbo4y70YS8hCQD+bX0aLGuvvwoSyE8J6S
 s+nPTIW6klHwRviaV3A2gqtZdR//HDUWk6bO/wxz7vmoXCtZgSMmxy40RatqPocP1Z1r
 rFyWKZc8MpmS2S6fHu+2iaVQEhtwQIv003ozxvljxsbYWGufscW8D3sGcUByo2ZPlIIJ
 cePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scs5VqcfHQMtxTEFen7eHBJfpGC/481GBhBiRGd4DQg=;
 b=LAO8Jwv+4arSzzTEEf81DbSUd3maaiMEYkItFVxRKVxcbJrokjrsYDkR8m/98UlGHa
 +jy9Lbp1PPKxuei6F7I0MDiJHwqDAQZxz3Or/Ahe6++ObpdnlS/+Kh92IZZLKYQGqtlv
 6EC0PN+elj7IqM/ksCdVQreNpH0qYVvmyBjMSpIDL/LMz37PaRN7Wz8gCo8n+uJMP2Jb
 kH/NKHNuBfxGj/doemT2E8Vbo07rgqSY3vMklLcefNQnKCOkYIU5Nge8lUzThd8PORfo
 Vy2IsGg8z8Rj6c9oc2Ikf8VmIHoos+0N504tW8H2RIvKWnNB7MO5xcp/Nn9aFgpXv4h5
 zxSw==
X-Gm-Message-State: AOAM531nfynP0jXCCBBIyGBK8jgA/80hw/df/Q0kGktbDVYa4EChKL8f
 ThQzw5IZZdYVSbaCMpu+E6uZFemdtUQ=
X-Google-Smtp-Source: ABdhPJwpw45Xb3Piksnd5EFjxESzfvUeemENueqiOG50nKakO79LmEK8DVPjrfox4nJ1BKY/IgvN+w==
X-Received: by 2002:a05:6402:50d1:b0:423:f4a2:95c7 with SMTP id
 h17-20020a05640250d100b00423f4a295c7mr25990038edb.91.1650991277762; 
 Tue, 26 Apr 2022 09:41:17 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906c18c00b006f3b99d29e0sm765261ejz.223.2022.04.26.09.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:41:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:38:49 +0200
Message-Id: <20220426113849.3544812-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/moarvm: bump to version 2022.04
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/moarvm/moarvm.hash | 2 +-
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 58e3ce8ac..31d91457e 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f93cdce6b8a565a32282bb38cc971cefeb71f5d022c850c338ee8145574ee96  MoarVM-2022.02.tar.gz
+sha256  ae06f50ba5562721a4e5eb6457e2fea2d07eda63e2abaa8c939c9daf70774804  MoarVM-2022.04.tar.gz
 sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index db336bfe4..1408f161f 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2022.02
+MOARVM_VERSION = 2022.04
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
