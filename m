Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673C7C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 08:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03EC1407EA;
	Sun,  1 Jun 2025 08:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cc4HdE8c2SJY; Sun,  1 Jun 2025 08:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AF1407ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42AF1407ED;
	Sun,  1 Jun 2025 08:46:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04478222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D3960709
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjA0nBbE2XXU for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 08:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42D9A606F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42D9A606F6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42D9A606F6
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 08:46:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55320ddb9edso3874600e87.1
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 01:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748767582; x=1749372382;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2DHMZsMnjGDcdWdAQpWyxMI+FVCSox+FuYjxUlsf3DQ=;
 b=YvmJgq4o+D+Y4sDxB3/U987Ra8v4qIMYcgJZ+PWO1viuhL3DqQutEbZuowZLPolJ0R
 exM61j3mQZDl4fzFgZ1cRQ7lxNPwr8dv7CJ26rKvJm64d6mwCzCXf83KXC0tcuc0sSgf
 zk+EqRX1XfT3BvBKv6ILYui3RaK6JAlUqsUk3dzCSQ+76JdI9Ms6JeV7U7ICfk0i8L7A
 hDz9Et174/SWoRe4a/93LwNArYpXTJAMLq7pOdS5lEhURrVHZaA0E6yO6mj5soBk0eNu
 P9ro9nf1klKmmSVNA0a5WbnSl0VXOTnxICd3mf0u+njpXQXq2i+xFVfvCwjKHU2j7JhT
 gXaQ==
X-Gm-Message-State: AOJu0YwYXpZBZr6G/dSZx8DWQXUSn86I6UJNjcwPCmyhvqunBXOnYMhS
 BiW4QT0f3mUF1OmsA0v3YUiV44KzlcW50DiFEefDmb+o9TcMDARShBOPpbAk9w==
X-Gm-Gg: ASbGncuK6fvhhfr+6z1KyTadOeCmXA0uasxUrE2TeGOFtzEKikzd7yWeFpK3bR9WfHy
 SAz/rVA8XdOynJjOZoEU0kyWGms3WI9rSfbrcXz5XGP15W0lHOMaCqZ7e11qf3nY3rJzUyUyilE
 TRN2HQvZinSWsfvBE+1U4+7ADOPT27JjHydXAYd4QzxHWKNnAcFxBYQg0ptiRbdbpApR7hGfFP7
 a3q9o3GlQ8BIjyVM0nrdwWmsvDpIjo+C3VOUNrWyRh6PEzkS4i4KjgcM5bATCqO5ggDF/qJLz1X
 YhOUqQPZhywcdJg2xAK9xbYt1RD4gEita5hKHq1J/Kly0c9xprD+ba6c3pVK2r/K8+9idHbbTTz
 QdXiuSM39UQ==
X-Google-Smtp-Source: AGHT+IEyB6aR2tHxluyzYlfybgWnFVKNShXCl0fvhwNqvXE+Ywlmup9hsrOjYzBSNzN8KRoHKqso7w==
X-Received: by 2002:a05:6512:2309:b0:553:35ca:5b0e with SMTP id
 2adb3069b0e04-5533b8e573bmr3315704e87.4.1748767581759; 
 Sun, 01 Jun 2025 01:46:21 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937764sm1227020e87.231.2025.06.01.01.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 01:46:20 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 10:46:07 +0200
Message-ID: <20250601084616.3104736-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748767582; x=1749372382; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2DHMZsMnjGDcdWdAQpWyxMI+FVCSox+FuYjxUlsf3DQ=;
 b=SnnpheK+kJ9bY2cbXsysCorblYav8+EYhPXf2t5vUHFe/BDZXR44yeDqTuIvf3wtcB
 Luy172YButrdpgKcJbAEoNoLJN5b4QpvGjKMyo7oShHz5wKV6h/z32iP2OuQTW8p1o61
 3aEkMoBWHm7BPH3thrvmQuF8qSyjXHXNJez4N/FE7LA3CljzaH5NsRjRl+E94ZgL2SHl
 HQcTfVd32Yb6PAiHj2mjxPmsOT1JRukNI66Rq6omPLuNCM7HWaOzKz8+vlwTpXyIQufz
 Dh5W64nZrZ2MvSuYksC/5YvefPM4Zg6EEFeJEJSXtmmLm/SsO1THGA0ExyesE7FXPSOn
 3b0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SnnpheK+
Subject: [Buildroot] [PATCH 0/5] package/qt6/qt6tools: fix build failures
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

Roy Kollen Svendsen (5):
  package/qt6/qt6base: add hidden options needed by qt6tools
  package/qt6/qt6tools: fix linguist build failure
  package/qt6/qt6tools: fix designer build failure
  package/qt6/qt6tools: fix assistant build failure
  package/qt6/qt6tools: fix assistant build failure

 package/qt6/qt6base/Config.in.host  | 14 ++++++++++
 package/qt6/qt6base/qt6base.mk      | 40 +++++++++++++++++++++++++++--
 package/qt6/qt6tools/Config.in      | 40 +++++++++++++++++++++++++++++
 package/qt6/qt6tools/Config.in.host | 17 +++++++++---
 package/qt6/qt6tools/qt6tools.mk    | 24 +++++++++++++++++
 5 files changed, 130 insertions(+), 5 deletions(-)

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
