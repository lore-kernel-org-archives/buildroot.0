Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B62C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE7C60E8F
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AE7C60E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1FD80F2C;
	Mon, 25 Oct 2021 19:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gx8UEYuUF34F; Mon, 25 Oct 2021 19:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E9380F25;
	Mon, 25 Oct 2021 19:02:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8735A1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74F7080F26
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EekISCH3BJd for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F77D80F24
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 19:01:46 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s1so3257320edd.3
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o12Dj82SjytdyOGw8wCtMwMN1Z4Fy7YllvYs5CGRjic=;
 b=T33HR0QGSYqCUgpEnUe6piK5l4NEBmWAVNixhZLd4oscQ61Uxz9LBTt59Feh+u7Ail
 UX/uahDtYob6WwNXFedJRoFFdv+zhuJxXcx7Hylpal+LILjBrpHxkmxkPsPQ2+r2JcQU
 6UUN0uTffrvatJI3kZ26774Qm0as6HCmuvvf1F/xzV8HO5tQo/9Rs4TK6JskkVLd91Hm
 ///UasoMN4G+MF3P0I9TeriurBoGmltEr4laebTbhkAMYRiYPnQ3+VT9ZnZlGQENJH0/
 TxiyNv/ezCu1wX/87/xpun+d7QyyexL6Cnfl90bVy4fNANiJKBqZL8CziXiQyt785Y9R
 Fg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o12Dj82SjytdyOGw8wCtMwMN1Z4Fy7YllvYs5CGRjic=;
 b=Gd5RHMrUiqtcZIUKQCRn3uYhkqI/rtG+2zgPEugsmwxiS49p2gcMBOUioTwxy+cGyP
 DwWZMeX7zdusBllYmAw4gOKmaK0l0aipLeKmPdCGejD+bRfZ/eJ8cLZGdkOmXu7YgqUD
 iOzlroBipjrobrEjdpDuRSOBXv3Ck3fRU2blMyeNPfJPlc7SE6uRSh2ZgrWTXFZ75Zsd
 sYJCP+Emiuwh/EReFXqu9SCvw4TQ7ol9mEcmfm6ufgYJ67wKm6g8571ioCnvLSlLp7x7
 6CroPAZrBenP/qQwvWnPKowdT/6jDtwKKA8KpValt5i74zZaYNwin3lN10TYnQ6d8aoP
 9rpA==
X-Gm-Message-State: AOAM531QbeCpTyvY19LAx7DA69LbJOuD4H3Ar5ahsmf/TP7FR2X1oOth
 DcIhixhlK8+5HsbHG2DrceF3XCbezZM=
X-Google-Smtp-Source: ABdhPJygDSDBLR1ySytK1Lbhvyr7RlSI4fatU1ccF1v640YL3upT1dAIBgfJQqsrJWz/anN2K2ve0Q==
X-Received: by 2002:a17:907:9806:: with SMTP id
 ji6mr3586626ejc.464.1635188504923; 
 Mon, 25 Oct 2021 12:01:44 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g9sm7890584ejo.60.2021.10.25.12.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:01:44 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 21:01:34 +0200
Message-Id: <20211025190134.1273703-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025190134.1273703-1-francois.perrad@gadz.org>
References: <20211025190134.1273703-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/perl-path-tiny: bump to version
 0.120
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

diff LICENSE:
-   Copyright [yyyy] [name of copyright owner]
+   Copyright 2014 David Golden

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-path-tiny/perl-path-tiny.hash | 6 +++---
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
index 855af46e1..6899d5c6b 100644
--- a/package/perl-path-tiny/perl-path-tiny.hash
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  cb34fd356725ec12b78e88ddac37db08  Path-Tiny-0.118.tar.gz
-sha256  32138d8d0f4c9c1a84d2a8f91bc5e913d37d8a7edefbb15a10961bfed560b0fd  Path-Tiny-0.118.tar.gz
+md5  046d14dde6e3568aee5085487dd4769e  Path-Tiny-0.120.tar.gz
+sha256  66a1164981d449da46cc88383fe37f9e352e87e9570bfb960e43fe8ff016ee1b  Path-Tiny-0.120.tar.gz
 
 # computed by scancpan
-sha256  a999b03d2b80e5c7f987289ac835fa2d88cafa9f0df24adf8a1fd21e175acd79  LICENSE
+sha256  c1a19c0d83f668a784640c0b41e024f37b182ad38011b170f9200123e57f6070  LICENSE
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 08cc66712..cd4c3bc49 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.118
+PERL_PATH_TINY_VERSION = 0.120
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_LICENSE = Apache-2.0
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
