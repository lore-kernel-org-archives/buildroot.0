Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C368ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 16:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A837B40395;
	Sun, 23 Oct 2022 16:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A837B40395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zx7_RkVaJ3Sv; Sun, 23 Oct 2022 16:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7D6C4038B;
	Sun, 23 Oct 2022 16:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7D6C4038B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1A401BF4D5
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B7214081F
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 16:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B7214081F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwsmszHFXR4w for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 16:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25A4A4058C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25A4A4058C
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 16:58:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v11so5235355wmd.1
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 09:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qzuX9kjzLag8t4TtprOOmr4eROPrdaTX+cDTQoqrGyY=;
 b=8DFUulvqrfzKBtbRY46UKS+MP2bNFk+HrwOlOmvD+IGOw9LVf/NxPgf3LjYKdMeZjq
 Ib8hdpOduyQUcQlPdcr9yyzL7pfDw+x1xOd2gNaTQYpwCpeC3bkso6fwRTP8r+HiVLdk
 maVV9Fr46O0n6aWcbKNdW/zfwdDUlLzxpCub8l8jeikJuZFlf7ccrp/xG/VwUlvW9Q7/
 26l4lAvW/I0fQKG+HnkTZrRVSBINQpAXew7a6v6x1lQw6siVUqE0WzD8kMvG6hUvGvxj
 NvURtx8wBWAyuYPvIfcnWfTXM9ZP6EEFejvwzXUDu0BbFECXKRVFre2AdGNnJVtM0i+I
 nQLw==
X-Gm-Message-State: ACrzQf19NBlU8M3sUdITctt+xxaF8b4f4HGdumF+NdPa2BhOdOE0eml8
 kV7ghyfn+TwzEW+RBnDAmC6dWFfA3bE=
X-Google-Smtp-Source: AMsMyM7Ip3EOSo++cBriPYHVMaZjSBDU+A1YA6bK3dZZsvw2lG5tlf1lr9x0Xvj8OAEe1OyFoU9F5w==
X-Received: by 2002:a05:600c:4f84:b0:3c8:3424:8b1 with SMTP id
 n4-20020a05600c4f8400b003c8342408b1mr7451370wmq.53.1666544283667; 
 Sun, 23 Oct 2022 09:58:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f18-20020adff452000000b0022584c82c80sm24015370wrp.19.2022.10.23.09.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 09:58:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 18:57:58 +0200
Message-Id: <20221023165758.24401-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qzuX9kjzLag8t4TtprOOmr4eROPrdaTX+cDTQoqrGyY=;
 b=FE42GlBf1jNLLQ+UxSZON9gUecGGb5oVDcOjCfIZh4p5MQEtZgsXhsWkH+UOA8czhY
 MMmgoh0aIVgoPjJlXcSMCUNQ+KdeVWBk5yjWhMNS6JbaUmyiACjeOdvO6OYTymLO6cj7
 6qPFEJzX8tz44Kv8l50LNBZ32tX3ez8vaZswisXLFNrbYfsU0GWSxI/6XlE5GoWPlXbr
 b1J9cBh5sHZFIHn7FncNtE36ayLAujqcgzrtUWGUKv4922Fe0QCNbx/i6o1Sa0Tm2oZX
 fB9S98jIaDTa86NLJ8mstT78h7Wxddn8A2uXmJyqyODYCC49B6vZY+YBlhSabiJnwlrU
 xr5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FE42GlBf
Subject: [Buildroot] [PATCH 1/1] package/libxmlpp: bump to version 5.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/libxmlplusplus/libxmlplusplus/blob/5.0.2/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxmlpp/libxmlpp.hash | 4 ++--
 package/libxmlpp/libxmlpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlpp/libxmlpp.hash b/package/libxmlpp/libxmlpp.hash
index 50238eff00..a974de57e3 100644
--- a/package/libxmlpp/libxmlpp.hash
+++ b/package/libxmlpp/libxmlpp.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.1.sha256sum
-sha256  15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098  libxml++-5.0.1.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libxml++/5.0/libxml++-5.0.2.sha256sum
+sha256  7c17cc3e5a2214314dee5a1354f4b436f266ded6185232a0534f352a76240d5a  libxml++-5.0.2.tar.xz
 
 # Hash for license file
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libxmlpp/libxmlpp.mk b/package/libxmlpp/libxmlpp.mk
index 874577eb1f..3db711826e 100644
--- a/package/libxmlpp/libxmlpp.mk
+++ b/package/libxmlpp/libxmlpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBXMLPP_VERSION_MAJOR = 5.0
-LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).1
+LIBXMLPP_VERSION = $(LIBXMLPP_VERSION_MAJOR).2
 LIBXMLPP_LICENSE = LGPL-2.1 (library), LGPL-2.0+ (examples)
 LIBXMLPP_LICENSE_FILES = COPYING
 LIBXMLPP_SOURCE = libxml++-$(LIBXMLPP_VERSION).tar.xz
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
