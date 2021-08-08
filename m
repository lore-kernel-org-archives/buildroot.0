Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8A7C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A73D60EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 18:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A73D60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFA8827FB;
	Sun,  8 Aug 2021 18:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGlUwvqKLiAZ; Sun,  8 Aug 2021 18:21:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471EC827AF;
	Sun,  8 Aug 2021 18:21:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17ED21BF4D8
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06B7F6058C
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 18:21:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xDrDa_G4AbJS for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 18:21:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1502A600C4
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 18:21:01 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k29so5530206wrd.7
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5uFki0ZMMLY+/pb5pxSTgmVRnz/tLnnH1XEsbB/OyN8=;
 b=EMfOuIBiAXhm5kjXqGqsz8HJ2KP8g1eLywJz85XBTa8/5DlzaUyk+ifGosZEmD/qe9
 KMoR2iyaysHOklGq/Htyg/pc7Tnj5xo5uiNTOD3mpo+6PWp6mQg3XB1fprcZGEsbh5xZ
 yl5uWR9PFRD/dwNAD+x3h81/ULvbzjEhXj59pQrBTgu+dpJbfP9j2AdjyRER4JHLG83X
 ux24cmRQ9xxdZSCCbg4XSZwWtECeBXhkEp/nN1X3pMt4WPRG7Jzf/nHXrE6YNo7Cb1p3
 9i4rT2+5iuF2SLBPlG95WNxKHn7ne5wnio36jqX3CWG7caqjchRRByLLQ/g8ppaFNqii
 1iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5uFki0ZMMLY+/pb5pxSTgmVRnz/tLnnH1XEsbB/OyN8=;
 b=X1SZdHehyKHa4hPuBZxw2HvdX6xAcVyTqfGbUvb8R1KG66dUBR3GdX//zlgiur2BnB
 ZvxWbZyVr8kALKrD+YLIu02fre7bc0Lbcr1sp++umYSe7f6YNNPNZFNcS/3yg0/b3e6t
 tXShaI9xrU5v1IZ3pyXr91eP/pjbyH2mORF9LexFt1cYWDcN+ljwgtIE/8mj5Ut/Qxqg
 MGUNOoLQxdHmER4cfVNsu8GAcPKQryeAPFCrjlubK/VVVIgJh+tJrKB6wBlcxKTHBUYf
 VXpylgRyNzwMlB6V9XvPhbKiWEgJh5yq6qP/t22E1gMqTl6fAB65aMzG9v7XOGpQr211
 mzow==
X-Gm-Message-State: AOAM533yfBKD88TIDRRf6DPQoAj5TcW2E5Z0sNSIFZfzomTtHzq/XOcg
 ZT+Ke04ctr15dDkAcQQIG4ySiJvCz4I8eg==
X-Google-Smtp-Source: ABdhPJyCNfHGPQuFb7DEvJ2P2LPjGgO3zboGrrb+T5xkM85qrRrji6gKQTw/ckUETrxNL2oCYQTE1g==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr6703441wri.250.1628446860136; 
 Sun, 08 Aug 2021 11:21:00 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id u15sm8388232wmq.33.2021.08.08.11.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 11:20:59 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mCnPu-0007Mr-89; Sun, 08 Aug 2021 20:20:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 20:20:55 +0200
Message-Id: <20210808182056.28271-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ruby: security bump to version 3.0.2
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

Fixes the following security issues:

- CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
- CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
- CVE-2021-31799: A command injection vulnerability in RDoc

For more details, see the announcement:
https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.hash | 4 ++--
 package/ruby/ruby.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
index b79596e57a..e3510cc97e 100644
--- a/package/ruby/ruby.hash
+++ b/package/ruby/ruby.hash
@@ -1,5 +1,5 @@
-# https://www.ruby-lang.org/en/news/2021/04/05/ruby-3-0-1-released/
-sha512  97d2e883656060846b304368d9d836e2f3ef39859c36171c9398a0573818e4ed75bfd7460f901a9553f7f53518c505327a66e74f83704a881469f5ac61fe13d7  ruby-3.0.1.tar.xz
+# https://www.ruby-lang.org/en/news/2021/07/07/ruby-3-0-2-released/
+sha512  0f702e2d8ca1342a9d4284dbdd234a3588e057b92566353aa7c21835cf09a3932864b2acf459a976960a1704e9befa562155d36b98b7cda8bd99526e10a374c4  ruby-3.0.2.tar.xz
 # License files, Locally calculated
 sha256  274f8d7983052448e7fd691c81043465c92ee6fb7bd8ab3f20a7997862f2778e  LEGAL
 sha256  967586d538a28955ec2541910cf63c5ac345fcdea94bfb1f1705a1f6eb36bcbb  COPYING
diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a71ca3a8a2..7e0266c6df 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 RUBY_VERSION_MAJOR = 3.0
-RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
-RUBY_VERSION_EXT = 3.0.1
+RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
+RUBY_VERSION_EXT = 3.0.2
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
