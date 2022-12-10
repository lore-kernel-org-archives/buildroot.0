Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295E8C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BED4381865;
	Sat, 10 Dec 2022 20:16:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BED4381865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEpeLNT65XO1; Sat, 10 Dec 2022 20:16:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED03F8184F;
	Sat, 10 Dec 2022 20:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED03F8184F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4A371BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FF6040292
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF6040292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPTY41yXSPzh for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:16:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF9240239
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBF9240239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:16:25 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id o13so1565070ilc.7
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+aBoJjhq6XKukdxzyvAGxpQkv+qvsRrzPGQMMeobxZ8=;
 b=Bv7s1Lzmr9MXliZKpSuQ1T92p4jcU4inGfuVZIBa/itXO50KLH90ImURxWdEckSN/N
 vXc/QTlxcRWwR4NZmBNUZrCt7REGVPLZfxD9x207MPRWtB5w4q2bHlajNTLhArf1XUpC
 hCACMm6mlONqzCWNmMTdWYqyM9vmMvDssVcSW79Pm7V7JjLX685C67Y2gmtbs1FfPjny
 xv6RFzkA9Qodg6YyZYgevgOmBobkLSuHW6l0C1v7deh4Ff2GlSO22mIffD02A+Ic1SSv
 b6eg7uXjHmHrOGZy8q9tkI+CS2oHkT7o9HI3pFr/UgrhT7qjykuz9UHtOO8zSyoRaVsC
 H9qw==
X-Gm-Message-State: ANoB5pkpneB9GjEDJkYwPHFb1n/VW3DTZS7JNkQswOL8rjNElDaJyq5N
 NzSR40jnB5c9DWX2FM02BNh9oKZy3MLT4+el
X-Google-Smtp-Source: AA0mqf6g640EbBygWhzugQX6j6PZL5lLDsmFNWZW6P51/YjMQHXP7uMG4VbvUCx3QVKzOtBKjx3e+w==
X-Received: by 2002:a05:6e02:5ac:b0:303:824b:25eb with SMTP id
 k12-20020a056e0205ac00b00303824b25ebmr2671971ils.20.1670703384610; 
 Sat, 10 Dec 2022 12:16:24 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p11-20020a056e0206cb00b00300ea3a86e2sm1574695ils.68.2022.12.10.12.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:16:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:16:22 -0700
Message-Id: <20221210201622.3516677-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+aBoJjhq6XKukdxzyvAGxpQkv+qvsRrzPGQMMeobxZ8=;
 b=NhZzxTafL75I+rnS4rQthcXZD45JKevfIGCntWjuYnWEiLw2FER8xxpmmQQyRXIJPI
 QC7g88iouqn+V6Ls0/D+jPjTOlBWx2/d3BCSUhkt5paiMTQA249wEyz0jUJXq4dt3Klj
 cYEEWLHXLAxL4cnCtP/dW6V/iLyqBoIo7dLFDKGsGlKI6se1N8SgroNFVKpl7wkec61P
 /JZFy6fbrEg2wQtbdrX9xLTwDq09kEcSpO14ojCgXsvMQfwz6rmWUS3Eofg3mK1MMuON
 XnT+u54S0UtsMkfgVtPRlhD2r/zJNeixjO0ac3Wtz30/6H4lgp6RCIy3nSXA90VMfES4
 XK8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NhZzxTaf
Subject: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.13.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyphen/python-pyphen.hash | 4 ++--
 package/python-pyphen/python-pyphen.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
index 3a145e0f81..39af62e085 100644
--- a/package/python-pyphen/python-pyphen.hash
+++ b/package/python-pyphen/python-pyphen.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/Pyphen/json
-md5  a2d6f69468684bbaa88d004b79c02128  pyphen-0.13.0.tar.gz
-sha256  06873cebffd65a8fca7c20c0e3dc032655c7ee8de0f552205cad3b574265c293  pyphen-0.13.0.tar.gz
+md5  a5039d1a4d8d4bad784cb864927f83f8  pyphen-0.13.2.tar.gz
+sha256  847f57a043a58408f24670ae0184ff6edfb5fd5731743208228c028ddc514438  pyphen-0.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
 sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
index d83eb79736..9ca064c293 100644
--- a/package/python-pyphen/python-pyphen.mk
+++ b/package/python-pyphen/python-pyphen.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPHEN_VERSION = 0.13.0
+PYTHON_PYPHEN_VERSION = 0.13.2
 PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
-PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/9a/53/e7f212c87f91aab928bbf0de95ebc319c4d935e59bd5ed868f2c2bfc9465
+PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/46/12/aeb28a1e1a3f3cede967cea98ef3a1da844418ab8296a4bb9513f232736c
 PYTHON_PYPHEN_SETUP_TYPE = flit
 PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
 PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
