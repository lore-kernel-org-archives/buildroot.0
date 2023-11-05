Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEB2C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 04:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75B48400D6;
	Sun,  5 Nov 2023 04:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B48400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAa7hGDWaL_u; Sun,  5 Nov 2023 04:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A63E401C2;
	Sun,  5 Nov 2023 04:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A63E401C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 204AF1BF5A0
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9F9E60AF2
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 04:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F9E60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IqOhg5f07RNP for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 04:43:06 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB5F960A99
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 04:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB5F960A99
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ce2988d62eso2244053a34.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 21:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699159385; x=1699764185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OglLUan/LRwPsLBfHls3EMjOO5IZIHuREa5D43Alok=;
 b=DdBFBGKr/SQIeOyltmb5/xJJ1bnn3yxGynDgNzs3Ku2p+VFmAGEtyo2TZ/S/Uk0EDY
 aj/w7dbrXBREzMVfk+jFWW6gxLUW9lIx+enlEZQKy1ttBar6emVeWZiV1zEmy+1Wj7r0
 tzOlqbJBN7gLf7Qrhy2/87HZJE0tv7mDwKK87OBczt9uwh+DnGzPznsu5+yaH8+TnRVs
 FYUs9MvJhyJcmNroGZr1AEmCeLaPWFMelq/lNPIoaj1TVKzHvzJUSd9v0LgtGkLudpgn
 zaQ1l97WZEkGqIx2A5QvCowuycx0U0im4/rHCjW9Lx+uJN3nTTLmQakAKQulZG0maHnD
 u4Ig==
X-Gm-Message-State: AOJu0YxAFt7jlARQFvbRpnuiCMw0dliwWEVattp62/v69YgnVas9BhKQ
 BbuCBGwqGZL6n9cZut4FBjGSyQQEG0k=
X-Google-Smtp-Source: AGHT+IFMXH0qrAEfOpTZkLp5K3UHq0MTn8TYeO089oJT4AuHrWA6SuLeozdEd3MXJDkvNkMcUqePpA==
X-Received: by 2002:a05:6871:8011:b0:1e1:e1f8:ea3e with SMTP id
 sk17-20020a056871801100b001e1e1f8ea3emr27801413oab.1.1699159384862; 
 Sat, 04 Nov 2023 21:43:04 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 z26-20020a029f1a000000b004564b193674sm1419900jal.160.2023.11.04.21.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 21:43:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 22:43:03 -0600
Message-Id: <20231105044303.2816798-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699159385; x=1699764185; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9OglLUan/LRwPsLBfHls3EMjOO5IZIHuREa5D43Alok=;
 b=V20SiGiRXVOxPzR71IbXKnd+4lWLa7k7pRYIzKXp5YUAogwq/SOLjkAcHQoAGKZT2I
 L0c+l/WoLfKdDFwdJkYbEulhGMTTujnAJEHLfTDuBj2Kp3XFJajN1xe1tdnWM9L/6VEt
 YfyUjKcgtXpcl8T+/5Lkxdt/1aqOUYgpRBAOHYuuGoiOtMknOp7r6aVFbL3HqOoT5Ysk
 RS09Kt2dXgO7PeQIjlM7/fvOQt3OzU+JNCBu9TDyV21h9H5gIpoGJ1oy5SshPU+M/z9H
 SaUO9EQeQ03p0N9Yp9tj+AVx8epXxioRjyi4FCQLybtpk1eybPlxklmcFZB8KyVHC+Rq
 uK6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V20SiGiR
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 2.12.0
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
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 83382bfb29..08d2675443 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  810a5b08cc14e269207efa9cb651e86b  dbus_fast-2.7.0.tar.gz
-sha256  9110c689fea4869647ebad3cd80317554c9f77e3825eed2e36f4cb9aec749761  dbus_fast-2.7.0.tar.gz
+md5  791ce3b0c04099959161a18ae983bf25  dbus_fast-2.12.0.tar.gz
+sha256  849478e11d251fa4ebb99ce5bfee332cb6383c63ef0bc97bae23cef4e0badf9c  dbus_fast-2.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 737406c9ab..b890177c74 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.7.0
+PYTHON_DBUS_FAST_VERSION = 2.12.0
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/e5/ba/beeaf36821f0164a208e8cbe9adbdc75ce0a6eafdebd4011912a806a4275
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/f5/8c/220fcbe4337b842d730d5752f207fc8efd3a02405c71c329e61218e947b8
 PYTHON_DBUS_FAST_SETUP_TYPE = setuptools
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
