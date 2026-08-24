Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79566C5DF94
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 06:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FA680B00;
	Mon, 24 Aug 2026 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbajajTF-zCA; Mon, 24 Aug 2026 06:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787553533;
	bh=S6uFvfJHlA86L8ejY9CWdlFPOo7KNVEBK1DdlnBq3bc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fDr1NWq6yhGOMAc1uhlMgCDrVaIxzAhMTjCkiUSDIrCGqzM5dSK74r5fpv+Y+dTKX
	 Pdxw9Uua743keeLNFkdZHSN7oebHt1TXNfW8vPHNZuPLFFhotMf8J2J4A2J7Gthl/I
	 pbbUWaYYKgvwdS2LOYQ14JJ3/mGuvYy9OsYNa6tZ30gR7RGlWBURAocp0MOnVWpTsM
	 ID8QmrwVHm+wuEQMlFXOKuS/24rZooMUrJK4U2/MiGKjTGAEbufdHTubGBKcWAi/cV
	 nbErAN9ztiycI+YYQCarZRmFsfCKQQxjefLlVff2y30cm9lPqrjGinP01K/Km25tIG
	 iIHbFlWq+Y7lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A75880B33;
	Mon, 24 Aug 2026 06:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 874ED3DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6136080B33
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmD3PXHFSUwF for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 06:38:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PZiWMPDD
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42DFC80B00
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 06:38:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c1712a04ddaso521429666b.2
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 23:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1787553528; x=1788158328;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Nj1dNbkkJJkZG0emCV1Myv303WFFtKpTcP7mguBfyqg=;
 b=PZiWMPDDZv7XsVxoYcnXkP/RdTHdd0kLtg9bI4NoZbZn8vv/0uHeqmtzVn84EGsfWw
 0dyKGdibZ7sHk7pgGuY5Zbokhd66b9iKcoh83UCg3VgEembVvsjC54AFauTsg7J3vQvb
 xrQSdUofEDGP5X28wvOsFEloyCOUnjlJmbEeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787553528; x=1788158328;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Nj1dNbkkJJkZG0emCV1Myv303WFFtKpTcP7mguBfyqg=;
 b=iu0ZcFjqDTe8G8FYfJA9xVzuDj/mhDMlPmq1TXYrYkSr37SvtyiZNpB9k0tueZuZnN
 5hCNDBTME8UKY6mDd92GUyzfL+6hBiXZRPjqMzxqp1GCsVSAcOSDQW1vgoTS26wBLjn5
 N6Q8qCs8FbmPEewfnEsUXdUYZnEeOyHz+TEGU2RpFyi9H9n9Es4MD7wpjlJQG7Q/5i79
 swKTJlNSeiNCeikLBT+UCSygjfRBoN/RsLmBY5Hk9LN3GfNyJZDYYCiHcyWapkwkUMIK
 bPZnsuhpB0Ik9zf+5/MAWN18jo1rAwsG2sqrmwVa2EsMog9LJJQUU8k5oIRymL/WJ6DY
 QMMQ==
X-Gm-Message-State: AFuF++lpZQ4pPwOjUPvh8nxHPe8iXrqaoQ/dZhI/1uJBrpXBrTqm8zjU
 /+EA2ge8Ctgb3RnbN9SveTj8mwb6qPOew3xJgfFcMicok8hEG27L1NJCRbttS9HghFq8WCOa1vP
 7ImJYUBQ=
