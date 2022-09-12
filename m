Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC9DECAAD3
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 03:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8E0C40186;
	Mon, 12 Sep 2022 03:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8E0C40186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZpvEU67rZC3; Mon, 12 Sep 2022 03:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F6AA40121;
	Mon, 12 Sep 2022 03:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F6AA40121
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EEBD1BF9AD
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59B0183F4C
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 03:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59B0183F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSi-4mOdueUl for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 03:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206D584214
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206D584214
 for <buildroot@busybox.net>; Mon, 12 Sep 2022 03:34:35 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bj14so13250383wrb.12
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 20:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x2IzXajCZHOKfXjrTBTdD6Y16aEIC94nNjR8Ajcg/Ns=;
 b=TFhIvW6EFmAPBMaiF+oT7BryWgn2Y20gbw9XZgRNagQA7LSU0f9RtHPingv2f0n6Fm
 dU67YOeC+UdZcIGi+ujfDGFEhJhYitv5QjcjolGxayDRxbX01a1tOgH4XOCKguvj09O6
 zxbOJB2Q9gqYjGiryTEuhQfDJt7JjdkiTB6gA3krH0JJfayaPF59BLD8pjhzYxgTx2Z/
 f/P0F5VXIsiKOP234fml6UAa36IIN1m28hTwWOs58pc55RLYld916v0/TSDEjbllfJuM
 smDgjnPHQDIQu4cAeH90LMSUXEvGZCuaFjw/n/e0S4m5YcTQAZ2Y0Hb2nSQVAQ8c5dR6
 LlXA==
X-Gm-Message-State: ACgBeo1/By46BwnA0S1Wm1ehcecdy8a8OK1pBArLa2vMeU7mXUIQt+fy
 uEYCyersy6HjHXEdREQb4FAY2abIlUo=
X-Google-Smtp-Source: AA6agR6RmuiHIDpLbkhh0/BWPTGtF2ZgyZ667RkR/u24jtjSKCLnxKwl1wUXUS1PIeF1PD0TgXc64Q==
X-Received: by 2002:adf:e80e:0:b0:226:d808:667d with SMTP id
 o14-20020adfe80e000000b00226d808667dmr13695570wrm.282.1662953672368; 
 Sun, 11 Sep 2022 20:34:32 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b0022862fd933asm6009588wrt.96.2022.09.11.20.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 20:34:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Sep 2022 05:34:14 +0200
Message-Id: <20220912033418.2587016-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912033418.2587016-1-francois.perrad@gadz.org>
References: <20220912033418.2587016-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x2IzXajCZHOKfXjrTBTdD6Y16aEIC94nNjR8Ajcg/Ns=;
 b=J5/dyVz6s8wq2jaB31crfqtYymRkhE3ss77ynCSScly3rHdJBAdjGsFutnw2IX08af
 xhRO0irg7AyimpaLDU28geYgDyJyRKFjM68kH7+1hYq97AyQYHT9hwRNorgQM3/WKxwF
 PqIsfGZn5ybLy/uPoIjADe6yxYwgO1bvVsoKgplxT/9Xl0GL6B5Nw8uTygUDZXApXQji
 T9xIAIpRsCf53IWD5HWjRZ4+Jz8SdfYguquQcJUZbWnBaUqMvszb6l7uMQKXJ55UkDBQ
 3erflwCGQrToDCdd+57mUiuu1bKRqV90ha0s9rdzXBoTjJeTJlPO2RlR5lVnhjyZ377e
 EVIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=J5/dyVz6
Subject: [Buildroot] [PATCH 5/9] package/perl-mojolicious: bump to version
 9.26
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
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index cd6c8ef7f..97625d129 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  fea8c6a9b97b988ee18b1616e20cf3db  Mojolicious-9.24.tar.gz
-sha256  5a2f2e064fe50ad94ec5ed175403a26ec1ff4150d77742d14ca7b842e17f9168  Mojolicious-9.24.tar.gz
+md5  494db2d1529e84a2575527dae8f3672d  Mojolicious-9.26.tar.gz
+sha256  9e428c5512698f05e151338d8fa12aede287ab3a5e429ec3d38c80a4a82c8d88  Mojolicious-9.26.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 4a05fe48b..dbf2e6173 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.24
+PERL_MOJOLICIOUS_VERSION = 9.26
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
