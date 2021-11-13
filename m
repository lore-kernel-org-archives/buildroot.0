Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CA3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42BD660F22
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42BD660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBDD2605D0;
	Sat, 13 Nov 2021 13:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQQos86jcoJK; Sat, 13 Nov 2021 13:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35734606DB;
	Sat, 13 Nov 2021 13:29:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B8661BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08E3E605AD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RJ2T0SNWbvrv for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEE9660594
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d27so20646547wrb.6
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CbiYaKYLtubKA5iFirinG10Fyvcqy8Cai5THequN/XI=;
 b=DbHjNzCPEFMuo2Oudz6tGJ5E3GshwTF35xrdcbM6Q0PAhzuLzsP1nKlf/dLke7JNko
 nyC85p8cXYRhcm7rC/mmEnv+vTwGGTp+vW2cGsj8W0ygxW6ZwOGfsBaJWnqxbRfkOP7s
 6Ztd8Exo3fRlQNfOC6mgRJKd5LjdrWPoLDLxG6rnEZTZHix82ltTAMXPzXwyFIGxEyJx
 P2BtdAsTcDrYiL8dpKV94i1c7W9OrCQFOcOiC/XFrG81IlEmK6Sfd/MuJuEBVpMT3TJV
 8DyeVDLSQwFOeH6uo7Wg972e3m6WE1NLG1gH7CdkeNZxY1edx1P9m65tib97+BM6Ou0J
 EbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CbiYaKYLtubKA5iFirinG10Fyvcqy8Cai5THequN/XI=;
 b=NYaFSdBZdMQmR9au9+Ky/ZSNGSig/ici+JIek7PGzk440zrtolmtxN4A1BWS//FQvn
 pvT7Azd1M+1PxdwT8ESRp5bwFxT78P7Zw22yzTCt97q0rpz/fFN3rdPQspmhtpUkmSPr
 oBxpjUqC+krarKCLuqT5mdBcVzwYDQXqxehE7HlfbZyPfSnI+/JSOBFi2HzjaJfSZToJ
 MfMf/+ocI7Ac5TK1zeuZmAtB3c5IO6Mx5HQO5CRJv8zRM4pkc6c8jbUr02KZhkbIm5RM
 mxN7v2YpGg7PHJGo/f/ItaB6faHKsX2rZ84YtYGVwCd0LYAqKKMqjalcHmXoggydJY6k
 w51w==
X-Gm-Message-State: AOAM530N1ieYaldIX0MWQoF7MNJrYnLEL9y35ocWQHwCfEWLhiIbOQ7c
 0ajIDHuvO6FgDTRNcT0dgdzsFYYEbRGW9Q==
X-Google-Smtp-Source: ABdhPJwN8lxVtQif2fGlI+9b01wI0fmtnQiKxeS6SWy4qR0S6datPf32Vm8EM2rXSB0SjuXlo+hPQg==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr28742010wry.360.1636810110012; 
 Sat, 13 Nov 2021 05:28:30 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:29 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:14 +0100
Message-Id: <e286c83167789c7663a3f93f0d3467a0241766a0.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 03/16 v2] support/dependencies: avoid spurious
 warning on print-vars
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When calling 'printvars', the 'suitable-host-package' macro is printed
(a macro is just a variable like the others, after all, just with some
parameters). Because it is printed as a variable, it is missing its
parameters, but it still tries to evaluate the $(shell) construct.

This causes spurious warning:

    make[1]: support/dependencies/check-host-.sh: Command not found

Only try and call the script if there is actually a tool to check for.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/dependencies/dependencies.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.mk b/support/dependencies/dependencies.mk
index 4fac5c731b..a7bb1a6080 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -15,7 +15,7 @@ else
 # script should use 'which' to find a candidate. The script should return
 # the path to the suitable host tool, or nothing if no suitable tool was found.
 define suitable-host-package
-$(shell support/dependencies/check-host-$(1).sh $(2))
+$(if $(1),$(shell support/dependencies/check-host-$(1).sh $(2)))
 endef
 endif
 # host utilities needs host-tar to extract the source code tarballs, so
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
