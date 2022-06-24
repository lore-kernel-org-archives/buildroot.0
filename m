Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01121C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Jun 2022 22:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CFC5409EA;
	Fri, 24 Jun 2022 22:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CFC5409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REJ3Zw-bW9IH; Fri, 24 Jun 2022 22:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71A2A409E1;
	Fri, 24 Jun 2022 22:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71A2A409E1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 690F61BF86C
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 22:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 429B141BD5
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 22:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429B141BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAAobIV2jmx8 for <buildroot@lists.busybox.net>;
 Fri, 24 Jun 2022 22:19:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9C9641B91
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9C9641B91
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 22:19:08 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id m14so3234842plg.5
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 15:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KieCyPUs96SPEIHFVtsCi81TjJptm7FwFIWyeO9ugs=;
 b=BYl3jPYlt6a4WhsPOPP5kgm3DGpw0da3CW/sucKNVbSMEKRhaelTocOkAX6CwlodRA
 99WckBBMLhMN6F3/SIHzPwlQ9fjkogBDhsOM3lZWftV0DDcwK/LfQ2ptupEsLa/ykiYg
 hciIfJKEYg6x+boIBgwlrLAzdtmfW8ybfC2EjR1e4IpJdE+v3hwqCjbWSvtCoWvKt8Dh
 FI431iCVyjJmiMgN51aw5JlWgyCmQL42CG3AG7w4MBXCgPscBDEbXV6Vf9/9mxwGtECz
 OBqQK2Off/F55j+kcxTMvLQcR1zT3s79qjUsbdXmkflyHk896fO/L2uOLwNGSEsOjegI
 WwOg==
X-Gm-Message-State: AJIora/AupSVAB0wqpuGZs6Bfb3pDlEEwspWPhR85Zglm78JgX2FjdON
 YGsGn/qIyCx2Es//l7lJNL5LOw==
X-Google-Smtp-Source: AGRyM1ulwe50nSFEsenwhaEv+9c2yLN/BYIVGLkJpPRmqYfTttpjPEsGyuKqj+bkreIg27hMwoYjdg==
X-Received: by 2002:a17:902:aa0c:b0:168:faa0:50a1 with SMTP id
 be12-20020a170902aa0c00b00168faa050a1mr1236991plb.57.1656109146627; 
 Fri, 24 Jun 2022 15:19:06 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.248])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa784c9000000b005251fc16ff8sm2180854pfn.220.2022.06.24.15.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 15:19:06 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 8DAB446EC7F5; Fri, 24 Jun 2022 15:19:04 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri, 24 Jun 2022 15:19:01 -0700
Message-Id: <20220624221901.514921-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KieCyPUs96SPEIHFVtsCi81TjJptm7FwFIWyeO9ugs=;
 b=JHvBDdHJTHoEMbLNH2TvFElV9P4zv/AngvU/ZrcDmy5iGmXmEoEx6ZXWRyKbQ00EFF
 68ZEm6yVOgG+CxS04rS3UMnRlfNDXiADWJ5pHpvCRgJ7CMLTWUF8U4yLkQaM3dTQB0oi
 KNkcFw3u5zP7kcgQtWrdyEPwEu8aYtDVld2Uw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com
 header.a=rsa-sha256 header.s=google header.b=JHvBDdHJ
Subject: [Buildroot] [PATCH] toolchain-external: handle case of dangling
 symlink
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

copy_toolchain_lib_root was not handling the case of "readlink"
returning nothing, which will happen if the symlink it is trying to
resolve does not point to a valid file on the build host. This
shouldn't happen, but it can.

The end result of this situation would be an endless loop of error
messages that would only end if aborted manually.

    [...]
    cp: missing destination file operand after
    '/local/users/mmayer/buildroot/output/arm64/target//'
    Try 'cp --help' for more information.
    readlink: missing operand
    Try 'readlink --help' for more information.
    basename: missing operand
    Try 'basename --help' for more information.
    dirname: missing operand
    Try 'dirname --help' for more information.
    ^C
    make[1]: *** [package/pkg-generic.mk:384:

Instead of looping endlessly without explanation, let's abort and
inform the user that something seems amiss with their setup.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 toolchain/helpers.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 05aa47a0dd8b..788f5ef671ce 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -19,7 +19,12 @@ copy_toolchain_lib_root = \
 			rm -fr $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 			if test -h $${LIBPATH} ; then \
 				cp -d $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
+				OLD_LIBPATH="$${LIBPATH}"; \
 				LIBPATH="`readlink -f $${LIBPATH}`"; \
+				if [ "$${LIBPATH}" = "" ]; then \
+					echo "LIBPATH empty after trying to resolve symlink $${OLD_LIBPATH}" 1>&2; \
+					exit 1; \
+				fi; \
 			elif test -f $${LIBPATH}; then \
 				$(INSTALL) -D -m0755 $${LIBPATH} $(TARGET_DIR)/$${DESTDIR}/$${LIBNAME}; \
 				break ; \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
