Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B5BCAC59B
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F33440B64;
	Tue, 16 Sep 2025 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwxuhEAdtMI8; Tue, 16 Sep 2025 17:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9291040A67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9291040A67;
	Tue, 16 Sep 2025 17:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1E1112D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E35E461054
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_NKK4_1dAny for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 17:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C756361058
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C756361058
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C756361058
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 17:51:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45f2c4c3853so14902745e9.2
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 10:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758045106; x=1758649906;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iq8IXLatxXFtQVKMAJs95qJpJ2ZLr11eGI8wUXd+6uc=;
 b=M1yrEZnREjf0C4NcWIAJHATiMHYQuZtJKvDavfZOj/9mCA7naOL68HAC8gojFgUgwa
 HgtgpV1H5uppqhC6W3hy0UT9LmmDga7GRPeBTJ6hK7ut9mYCp5Io4pSg2L8poW0vpt2J
 0vm1/35aIYcKYkIuCQQlfdFeXMYel5e3a/AhoozEFiD8TeS0ZObaBXZlSoAmAVhlA5ya
 3ZMhE4zgwuPM6jOA6KTN0myedRx/88luL3uoV3zFfh6I9UHzjfWNt0RLY7Jj8cIyM9tR
 qdFGUeH7idApRYftlm9UeEFXa0G7Y9h+DQIjRmhnPD9UWGcT4Cb8BESFK+XQVBpQuwFf
 Q/fA==
X-Gm-Message-State: AOJu0YwVEC4Rwu6cbp12BrK3fAjusB5Os9nHGyDsBudJBShTejUVEbdS
 KJzQR2EBHjn/Lpt4QgygTysZI9xtbOAQzlgxc2UN9iWvrWTKU4qrE3lsz7nZPtbYw71Qt9pxj0j
 iqDp9JIc=
X-Gm-Gg: ASbGncuJg+Md3+k3i9nEZqcnbj3+PcFdxrNq7Z+w9wVk/llnJXP5IhDopbTPJsJmUGa
 vMyiTfJv7GHZXkXN/jsQrsnGa9Zg2mA6C8CziiDrzX2J8jGuBk9Bf22LOez3VgIAv2y/tk1O3SJ
 5pnUdMSn1y1LPoKCGJ5FEL0BKcBlqJ4f7aJ5ji1J3/BEFV40WEw30+KMlQm6A5MNxHRyW8B29IB
 +jzaXjllTF2B4M5ui/8Vc+qQGmqGC3w0UiNf257V4DElm61gOABoV0bEQZbsuf0VhDU5DCe2fDi
 ztjd25MMJ8S/UFZJkJZcw94w/mIIUoVLlcHX9HkCJduGA8b+kwNnzU/LQg8fLQjtlr9LiLaVyFA
 9t3dZyiJVhZQ/lh8=
X-Google-Smtp-Source: AGHT+IGqo9RT5Xc2OnyqFjK9++UaC9pddvLlhwpxWsKyB+iURyv/fAqQTb2PQOXViP4neXAY8lRuhQ==
X-Received: by 2002:a7b:cd13:0:b0:45c:b5e0:2cf5 with SMTP id
 5b1f17b1804b1-45f211f9926mr125998815e9.24.1758045105773; 
 Tue, 16 Sep 2025 10:51:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32085823sm23625805e9.0.2025.09.16.10.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 10:51:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 19:51:44 +0200
Message-ID: <20250916175144.1057267-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758045106; x=1758649906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iq8IXLatxXFtQVKMAJs95qJpJ2ZLr11eGI8wUXd+6uc=;
 b=UbNFfLZUCsrAQqRxN0JVzXdyRKTUGeX+4icWkdl3vGvjgK6OTqm+1wAxb43VH2hLzF
 nEYTTHtJdMr2ST4rNnpyqJWHM/OcKhTej3wFk6yI9jwFsXp/ay4mbtN6odl2GUHW8z/i
 xMluY5hhoB4OZe2FJ6XClIsakx4JzCpgLbD8Xs53mdqFmHkqtVVwTtTSfEapQwS15gjb
 8R1C9rxQoIjPuNhF+K+HmfouGvg0PCNyFtJNQiP20/az2hQWvq5+Zzw/OSh0sOLz+Ori
 vhd7VwP8gnJkjxpDdsZXKt245huVkbkx6Wif+fhpdsMS8dpIiIkrGFDfss67l2BjU41F
 0mMA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UbNFfLZU
Subject: [Buildroot] [PATCH] package/cjson: update deprecated CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'cpe:2.3:a:cjson_project:cjson:0.0.0:*:*:*:*:*:*:*' has been
deprecated in favour of 'cpe:2.3:a:davegamble:cjson:0.0.0:*:*:*:*:*:*:*''

See https://nvd.nist.gov/products/cpe/detail/70BC45DA-D915-4A1D-96AF-84A6CECEE148

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cjson/cjson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 35304ec618..b87ce97ca2 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,7 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
-CJSON_CPE_ID_VALID = YES
+CJSON_CPE_ID_VENDOR = davegamble
 # Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
 # -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
 CJSON_CONF_OPTS += \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
