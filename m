Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92223C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 11:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3351940895;
	Sun, 13 Mar 2022 11:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjmnwyqSGxrN; Sun, 13 Mar 2022 11:48:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CCE340883;
	Sun, 13 Mar 2022 11:48:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E37331BF47E
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFF65606AA
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 11:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNbzNYEF0gQT for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 11:48:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02F3860692
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 11:48:36 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k24so19717198wrd.7
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 04:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kcgzRjcB8JKTkY0Q0SEGt/7T6EZ2Jx2I5gMQrPgKCVk=;
 b=Z/tQ2QnIZFblILNj4ZSecoLBjHgeBwblLpGRjgYHz1fnZL9aSeW26njVxMpctbW5hM
 s0Stjn7vX5BGQSlVyBu8sNoxRu1cD/I1D/Lj6Hzeabz6XRbk2pNqJOkQ6Fz+aK6I9GdO
 /JE2YxhYN4qj8Yo6wGEc/c7f8CRRotzHgZA/D54aYNqUT6/5TsmkACZ1dUtgF9XbH1Vf
 wgvwa5dI+nEyclt62CrU/+J5/nj4aXQfhYT3tPacGgmSFAf42Z69z1bBObP/D0/0VUGM
 hwmIA5uBq3+hdqZdgMAid68oywuUf7nW5MhA70CqGpZ6VCHi/7A99VvYZFAaD+4rMikq
 mV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kcgzRjcB8JKTkY0Q0SEGt/7T6EZ2Jx2I5gMQrPgKCVk=;
 b=ffqXDtuPJqef+ETW0CRkXH2OVV0MWvyuVVd9KDO6uJx9szBi1m7afSbOTdWCLsnI8i
 rEtN/923CuItFtGmj+KkoYQ8p5eOCaLNNQC6dvGQvMo+r4r9qMYDPOA/gsuuWq22Vuie
 Ac+TXpfaf/kfcc5n95+SnvAOZTheLsykG/HThtLo0MFVpn2FXs7Bp7jpy76NrBaevimW
 UblVlwgRT+PpiVwxXsOCjBIUCUcl05L4n/QBiT0NqTuy3OoZlc8hGtm2dZaI1TPKYD+x
 4z2Pwn1aRPJdgQ/mFPKwh8ju0/q/wOorwrGl9heIiB8+Kj/kQWcXT90qjdZuibYWnQZr
 ru5g==
X-Gm-Message-State: AOAM5310MtEcSlNgp5gwadF8/BGn5z7bLz5qKzmqhNnzImAYZdEEUBWF
 kM7wuG2jfJmk8DOLDC61sS1cYlddQCo=
X-Google-Smtp-Source: ABdhPJxELznNJxfbgNL4GVJBSeQ5TAF5gbNFsvf4PIOpsb2IP+cY9Q4lGm0eT7qIoRGHivj046xDTg==
X-Received: by 2002:a5d:6a8f:0:b0:1f0:1821:dce9 with SMTP id
 s15-20020a5d6a8f000000b001f01821dce9mr13749389wru.565.1647172115079; 
 Sun, 13 Mar 2022 04:48:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm10904075wrm.53.2022.03.13.04.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 04:48:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 12:47:41 +0100
Message-Id: <20220313114741.1127825-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: security bump to
 version 22.2.0
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

Fix CVE-2022-21716: Twisted is an event-based framework for internet
applications, supporting Python 3.6+. Prior to 22.2.0, Twisted SSH
client and server implement is able to accept an infinite amount of data
for the peer's SSH version identifier. This ends up with a buffer using
all the available memory. The attach is a simple as `nc -rv localhost 22
< /dev/zero`. A patch is available in version 22.2.0. There are
currently no known workarounds.

https://github.com/twisted/twisted/releases/tag/twisted-22.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 8f0935e4f0..63da0125b8 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  c818cb1ab241dc249517442e5a0e0412  Twisted-22.1.0.tar.gz
-sha256  b7971ec9805b0f80e1dcb1a3721d7bfad636d5f909de687430ce373979d67b61  Twisted-22.1.0.tar.gz
+md5  fd252d0b895ca2ab81b5b1454073d890  Twisted-22.2.0.tar.gz
+sha256  57f32b1f6838facb8c004c89467840367ad38e9e535f8252091345dba500b4f2  Twisted-22.2.0.tar.gz
 # Locally computed sha256
 sha256  686f6426a775450eb3afd00bc3a5c2621f305ddb9c8478ee9bf28a368ef2dece  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 8e867cfb58..e5d643ec05 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 22.1.0
+PYTHON_TWISTED_VERSION = 22.2.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/b8/8108806ebf2b33654989fd1511281dc94a49fa7e03326d84fe5498ecfae4
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
