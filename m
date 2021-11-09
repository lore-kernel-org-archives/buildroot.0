Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484BDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 16:59:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 111A2611BF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 16:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 111A2611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08DF4043F;
	Tue,  9 Nov 2021 16:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMQi0dyM-VmA; Tue,  9 Nov 2021 16:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E857C4043C;
	Tue,  9 Nov 2021 16:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1DBC1BF2A5
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 16:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C08C540381
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 16:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TWEQyImaFRC0 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 16:59:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF4B240373
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 16:59:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d3so34133783wrh.8
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CbiYaKYLtubKA5iFirinG10Fyvcqy8Cai5THequN/XI=;
 b=kvkaREUCeikHx1dewMAblbFCsfj80v1d3o8k3wkhB9F8ziCAetghLfhVWs93K4vBpd
 4pPDOXmPA3nookjDwBJdbGK/kbUXgQUIH2a49rrP+hkQ2vmfzgmbGAab7fB9swrzRt9G
 38TMvzAqUZMEH8K4bhk0VZszNjcg3q29QQiUUqEmOXkO8hmxLf5Li1jNItq6Ox6d4wlQ
 1LDHGqho1ZuV3RWR0qc48VVwlYF+YuvXjd328iWAcrf8LEf/0SeGCJtJHgEs/DU/PvMW
 52xHQMQVNEO72T8ie3xk23/1ss5RXoOCKyTNtNLinKfzuXXxRGeXRXbXV31GCSOHALqU
 JS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CbiYaKYLtubKA5iFirinG10Fyvcqy8Cai5THequN/XI=;
 b=NHnSbxZ5uYlOEAgL5F8ucUHshWS/9y70Mwh60ZzjIodhsyt+SQmvFV5X5pDF/S+/Ot
 9uMhNsWUf3HgfFFUca8OBzZAIzob5ky5rEeLxCc66zEGCjFtGVTAMVthz+VmmWhET3qA
 ylkNovkb1HiPhZpKrGpHnuvLPgyOzErM1Usi/AclR2nnt2RGOKhXS+5gVAgxz+X+0m82
 r07vWECFGezx0bAk2wMJPwdFjj2exRzEiez5k0J9JrFqEQWEVdgLDEl2rjyZEgHyDJnU
 KFcMTYoV3H0KGzc51MUroLQVYgKqYDLXFfdI8ECT8SB1aPd0a9pWvYc6EBxRV6cOT6jT
 NzdA==
X-Gm-Message-State: AOAM530BIudgQ/o+LKvupCcpaY22rt4alEOFWCud2tju+dlFpYa5DPaA
 jeXV+J8q9xWAruPVygLqkDHPnBSeKwccWg==
X-Google-Smtp-Source: ABdhPJxnql0GO8hZYCeO6GmX//9WlphjgFOdVa9/0y54EZ5oA76hvqOTmTf5onst+V0FY9Hnu1e8rA==
X-Received: by 2002:adf:f786:: with SMTP id q6mr11201212wrp.356.1636477156169; 
 Tue, 09 Nov 2021 08:59:16 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:710f:610b:602a:e07])
 by smtp.gmail.com with ESMTPSA id b10sm21480384wrt.36.2021.11.09.08.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 08:59:15 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 17:59:08 +0100
Message-Id: <20211109165908.1942790-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109165908.1942790-1-yann.morin.1998@free.fr>
References: <20211109165908.1942790-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/dependencies: avoid spurious
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
