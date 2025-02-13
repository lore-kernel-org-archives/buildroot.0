Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A4C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8DB640B61;
	Thu, 13 Feb 2025 14:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hxhBA5zRL_o; Thu, 13 Feb 2025 14:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8511F40B86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8511F40B86;
	Thu, 13 Feb 2025 14:58:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E654912D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D59B661766
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0N4U-D6jbXPn for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F164261485
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F164261485
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F164261485
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:57:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-308e9ff235bso8734331fa.2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:57:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739458678; x=1740063478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OvCne0A9SGiDrM83MaPf5uu9hHjIP3BXrATYXyXcBy8=;
 b=pZVCmz+9EOG1Feopdpd55Mu3xFpBLIYSJpHn3YHifAg4fXa8DsbeikeipSCj9fcBxr
 3Jcel7rSntAQaePhoc6MhCOTdCSkfUg1E+z0k3+BxavPZV6xNSwb+qzLAnP8+QY0BmJj
 BLT5rcQ6/G5e65cSdi1d7hlFgXpgnvgQMZmWz3kNAVfe6CSvCG1F+kZJjAml1my+V8KW
 Nkd+mw6IGRQdvWrkoq9YGYT6CfsB68NIqEmEOsljmXEobdIENETpteSJoXcbdCqoENzS
 wFNVtOgEnfn30G3ZSq8Fbd+lHRxtcxwVN8GOPyMMmoT2KjhPEcmk1xzI3mBL6LJCgTlO
 Oe8A==
X-Gm-Message-State: AOJu0Yw/JDA6x1zTkl4jI74ZAPe8EUZDEuGztQU9yg5dszax7UWwXfQb
 ZyJ3Ix7nPBG+lmpiWQ/7JSoqNtDjxk6p7+BOsTqYjJTNZEi2Sdajq8w3OuDI
X-Gm-Gg: ASbGnctlEGcrLDJr3BO8+SSiOIQb7RhmSQsM2/O4D28gvVUoI8EAUkCbn/2AKgXCJyb
 MhxHD6wxEYX/0E6z48UCUQBBdb8I9ojdFmZhW6CS71mf4XIiDioRiyRkBbsP34A/WKTlX1eG4Bi
 +zEH3gfqilA1hq6OMkq4AA/EAg6skNN7pmAp1n80F716P4C2Kif2ZfnfuvdqI8iL4HwcTTR+JOn
 N6Dj2I+sxc4Q6zIp6jHE1q9Ji74Zleuy8uZhP4TzxLo3AdmIGvddblaSFnSfenc8MPtSWeVCfGw
 t8WThPZ/adpeWgxlPp5klva01oCJilWrUf545W97iBYHEQ==
X-Google-Smtp-Source: AGHT+IE6NLw8wQv++xvVovnr3IHdSYwA4PYqL4UUGl2642EUvzahWNsRd1jNgFcpleYGLEm8ycetXA==
X-Received: by 2002:a2e:a80e:0:b0:308:ec6f:7022 with SMTP id
 38308e7fff4ca-3090366a994mr32610931fa.17.1739458677421; 
 Thu, 13 Feb 2025 06:57:57 -0800 (PST)
Received: from precision7530-arch-roy.lan ([79.161.254.156])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029be88sm2094681fa.96.2025.02.13.06.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:57:55 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Andreas Naumann <ANaumann@ultratronik.de>, Baxiche Su <baxiche@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Thu, 13 Feb 2025 15:57:40 +0100
Message-ID: <20250213145747.639358-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739458678; x=1740063478; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OvCne0A9SGiDrM83MaPf5uu9hHjIP3BXrATYXyXcBy8=;
 b=nZZ4foUbww0KyKQlvF1yQuTtyE+UBwYk2CE9xn2zIr3xG8wjiYCKmBva4l7oYfduuG
 v1cJh270oGKnSEVUxv126oOURyyk9mjArDjP6KoBFdlX98hJpTRIeNw+Sj3tm7oUnKvB
 piwaz/o6kWoxidfg96jdD03NL324m+gipn3Fo1Mxy3eqvMtUcbJsj4ilp/EWz80eoQGv
 m62xS+eGk97pcMpYal1VZtfTDiGQCsz6bgQBwB5rmQ3TdYsLz9wPpixma8bZHUdhXjLj
 BuF+ogJkM7Jodxuv5UHsvBIFkGp571r/Y3djYRCthwIgPmnrKS1sUO2yMrAmxwTBLnHX
 rhuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nZZ4foUb
Subject: [Buildroot] [RFC PATCH 0/4] bump, fix and add qt6 packages
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

Here I'm bumping Qt6 to 6.8.2. This is probably good to do before the upcomming buildroot 2025.02 release.

I also had a patch that adds Qt6 Sensor laying around on patchwork, so I bumped that as well.

Some files were removed from Qt6 Multimedia's LICENSES-folder, so i removed those, to fix legal-info.
I should probably squash that commit into the version bump commit.

I encounterd some bugs when trying to build qt6tools. I'm still working on fixing these.

I don't think the bump to Qt 6.8.2 introduced the qt6tools problems, so I think it's safe to bump
the version without these last changes. But I'm not sure.

Please test and comment. It takes a lot of time to test Qt6 stuff, so help is appreciated.

Roy Kollen Svendsen (4):
  package/qt6: bump version to 6.8.2
  package/qt6/qt6multimedia: fix legal-info
  package/qt6/qt6sensors: new package
  package/qt6/qt6tools: WIP

 package/qt6/Config.in                         |  1 +
 package/qt6/qt6.mk                            |  2 +-
 package/qt6/qt6base/Config.in.host            |  7 ++++
 package/qt6/qt6base/qt6base.hash              |  4 +--
 package/qt6/qt6base/qt6base.mk                | 16 ++++++++--
 package/qt6/qt6charts/qt6charts.hash          |  4 +--
 .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +--
 .../qt6/qt6declarative/qt6declarative.hash    |  4 +--
 package/qt6/qt6graphs/qt6graphs.hash          |  4 +--
 .../qt6languageserver/qt6languageserver.hash  |  4 +--
 package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash  | 12 ++-----
 package/qt6/qt6multimedia/qt6multimedia.mk    |  8 -----
 package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash        |  4 +--
 .../qt6quicktimeline/qt6quicktimeline.hash    |  4 +--
 package/qt6/qt6scxml/qt6scxml.hash            |  4 +--
 package/qt6/qt6sensors/Config.in              |  6 ++++
 package/qt6/qt6sensors/qt6sensors.hash        |  7 ++++
 package/qt6/qt6sensors/qt6sensors.mk          | 32 +++++++++++++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +--
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +--
 .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +--
 package/qt6/qt6svg/qt6svg.hash                |  4 +--
 package/qt6/qt6tools/Config.in                | 21 ++++++++++++
 package/qt6/qt6tools/Config.in.host           | 12 +++++--
 package/qt6/qt6tools/qt6tools.hash            |  4 +--
 package/qt6/qt6tools/qt6tools.mk              | 12 +++++++
 .../qt6virtualkeyboard.hash                   |  4 +--
 package/qt6/qt6wayland/qt6wayland.hash        |  4 +--
 package/qt6/qt6websockets/qt6websockets.hash  |  4 +--
 31 files changed, 148 insertions(+), 60 deletions(-)
 create mode 100644 package/qt6/qt6sensors/Config.in
 create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
 create mode 100644 package/qt6/qt6sensors/qt6sensors.mk

-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
