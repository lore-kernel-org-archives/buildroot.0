Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59B4CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 22:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553D460B98;
	Mon, 15 Sep 2025 22:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUjUAHvDTdS5; Mon, 15 Sep 2025 22:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BE9D60BA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BE9D60BA1;
	Mon, 15 Sep 2025 22:12:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 381C622F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E9B6812F8
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIFsRbw8SedV for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 22:12:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56E6D812F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56E6D812F6
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56E6D812F6
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 22:12:19 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-889b60cc6feso381033339f.2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 15:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757974338; x=1758579138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hs0UZFwn1oeu3SxYFXqN9OiuSdcgfvXghBUmw8+rOCQ=;
 b=dB2Do2itEEFLNPaPrK+Dy+o6MAj8SjSQyHMLzV2fsMrYYy85VzaLsI1kJdaUapn5nL
 2uK/44hAL6EUwhNSDmZCj8+I9LBL0foBhDBROz7jUGeLHfjpv7WPWmBgeJAuwI/akDlp
 akKeDHm+KlfNSXWEbETtdK1d4IkqgC4hxdXdezCAWe5iltGJ36QJubo/xFDb7H9IcXoC
 jD5Z1XtFjsiDyBTjynqngDmiVGVx9BGzpKhxfFFoP7MU6p+P8UTNKte/0FdLFEACwtUD
 bYXwFIpBalk24omv10wmeYRN5+bkZTbIbDJ/T+NT/mvVYZHAi22x7N6OgED7bqk1aUyp
 czwg==
X-Gm-Message-State: AOJu0Yxd04cLHfAmBLSqz/jgHcEI7y8N5SBWslRE7Xtl4kl2evhFmkrt
 ctwzhI2GqhwcPRLcq7BW+NIjTrfRDM31ewgbCHLCmyBMSW6k1hrULLA5v6HS8Q==
X-Gm-Gg: ASbGncvX3RvCMTNbmKLeHUe01TakHgGLxfye3b8iO7bgwUxKFjL2OGe+yXN9158p/cl
 3btNIQJeH3sTYK10N7XDRZcofHEAMpF7Q3/kQQYuQyXCJZfttO3wwS/FqpP2LHWYYPQ2n3lElMj
 aLKBPuAsFuIhq4kLNGjqgOWo887zoKhbankrzFeN8D8MJ4uLYXZfeMR7F5QR0T9IHIjBSZTy+xF
 Ci+NLcxXljwaiX8VxnCBYGGeapDNZ0bunItdboOXrg+fz42TSCxwSjgkC0XMXdfDcG054qmEit6
 uk4lUscA9N+HaX7b/XGpmeH3AVE276MwVV8g8ksP/Ovvp79XkPcHKtWpVGzBr8acUKPX/umSU3v
 uer2VnooW/oQqoBOwkZMMoMX9P0+9SKCi7ixG8W0our9lVFUybvrXNaSs/F4pBWZ6nPN2hmLURZ
 DX
X-Google-Smtp-Source: AGHT+IEdtR8eJ8PF1w5TMGD/2us+w6HwyaKgel3RitMK0VyqY6178rb6sRS3dqrf0BLqzLemDcUsvw==
X-Received: by 2002:a05:6602:1593:b0:887:638a:29b5 with SMTP id
 ca18e2360f4ac-89033e5f7f5mr1660380839f.9.1757974338077; 
 Mon, 15 Sep 2025 15:12:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-88f2fea9566sm519278839f.27.2025.09.15.15.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 15:12:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 16:12:11 -0600
Message-ID: <20250915221212.1603214-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757974338; x=1758579138; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hs0UZFwn1oeu3SxYFXqN9OiuSdcgfvXghBUmw8+rOCQ=;
 b=Iwql5+3g2hWZZqm4XTVEk1HhH3qyHTJoeRSSBy6eGYqpescb2yoCNFS7sbSgm/NNA2
 tDsz1i56izEVus2Qd9TS1DtiMujHnZubyenehEFnivx7VG08ahbJrL1QXahHvZxzGbYd
 h706DYaf3x6zNxnJzh6+PVQmeE4KiYPs6/ISdFMNx86ZEjnKWR4tJVGJEsJwrCADVM6O
 VdDl/tX5ztJNMesTisGEXdUYKstgW03skprU2XBhhjJt0nugkLMcPjR/GiPYBmSA1vNn
 WQTzZxJKBTM1osIQTmFW/xTucROl3rughj5HKs4mhMeZxjEhfWz203U6MDU4LPhmM9pX
 J0fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iwql5+3g
Subject: [Buildroot] [PATCH 1/1] package/python-asyncssh: bump to version
 2.21.0
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
index dbc5232d15..604e57bd66 100644
--- a/package/python-asyncssh/python-asyncssh.hash
+++ b/package/python-asyncssh/python-asyncssh.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/asyncssh/json
-md5  3da75998b89240d5473a92419d3d187e  asyncssh-2.19.0.tar.gz
-sha256  723dead4d068b558708dc66a4ca7e7a93a813aa9416036eccb9af4c03ae2cf30  asyncssh-2.19.0.tar.gz
+md5  2405165d0ccd23ae8ba6cfcf92d6a0dc  asyncssh-2.21.0.tar.gz
+sha256  450fe13bb8d86a8f4e7d7b5fafce7791181ca3e7c92e15bbc45dfb25866e48b3  asyncssh-2.21.0.tar.gz
 # Locally computed sha256 checksums
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  LICENSE
 sha256  68c286b0cf4507bec8922103efe861adb0bd3218003b1ec1b25e2e64bdd76bd3  COPYRIGHT
diff --git a/package/python-asyncssh/python-asyncssh.mk b/package/python-asyncssh/python-asyncssh.mk
index f053453a7b..24d0e0474f 100644
--- a/package/python-asyncssh/python-asyncssh.mk
+++ b/package/python-asyncssh/python-asyncssh.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNCSSH_VERSION = 2.19.0
+PYTHON_ASYNCSSH_VERSION = 2.21.0
 PYTHON_ASYNCSSH_SOURCE = asyncssh-$(PYTHON_ASYNCSSH_VERSION).tar.gz
-PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/75/85/c723aa7dd69570a31b6638c1405e659712f18f569f280da2da27989445d3
+PYTHON_ASYNCSSH_SITE = https://files.pythonhosted.org/packages/e8/d6/823ed5a227f7da70b33681e49eec4a36fae31b9296b27a8d6aead2bd3f77
 PYTHON_ASYNCSSH_SETUP_TYPE = setuptools
 PYTHON_ASYNCSSH_LICENSE = EPL-2.0 or GPL-2.0+
 PYTHON_ASYNCSSH_LICENSE_FILES = LICENSE COPYRIGHT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
