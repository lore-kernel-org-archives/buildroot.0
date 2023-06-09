Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91464C7EE2E
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4192041A0E;
	Fri,  9 Jun 2023 16:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4192041A0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RyCvPf1q_uch; Fri,  9 Jun 2023 16:21:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 756D641A1F;
	Fri,  9 Jun 2023 16:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 756D641A1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 513DC1BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B2EE83B97
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B2EE83B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OAgqJJPFKCZy for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38D0E83EBC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38D0E83EBC
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f7f6341b99so15222725e9.2
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327628; x=1688919628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8sdwTANpeQhpsURLp7kgO0ZKIFbV1FKc63DXN/nEv04=;
 b=gwt5mVl99ScftJ0oA+Etu4k/fftBzF0y73dKlvcvyApRGGMSQtkvYnxI0GIotuP6H9
 YRx8pWMJUbfLDal+VMsecKI5J+GWyhlt1cv4uNWfrvKPr5InkwlkLeNewHuLZbuvV8U5
 s9aiNor7h/PeVeE8oYBydT7W/3hDFLQTmRwN7KTxcqnMH4tr611vj+sYSKdgvXCDLSsl
 xsdkDWT++CwXMZu5tMmNvaD9MhsahDsvXu/HVrsAf+9FgG7RkMeByaV0buFBHu4HHexW
 NZSV0M/pwah+uaQ+G70rG8xpkhQP5djizyYfDXTTdxvWIY+4Al5Q0wVExrCJWhv1iwRy
 Ajyw==
X-Gm-Message-State: AC+VfDwL6tnQ8OZwMHjY8RTjAaRIwKBHp1iySNv8CpyV6abs2BGjUQOg
 v/GX98s7fNt0D8g1IlIFKC0ExIdtZDg=
X-Google-Smtp-Source: ACHHUZ4p2r+VjodLLuNZ/OEzR6d725i7pl3fpwRRU4yI2JmBlDrFZqcGLHOrPyTpmWJSVfoqg9uW1w==
X-Received: by 2002:a1c:7418:0:b0:3f7:2a13:9621 with SMTP id
 p24-20020a1c7418000000b003f72a139621mr1176052wmc.40.1686327628419; 
 Fri, 09 Jun 2023 09:20:28 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:27 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:16 +0200
Message-Id: <20230609162018.1231615-6-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327628; x=1688919628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8sdwTANpeQhpsURLp7kgO0ZKIFbV1FKc63DXN/nEv04=;
 b=IT4kjhZenLWN1/zQiWv8D+Ajr3OCIyHvdFUqwlI2tkjROGF/pMk9Oz6zZTQg33soa2
 1JCzlo54lMTHF/Uhk8Hz/DBcHfjn4HKJs7x1g17m6JH3xtKnaV6zHgQdzB9GmFVgbpRv
 XJ6oiOBTEo+Vqh19HOPVNQzjmxXGElUWofBMWCLVwKEomw0pXEe8L2RGskkwN8yH8eTG
 ICeCBTagDAuglCR3xAyvRGoT1eZ/K2BIESb6qOY5aNatJDBs2MRp/X0OhnCl849r3S93
 TYe8Ew/jAh1lb/9k2UiPdQQjiNIpCZHbo+wUOWNlStL1YC5pQFrPOGp16gCgx3rWVTFp
 dVUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=IT4kjhZe
Subject: [Buildroot] [PATCH 6/8] package/perl-mojolicious: bump to version
 9.32
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
 package/perl-mojolicious/perl-mojolicious.hash | 6 +++---
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 989eaf341..6d8f50015 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  523193316a839ff56a447f0f0c2e5b36  Mojolicious-9.31.tar.gz
-sha256  cb96ccd7a5319321ec6f57633c88bf17193d45169f4d7846da254bb6f9ed8312  Mojolicious-9.31.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  e06ce611dd2444f2ca5b74f3a910b679  Mojolicious-9.32.tar.gz
+sha256  bc04c552ee24eaecc45feb8709d49c2901bc26fb82b4a1a8e17574e1cca083dc  Mojolicious-9.32.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 618327d09..63b02a518 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.31
+PERL_MOJOLICIOUS_VERSION = 9.32
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
