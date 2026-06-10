Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781A0CD8CB2
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 06:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29A0D40AA8;
	Wed, 10 Jun 2026 06:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MM4leGYOfca2; Wed, 10 Jun 2026 06:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C03F40A9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781074003;
	bh=9rhLKImKppaLhqmgEp80AvpjjjRmYeOvsbFWUeKcwx8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CJY7rGB4P38EwE4DdHDwmhiPQMLR0RTit2s2Ot586FK0AJwMpy68JHuhc+QU8IMDi
	 JydQNnGOzBRdWmKZUBV9T9GC3eneTkmiqfEQUKICN+v8pOsMd+TIAJ+97u87wKHtpa
	 MLjuJaS+h5coRp+/1PGwhrGF1Ud0Fwd+cxBvUN0Kb9BYZwDFMfJCRIPoJwhjw5TORm
	 ewOg2iTwIRdOoCew+YBpKy1dAFuhwt1sHHpoOMjHqrp2IPmi97hRjUgHV/izEz9BrS
	 2IC54wc7ciHdj+/qVH93w4wHNw7uA1FnMfnje6fpVg82eOGOThXmvNPcAcALlkRQjV
	 OYkELkPR4Z6JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C03F40A9A;
	Wed, 10 Jun 2026 06:46:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30C28256
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 229D880EF4
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 06:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k57FQsumvhhp for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 06:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 425E980EEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 425E980EEE
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 425E980EEE
 for <buildroot@busybox.net>; Wed, 10 Jun 2026 06:46:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so4723306f8f.0
 for <buildroot@busybox.net>; Tue, 09 Jun 2026 23:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781073999; x=1781678799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7X3Ba7CES/MWkavIM5jTW4NaGNACAz/wxJlvleYqxY=;
 b=bfho4yEweMF1l2pa0GgX1VxkJfLzDPFkGnZcxnqAvVhgxHvLhLEm2ORoO6piONA0+H
 AkVcNmKsxjJPl0rTsezKARaTKFhKBSGDxYQWu2X04FDdKjjq1e/2+5J3vrEGT2RxAN+K
 fjZw/quwF05oXa+F7Cza7D90gd4OvdInTblx9q7EN5Py7Wp2aEY6NEYc62gIGVnv8uvU
 4XA0h5RXJ8D1JYhJVdjfJhiuLf9YS6DBirAMzZ5n9XsmY15J/TXrW86yoJyDuZ13c+sa
 5lluhsjL/24IhRE842Z/99V9QqeQ0YlyJQxaHRG3JlmqTSwCdNz14fIMEec5VYxU+WMJ
 u0jg==
X-Gm-Message-State: AOJu0YztdhDnVuV6A5hrH2diJ+wB4zmS8Ewv0at0l/xGt3F4XQWL0pvU
 fsS2Sy4PzYMb0Mb1+KbhmiItvdDuLXnEVlYHmx8h9Yh8GfXNrRUAinltptmjJF03RU97XOLiKjz
 yMvGikjuo
X-Gm-Gg: Acq92OGv2iJyOcjXH8Faaq235yLb0K/LYv8x7+iXNShsbMIEBHj8Yak0K2cIQNvtj2I
 6oUIqCmMoC0QUozfrE/eAcx2AIkj273as8U959IB/Q4J0fmnGjnnq2LShSzvugfj9UbbzhKQgcZ
 lhGConQQI584jcNrSCYPQhTT2sYptwyqCIxpVDkVHP4n0fURtgAnfdOvUkEM0WYGoBVEFGHhxGv
 nhi1htOvp9cyDp86Or9NIWSgiGDIR3o3O0Pm+Jz30dicJjn6URLhSkcAN/GPwJ/B3qzCPa6wsUd
 ANpmgQc/shG8JaTXGUzaJ3kDa6ZHLhVxf24scAX4VzOT6AymxPmOjWcnkmflhZIWyzm+Rf8yY2P
 p+g/U0uFMYiF45iG659LUFywBhEawxju4I8UkfAvWWRhiOtSaL+9JaBeXwpfyQEkxVyly8B+3TB
 G6s0jGXF8FI88bx6rCNg4YnMg3784qfLDWYtzPCgps9uWbt7mEpxMDl0xwiSWu
X-Received: by 2002:a05:600c:37c9:b0:490:b629:286c with SMTP id
 5b1f17b1804b1-490c259ec1cmr391666595e9.12.1781073997925; 
 Tue, 09 Jun 2026 23:46:37 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dc577sm70676579f8f.3.2026.06.09.23.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 23:46:37 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 10 Jun 2026 08:46:25 +0200
Message-ID: <20260610064625.70476-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781073999; x=1781678799; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+7X3Ba7CES/MWkavIM5jTW4NaGNACAz/wxJlvleYqxY=;
 b=F+3uRsRQxdFG8n4NgfZZ0nRmaXpnycISE6Fs+R8O8DjIdDIw8ygceUnXY9h2M0GVbm
 S5CKvhrh7Mq36eZ3LWa9L5OCq/cMV8mqD23GnFR9eiq25ZZSBBG9c75jbyWZov0HSNeH
 /LV2WQynoZQu/1Cw342d/hbuFe30ERfLzcdu8zJmQpvFI5qLRoNOhBlozfixqYuaTBSY
 FAzjbYoEJE20re37kJe/80bcIAQV53LkRd5QyA3HjY/y92lqO880qv53Q8IisZ01pLDt
 hhROB1nU9BMRHFm1aH9HEdFHYd0+ulZ7i3RYIf3/DDUjEpSv/U89H28oUfvYjC+kex+W
 22Dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=F+3uRsRQ
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump to version 0.3.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gettext-tiny/gettext-tiny.hash | 2 +-
 package/gettext-tiny/gettext-tiny.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
index f7ed50b49..e255aded2 100644
--- a/package/gettext-tiny/gettext-tiny.hash
+++ b/package/gettext-tiny/gettext-tiny.hash
@@ -1,5 +1,5 @@
 # Locally Computed:
-sha256  29cc165e27e83d2bb3760118c2368eadab550830d962d758e51bd36eb860f383  gettext-tiny-0.3.2.tar.gz
+sha256  daff8b4a7863745710ec0b02657fd20bda2d90398f54945751259bb94d6ebffd  gettext-tiny-0.3.3.tar.gz
 sha256  4c938aa3d8fa3c184bba5e87a8a2febc89560627c9d0567536879e3eca1a7b4f  LICENSE
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  extra/COPYING
 # Locally Computed:
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 3fe8a781d..625ec5694 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GETTEXT_TINY_VERSION = 0.3.2
+GETTEXT_TINY_VERSION = 0.3.3
 GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,v$(GETTEXT_TINY_VERSION))
 GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
 GETTEXT_TINY_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
