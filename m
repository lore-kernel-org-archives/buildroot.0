Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894B0C54799
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 11:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B61161025;
	Tue, 20 May 2025 11:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2u4cxoADS7g; Tue, 20 May 2025 11:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B12260796
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B12260796;
	Tue, 20 May 2025 11:33:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97431D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88F0D817FF
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYeE9WZd6rQQ for <buildroot@buildroot.org>;
 Tue, 20 May 2025 11:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D09B81846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D09B81846
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D09B81846
 for <buildroot@buildroot.org>; Tue, 20 May 2025 11:33:46 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-3280b1a25b1so34286501fa.3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 04:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747740824; x=1748345624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EaHCErFiarc53CljFiBh02tqnjGpY3Zq7k31JPwVfS0=;
 b=aNOmsh87cmHt2FRGvvsfbXeBr6dBV0Kso+ZSrCEWGgGF+vYNl58BMZmOkTna6obsqN
 jlqgv9pLo5xY7Wj7HOwjxRc5+acL2Io4yOWaeAV4ETFQm6do+pi9VFQgJ93BvDPq5o0/
 hbht+ISVXrymFUHmgJdjmnmJ7kBF/WY+zpdNWAFvPCotXaqIFe+iCm+6ykJo9/iC8Mec
 etYIpD/YDydqAq2uONu3/2bj2k2YI2XsHIYeR8Ry9DdFU1kVEBjGAQ2e+i1KFR8Q3Mnm
 4mkFmNRdsI6HhRG9VlzO7+KU9UVy0FUpR+Rbw8ow4kxDHAxnOZf+uZiCVkmCivazfwF7
 oucw==
X-Gm-Message-State: AOJu0Yw/69hiZiZA5XuWpe7OeBlwlboZAgXlAW8KnSS4Kpz0qG/2kuae
 NsUdovGtoOppM2KPAzzgcJXVLrPZOgMH35Imlu+CltixKPC9htRVgXWT55vvfg==
X-Gm-Gg: ASbGnctE5BAGy9/aBTDr6NE5v7MeyLhElV9A1xm8SXJqu7HwZrL5ycTKhlCAbvMxABZ
 vW8xNkjnNEBlZvQZI/Md+SNFRsjbKVnGBgN7uCjM1HmV9N8vjwcVVjfyijPr6YZRwye4qlt0/fC
 fX1SIDuB5wgxiGNMwGN8ChcNkQzOEeZoc6Sc5lQmNWpEUx8VnKXnCiCxkw9Yi1n4065ukaHrSKk
 40/jPQSfbJIs1Use6RY4sgCAz5ILZdrYtNkDbbQeeXDNDBeDhFAqE0LbenrTaz3P/OFJ5ztEu+8
 O7R3rqoiLjlrU6t+KA1kn2jprG3sNtcKsVCUxKmcQc5ztr/o415RAH6odWVtPdd0gZjk5ynZWKe
 2RZe4/A==
X-Google-Smtp-Source: AGHT+IEG2YIVRvp+V62j6WgWNxc+21y/FTzaTMo3KnaFPLhAR87ngssEXNRoZgqv5zeqnEBGObojdg==
X-Received: by 2002:a05:651c:e0e:b0:329:c65:eae7 with SMTP id
 38308e7fff4ca-3290c65ebcemr18733151fa.2.1747740823959; 
 Tue, 20 May 2025 04:33:43 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085b8bdfsm23324841fa.76.2025.05.20.04.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 04:33:43 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 May 2025 13:33:19 +0200
Message-ID: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747740824; x=1748345624; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EaHCErFiarc53CljFiBh02tqnjGpY3Zq7k31JPwVfS0=;
 b=FUYDFSTPT2VKymOT1wQ0HYXugF2SF+JfCcAZpSVb8aeW49/ixuocEWfpeA0HleMcxd
 sWRB3gIy3OetwNAFnkTRGC31DMTfuCZ0CESfFajIkmoWMxhACZHiD6a5scq8GI8FgVxQ
 8Qg7iNMNrH4LL8pFYpYMbuuQtAXdXHT1ckyl21GJ9+ohaTkt1kz6Az7r5+eUG3iqNBjM
 A5KciFdntASB3b8x9SN4slbjXO5Ubz3Qb9Tf9bOvpxK/dFF9vezzxyQqWET8Htldnu2p
 Fad/APDkcxhUgGCqS/mayxr5gL9w4NePzZGqolZ8Q8Add9ICpPctsG1ZOF13LT76ean6
 jL2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FUYDFSTP
