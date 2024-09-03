Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D059CD3420
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 08:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139F180E73;
	Tue,  3 Sep 2024 08:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfX-MlkvwWQh; Tue,  3 Sep 2024 08:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1184280E75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1184280E75;
	Tue,  3 Sep 2024 08:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5171BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2908B40220
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 08:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLa5baCBlb-p for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 08:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1631401EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1631401EF
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1631401EF
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 08:57:51 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a86b64ebd8aso303240266b.1
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 01:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725353870; x=1725958670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=teRRsZfFE9whINoPHQ2NNCQOMz3QDap3bmLVQ/9UIjU=;
 b=HH1fRk0Bf5TExPP9sDY3PQcplOTheVqz56zlf8TlLpJDBmV1Q0uUS9P3sn+cySlNHl
 hSfeBVVFIWmYlOQ+czHpFyKnbU2NheWdNB0ovmn+4GFKlmZPAts4C023PiK/ktImhEgz
 0EOT8pzQYSAyiP+iNH0rWkxS3tLvR8goTe63T9anQ/5gzpgq8HmIGCAFd6FtyFt2SOXu
 k8RX8fYA/FS/8e6fUyjv3r+SAl+oQKCOsV6OOTvT9HxkBJK0lXlQGA8Kti6HymEYqe+d
 f+gL2JCqOy82XtLoZGc3QJVKE1rdpMzSt7xv/NE9E/18KaVQ+924q3cgA6wFiKjjPuRB
 zOsw==
X-Gm-Message-State: AOJu0YyMGOQQY6OKIruTQd0/SBw2uv4Q69O+HLkLOtfvi8tLhvCyboWa
 fsq+VHj2xKDelc+BTxm9xUxtc/STxW6D39M3B6XC72sTjcNPci6cjIdh65YfXJp6motmWoOXTac
 IKu4=
X-Google-Smtp-Source: AGHT+IFF02N8aC1DQXczthHp2DA+UZtiLFh/v6fTuIq5es9JryrbKVz5RO7gZxNuJGo0XOdK6WQFSw==
X-Received: by 2002:a05:6402:1d55:b0:5c2:6311:c9d1 with SMTP id
 4fb4d7f45d1cf-5c26311cb25mr3683446a12.22.1725353868659; 
 Tue, 03 Sep 2024 01:57:48 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (93-35-133-65.ip55.fastwebnet.it. [93.35.133.65])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccfeacsm6204487a12.78.2024.09.03.01.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:57:48 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  3 Sep 2024 10:57:44 +0200
Message-ID: <20240903085745.2594893-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725353870; x=1725958670;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=teRRsZfFE9whINoPHQ2NNCQOMz3QDap3bmLVQ/9UIjU=;
 b=V0TejEk6swQR38DYsnaet6LZSFGh2HdvaQT8ZK2QLYDzNmGc2t5eCnbY7fyRXu7U0Q
 CwQhOmpYsFTLZxoGlr5SHdC5uIhZi4fgOgcWqug6b7HPTIZE51/A+BMwollNzTLpLTUp
 5G6jyS1mCssWC/7eaYi9azHfcb5AHkusX//uk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=V0TejEk6
Subject: [Buildroot] [PATCH V2 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Just a simple clone and pull with --depth 1 should be enough to parse the
cve and generate the pkg-stats report.

From a full clone and a depth-1 clone, and the size delta is 2.9GiB vs. 2.2GiB.
The download size does change: from 983.55MiB down to 270.78MiB.
it's a net time win too: 2m17s vs 1min7s (on a 100Mbps link).

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
V1->V2:
    - Add statistics from Yann E. Morin
    - Use git pull --depth 1 for update the repo

---
 support/scripts/cve.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/cve.py b/support/scripts/cve.py
index e25825581e..dcb3a63925 100755
--- a/support/scripts/cve.py
+++ b/support/scripts/cve.py
@@ -72,7 +72,7 @@ class CVE:
         print(f"Updating from {NVD_BASE_URL}")
         if os.path.exists(nvd_git_dir):
             subprocess.check_call(
-                ["git", "pull"],
+                ["git", "pull", "--depth", "1"],
                 cwd=nvd_git_dir,
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
@@ -82,7 +82,7 @@ class CVE:
             # happily clones into an empty directory.
             os.makedirs(nvd_git_dir)
             subprocess.check_call(
-                ["git", "clone", NVD_BASE_URL, nvd_git_dir],
+                ["git", "clone", "--depth", "1", NVD_BASE_URL, nvd_git_dir],
                 stdout=subprocess.DEVNULL,
                 stderr=subprocess.DEVNULL,
             )
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
