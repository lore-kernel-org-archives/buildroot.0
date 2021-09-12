Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E03C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 16:56:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F3360F3A
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 16:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1F3360F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59EC9404FB;
	Sun, 12 Sep 2021 16:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vLLuniIvYQ4; Sun, 12 Sep 2021 16:56:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C710C404CF;
	Sun, 12 Sep 2021 16:56:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 662B41BF423
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 16:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5472481B4D
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wtDkev9y1sF for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 16:56:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5693D81B48
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 16:56:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so10894097wrb.0
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pto7sMeOnNRoDL3ZZSzg73m6ZW99x/w67y5LksIITD8=;
 b=a8roH7w7dmy0Oze1nAlSNKounUdA8b5izRaRwRDhzJ/CmBt5OymVC8flUlknTKSEDY
 m+bD18/2Bb+yqoMMrCJ8JjhRQmCn31vWRfY2BpOyjpSo1E2zpeYmP8wWRnORpa7C6d6Z
 0Ysp8pISxh5qNhdB9v9rbaWuj6xRxgxPlvYx3UZGXG5X711rY5LrHyjF/h5WsiTNXqjt
 F2J0SI0L3ktsXfCcbXjcwCOjqIjsdNoQu0HFya475iX5V22qDX5siINi1gzcwiOSZds/
 N1E3Q8qAITdd19gxT3Gpq/lBFzTWsE6vr+8XJeA1IvczmfoOJktA8Z3irpjo1P/AAimN
 GkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pto7sMeOnNRoDL3ZZSzg73m6ZW99x/w67y5LksIITD8=;
 b=Yo6NTqQEiZXBwZZ5iK5WUfNLsYJOS1GmYBOhVp+nl3ZPpVFSWgmPHQzi40ZHCIEY5p
 faXC+SRIyBtZbfOGNBAOzInN3EsG4oUEL7b9ZYjAx/bj9Br3hpMXRkjgm0gkrUEixRW4
 jpDTdqMvuRRvmKRbOMUBgbLQy+RjiTuLpWkpNGcla4jHdFh1Hdqefjp7M5Gtp7Bbsr5m
 3u0nFXlGmdw6gz5mTG/UrmwXtXA+zYo66zggFzBQnIEwBJveqHSFhAGFIg7/xV7VnQxg
 eIzpMCllR6/+yJhjNaW7hIM8yC18uX3feDgJ+qC4JQ1iLAaDqarjPVrJIZuSzFCRoL6J
 mCGQ==
X-Gm-Message-State: AOAM530ulHj121w6zBDNYiAu2+umC1EnqZ5N1wXgtEo8iUDBO8/skPa8
 bK0GOs4Ah7HqXVULUuTcGDEB6wMymD8=
X-Google-Smtp-Source: ABdhPJyLErYOjc2uEiSGGNtfVK+jyizrENtJ10nCOY+okoZZMM6Vz1QaD6oYPyfCd0xYIs+4N4Gv7Q==
X-Received: by 2002:adf:f88d:: with SMTP id u13mr8410712wrp.297.1631465805347; 
 Sun, 12 Sep 2021 09:56:45 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id g13sm3208478wmh.20.2021.09.12.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 09:56:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 18:56:43 +0200
Message-Id: <20210912165643.2170239-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libssh: security bump to version
 0.9.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix CVE-2021-3634: A flaw has been found in libssh in versions prior to
0.9.6. The SSH protocol keeps track of two shared secrets during the
lifetime of the session. One of them is called secret_hash and the other
session_id. Initially, both of them are the same, but after key
re-exchange, previous session_id is kept and used as an input to new
secret_hash. Historically, both of these buffers had shared length
variable, which worked as long as these buffers were same. But the key
re-exchange operation can also change the key exchange method, which can
be based on hash of different size, eventually creating "secret_hash" of
different size than the session_id has. This becomes an issue when the
session_id memory is zeroed or when it is used again during second key
re-exchange.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index bc6fa3f1f8..4dbab11374 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.9/libssh-0.9.5.tar.xz.asc
+# https://www.libssh.org/files/0.9/libssh-0.9.6.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256  acffef2da98e761fc1fd9c4fddde0f3af60ab44c4f5af05cd1b2d60a3fa08718  libssh-0.9.5.tar.xz
+sha256  86bcf885bd9b80466fe0e05453c58b877df61afa8ba947a58c356d7f0fab829b  libssh-0.9.6.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index eeb5d8489a..4cadf83aee 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.9
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).5
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
