Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B34C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 14:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C6C8118A;
	Sun, 26 Jan 2025 14:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4k1GDgC47QDd; Sun, 26 Jan 2025 14:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE678118F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE678118F;
	Sun, 26 Jan 2025 14:09:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4DA794A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C249B4097F
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhexZ9HhD9e2 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 14:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86450400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86450400E0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86450400E0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 14:09:35 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-844e7409f8aso95864039f.1
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 06:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737900574; x=1738505374;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/X3e8Gk/lMjT69xVT9qi5rwPMmcKHK+R7tw/hm6WnU=;
 b=LcYh/3xAYA3mfl4J1YhEKYR1eg38/ATdZ5K7VFhI2Jucd2MbApM9yCs1zMZ/ACQWjz
 GBIxH4gw+Lx1gzOTBKeKGT/VVWRNmmqZx5PDLIb7WT5VUTQn290h0Af4f7j/NrE6jp43
 24nS5qLf/0Fg22+mWzrvFi9DcFlJQdVVObR1NtuZIkPAqzKInHQQbKidu4SbErfhIP5N
 Jb2kVsYbUc+RrHxFG3qnFVRpOhOirWqoakmZr1d66E4JLhSLpXJzxLrollNBX3DIZfV2
 +Irz6ryxx6t7flJDX/Q6OCneJ6gs3WiruCoqpYdGCglLuWP0mLMVNfJoIMpwc4w/nGtM
 1N6A==
X-Gm-Message-State: AOJu0YwNQhj1svGK5HnQioWNF+2p+unX90PfGquuP9Y5Nkai+vzTHJMu
 xikm5JVQvUZJ+ouJdAglkbvKwR48We7UyoCn/NITEjoXf2GB4sjGpYP7+oD9
X-Gm-Gg: ASbGncv0XbDgPUrIbPIYosh4H2aDuE/aefBD6kzlZ7rBWzlg/3NLTqvIXVdmoJ0WUAx
 R5dL7N4RSuHHIQJkhFxxA49PDZHUn0AtobI4rSgsW4vZx0jNNYPdrU5ax1+o7y8loKtQf7i61hx
 GIXm4S7bfCyOV7io5fuDGB9+jrBiW8o9jTy0BBEFop04rdZhaIsxCXg35CihPY/oPRvq7TcMmFU
 Y6SH0+TlqFyLFp/0AD2k147O7HqupIQYrtXGKvrER+neYt4cv5/xssiRyS3QsmBK13J1+BfmMBQ
 QbAyE1Z8p9fIkfHAWaDPTfmu+AGY+3yUNVTrS0xmtVgnwKnFC1BPwCc=
X-Google-Smtp-Source: AGHT+IE6AnkGKr/13SJjIk3URSUq95E+HffZ/erB07JJph6HSQG4KGMCCiYvXBXZTzmt+5AN55suzA==
X-Received: by 2002:a05:6602:4881:b0:84f:537d:b097 with SMTP id
 ca18e2360f4ac-851b62b5a35mr3174146339f.12.1737900574232; 
 Sun, 26 Jan 2025 06:09:34 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521de1206dsm220375739f.17.2025.01.26.06.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2025 06:09:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 07:09:17 -0700
Message-Id: <20250126140917.235801-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737900574; x=1738505374; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u/X3e8Gk/lMjT69xVT9qi5rwPMmcKHK+R7tw/hm6WnU=;
 b=dqBxHSPVronq+UN72w+WdLdlRQjcfBTbvCkMLqqEV3WyK22RXgUYBcF2JlmklyDzTz
 CSQwmvbWgZIcmZcfjCPP94++YhAs43lUlvYm7SJpVVI+xukh8zzetWIC/NDzU1ab5OVi
 SuWHYwP3KMUKUsRaMRMCU0yqWUBeOLxW1cyz9UNdCRJcDgOwzcaMYda6uKhUftHgmTcb
 dedaXNKEuhUOMeGs6fnpWGkTMRhDzUow3w2kmtFE1wIEIp1XihlQ3yWy4O74Jl4efKg1
 UTdjnsZw4bs8Nxvj8gLM5OEfL70NBB9advYSXEElfnMfwMRH4k5tUdZgLRPzWGG/5uvR
 6xvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dqBxHSPV
Subject: [Buildroot] [PATCH 1/1] package/python-attrs: bump to version 25.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-attrs/python-attrs.hash | 4 ++--
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index ae13fbb552..95b0a63bca 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  85dc1d9cca54e0986f429bfd1f2a4987  attrs-24.3.0.tar.gz
-sha256  8f5c07333d543103541ba7be0e2ce16eeee8130cb0b3f9238ab904ce1e85baff  attrs-24.3.0.tar.gz
+md5  338069d6f69126086d589b2cb44f4c73  attrs-25.1.0.tar.gz
+sha256  1c97078a80c814273a76b2a298a932eb681c87415c11dee0a6921de7f1b02c3e  attrs-25.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 97b72df6dd..74d0c2f8d1 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 24.3.0
+PYTHON_ATTRS_VERSION = 25.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/48/c8/6260f8ccc11f0917360fc0da435c5c9c7504e3db174d5a12a1494887b045
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/49/7c/fdf464bcc51d23881d110abd74b512a42b3d5d376a55a831b44c603ae17f
 PYTHON_ATTRS_SETUP_TYPE = hatch
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
