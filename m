Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB3CC54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9727341DBF;
	Sun,  1 Jun 2025 10:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_W1EVkQJ39S; Sun,  1 Jun 2025 10:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5EBB40BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5EBB40BB4;
	Sun,  1 Jun 2025 10:13:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E19F7222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D312D81B58
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sr8D0tN1fC-k for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24254814BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24254814BD
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24254814BD
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:17 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55220699ba8so4326199e87.2
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772795; x=1749377595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3gizs62M1KKe9d9ir5/5ZtdHels+YRSP6Zm0EHP5V30=;
 b=P764E/Ct69WdAIZtCP/y74ntv8AM/fKoaW/HKHgogh6tpiLXNAgdRYWyxSOTmHC8OK
 1clIZ1NExLmHN63QciZ1n3v/LsLrIce/gw0jFvqgWKLaYQm2Xst/W5DYh50n+jcxOhKx
 fko50pcstQVbTus3lzDgyO+7FrhH5auVP1s9oIn3Qfj4IBOI58sr1A9s/92igFlxQHjb
 UlL+BdkKHV/6/j9sIwnAncDZIqwIZr265mD7FdGEnVRm94Oz0cbgOiCWuuc1lELpAF/m
 MhXKYkS+VBwt02IE+jWKPb3i8G2/xc2tCjPxFYOLpw+5yt6dEBY34aP033HOky24SRSl
 YUlw==
X-Gm-Message-State: AOJu0Yxos8mrAia3jtnSAiKIcWl61sjHQuKPPDQIoCPoZB4K46HO0utt
 xWB51Eum2s7yKO+fY5+9XvdM2MgdhbyBQmEwFG4OcEW4Bvh+EOnpwmjAPzBeRA==
X-Gm-Gg: ASbGncsFRF7Evmk0hGdFRZYaBvdA522QFHcWaMDSVBkSatbeh+WaedwQ+XwiIT5sJDC
 1ZlNq1ihe6BmzE/ZNcfvL3heiNGKOr3K/v4o/g7cR3ooqgYh4MGIYcifcIY3z1pPiuofGq+gDCD
 DVVYurRUlbtBan3YYM50HodgaLUP8GB0k7cRDUxmPjul9HDIdFKLsXvtX7VdigF7BSg6UpSpP7b
 AVpN9SHHjARMFY2uHye6O0NGjuxuhRIw4BWlLiUXS4A+Hx1qjXkaGJjbbllbNFey88n4p9zdpNc
 JLdeg0HMxIr05Ng3+z3b7Km/CWcr61ueucsT5cvPyrBdjMjMD9MawhZov7T1AJqqa66MAVPxqQI
 mKfplkRtLqxtvzd2Judx/
X-Google-Smtp-Source: AGHT+IGOjBinq8jEUkIHPmZiWKNTjgF+th9OKu+87xz8z6PS35WDdFTu45G5PoruR9wiIbYTtEaYCQ==
X-Received: by 2002:a05:6512:6418:b0:553:2bdc:e36a with SMTP id
 2adb3069b0e04-5533d19dd17mr2403319e87.34.1748772794423; 
 Sun, 01 Jun 2025 03:13:14 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:13 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:12:54 +0200
Message-ID: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772795; x=1749377595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3gizs62M1KKe9d9ir5/5ZtdHels+YRSP6Zm0EHP5V30=;
 b=WsmFkNJ4mHNpBxzMb8cv/0AVaLQPXzbgjtrg55mWy9IwlAcam/29EevWwhSOds/+nh
 QSPj00ljQ3am6HPCLvVMUHzPx/fPwW1KoIlZVwfS6jup9OfvUdblT1QHR+kIxQovY99d
 7ewwkay1kKg3KKmsxoDHfuHE4DbdKmwFCT75XbEnoQdpiKq5aKzSuQP9ERL4ILYHmJH3
 4aCg5BRu+FuAEQkKJG42jdDom1x8S/Lr54tOVMU9UoS81vSHZWMqFuI/IEoSfWLuK3vN
 aFcxnxh2kgC0PPxWtZVKxdPgv2avCPwesUe1qfAKSxg+TT7apgWuGk/2j9iz+eAGcs6z
 f9eg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WsmFkNJ4
Subject: [Buildroot] [PATCH v2 0/6] package/qt6/qt6tools: fix build failures
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

These patches were originally part of the series bumping Qt6 to 6.9.0.

The fixes were rebased on the old 6.8.1 version, and reordered to match
the order in which they actually appeared.

The commit messages and comments were updated.

Backport to: 2025.02.x, 2025.05.x

Changes v1 -> v2:
  - add missing patch "package/qt6/qt6tools: build without clang support"

Roy Kollen Svendsen (6):
  package/qt6/qt6base: add hidden options needed by qt6tools
  package/qt6/qt6tools: fix linguist build failure
  package/qt6/qt6tools: fix designer build failure
  package/qt6/qt6tools: fix assistant build failure
  package/qt6/qt6tools: fix assistant build failure
  package/qt6/qt6tools: build without clang support

 package/qt6/qt6base/Config.in.host  | 14 ++++++++++
 package/qt6/qt6base/qt6base.mk      | 40 +++++++++++++++++++++++++++--
 package/qt6/qt6tools/Config.in      | 40 +++++++++++++++++++++++++++++
 package/qt6/qt6tools/Config.in.host | 17 +++++++++---
 package/qt6/qt6tools/qt6tools.mk    | 34 ++++++++++++++++++++++++
 5 files changed, 140 insertions(+), 5 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
