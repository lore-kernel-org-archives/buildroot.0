Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAD4C64ED6
	for <buildroot@archiver.kernel.org>; Sun, 26 Feb 2023 13:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE4A80B1F;
	Sun, 26 Feb 2023 13:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE4A80B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVX0IgVYq6dw; Sun, 26 Feb 2023 13:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF23D80A55;
	Sun, 26 Feb 2023 13:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF23D80A55
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 04D6B1BF361
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D241E608A5
 for <buildroot@lists.busybox.net>; Sun, 26 Feb 2023 13:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D241E608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVnLyGQEzX5j for <buildroot@lists.busybox.net>;
 Sun, 26 Feb 2023 13:10:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABCF260758
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABCF260758
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 13:10:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id q16so3611175wrw.2
 for <buildroot@buildroot.org>; Sun, 26 Feb 2023 05:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5TKYmPr5nMTd9K9rCPuYi6ArigTG6IWi4NXMtOd+Izo=;
 b=RwijANxzZ1zqcQapOivzAFxCKVVSaywrKoRa/b3NEK8jPnh2s5noICpP5Guu2GVjkX
 2/SJfOkzLHIDWJ7ldOMH3l6DdGVfjiXcB5iNQZizwcnBSq5tn9qfPIh8uQo6UvdfvWhv
 YpKgDeT8n5gbGJMxRrqbEVo+wJ2xE15ZczNSw6AKVAAYiHMqqJyQRBR74D2CFmlMCf1j
 WpvPDKI4hF5Nf3YhdjBz+Xqt+rOOumxGT/czW6j8KQmFSbg8bRN0S0SmdhnrXg4o+rYY
 F7ubqXodNqy7aK87b0JdIjZjo8tvsbhwn74HSD58QXpV3lVRH2ZtyYEv7xVqZkro0yCs
 2SxA==
X-Gm-Message-State: AO0yUKWV3E+nfjNVKAQy36nBA6PmmWz+n4rkpGtONWBeZb65y4yRjkJX
 vgYe0+TA17ZEPSAAK9UoafKCnRWHLRo=
X-Google-Smtp-Source: AK7set/0jHBVGE7m7CGqEj3Yh/VVE1n3qC7qzbsKUTkI07uDtN8rBZI0AbyEdlb1XSsJT4KmwoUitA==
X-Received: by 2002:a5d:4b92:0:b0:2ca:7dcd:532 with SMTP id
 b18-20020a5d4b92000000b002ca7dcd0532mr1537764wrt.42.1677417054565; 
 Sun, 26 Feb 2023 05:10:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u3-20020adfed43000000b002c55ec7f661sm4543106wro.5.2023.02.26.05.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 05:10:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Feb 2023 14:10:48 +0100
Message-Id: <20230226131048.75813-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5TKYmPr5nMTd9K9rCPuYi6ArigTG6IWi4NXMtOd+Izo=;
 b=aqsM93BMatXOVJI/SeMnBgsjvWhkUVObDNvcOWR3MUgGtXElCYHz4sKWKKNwGfphET
 qpMJdo9JM3l5O8v8ly1EbExCquczhSaWqOIfrwXdOkl/QH3CX/NPxefZQRK8j5suBFuh
 7rcTnW3Drnb7CQ0YAl/4LIz7e0p8XZqZbRlocxoEw+yCMxHLd/dkfM/t5xkYY9XxmvGO
 sXoQV93WAv2uv+kRTz9FZbHX37PK/K9X4i3Qig7VF7r/QWs8oXoyIV9irRf0ZUIiN6pX
 WRkAJctpxlEWWmNMY9ubG7NABmxWXmdJib9x3uB+PfVL9XDP9SQJhh4g71wjn0epj1Oi
 +hUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aqsM93BM
Subject: [Buildroot] [PATCH 1/1] package/python-werkzeug: security bump to
 version 2.2.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-23934 and CVE-2023-25577

https://github.com/pallets/werkzeug/security/advisories/GHSA-px8h-6qxv-m22q
https://github.com/pallets/werkzeug/security/advisories/GHSA-xg9f-g7g7-2323
https://werkzeug.palletsprojects.com/en/2.2.x/changes/#version-2-2-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 13b95bc448..0b60a40066 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/Werkzeug/json
-md5  9d7e50c5bb3a9fc12823b5faf374b90e  Werkzeug-2.2.2.tar.gz
-sha256  7ea2d48322cc7c0f8b3a215ed73eabd7b5d75d0b50e31ab006286ccff9e00b8f  Werkzeug-2.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/werkzeug/json
+md5  28c3ec6a4b1ce8f06c85612c1dfa351a  Werkzeug-2.2.3.tar.gz
+sha256  2e1ccc9417d4da358b9de6f174e3ac094391ea1d4fbef2d667865d819dfd0afe  Werkzeug-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 3ebae3c165..0dd27d145f 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.2.2
+PYTHON_WERKZEUG_VERSION = 2.2.3
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/f8/c1/1c8e539f040acd80f844c69a5ef8e2fccdf8b442dabb969e497b55d544e1
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/02/3c/baaebf3235c87d61d6593467056d5a8fba7c75ac838b8d100a5e64eba7a0
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
