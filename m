Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA2C021BA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB5194072B;
	Sat, 14 Sep 2024 21:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkCZhMPhkijk; Sat, 14 Sep 2024 21:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EBD54072D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EBD54072D;
	Sat, 14 Sep 2024 21:00:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 193281BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5E26605C2
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50cS0c2Ts-lD for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FF57607C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF57607C1
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FF57607C1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:00:02 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-39f526fd19bso7151985ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726347601; x=1726952401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lmOka2iZeZjvUgVf1Xi0nwn2azT3nczH2MKG+f93yaY=;
 b=i67VbBGPtDU9sx/iPpvf5SVcRwAng85s6PRHes8K91VoTaXhUaBY3lacsh3UHlU9if
 FAgPmOgUHFW4DGdyEtIzsyxCWgZZk1J1ePZJu92+E9sMA3Yx74yRSZHdk4QSgq6Ow+GE
 71kO09JkIJiU+/23zMv+P0a+l5oGcob6Q7kk+1O8oM2rf4rDIJ9kV1HGy3UwLYo8Y8SE
 pTjNKoYxpB41xxU54KGsn2rF7B5XXH0A3f6u81ry7+B6DKSWr1H42fAUaCkSbAcWmleH
 IWQn4J+Df8Kx+UXWWnagRm7RDvGWWcDro9ZbcqGtN5ZKLzmXFVUvUxTpkzgjpicO0z9O
 TzbA==
X-Gm-Message-State: AOJu0YxDJcP8djXfYLV7zZjJDpFFxjvCxrXwCgj1fYSyW6iW/xHKO4y8
 RA9S5XtCg0nTyoAeOwiRhO3iSarLHK+s10I9A9LL7z/0WXJydrqwJhi+0A==
X-Google-Smtp-Source: AGHT+IHYhZHvIm+xYOjrRUKCtzd7rdlsqzY7iYmr4eeH4lppVK6SUJc2aSQ+MVhKGmozG/QUbgyIIA==
X-Received: by 2002:a05:6e02:1645:b0:3a0:4de2:3257 with SMTP id
 e9e14a558f8ab-3a08b789712mr88508455ab.18.1726347601049; 
 Sat, 14 Sep 2024 14:00:01 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8fecasm6324715ab.80.2024.09.14.14.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:00:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:59:58 -0600
Message-Id: <20240914205958.1174180-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726347601; x=1726952401; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lmOka2iZeZjvUgVf1Xi0nwn2azT3nczH2MKG+f93yaY=;
 b=HLi/n0cY0pFcYGg7w9HxLytzUrFQTOdMTMrl4jtEeXs3xC+DDeRl0roIeaTVq9dHkr
 v8LGlcsn3EXZ3bfjLGa0y1M6ixVaS72KrcM7hEKnaaCSnLBIPP/H5IkRAyx2qBGxaWZx
 +53JjaDadYxpP8PaZc+5OTD2JDvzwl9d3TSc7FwNZRvHikWFOv8fSEDZDebpvPTQX5nh
 +80wzAd3kCOyXEB5BYU6C/D2myXAjvZMnESOzF2PvDcCo7AZDkARmZvonWgCrHio/OqC
 98OJl6gQBA2R8uQTsFdjluxsHB5n/H79vtJljJ4wd2yWb2meTYxNegW8jC9elDSC2fi4
 aa6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HLi/n0cY
Subject: [Buildroot] [PATCH 1/1] package/python-aiorwlock: bump to version
 1.4.0
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
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index 15584a8a41..50a670280f 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  28e4812a1d1d67a2be4370209ece5528  aiorwlock-1.3.0.tar.gz
-sha256  83f12d87df4b9728a0b8fda1756585ab0d652b107bab59c6084e1b1ad692ab45  aiorwlock-1.3.0.tar.gz
+md5  669ff2887392cfa393205cea23661c2f  aiorwlock-1.4.0.tar.gz
+sha256  4cea5bec4e9d03533a26919299394822a1422aa519bca9dd09178ec490f8d1cc  aiorwlock-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index a5e7eeae83..4209ae407c 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.3.0
+PYTHON_AIORWLOCK_VERSION = 1.4.0
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/77/fe/7027595f5e635ac1f597f7160a420e1f642a474576efb697001efea16bdc
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/ba/c5/882b4c89d71d6f9c7d0d8dee18d267025e71d4c3241eb3b16ab39105a0d1
 PYTHON_AIORWLOCK_SETUP_TYPE = setuptools
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
