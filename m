Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA675C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 12:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D963817A0;
	Sun,  7 Jul 2024 12:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFdIP-nUEbdq; Sun,  7 Jul 2024 12:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83753817A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83753817A1;
	Sun,  7 Jul 2024 12:31:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 899E91BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74408817A1
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2V4gh6MuAGm for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 12:31:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 48E98817A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E98817A0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48E98817A0
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 12:31:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77c2d89af8so309200066b.2
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 05:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720355496; x=1720960296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UbpKF3Lp3cM6rnp7/EFBQ5Ej/g/KA9OsmgiZ/LPsHv8=;
 b=mJGXLld9bLuFHDnhpLs66dPItu6Xwq/oyIbsusZ6VsYm8+tNfLTlYrq9vhPKCeyEiP
 c/rVmHSDq3mqfarV5PwWIaysA1nHpT7IFpdCpv/w5vHHX8DJmz3zHIvp2Cnl5l76nuuL
 4RPawLrp+F0pyEHJQ7fOD0riNdPeHIx6/ztuglaJh+ZANJGt6VLkay7NCSEhPhir16Ym
 mZF3tep9tVWkFoLehljsuN3N9nW/hYJXjzMv2LoeRrDbPr7xYt4CiXlp6rutyRlboTu3
 2ZiS97PCXBqd2mFf0odTasvAyzmlC4LEW0Rp02AO7pOZYfLOaKtltMib7PNB7lBtzGfx
 5OTQ==
X-Gm-Message-State: AOJu0Yx1LgzMFIj5lt5qIAhExhw9cC676NjGyH0W1bLZVuIxKwCq/gV7
 nN0Mzw8EA/NFpWx6eM+fa7jgVZx3jqGfq7IpsfeDAVGmD8Pk6CEeSp1KfTA+yMGr1h5CjGzJW1i
 8ilY=
X-Google-Smtp-Source: AGHT+IE4W0OvPhY7+Qm4QITjmjyt41V9c+fA4muQ3Qv9/v3VRUw3qKg/LQD7dztQTiBPVzD2ntuyZw==
X-Received: by 2002:a17:907:6e87:b0:a6f:12:8c45 with SMTP id
 a640c23a62f3a-a77ba7295f2mr778062066b.72.1720355495596; 
 Sun, 07 Jul 2024 05:31:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77cb954f26sm218709366b.0.2024.07.07.05.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 05:31:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 14:31:29 +0200
Message-ID: <20240707123129.4045342-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720355496; x=1720960296;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UbpKF3Lp3cM6rnp7/EFBQ5Ej/g/KA9OsmgiZ/LPsHv8=;
 b=EKbmGXcfRMVWynr8z8XUNYcBd4Z0I7sdd3iwA/jdvu7eeSLBLDJEF0VDsqJ3MkIFmI
 6IRzf8CYz9XwGsmNbqnaGyr3YwoN9Why1lbKYr2p7pGKxsGGzNNQ+VQZFBOAvuWxvnYy
 08NyNYN5LxYwTMLczdbgzPHF2/HwLesRJA6OY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EKbmGXcf
Subject: [Buildroot] [PATCH 1/1] package/ympd: update the patches to be
 applied with fuzz 0
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
Cc: Eric Limpens <limpens@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, ympd fails to build with output:

    Applying 0002-added-forward-declarations.patch using patch:
    patching file src/mpd_client.c
    Hunk #1 succeeded at 29 (offset -1 lines).
    patching file src/mpd_client.h
    Hunk #1 FAILED at 96.
    1 out of 1 hunk FAILED -- saving rejects to file src/mpd_client.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ympd/0002-added-forward-declarations.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ympd/0002-added-forward-declarations.patch b/package/ympd/0002-added-forward-declarations.patch
index 90ee1eae6868..d96307d2a472 100644
--- a/package/ympd/0002-added-forward-declarations.patch
+++ b/package/ympd/0002-added-forward-declarations.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] added forward declarations
 from:
 https://github.com/notandy/ympd/pull/191/commits/2268e0f0f372a61827b912155a1796490968b3ff]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/mpd_client.c | 2 ++
  src/mpd_client.h | 6 ++++--
@@ -17,7 +19,7 @@ diff --git a/src/mpd_client.c b/src/mpd_client.c
 index 2911e461..9f003ab0 100644
 --- a/src/mpd_client.c
 +++ b/src/mpd_client.c
-@@ -30,6 +30,8 @@
+@@ -29,6 +29,8 @@
  
  /* forward declaration */
  static int mpd_notify_callback(struct mg_connection *c, enum mg_event ev);
@@ -30,7 +32,7 @@ diff --git a/src/mpd_client.h b/src/mpd_client.h
 index 447dd563..9342c550 100644
 --- a/src/mpd_client.h
 +++ b/src/mpd_client.h
-@@ -96,6 +96,8 @@ struct t_mpd {
+@@ -92,7 +92,9 @@
  
      int song_id;
      unsigned queue_version;
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