X-Gm-Gg: AR+sD11lVwDkBAFroFVJKQIIMMC5Ahzuwi0Td6HlD8Lk6fMQMfIrj3iIuoBqvaoT8gi
 veTyqExod4wR5F7zWkmiE0zTujWpeeXC0GCC+y7C7sArmSCZjboUx6/30UvrzH9DE6NjWILFIa2
 Nhh+T9bcPnnGqKvl6NY6q6NPCJussLYFqPNn5myDtjwl0lgBuvC6krx4OUCLUe1/J7nN51YuulR
 6p8BXEp9NCaXQu1nJjIm6v5oLp5kt6BZgwsXqR42bmP+lsujwPBHnbiCarbIePirf3NIlRQZkvV
 GY+zplvQmVY8sPWHs165r2RIOL0pZygDlHETbR/t6oKVz3/HJiucebAdXW3ee93Id6+xezlAFEN
 a+O2yLPplG1Hk1QiOWQhJYwjCNecToznJ1hFAS1ClKMiIevmUmZJD0bE2DSRuY+39kg3h3RZKVf
 TD3ZO5Erf0AEYkG6RQHhYRB+nc1LHLT1eN3yLuVVTRfKPXVb7PwFWJMc/haI7/TjTmg8RKbFPGz
 FgteacMaQ1r/S3NU89dti/fO69OMoDcn9Ewcsq8JuDuCaTtHfDIX/dXLAQvkqCaPoDROSW0+WBu
 9OKw918w8+I+Mh4sDnSF2JPKi2g3FjekyMnGmWbUZi8OlPLPbLoFAWXqGqIjWA==
X-Received: by 2002:a17:907:930e:b0:c1c:4e36:eec6 with SMTP id
 a640c23a62f3a-c2492099898mr1690528766b.18.1787553528494; 
 Sun, 23 Aug 2026 23:38:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249685ef7bsm1226186766b.52.2026.08.23.23.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2026 23:38:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Fischer <mf@go-sys.de>
Date: Mon, 24 Aug 2026 08:38:37 +0200
Message-ID: <20260824063843.839745-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 0/6] package: add CANopenterm and dependencies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds CANopenterm and the packages required to build it.

The previous version was blocked by the lack of an SDL3 package in
Buildroot, as pointed out during the review of v5 [1]. SDL3 has since
been merged into Buildroot, so this series now builds CANopenterm
against the current SDL3 package.

While revisiting the v5 series, I also addressed some build issues and
added the missing dependencies required by CANopenterm.

This series was also tested with Buildroot's test-pkg.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20250707055824.49575-1-dario.binacchi@amarulasolutions.com/

Dario Binacchi (6):
  package/sdl3: fix build on PowerPC with uClibc
  package/sdl3: disable m68k builds
  package/pocketpy: link with libatomic
  package/isocline: new package
  package/canvenient: new package
  package/canopenterm: new package

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  3 +
 package/canopenterm/Config.in                 | 27 +++++++++
 package/canopenterm/canopenterm.hash          |  3 +
 package/canopenterm/canopenterm.mk            | 29 ++++++++++
 .../canvenient/0001-Fix-build-with-musl.patch | 43 +++++++++++++++
 package/canvenient/Config.in                  | 13 +++++
 package/canvenient/canvenient.hash            |  3 +
 package/canvenient/canvenient.mk              | 14 +++++
 ...nly-require-CXX-compiler-when-needed.patch | 55 +++++++++++++++++++
 package/isocline/Config.in                    |  9 +++
 package/isocline/isocline.hash                |  3 +
 package/isocline/isocline.mk                  | 21 +++++++
 package/pocketpy/pocketpy.mk                  |  8 +++
 ...001-Fix-build-on-PowerPC-with-uClibc.patch | 40 ++++++++++++++
 package/sdl3/Config.in                        |  8 +++
 16 files changed, 282 insertions(+)
 create mode 100644 package/canopenterm/Config.in
 create mode 100644 package/canopenterm/canopenterm.hash
 create mode 100644 package/canopenterm/canopenterm.mk
 create mode 100644 package/canvenient/0001-Fix-build-with-musl.patch
 create mode 100644 package/canvenient/Config.in
 create mode 100644 package/canvenient/canvenient.hash
 create mode 100644 package/canvenient/canvenient.mk
 create mode 100644 package/isocline/0001-Only-require-CXX-compiler-when-needed.patch
 create mode 100644 package/isocline/Config.in
 create mode 100644 package/isocline/isocline.hash
 create mode 100644 package/isocline/isocline.mk
 create mode 100644 package/sdl3/0001-Fix-build-on-PowerPC-with-uClibc.patch

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
