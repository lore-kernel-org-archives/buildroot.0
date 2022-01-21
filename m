Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0205C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 18:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A070760F01;
	Fri, 21 Jan 2022 18:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O207cpbL02X5; Fri, 21 Jan 2022 18:59:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D335B60A99;
	Fri, 21 Jan 2022 18:59:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3162D1BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AD958125E
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BRWtHRDlz4YH for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A57D80F44
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:53 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id c2so18803862wml.1
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ei4Xv4o2pOR6S2ty1NSSqhLoOImjUC+dfu4/vWG3xOs=;
 b=YI8OmVmZFHuWiOcHfbAOcgEoBMlUZj/ld1oaG5yBWWye/UioDiSXwO6BEx79Rx1N7o
 0mq8A7o7dWqwU+4e/aZ0QuIaJ7N7Dack+SHY9HImh1bScye0KkDW04fDcQyUyBGAl4M8
 g4qo0iJPSXzEKte5k+9w3u31yP9AC1tG3nXIsiE41xEnjzW/tBme1TigKhbm9plTntiI
 k7qCZTSwDZ6RrC27PJeGjZahfWqAuDLEi5nm7XhSt4cL7uB4A9hlSRR+UZR8WFbLowl2
 EpxGub5BwqVxy/Ac1pfaC0hd3v2E71wovWlOG7AZI/uMRGVYbTSlRqe1oonkWT40R+/G
 W5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ei4Xv4o2pOR6S2ty1NSSqhLoOImjUC+dfu4/vWG3xOs=;
 b=Ai5eFXOTWHKqUc2meYwNe6p64duXnVjvx3+8zA2JY5xhRMKwUMKc0djz0kndwIEh96
 Att+wQs9T7EbxcKbvKrcbXq5reQ748FcdCXXBbvAFyqG/QmjDd4cParf/KbV/npsymLD
 KOiAOcD5Iz8qhqhEejQODJW0/Xi4a0ysNcoOsZ3GVJOfbAvyeRQ41F1HkS+yvd/CqVVn
 lVMqEnDCTZWEgr+l3TyiLUKX5NfiWQgJwrdQzq0A/wwg4IJHNRUoZQZrboufjS67wvNk
 ipsIvPn7JQQJXoD67QxDrydbqaQAORKM+ZX8KnYT6a4HWXaJpDDdubsX+GMMpOL+VFnw
 2iIg==
X-Gm-Message-State: AOAM531fHiuiY3OaCbN2ZnAh/M4EN2QFPSb7jA5gOIc6PhCq8ht5OAt+
 mMMDfqe7+9D/1jejbw5I6D9iBJArUv0=
X-Google-Smtp-Source: ABdhPJyd8HQcTK9wMuO9Ds0NCCUbLz3J4MLKPQSYbONeY0tC2WeH1fQjvRr66Tea86LZkIZxiUvfgg==
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr1917821wmh.84.1642791532016; 
 Fri, 21 Jan 2022 10:58:52 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:51 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:55 +0100
Message-Id: <20220121123859.754653-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/8] package/perl-libwww-perl: bump to version
 6.60
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
 package/perl-libwww-perl/perl-libwww-perl.hash | 6 +++---
 package/perl-libwww-perl/perl-libwww-perl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 2c9b19d6e..e32258050 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  e0b7b07a01f19cc507d3a9b55951ce3a  libwww-perl-6.57.tar.gz
-sha256  30c242359cb808f3fe2b115fb90712410557f0786ad74844f9801fd719bc42f8  libwww-perl-6.57.tar.gz
+md5  ce5180358d9279b2843a6518bf2de200  libwww-perl-6.60.tar.gz
+sha256  cdd28b9237b9c6791725b9099695c7c3c720b33881606fd6cc7635a5495bb07c  libwww-perl-6.60.tar.gz
 
 # computed by scancpan
-sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
+sha256  311f168ba9a7819ffab4fea19858f9e880737baf6d112929d11530205035a4cc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 23e2aa3bb..aa15ebb59 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.57
+PERL_LIBWWW_PERL_VERSION = 6.60
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
