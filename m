Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22FAECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51F0F41090;
	Mon, 12 Sep 2022 03:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51F0F41090
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQFEByrefIAw; Mon, 12 Sep 2022 03:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 951074018E;
	Mon, 12 Sep 2022 03:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 951074018E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743E41BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F8A284012
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8A284012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsfW0e3sTNet for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02FC983F4C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02FC983F4C
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:40 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 d12-20020a05600c34cc00b003a83d20812fso6336804wmq.1
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9tbSVlmuYrp2gNBEnz415qjuUpa+gW2aS4kR7zTufVM=;
 b=U5yUsxpX6y3TPjSrMqmY2elA78XIp6DwhkPeYqaidxuutUEI1TKvBcF9dCEvUatPFk
 qUR/2Z+ZguKfhOXpqMuJ1ciG76SQzIPRUxUHnEkpkWaLMWZSw5czW+uTLuGaFU27vc7c
 8MsZYxeof0QKkkVZHQrh13z9wJlfr38RtsxC0r3MycKT4m5GDdNbL/5FBO78XRA6l1wY
 qVvr3NfkS4+fjsurP9bCkNQ2TfRfKao6l6Y6+A4wcBD+fsmtfAeMVhir2aSXyz2xXGGh
 CQxXeTbyjl21MFYrmbSfQ4PWrAEXXCeDQdHpX8hpXeDsa5mzyNNjgx6n/O03I0HHBe4k
 SeaQ==
X-Gm-Message-State: ACgBeo16YkbO7DzqAF6k5k0Luwr5xytgEm1VnxUwWiYbPtlqxZZOe/et
 qaRy6pahvMao+hQx/HIGZ1khBDBgzt4=
X-Google-Smtp-Source: AA6agR7/XjxQFcytqH/cVViMTojMTEr23zqMcNBTCLJd5+LGC4RaEWZ2mMcBcmvcA1jMZDGzU5ZqJQ==
X-Received: by 2002:a7b:c2a2:0:b0:3a8:4959:a327 with SMTP id
 c2-20020a7bc2a2000000b003a84959a327mr12348022wmk.50.1662953675658; 
 Sun, 11 Sep 2022 20:34:35 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:18 +0200
Message-Id: <20220912033418.2587016-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9tbSVlmuYrp2gNBEnz415qjuUpa+gW2aS4kR7zTufVM=;
 b=GAgiJ48yYYaVruTIOePqRyAa3kS2cP+rOmjN3AHVad2JbHqatiWxFsdoBj+qpu1mUu
 6hX9M2yjxNHsoEceJsjNFIixMRnGjteWZ5dP9t+SJD+OiwlFgd7K7/bnOTn0qdRuiEae
 e4wOXot9F94NP/YTeoKxWEwrUU1/ui8aaRXvzIJKBqnjYTkTdUs3omyFLC8g5t4CrJbx
 +3DzGifGlwSJNrTIdD1H1Na1324/4jSQVZdu5WkXcCWyKiDZTVSXeMt1NQTIX3TQZ7Mm
 xn8mK1oh25MaqWFi0wx4N+QImnaDdV911vzFDW3Fg6deRkkSSL+kV4WVCJTN+7TPsCbQ
 0ryw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GAgiJ48y
Subject: [Buildroot] [PATCH 9/9] package/perl-uri: bump to version 5.12
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
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index e7e272c63..a169fc067 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  2a00d3dbf891df4256d251382aefd9b9  URI-5.10.tar.gz
-sha256  16325d5e308c7b7ab623d1bf944e1354c5f2245afcfadb8eed1e2cae9a0bd0b5  URI-5.10.tar.gz
+md5  d7fc1b1c88d03357aed2f03b455a223e  URI-5.12.tar.gz
+sha256  66abe0eaddd76b74801ecd28ec1411605887550fc0a45ef6aa744fdad768d9b3  URI-5.12.tar.gz
 
 # computed by scancpan
 sha256  d4f0b7a8771dcb1eee79a38c2e466eb997e23565a6687dd1900a2027eabe12a0  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d451bc5d6..b0ac885c1 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.10
+PERL_URI_VERSION = 5.12
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
