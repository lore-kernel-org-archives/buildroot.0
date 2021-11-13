Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 600BDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B7460F70
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 13:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4B7460F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3BB940219;
	Sat, 13 Nov 2021 13:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vX9yogsTnCZI; Sat, 13 Nov 2021 13:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF11740204;
	Sat, 13 Nov 2021 13:29:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 37F101BF2FD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27CC3605AD
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 13:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hZFOQlDvBoT for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80B8460594
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:28:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso8805343wme.3
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGM/kKSNPiFcqdgVMW4wQHvoErn7jITv1Pvz+jtkD0c=;
 b=cJP3s42H3cd7sfPXOCZTNzjIkEU+BOlMbSp18CLsqvfuOGpD5nRckRXspNtuqJTjEl
 Vc98xLfwk7YKRNOYS/Zsm8V8PWFVf9Kec4LXLXm7r0tTeHEO+NCU7R/uUawx8a2EVabQ
 DvDLY97k3+Qjctnz2SwS5QIXSWYNoE5dUZ/r47ibpxFtGHEHLSQdx1FtMzDhGZc/1S9H
 81CJTxJ1YrHYBlRUN+o9USl1avmLndvSuT2ryv2NcfxFgGE9qjvTxXh7mSJlgK0NZyH2
 J/Yy8n0J/JmCAM3N55MbL4wlECp9MC4XZN7+kFrNLL6LB3YUGBNUHNMCdPdE8Xqd0REt
 VRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QGM/kKSNPiFcqdgVMW4wQHvoErn7jITv1Pvz+jtkD0c=;
 b=YHWV/WrHLcT3xZnRYcAFApMfDuJQvfdNyNmqyQ1ghLgUjPG0bBTcHxfcQj4VO37B/K
 ti2aYDR4kIN4JpdVZXJ5MZOHley7laO5fZ4nn1rNzXFR18m/8nwP1P6AAanQj7nKaNoz
 ICAXuuxjX+qPo/pmqnNNM25TEmCcVII3rxypdVlpKH06oXAQfsOn4JtYjUVcQLM+fQhS
 gQaF1Ggl9LFdeYx0xUGsGJ8bbsMN4svlJgM41gV2RzTH6UMgIWuejpQ6WfxczbDclb5k
 1LO4jKM/txKRH/j9/yMsK08q+YktUnOpiJMaTI+3Elyfe+S+guUXJNdWz6GDu5GMXIVd
 +kLw==
X-Gm-Message-State: AOAM530PIr4Dxzmc2sB/j1I0Y9osnep13VoCyHnCseqhaT3Q55RfgK6D
 2vP41rsdBjByKsWTb6vPILfv+VmB+H9ImA==
X-Google-Smtp-Source: ABdhPJyS3RKnCz0t/G4uuONRv+0oztQ3yfA+1uiDjawu36ulpse6DhL/zx9Pca2aHc6lfANKuArDhQ==
X-Received: by 2002:a05:600c:1d9b:: with SMTP id
 p27mr43655945wms.123.1636810112830; 
 Sat, 13 Nov 2021 05:28:32 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id p14sm5606890wms.29.2021.11.13.05.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 05:28:32 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 14:28:18 +0100
Message-Id: <d91a923ec5d99789ecf3f4b4d695272e2e6069ec.1636810092.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636810092.git.yann.morin.1998@free.fr>
References: <cover.1636810092.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/16 v2] Makefile: really comment syntax
 colouring
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

The unmatched escaped single-quote lies in the middle of a few
function calls, so they too must be fake-closed to properly fix
colour highlighting in some editors.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4062883cc2..6f6bb72de3 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,7 +1068,7 @@ printvars:
 		$(if $(QUOTED_VARS),\
 			$(info $V='$(subst ','\'',$(if $(RAW_VARS),$(value $V),$($V)))'), \
 			$(info $V=$(if $(RAW_VARS),$(value $V),$($V))))))
-# ' Syntax colouring...
+# ')))) # Syntax colouring...
 
 .PHONY: clean
 clean:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
