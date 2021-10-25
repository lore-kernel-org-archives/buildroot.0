Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5700EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2163E60FE8
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2163E60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D916089E;
	Mon, 25 Oct 2021 19:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRaDQzFcYBTj; Mon, 25 Oct 2021 19:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6269960892;
	Mon, 25 Oct 2021 19:01:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 696CD1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64CB380F2B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAUlshtz83oc for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C60280F24
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 19:01:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id u13so3389571edy.10
 for <buildroot@busybox.net>; Mon, 25 Oct 2021 12:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mc9cYyJWRXhsG3ezquEoZdDdoKzXoSm3hX2sPphwwOk=;
 b=R6SDqZijcG7rFCQ7TURmraDQgam4xCiqhWDeaGFNvWxnIPwEY/wuLmnNG9jf4z1tgc
 33TlRBXG3I0Dna0AlxzyR6GFbpcAVagLO+fkIAKYNrZnD6pCJypuZTWvpDkZKNHdRtq0
 a6aI93nS9msfGYP2U7DcRpH+ftJh0nfeHB/s+35ZQUBruMAQzjED/yNPgWowoHK/4KT1
 Jp+EORugqM8YMbML0Xmtkb91AEaS5N4D/xe6zDfRGwpRO1gG3k0JlWrYxz0sdVzUz0vj
 32wcWpIMak71scDwQ1fDCDKMMT/V2dtOBK18IQH0S/EdnhgpMvBUKB7Cz9M7mhdgUyki
 XnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mc9cYyJWRXhsG3ezquEoZdDdoKzXoSm3hX2sPphwwOk=;
 b=xteHCQQBsgwjVNLj+e4b0wS/jrErF2UBsiN8Zgw5TG/XmaDQ1jClBWPwykQlXjhvFr
 9nWEZ2572zXH+l0pwR81N+dtLB5hdW+gMpe0XKu5LoCXETFzPbjJz60nYePyxkrEAVHR
 PvnYN/lT4yamc3G5UH7kPYIKpt2i7I69RqWpeHq/zVABxpeovwLMNVxkiutDE2cCen3a
 fPiIuMLzqmuTPRRYjqvNDtDSY7vU5kVy2ctQatM9/TQfofP0MGTX77HIt0o1vMhRuYEi
 /tcp1KukLzkRZ9fNlvy9FhNBTyhNckrvpy0cg8Sd+qG4gOB2tLv9zYZ6ijq8OONOZQdL
 nFMA==
X-Gm-Message-State: AOAM532bXRn5LESZM9gE9E4bU237FfuB4+haBE4nuNxN/C+lUFeStnQN
 fkqCLcwPhNKYTlUWgnhU+F+QmzP1Bwk=
X-Google-Smtp-Source: ABdhPJz9TaKNJjycwiABSBSkZ+iw18wK6yHm/Fg88Cs4fFYIHZ8+6by8ALJ/lpxtMELqePVZaiYnZA==
X-Received: by 2002:a50:8710:: with SMTP id i16mr20376030edb.36.1635188502253; 
 Mon, 25 Oct 2021 12:01:42 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g9sm7890584ejo.60.2021.10.25.12.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:01:42 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 25 Oct 2021 21:01:31 +0200
Message-Id: <20211025190134.1273703-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025190134.1273703-1-francois.perrad@gadz.org>
References: <20211025190134.1273703-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/perl-libwww-perl: bump to version
 6.57
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

diff LICENSE: remove trailing spaces

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/perl-libwww-perl.hash | 6 +++---
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 709e94647..2c9b19d6e 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  0ef270c43ee93e22c2086ba9998aa11a  libwww-perl-6.56.tar.gz
-sha256  94362e68e5c6782f3987a9dec6adc409d20e28665dbf28ff47d1d701443ce7ce  libwww-perl-6.56.tar.gz
+md5  e0b7b07a01f19cc507d3a9b55951ce3a  libwww-perl-6.57.tar.gz
+sha256  30c242359cb808f3fe2b115fb90712410557f0786ad74844f9801fd719bc42f8  libwww-perl-6.57.tar.gz
 
 # computed by scancpan
-sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
+sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 10fda9de6..23e2aa3bb 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.56
+PERL_LIBWWW_PERL_VERSION = 6.57
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
