Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7A8481D73;
	Sun, 24 Jul 2022 05:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7A8481D73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCpMvdRpWmrc; Sun, 24 Jul 2022 05:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7563840EE;
	Sun, 24 Jul 2022 05:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7563840EE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81AEF1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6830A41729
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6830A41729
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lcLLencrdUq for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:51:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A5A6416ED
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A5A6416ED
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:51:03 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 o16-20020a9d4110000000b0061cac66bd6dso6339817ote.11
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=aducD+9P9N20hgmQwX16MVV6nICrwh78ArRB6tFhiCI=;
 b=mkzoYiZoI5GS5s9vJdPqCFsmiJJhLWHVCBawKV/XwAbJli4/Y9De2x3y1ztn0Bu57D
 9GU6agVZPXbKfgYkePfi1quWzBSpxunPnMoWZzP2E8WRmGQB3UnQj30SZTROasTJdReQ
 3VWCAdxr+cJsJr6WGp//J1GWePIGb+Trp9lxQl2KTXCba57hNGwt+T+6Q3SbunpuJNkY
 5DbhqDuwXAH5lZNq7GFal9MDe5KLNRmz9jk9jQlWTVvFIPvjUGMDg3xFLVBFlDJ0A8tt
 MDmmDsNfZKNSr4SCt1qzEvNgkHrGb48RT0JVhYpDbAgzDHexnJtdYkB61MdQipuOi0zN
 M9VQ==
X-Gm-Message-State: AJIora/US/ft7onHGlsPulBW3AZCCNU73HPts0WKSH/PB/CZCEaIZTwY
 u6uJpPKEzOF32f5gTKdf4bH9VhN3VDU=
X-Google-Smtp-Source: AGRyM1sxxU8xmmx3V5Zl4Fwu/EBt1UOW0bBvbOCYzfS9nBFEw1URoyRkDHhh4R06q1IcSlDIbjprMA==
X-Received: by 2002:a9d:7b4d:0:b0:61c:d27d:cf3b with SMTP id
 f13-20020a9d7b4d000000b0061cd27dcf3bmr2891314oto.49.1658641862392; 
 Sat, 23 Jul 2022 22:51:02 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a056870818d00b000f5d8d031b6sm4236969oae.49.2022.07.23.22.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 22:51:01 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 02:49:11 -0300
Message-Id: <20220724054912.2354219-16-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=aducD+9P9N20hgmQwX16MVV6nICrwh78ArRB6tFhiCI=;
 b=oJ+UwBDweLHweVoTyozKoWIILVpUz8Ix7PG1pXIOhEyscLV8T/CiUvvlzxDllqXjKy
 aSO9+jTNv85BIIDOxn+brgJVlZx3UIIeiyVOik+irkqR2SwwBUpV9cNf/jPh6fePKrfa
 fP3prfW3ueTL04lGvg+97M8v8jYrxpc8QpNS76J6inKqTiHdHXPCG+prI7JgRT7sfOfz
 Eglup4ctwleAKlWHuwnuTAWtRYy/pwGkHU+JVIT9xQ7mpm+cIXiL6G0vPdmroZqJMelB
 BT6tcRv2usN2TYSl8fwPsoB6iSNptb+kGSgw2jCKICv7st8gqIuj6HNr1nBrv6XoTYmF
 rgQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oJ+UwBDw
Subject: [Buildroot] [PATCH 15/16] utils/docker-run: fix shellcheck warnings
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

SC2046: Quote this to prevent word splitting.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .checkpackageignore | 1 -
 utils/docker-run    | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f9ab48674..6f1a838562 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1077,5 +1077,4 @@ toolchain/toolchain-external/toolchain-external-linaro-armeb/toolchain-external-
 toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash HashSpaces
 utils/brmake Shellcheck
 utils/config Shellcheck
-utils/docker-run Shellcheck
 utils/test-pkg Shellcheck
diff --git a/utils/docker-run b/utils/docker-run
index 5653764254..f42dc33d0e 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -7,7 +7,7 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
 exec docker run -it --rm \
-    --user $(id -u):$(id -g) \
+    --user "$(id -u)":"$(id -g)" \
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
     --workdir "${MAIN_DIR}" \
     "${IMAGE}" "${@}"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
