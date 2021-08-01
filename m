Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73DEC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:30:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A8560F8F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 21:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 54A8560F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF3D6069E;
	Sun,  1 Aug 2021 21:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zl4K1ZrhAr1; Sun,  1 Aug 2021 21:30:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B55605EB;
	Sun,  1 Aug 2021 21:30:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A2921BF36B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73D6340415
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 21:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-Nuomqpnwsx for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 21:30:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8087B4040B
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 21:30:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l18so19059679wrv.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pZGfV7M3++7GwirU57ELdlaPNlZ7ABphNdkWEA2bveY=;
 b=LIJ74rElOav0rYj3FGL082k4ddupnhI2ZRf1teSis+wMYoO71CclFg3SUCGDc9+asD
 VPOGfBpgOcPtbXxEIPfATfNyNdrXGeSB6L7Ig5JPm0UrnWxx9NUSXL58wiAUbUtjwsKe
 dTskOzj5uAmwA9Ofwlo+N96ONTU1VIkr159DORPqIfDsqjqV2rq8iTkHyBQNmcSZyeSu
 tOVH9hK8uM5bBxFKI1N/9Th5ynrMWX2udxIGvzQJybcIqH6N2DidJd7xEnKGGYa6Xejj
 Li8YcDxDfkTA/GGPHNGo8urXoSt68DKdDPkvghZgKz2eFYf8MMxJtER++U965z+efhBR
 Jt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pZGfV7M3++7GwirU57ELdlaPNlZ7ABphNdkWEA2bveY=;
 b=dQFGa1d7EdMNfzqZ93LQLtZKtPlS1Vq8K4PyXENZxTgzb+n3nFZbDOoIesFTQJUly9
 c/Yn2H1zsgoX5zFexUck2c7oCGP5oHeMkyj3JWoGeESqy8q2akTqE8q3fYOo+54F/BHS
 rmzGkphtO7bxeHN7EpBN0GhDX7z75NVjzXyXY6RPYq7AqQm/rvmwAUn3O7NxRHwuF4vE
 wNo3bwHbf6y5WTPPpPm9CDHptdxdTmCYxJecHnTmc8QSlrVJyoJMWjmb6NtFIyxLmjMu
 YWE654cYb9GzTg8VMZP53tNOKksm+p8Fmho7gxsD8SR3ZYawbaBxfUc7+SFmhlKYbzv/
 jw8Q==
X-Gm-Message-State: AOAM5311IdF8NLK+se7WX/YAu0W9seX6KOmK+Rrr2qoQT4kRQlbni90X
 D0fSPgkjiWDLtTWw30CE9jYWXStliSITww==
X-Google-Smtp-Source: ABdhPJwPj0aEoPpMXrZ2fom3IQVcfBfNkuEmSh6RUAzwlecDG3AVakn6owYZcbXNoZTV52onajMw3Q==
X-Received: by 2002:a5d:5645:: with SMTP id j5mr13904161wrw.426.1627853398301; 
 Sun, 01 Aug 2021 14:29:58 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id p2sm8976192wrr.21.2021.08.01.14.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 14:29:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 23:29:49 +0200
Message-Id: <20210801212949.382493-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libodb: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix the following build failure with gcc 11:

In file included from details/shared-ptr/base.cxx:5:
../odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
   38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
      |                                                 ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cfd5f92f0aa923815edba5fbfcd5b7b312d9d40e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libodb/libodb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb/libodb.mk b/package/libodb/libodb.mk
index f36d8957c0..11ca9de866 100644
--- a/package/libodb/libodb.mk
+++ b/package/libodb/libodb.mk
@@ -11,5 +11,6 @@ LIBODB_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_VERSION_MAJOR)
 LIBODB_INSTALL_STAGING = YES
 LIBODB_LICENSE = GPL-2.0
 LIBODB_LICENSE_FILES = LICENSE
+LIBODB_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
