Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0B5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 03:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDCF6108B;
	Sun, 24 Jul 2022 03:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEDCF6108B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4xMuldY7nnji; Sun, 24 Jul 2022 03:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE9346107A;
	Sun, 24 Jul 2022 03:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE9346107A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2399D1BF332
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE8654056B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 03:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8654056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVLddodICD2T for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 03:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13AD040103
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13AD040103
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:37:31 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id 125so6387397iou.6
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XfanI8kaWconDILlWOQcNQjBcKXC+QIXUObhqF9v4s=;
 b=YAd/StDCuG9l7PeonoDDVoC7FYyHdnb10LiGPuG18KDxvhfIIEtTyCcgQns/F8LF8f
 9j5tylXKiK0mofqyKQLzPasBjvNWu/ZMpGrq9LquU5D/Fqff8YlSGmUVnsSICSIWtlFN
 j7/8g7DenmJITBMJ3nl5BB89OROBjk2UnunQzl1mrRXEdjSenxKoPn4VRjDPbnyRe/h7
 0zaJIy0yjXVPYEZ9f8yVK78Zi9/cvbggTyv82w7rDWa9DzNPxhTSraowhx2C/wdUYKqb
 lJIYnaDURfQqLiF/DiJrey2ZJqgQ/kpm2t3cEqKR9svyP8LcrJQH00H5m98HA720ILtF
 ugHg==
X-Gm-Message-State: AJIora/LEpBYxdhZP0yJ2ydGzHXWV85Hvew0A0FiGwHjlUPGWVytE98s
 k9Fw+l/DShPYOqi2atkkQCScsGuamXi42Q==
X-Google-Smtp-Source: AGRyM1s9uwA5ctzJdO2avSwz3LUa8PpT7NJUq3mO5lCAa8lUj+CrAVdWtW+DY0ZaVj3TjqNnZBHBKw==
X-Received: by 2002:a05:6638:12cc:b0:33f:7b73:541e with SMTP id
 v12-20020a05663812cc00b0033f7b73541emr2778810jas.275.1658633850039; 
 Sat, 23 Jul 2022 20:37:30 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net.
 [71.33.133.32]) by smtp.gmail.com with ESMTPSA id
 o15-20020a056602124f00b0067b4d6cecc8sm4288466iou.45.2022.07.23.20.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 20:37:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:37:27 -0600
Message-Id: <20220724033727.1273308-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XfanI8kaWconDILlWOQcNQjBcKXC+QIXUObhqF9v4s=;
 b=GKvFaj4w5izTnaws/Lu7DbUUZa7byrN4af5MnF93XCf637o+jc9kMIG3+C7g0U41P+
 yLMaa6Hpw6nPv4fYzA2dkrPhVR1BbKXiegLUxAdZbGp97qrcmJz0zE5RcoJDL9D7pG2v
 IwbYwCV/Ic0vnljJ0iVv4n2+1OJsQJcY/j69fBAiRl8OJClGrJ3yZWhGzvClSnNUHmoH
 Pfrni9EOeVyJtxSPFewf9RYQWs0kfoaZdcY3wH58HHgnBSejFRvXi0ymh0/94GDi1l+C
 n9n71/Q8nHrdkj92khsbICO1r40UazosGRyoEkOZNk4fD1WWc0N6IZluq37VPGyudBH3
 zUKA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GKvFaj4w
Subject: [Buildroot] [PATCH 1/1] package/python-typing-extensions: bump to
 version 4.3.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-extensions/python-typing-extensions.hash    | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index f37a609adc..2512ed042d 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing_extensions/json
-md5  197fb153e3720a3f6e0c85bb47f9c2b5  typing_extensions-4.2.0.tar.gz
-sha256  f1c24655a0da0d1b67f07e17a5e6b2a105894e6824b92096378bb3668ef02376  typing_extensions-4.2.0.tar.gz
+md5  30ff8c89459dd93970a92a90b0386aba  typing_extensions-4.3.0.tar.gz
+sha256  e6d2677a32f47fc7eb2795db1dd15c1f34eff616bcaf2cfb5e997f854fa1c4a6  typing_extensions-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ff17ce94e102024deb68773eb1cc74ca76da4e658f373531f0ac22d68a6bb1ad  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index a664e5d3e9..2b8c23f354 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.2.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.3.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/fe/71/1df93bd59163c8084d812d166c907639646e8aac72886d563851b966bf18
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/9e/1d/d128169ff58c501059330f1ad96ed62b79114a2eb30b8238af63a2e27f70
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
