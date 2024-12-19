Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D5AE7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF6B428DD;
	Thu, 19 Dec 2024 01:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tpPfA0DDhJZ; Thu, 19 Dec 2024 01:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30142428DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30142428DE;
	Thu, 19 Dec 2024 01:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C0DC0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DB018523B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCKiTIKGS9Zi for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:25:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 154EC85239
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154EC85239
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 154EC85239
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:25:36 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3ab2f414695so1039075ab.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734571536; x=1735176336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2c+SIfxvehYHDNsjnx+NL8nt85Xe0LdqhPTpJ7VKF60=;
 b=NoLkeE10+TDmptCXR86HsrV0d2vX5IraXW4hAiqf7ld1XcnVYnPHFp/BSz8ChGEO3j
 Z44inXIp72/nhlRtGxZNilX+8AW3ul3r3Y76fug6UCxr7ccd41MZ6RLhadIAAGK+j2Rq
 UsBk/7yjnNy0raTaKVD6h4xNijhS28z/3uAr4QolctE0Fn0vFmO/c9ERr4WrNnUHd8OJ
 WLTKSMdM/WmIx2XOf4NbBHab6Y7WEQjQ135YbJkaq2XhJQ9XWJJpzUAIb8dNBTYnYmTM
 p+PxziDgStXf1P0Dvzl1WoYmH4s879GjY0JnCEpjXU2xjmjVoyWdxqZNTxRMAnUzFrvh
 X38w==
X-Gm-Message-State: AOJu0YxCjsmZyQGw0bwnw+QIeN5Z0x45hvgHwEnrXJNM9rnPP7V7qm7w
 MoGHHn3gaTmZqQVNNd9DvxjkEAbzduwjsTvMqBfYfXGiAvCQ4tOpQcOoWbNqtqk=
X-Gm-Gg: ASbGncsVvKn08eABvCZp+ST5koxETqur/e9s9LwAWZz1n4knJwztm/QJJYHsr1xMmHc
 n1bb5YAvvUFjWb7h+VrztAlXsR6i0bWzy2tcgA+6OzRiuY8bwL23ulgbXxz9Li8DBy9qaTfTB3B
 esKTAGsR4RN80zOHxWPHcZImRMuiGEJhpMaBzjctaUM6o67f99WXEgJlbaJK3fsnHNHoKhD8uC9
 CasPHAzAbCMe76c3qP2OF2c7kGOvzpqY/Nztzr4ZGY5KkO2hjXQVpIqUZYQrsVVGHDD05eAGKFr
 ukOD/OHr/kOVOMMdg8/aS31U6snyluKSCQ==
X-Google-Smtp-Source: AGHT+IGugims5VlqDIANeWpnC6hS3Wc02VL2/7nlF8YFiz3yPrUV887XiATuzFcdQll0ma0mZYL7SA==
X-Received: by 2002:a05:6e02:3c87:b0:3a7:8cdd:c0d2 with SMTP id
 e9e14a558f8ab-3c00b59fa70mr16382915ab.0.1734571535827; 
 Wed, 18 Dec 2024 17:25:35 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf4f474sm37206173.8.2024.12.18.17.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:25:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:25:33 -0700
Message-Id: <20241219012533.242119-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734571536; x=1735176336; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2c+SIfxvehYHDNsjnx+NL8nt85Xe0LdqhPTpJ7VKF60=;
 b=locMWOecSwOeC44gSSCss5jTii4glB1jlry4moN6wgb1sHosMejo1RgV9/x2As5nNR
 QuicpnzqAUWA36VNwqBIgdVB/9EE6LAG6+iBwQPax2YbeozLwM07sk7cNEKpjH8uK5hw
 22wOeUuRxtTrbB8zW45wGPTUu3DDSl3XyPftMBOQy+iG1cULVAdHm3EZrMD3uYDYN+Fp
 3nQB3f2/43Fgtg6r218y3/tFu9fnLYjcf/s5bXkRpaItAjypVi5jWEO1DEE7oa7lctpq
 e7lN2SO4qjV+j3cPzAmrDkgH38QOEvqziP9B74HAsIQ7c/GcqfrbVeoz9u0lyaGxjsuN
 HJgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=locMWOec
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to version
 2.19.0
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
 package/python-asyncssh/python-asyncssh.hash | 4 ++--
 package/python-asyncssh/python-asyncssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asyncssh/python-asyncssh.hash b/package/python-asyncssh/python-asyncssh.hash
index d3c2f642bd..dbc5232d15 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  9c61e713b1630f62aa1a690744573e1b  asyncssh-2.18.0.tar.gz
-sha256  1a322161c01f60b9719dc8f39f80db71e61f3f5e04abbc3420ce503126d87123  asyncssh-2.18.0.tar.gz
+md5  3da75998b89240d5473a92419d3d187e  asyncssh-2.19.0.tar.gz
+sha256  723dead4d068b558708dc66a4ca7e7a93a813aa9416036eccb9af4c03ae2cf30  asyncssh-2.19.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index 60a559f0b9..f053453a7b 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.18.0
+PYTHON_ASYNCSSH_VERSION = 2.19.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/25/69/8ea398f5aa6ae8fa7d007feb262d83aa9304e4a6a1accf7a104b37fef97e
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/75/85/c723aa7dd69570a31b6638c1405e659712f18f569f280da2da27989445d3
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
