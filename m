Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F42CECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 20:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CAD8142A;
	Mon,  5 Sep 2022 20:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39CAD8142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EVcRDvI3IpFi; Mon,  5 Sep 2022 20:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AEF481425;
	Mon,  5 Sep 2022 20:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AEF481425
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 030641BF337
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D16B481428
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 20:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16B481428
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yT2orvYx00DG for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 20:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A2F813D2
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 30A2F813D2
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 20:20:07 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id 62so7470297iov.5
 for <buildroot@buildroot.org>; Mon, 05 Sep 2022 13:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=xkEF+QHD96Fk2i85FKIzuaqFnXtmOGglY3Y7bLxtRWQ=;
 b=hdoRSv7lUT7Jb2H/QZpD4Uh/0JEaHphBXjKijAo46/H8izF5VLniE/sswrODGnNWEI
 9VYofgjKKCacrNifsTz6yHaKVuoHLIyYqtRCMp2BAz7vr4DkdErckrxypLF689aC210w
 krpjalq3iSbFNBAKl9Xxw9rUiJ8JdJ5WxSGVPDdcZxJO41V52QL+U01k32Cgzyq+ObQk
 K06YlsB+Kyt1jaCVpt9x4KgdBrKlOtUCP2nomQRFUtSHQ5i/tuvurwU57cO08K4Reagn
 6uemukzw5C9TINrZ7xEWTbNf4vWMC3A03iK/xILxYTZzfPNixFWojmOX6eq+FDhfIYNh
 aLVw==
X-Gm-Message-State: ACgBeo3EIjQmoOJ4jvMPgH6D/jMlxDtgNlEbc4O+O43NfKfxAP+kcHnB
 ttNRzdzWfCVdN5uivPLPoh+SevfN798=
X-Google-Smtp-Source: AA6agR4d/ts6qXLl09peGJpzOVnpCGljb8sNrwSsg2o/A9bpEjYHmMUMtqL5cCNTlP5OgXbFoCBNLA==
X-Received: by 2002:a05:6602:154c:b0:689:c27b:93d with SMTP id
 h12-20020a056602154c00b00689c27b093dmr21839713iow.93.1662409206006; 
 Mon, 05 Sep 2022 13:20:06 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 u2-20020a022302000000b0034e9ceed07csm4478967jau.88.2022.09.05.13.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:20:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Sep 2022 14:20:02 -0600
Message-Id: <20220905202002.4183680-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=xkEF+QHD96Fk2i85FKIzuaqFnXtmOGglY3Y7bLxtRWQ=;
 b=nbIXaTepxA1cQyDn7r0tfRlKDQLpTWfzbS5TyMD3keNdOHcnIvOTHh36zR5W3HLa9M
 KvPpE66m19b7NwMf1oPzd1oScsetgnGBbdmG+ka00aUvdxvtalsNevpp0mKZqrkvwGc2
 gb0HgWrPPRKjzt70ZYzgbOpEb1Ej7yBf1S6t5AYHMEhj+Ui5a1EMElZAlZcjeAvYxx8e
 q/twqZQeFPl+ov6cQ6eMoWeDE/AL1ASGfJKSe+cHuooe7wSMrXWFEmYWCWbQQ7Qy3mjz
 9nUj3WBsp6eOiNFCJhG74xAfyevdNZWL/4JyOnSvKQ+wYYEPLc5df+ciCQaJ7aoInrRh
 1mXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nbIXaTep
Subject: [Buildroot] [PATCH 1/1] Makefile: unexport TARGET env variable
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If set this can may break package builds in some cases such as the
host-icu build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index bd0b906cde..a82a22a276 100644
--- a/Makefile
+++ b/Makefile
@@ -427,6 +427,7 @@ unexport GCC_COLORS
 unexport PLATFORM
 unexport OS
 unexport DEVICE_TREE
+unexport TARGET
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
