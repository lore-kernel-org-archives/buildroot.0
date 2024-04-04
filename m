Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA33CD1292
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7DD041A7D;
	Thu,  4 Apr 2024 12:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZubgGBaUJiXy; Thu,  4 Apr 2024 12:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A3741A48
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A3741A48;
	Thu,  4 Apr 2024 12:45:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2921BF3D8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0769D60F22
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV9dJetQ1mge for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:44:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E491660F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E491660F75
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E491660F75
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:44:54 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3436b096690so1588031f8f.1
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712234692; x=1712839492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SdLXZdlgmIr74B17vXp11v05sD1s6UAunp4OWgZlNgE=;
 b=WJuW2JqPKgqLqK3yMxKaCoeXB/pg/qQU5F+Dboda7mjViWlLiwkfrQFjNJOx7q5FOt
 DwzNGbtbcFK8xcyR7cvru6fp2lOzvTZI6wh8buDl0lEAtL69UT0/cg1kb5rXy6hqSpiB
 1Mzr0joe7d8z04v7GXQwR+jknR1/e2BdHvGa+hEB7TJNnCP3J8KS7aXXJ5/qgkunAouR
 s5WmY+1zxje/aDRXqp6qlkIk0RGx6ZVesXZjIfrQXouvtFkcEiMs9xNC3h4HkqYz3jkC
 rObiwy1HB5mCVgcFA4PisVE0+S4XZrZqCcvIGvjGOvDLZ4JMq+yweSq6QX9XSBUZxbju
 5I0w==
X-Gm-Message-State: AOJu0YzFiEfXckEXjCzli1y+CCoh94IMGpAiDk4Cbx98PwccwyiHtTnf
 6DuufZOYXs0T/+xp7kgEEhdCeagQLauHN2JzKRh+RwxDDbAI1bAQ+u9HiBkQBKMfYa59TqS1TsH
 F
X-Google-Smtp-Source: AGHT+IEhPBDPLKpL/89RFOLPIBZr8EkzVjwcO498MPi+nwP4W4fyJ7kx0Ygl1XNJcd4ITIVvqqRyxA==
X-Received: by 2002:a5d:5242:0:b0:343:b748:9af2 with SMTP id
 k2-20020a5d5242000000b00343b7489af2mr1928871wrc.19.1712234692219; 
 Thu, 04 Apr 2024 05:44:52 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a056000014500b00341dc343e21sm19913663wrx.65.2024.04.04.05.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 05:44:51 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Thu,  4 Apr 2024 14:43:26 +0200
Message-ID: <20240404124329.768546-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404124329.768546-1-thomas.perale@mind.be>
References: <20240404124329.768546-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712234692; x=1712839492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdLXZdlgmIr74B17vXp11v05sD1s6UAunp4OWgZlNgE=;
 b=SDnzGmf14mhWCkCwGJmOJWAEEF/Jry/eOFX6xHWt9Uv0WSWcENEog0/rCdl2/Q6r5R
 s5EpR1A98YFsb35g4PeTqii1Ie5qo7fd+0/CEX0p6kGgItONkQWdEok3ficDTO6mv4Gd
 B62pNp8hD8CYi2MYOCKpaQwJMpihIhNRe+BwdOTkFPSPKG/bqAoOxrXJn8oDYdeOaGVa
 TBdJ6mBt0yyOB9J5PP1/HnLQzpF0MI5uGcF0ZGypcIBN/tytQTBHa50D0LGnZhKgK9J9
 gR+jD2JM3PguUQNVcFyn8vQqDlq+mWl5k0ScycMZAJjPtAW1ku46tf5wv2Tpt9fC1tF1
 82Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=SDnzGmf1
Subject: [Buildroot] [RFC PATCH 2/5] package/pkg-utils.mk:
 urlencode/urldecode macros
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch introduces two new macros:

  - urlencode
  - urldecode

URL encoding consists of converting ASCII characters into
a percent symbol followed by a two digit hexadecimal code.
And the other way around for URL decoding.

The macros encode/decode a string passed as an argument by
escaping the following characters:

  - '%' is replaced by %25
  - 'space' is replaced by %20

The characters covered by this patch is non exhaustive.

Because the Make language treats spaces as different entry of a list,
the aim of those macros is to provide a well known encoding method
to escape text containing spaces into a string that won't be
treated as a list by the Make language.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-utils.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 723bbe4e24..b8cfb85fca 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -329,3 +329,15 @@ define NXP_EXTRACT_HELPER
 	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
 	rmdir $(@D)/$(basename $(notdir $(1)))
 endef
+
+# urlencode -- returns an url encoded string.
+#   - encode % into %25
+#   - encode spaces into %20
+#
+# $(1): text
+urlencode = $(subst $(space),%20,$(subst %,%25,$(1)))
+
+# urldecode -- decode an url encoded string.
+#
+# $(1): text
+urldecode = $(subst %25,%,$(subst %20,$(space),$(1)))
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
