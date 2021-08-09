Return-Path: <SRS0=uMfR=NA=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8C0C4338F
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 19:38:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBCA61019
	for <buildroot@archiver.kernel.org>; Mon,  9 Aug 2021 19:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BBCA61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A9F60632;
	Mon,  9 Aug 2021 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4J6IpHB3qtN; Mon,  9 Aug 2021 19:38:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3726063B;
	Mon,  9 Aug 2021 19:38:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29FC71BF281
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 19:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1519740137
 for <buildroot@lists.busybox.net>; Mon,  9 Aug 2021 19:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HTfNLYtpLOv2 for <buildroot@lists.busybox.net>;
 Mon,  9 Aug 2021 19:38:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A05DE400E5
 for <buildroot@buildroot.org>; Mon,  9 Aug 2021 19:38:47 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b7so26381735edu.3
 for <buildroot@buildroot.org>; Mon, 09 Aug 2021 12:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lCh4TrX5iXSgnQYVrz70OzVKSaAEm+Z+ZdXmuWWL/rE=;
 b=soaOjWWFJRE8faXHJ+fcqQoGy8v2fWt7a63w+/L1Bcgs3ODyNdmUq4JeyrO41s52ei
 GgdDX1zO55GJ0sb4/TzJMBGca++y9t93f5roGJIeeXwdc0kzEJVWMl0uNsIjQODenUx8
 E0AYQ7rSeRI+14KCpkLM15n4F7Cf/JMGV6tI5WglJZLnYn9SxxV9Uvrt9X2YQ2BUQbYK
 +lrTo7O6HXY8G9qqwHJ1LoLgT+XFYLo2b1rV2C86Q7ZOU4YFUjXtHtxwVQknaGejBnoH
 PlRdgc7KP1i+3kD01RktfAVE7aHvexvmcDVuJnSwyGfRbCWPJA6XDahdHhR6jySimvB0
 0orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lCh4TrX5iXSgnQYVrz70OzVKSaAEm+Z+ZdXmuWWL/rE=;
 b=sP7NJxznUPDDS9TqNA12BdvH7Bks+fZqIhNO/Xy5UlJtrw3o8+EmkfErABi84ThxSy
 syjrrhy6YZGEs6Q7qYtvfBTrq283uaKfl9wUtgtL4pXSZ00koGsk0NYBYDgh54uiLj6/
 WaFp1RZiVtPjjnrwTbIEJmkeDk+w7j+EaF+vdgWGkgB0lb6/5uZ5Py57U2blMP8ZJV9p
 ffWWJca+gG9+5vhsc4klWrW6Ssj3TWMkFa0i82L9X1MCMa/tg+m0lo08eIeiFwuD90/l
 ZgnmSDCGhSPXG6LCz07sudaxkchQ6U5OuQva8mWeoZoTSTDWLDsZEJrnKvxHfFkdaXdz
 732g==
X-Gm-Message-State: AOAM532FGQ4VjEEXrBwTjnCeevhVZEgcjKuD31+iR4ZvG11W/JO0rX/J
 yQF/8XLGR1ZObFf7Nl/AZiha6OLAwJV7lg==
X-Google-Smtp-Source: ABdhPJwMDlqAf18ZMt1HQfX0MdZGynZONxAKZEG9CQZ+YQDS1xv1GxtY49QytObqEYwuBr0ejKPIkg==
X-Received: by 2002:aa7:d4da:: with SMTP id t26mr31863526edr.42.1628537925826; 
 Mon, 09 Aug 2021 12:38:45 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id g24sm6147046ejo.77.2021.08.09.12.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 12:38:45 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mDB6h-0007Y1-Ly; Mon, 09 Aug 2021 21:38:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Aug 2021 21:38:42 +0200
Message-Id: <20210809193842.28963-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ruby: fix RUBY_VERSION_EXT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Correct RUBY_VERSION_EXT after commit be9783951d1d44 (package/ruby: security
bump to version 3.0.1):

ls output/target/usr/lib/ruby/
3.0.0  site_ruby  vendor_ruby

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 7e0266c6df..2434ce946b 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,7 +6,7 @@
 
 RUBY_VERSION_MAJOR = 3.0
 RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
-RUBY_VERSION_EXT = 3.0.2
+RUBY_VERSION_EXT = 3.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
