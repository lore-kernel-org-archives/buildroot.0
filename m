Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5530CAC5AE
	for <buildroot@archiver.kernel.org>; Fri, 26 Sep 2025 17:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7770661C96;
	Fri, 26 Sep 2025 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zi_5MsGTRNWJ; Fri, 26 Sep 2025 17:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B9D61C6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B9D61C6F;
	Fri, 26 Sep 2025 17:45:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECB4198
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0054041FB1
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYvEgYOi-3-s for <buildroot@buildroot.org>;
 Fri, 26 Sep 2025 17:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0BF140147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0BF140147
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0BF140147
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 17:45:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso1470986f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Sep 2025 10:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758908706; x=1759513506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jmvpwriRdEckD0HvnO5CmfibVvMxU6jfHSWhh6aPSPM=;
 b=W7KYc6XaziOg8na2rRCnq0rtH06gkLmSQNEJb+ZiV5RxKYFNtD/atpT0e6DXak2OUG
 eucxs/cMG3z7CMwoVmxEUOMaWJ4U4N0iUDWz36+DB4xMGjjjAObCkKz5zL5JVofrKros
 dWiDeis9SOCmVlQr53pawnHd6JzJcljLH1snX73niN8tHyBsgF3FjB99gehTEpOtSw+B
 Df1+Br/fvYIU6wi+5evU4DM04/4mLjwCmH95dGaWqdioBIomO5+K3+mr0PGzEfmsRcHr
 Ndxhp3RTZnnqK8gf5sVBRBIyOVm/OxIoM5hfSi1EzlJ3qIac7NxR3fi4Zq6ieEdd6GJw
 NxPg==
X-Gm-Message-State: AOJu0Yy3qUqngDsJgLJZr8LLUJyd4BMX2tWL5VMLq0E9W/+BrW04MkJL
 ZDG5tV35hNVsBH5JBPnmh3KDfJbBJ9RXmQWa0hZOzqtTSpwfv/0YemZrhVaoAGJGdgebAB/oSqk
 7dNzWAv4=
X-Gm-Gg: ASbGncvy4ZPOvl3CIcPobhHMoiU9+M8kFBfbjoduaMJ1Rp6nBhKYWEW9pYNykRdb48x
 ACEgEsE3MoO7sWB0D/RcQpHlLzOk4sFZw23yBLy65kKFh94LgkiFMqPIfxTXrj0chPq4tvEDxXE
 GnKfZ0xCJHdiUqXs0wl3yke5Z8D4HTuLto9egUCHcw2Lm1CLHhcYFKYpVwQZurvuyv+U3OlhPs0
 girwmWTvJ2Vd1m4QvUjkkEGtXLCvOdxWMNnPUamadFJzioPLfgpO0L414GqDhVg4TkV6aj97ke8
 VzdShVTnPs+KA+1FBQ3OKgJH4vKVfBERXJiBBBOMO84OwC5q5PsJvurwf5mnRG5kOxUlKIn8/h3
 wArIyLcHCKoW/SE0=
X-Google-Smtp-Source: AGHT+IGh4bbAsC+fobJ59NnYEpW3bT/Q7g7N09MZCNEss7UlFFFocxcRDQPRbNlN2XtuDBTht/+IWA==
X-Received: by 2002:a05:6000:420b:b0:3ec:3d75:1330 with SMTP id
 ffacd0b85a97d-40e48a57472mr7724754f8f.52.1758908706171; 
 Fri, 26 Sep 2025 10:45:06 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2a9ac582sm128368205e9.9.2025.09.26.10.45.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 10:45:05 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Sep 2025 19:45:05 +0200
Message-ID: <20250926174505.184011-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758908706; x=1759513506; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=jmvpwriRdEckD0HvnO5CmfibVvMxU6jfHSWhh6aPSPM=;
 b=dEwkVXgzUdVnUBGaNJRpk/dT/yuqd3M3DrVt37I/cdp30eGwJO6dcvTrnb5wMyrD2y
 PQmC4dj635Tn+JkJf/zhFa+U6w4tYlqwtvRQEcoOfbJpT8hxhH7B+hRxsTusI3hihCEa
 ZehxuQ+AeMUOj4txOJK3G2q4BmC8kx8/VSo950FFspe/gVhCShI6utbLI3nr+JTA01gj
 i6/h3Zu8v0eyfi4lskdQgO5MgaAMNMARO7m0KUPVdX8xpOnJzXFFOhyFpDsqmYugmzet
 1LxaKS/R4kYg7gVG2hcfCOi5wD8Y7/xvld14atfDntEUz3g4JIdw4iX6wrP7UUJ80vpK
 Ue2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dEwkVXgz
Subject: [Buildroot] [PATCH] package/libssh: security bump to v0.11.3
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more details on the version bump, see:
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=301d0e16dfa8a5cac1cff956b6880ca90eb82864

Fixes the following vulnerabilities:

- CVE-2025-8114

    A flaw was found in libssh, a library that implements the SSH
    protocol. When calculating the session ID during the key exchange
    (KEX) process, an allocation failure in cryptographic functions may
    lead to a NULL pointer dereference. This issue can cause the client
    or server to crash.

For more information, see:
 - https://nvd.nist.gov//vuln/detail/CVE-2025-8114
 - https://www.libssh.org/security/advisories/CVE-2025-8114.txt
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=65f363c9e3a22b90af7f74b5c439a133b1047379

- CVE-2025-8277

    A flaw was found in libssh's handling of key exchange (KEX)
    processes when a client repeatedly sends incorrect KEX guesses. The
    library fails to free memory during these rekey operations, which
    can gradually exhaust system memory. This issue can lead to crashes
    on the client side, particularly when using libgcrypt, which impacts
    application stability and availability.

For more infromation, see:
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=87db2659ec608a977a63eea529f17b9168388d73
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=266174a6d36687b65cf90174f06af90b8b27c65f
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=8e4d67aa9eda455bfad9ac610e54b7a548d0aa08
 - https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=1c763e29d138db87665e98983f468d2dd0f286c1

The v0.11.2 already had a fixed for CVE-2025-5318 but the NVD reference
mentionned wrongly the version 0.11.2.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 161d5b1e58..1c15d77a45 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.2.tar.xz.asc
+# https://www.libssh.org/files/0.11/libssh-0.11.3.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  69529fc18f5b601f0baf0e5a4501a2bc26df5e2f116f5f8f07f19fafaa6d04e7  libssh-0.11.2.tar.xz
+sha256  7d8a1361bb094ec3f511964e78a5a4dba689b5986e112afabe4f4d0d6c6125c3  libssh-0.11.3.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 7bcf077929..3c7e77a206 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).2
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).3
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