Subject: [Buildroot] [PATCH v3 00/12] Bump Qt6 to 6.9.0, add and fix packages
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version of the patch series adds a another fix which disables
clang support in qt6tools, since the current clang version is incompatible, and
the external host system clang may be incompatible as well.

Previous version:
https://patchwork.ozlabs.org/project/buildroot/list/?series=457528

Bernd Kuhls (1):
  package/qt6/qt6positioning: new package

Christian Hitz (1):
  package/qt6/qt6connectivity: new package

Jack Rubacha (1):
  package/qt6/qt6grpc: new package

Roy Kollen Svendsen (9):
  package/qt6: bump version to 6.9.0
  package/qt6/qt6sensors: new package
  package/qt6/qt6speech: new package
  package/qt6/qt6base: add hidden options needed by qt6tools
  package/qt6/qt6tools: fix assistant build failure
  package/qt6/qt6tools: fix designer build failure
  package/qt6/qt6tools: fix linguist build failure
  package/qt6/qt6tools: fix assistant build failure
  package/qt6/qt6tools: build without clang support

 package/qt6/Config.in                         |  5 ++
 package/qt6/qt6.mk                            |  4 +-
 package/qt6/qt6base/Config.in.host            | 14 ++++++
 package/qt6/qt6base/qt6base.hash              |  4 +-
 package/qt6/qt6base/qt6base.mk                | 40 +++++++++++++++-
 package/qt6/qt6charts/qt6charts.hash          |  4 +-
 package/qt6/qt6connectivity/Config.in         | 17 +++++++
 .../qt6/qt6connectivity/qt6connectivity.hash  | 11 +++++
 .../qt6/qt6connectivity/qt6connectivity.mk    | 42 +++++++++++++++++
 .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +-
 .../qt6/qt6declarative/qt6declarative.hash    |  4 +-
 package/qt6/qt6graphs/qt6graphs.hash          |  4 +-
 package/qt6/qt6grpc/Config.in                 |  7 +++
 package/qt6/qt6grpc/qt6grpc.hash              | 10 ++++
 package/qt6/qt6grpc/qt6grpc.mk                | 43 +++++++++++++++++
 .../qt6languageserver/qt6languageserver.hash  |  4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash  | 12 +----
 package/qt6/qt6multimedia/qt6multimedia.mk    |  8 ----
 package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
 package/qt6/qt6positioning/Config.in          |  8 ++++
 .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
 package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
 package/qt6/qt6quick3d/qt6quick3d.hash        |  6 +--
 package/qt6/qt6quick3d/qt6quick3d.mk          |  4 +-
 .../qt6quicktimeline/qt6quicktimeline.hash    |  4 +-
 package/qt6/qt6scxml/qt6scxml.hash            |  4 +-
 package/qt6/qt6sensors/Config.in              |  6 +++
 package/qt6/qt6sensors/qt6sensors.hash        |  7 +++
 package/qt6/qt6sensors/qt6sensors.mk          | 32 +++++++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +-
 package/qt6/qt6speech/Config.in               |  8 ++++
 package/qt6/qt6speech/qt6speech.hash          | 10 ++++
 package/qt6/qt6speech/qt6speech.mk            | 37 +++++++++++++++
 package/qt6/qt6svg/qt6svg.hash                |  5 +-
 package/qt6/qt6svg/qt6svg.mk                  |  3 +-
 package/qt6/qt6tools/Config.in                | 40 ++++++++++++++++
 package/qt6/qt6tools/Config.in.host           | 17 +++++--
 package/qt6/qt6tools/qt6tools.hash            |  4 +-
 package/qt6/qt6tools/qt6tools.mk              | 34 ++++++++++++++
 .../qt6virtualkeyboard.hash                   |  6 +--
 package/qt6/qt6wayland/qt6wayland.hash        |  4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |  4 +-
 45 files changed, 489 insertions(+), 70 deletions(-)
 create mode 100644 package/qt6/qt6connectivity/Config.in
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.mk
 create mode 100644 package/qt6/qt6grpc/Config.in
 create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
 create mode 100644 package/qt6/qt6grpc/qt6grpc.mk
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk
 create mode 100644 package/qt6/qt6sensors/Config.in
 create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
 create mode 100644 package/qt6/qt6sensors/qt6sensors.mk
 create mode 100644 package/qt6/qt6speech/Config.in
 create mode 100644 package/qt6/qt6speech/qt6speech.hash
 create mode 100644 package/qt6/qt6speech/qt6speech.mk

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
