Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6639C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6478840B46;
	Sun, 24 Jul 2022 05:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6478840B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCvxMHrnCNwt; Sun, 24 Jul 2022 05:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E714400EC;
	Sun, 24 Jul 2022 05:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E714400EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD2A1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF58084063
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF58084063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id am2g1YI-LyRl for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:50:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C48183A47
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C48183A47
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:50:51 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id v130so4703316oie.13
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fdoawylqbt2oZ5y6d9SfRXwyVoU/NI23NfztuDVkVBo=;
 b=8AaPU447zequXXLARGzDtFfqhCmt/AmdlfK7H+edEqdby07yamE4yo0znj0OnrPrK4
 FcioBArMz5djGi+sBDMAhfqjZI9e2YYc0HBnHYk4zJwx3BUVyuPQZfeShMoe5KO5ryhd
 GRQ1WtW0UoN3CQ7VhHSHDgBvppFuVE5GtNJadyFVMaAPHsNVbPYcdek0F26TbC0RRD+7
 IEmf221fLD2hDOuqanX/vOkNhQ6Pi5DWgblABqF2OXOVHSdEv4Fi2Gx4IHWHZyNU7+ph
 /6WcLahYhLYp805KePxTQx1lnPtcnJClXSYN5ue4A3ug/Vjob60I1r01eG5M8c1+kzya
 M0VQ==
X-Gm-Message-State: AJIora+TirBrzKxXjYAEIw5ngBbt7WTPOijkmHjk4p7yZBOhLs5sGjnp
 y2gWExaf8BfTp+F5V1HC27xMtt1TYBY=
X-Google-Smtp-Source: AGRyM1u5sC/haMu9cetnwxpNGlQ0/APbLKEY3Ik2MMm5Aki5eyM3I8lLpvP53Nji7ck7B8QH1zaGKg==
X-Received: by 2002:aca:ab13:0:b0:33a:9e31:7038 with SMTP id
 u19-20020acaab13000000b0033a9e317038mr9644543oie.223.1658641850395; 
 Sat, 23 Jul 2022 22:50:50 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:50:49 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:07 -0300
Message-Id: <20220724054912.2354219-12-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fdoawylqbt2oZ5y6d9SfRXwyVoU/NI23NfztuDVkVBo=;
 b=iUVlwv67oAmGZ7PbSSV8QR8QF1bUT2256ZuxaYUVeowWXWJ5Q5gEZ5rTiqLkTtB+V4
 wOVsZ+LRrqtG5+5vYIyCOQj95VaP7DnwOtVj/HCcuUFZWlgobmQVNanOno4nu1tHqJGV
 6LNNShpm+JSmGGLGCftUql4jeIJzO3Lbto6QxrRaJl3C9rXAliiLqpv7Ec1k1KpcOEY9
 XI8r/isG1x80wTVlwAGhQf3V2r0T5MeiHIVqTZyZVkKLjCYAmfBM+/encTBxedmTfQwB
 93kFqj3KagQcfD+GhV6ORytxcVfL8lbjrvdQfNLk5KdXxfXlnCkLn4+BjWFLiT+SKk0l
 rlHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iUVlwv67
Subject: [Buildroot] [PATCH 11/16] utils/check-package: check files in utils/
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

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE to the maintainer applying this patch: please re-generate the list
of ignored warnings while applying:
$ ./utils/docker-run
br-user@...$ ./utils/check-package --failed-only `git ls-tree -r --name-only HEAD` > .checkpackageignore
---
 .checkpackageignore | 4 ++++
 utils/check-package | 1 +
 2 files changed, 5 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 541f234bfd..765e5c1cba 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -940,3 +940,7 @@ toolchain/toolchain-external/toolchain-external-linaro-aarch64/toolchain-externa
 toolchain/toolchain-external/toolchain-external-linaro-arm/toolchain-external-linaro-arm.hash HashSpaces
 toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-linaro-armeb.hash HashSpaces
 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash HashSpaces
+utils/brmake Shellcheck
+utils/config Shellcheck
+utils/docker-run Shellcheck
+utils/test-pkg Shellcheck
diff --git a/utils/check-package b/utils/check-package
index 6612cee24e..880fcfa21e 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -107,6 +107,7 @@ DO_CHECK_INTREE = re.compile(r"|".join([
     r"package/",
     r"system/",
     r"toolchain/",
+    r"utils/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile(r"|".join([
     r"boot/barebox/barebox\.mk$",
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
