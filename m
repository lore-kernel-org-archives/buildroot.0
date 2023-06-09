Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04A0C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 17:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7915183C1B;
	Fri,  9 Jun 2023 17:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7915183C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPXcDmk5WP4O; Fri,  9 Jun 2023 17:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B24D083C1A;
	Fri,  9 Jun 2023 17:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B24D083C1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 248061BF97F
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F16DB607D6
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 17:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F16DB607D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JrOuyEVOg5v1 for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 17:50:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 420C9600C5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 420C9600C5
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 17:50:03 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so21148165e9.0
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 10:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686333001; x=1688925001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=koa7CWVEn52jl/9ZiOscyyhusQKI3ENeMYOeL1tn3oE=;
 b=RFG4CZRO78hJpyuP3W+wnv77Mj1NFrIf6fA3kNOt5Bs2EjpiV7J0kz533hKkJTQHpk
 GN1+gW9o83BP+GZvcogGWdvJQDYA5nvpYj4n/aZhA1MJlmNbA0Mjw9yzD0VRCqMZ53kK
 sq98a7pJu9z5GUwsz41TLp89qgi9v8PkjLWczHPGD5Ak4HhfXEMFH1auKs82HF1acChy
 L4/2tZMIEo1ppTm8eEfgeaDtrpt2BlygRxWZCbz4y7fROM56ai6c3yqjzJXF8jCkHOcz
 BJsm3ixVxzGA7XJCF4632sph8E0gH4Dlhg1rzP+Mke7tVLVH2m9r7XmAuGtGWBt3QnFp
 Y7Yg==
X-Gm-Message-State: AC+VfDxgTaxpImBcgnutYpRJ/7oDc+lSZAw9awLZmRYxQM98RZ9Qmkl5
 g3LL6Xs/2bxUQTKrbP4oTNrSW1pbW+Y=
X-Google-Smtp-Source: ACHHUZ5L6QMbL9qPBufNG5lmWssANun8UdMU9X6+6MKu7cnxj4PmbIR6MmHsQYyrvcbtL/OqtfIHqQ==
X-Received: by 2002:a5d:6646:0:b0:30e:3ccf:d4b3 with SMTP id
 f6-20020a5d6646000000b0030e3ccfd4b3mr1491462wrw.28.1686333001035; 
 Fri, 09 Jun 2023 10:50:01 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 a4-20020adffac4000000b00307c46f4f08sm5048877wrs.79.2023.06.09.10.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 10:50:00 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 19:49:54 +0200
Message-Id: <20230609174955.409551-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609174955.409551-1-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686333001; x=1688925001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=koa7CWVEn52jl/9ZiOscyyhusQKI3ENeMYOeL1tn3oE=;
 b=pr780nlpO0Q++h4pNudMJy7cstk2IurVmnVlJ/W9iCMTN9sJi2psZGqyBWTmwBlbuR
 TwdW8IthcITYq3QtCmL0mLB2/h6tz3sgDU3nVEj0lIsN9SoEZNbGh8/Ci3DHt2gDcnjh
 UDNiRJxJnDuNKoHdjfc8BM4VFXCOxtZBIr0HGHIil3hC7EhSlQtrZUyxRBQg3YCzXsOm
 zVJMsJEByGX0Q90ueP/I9IFxIYrh+S4TqzlJ6jkWfimMTY4C7s7vmBW1qStcC/DoEp5z
 qMxdTFg3DXiGhHns3cl89rahW6NqptFtvCJk1vZb7+UpNg+DCZ3+4aUmpLOo9SMEKv0U
 Po6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pr780nlp
Subject: [Buildroot] [PATCH 3/4] package/python-mako: add optionnal runtime
 dependency on python-babel
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-mako/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-mako/Config.in b/package/python-mako/Config.in
index 2e1094189f..7bba31943e 100644
--- a/package/python-mako/Config.in
+++ b/package/python-mako/Config.in
@@ -17,4 +17,11 @@ config BR2_PACKAGE_PYTHON_MAKO_EXT_PYGMENTPLUGIN
 	  Provide python-pygments support for
 	  mako.ext.pygmentplugin
 
+config BR2_PACKAGE_PYTHON_MAKO_EXT_BABELPLUGIN
+	bool "mako extension babelplugin"
+	select BR2_PACKAGE_PYTHON_BABEL # runtime
+	help
+	  Provide python-babel support for
+	  mako.ext.babelplugin
+
 endif
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
