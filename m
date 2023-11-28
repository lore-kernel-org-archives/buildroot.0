Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F366C07CA9
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 13:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDD640910;
	Tue, 28 Nov 2023 13:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFDD640910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcRlEy7vQugi; Tue, 28 Nov 2023 13:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1241E405A2;
	Tue, 28 Nov 2023 13:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1241E405A2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D1E01BF3C4
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 422D2403A5
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 13:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 422D2403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8rdvJ8iLJkU for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 13:16:55 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEEC740192
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 13:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEEC740192
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5441305cbd1so7092642a12.2
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 05:16:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177414; x=1701782214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sZ6w6NYK7MLJExaBCacghn7jvxqCecqeGhA0DwYoWTE=;
 b=bczinxA/6mkrFDsAu1RgitvA02gWPlG9TaLykMSsq2MQ/lXIAj7MMGazX62nDf3mPY
 o43lXtQgD2AnSvawMelHPsJ97jzkUuPy6yVJhKRT7YoiF8RADrG6HFHRVzLqI+PDH+N9
 dakcoGMSqkI0M4y4jrQgEncvJn0a5d2m9qCcDnOGP9jD3vhGwLN/KWqd25O4SyIaqS4Y
 nUgvhdRe1ekD05WLslhsDxdJavMqkqqKnO7XafvHXdQCYv/L6bzQ3h6C48SJYYqn503X
 ZyrX/Vuu7dVEUumyeZThp7ZTVCgYqtQ3VtyDxB4Ooz1hFkFVuv6c4+yjjmEmiLv+Hi76
 6lYw==
X-Gm-Message-State: AOJu0YxsMX/HjWjuqbOtHgqclCSc2be8uBhlLAXncXAy7u5qAp7rppOi
 AYA9hir6ESq82N1eCcvMu6KD3IyX5ySNBQ==
X-Google-Smtp-Source: AGHT+IFGGwoEJQwhzddqff06BeKok7z45imfa8mQ35wdKAhyB5ynyig3kFbEQo5U9zJRgFjgFopBsw==
X-Received: by 2002:a50:8ac7:0:b0:53e:4762:9373 with SMTP id
 k7-20020a508ac7000000b0053e47629373mr10529259edk.18.1701177413589; 
 Tue, 28 Nov 2023 05:16:53 -0800 (PST)
Received: from wslxew193.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a056402048b00b00537963f692esm6243150edv.0.2023.11.28.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 05:16:50 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Tue, 28 Nov 2023 14:15:49 +0100
Message-ID: <20231128131557.44045-1-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701177414; x=1701782214; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sZ6w6NYK7MLJExaBCacghn7jvxqCecqeGhA0DwYoWTE=;
 b=HvRAXoFl/hHglbKcnN4p1Y+9atDlXFiLDPlvSgMeqr7Y1w2tiulQKz7hRmapU3+167
 +6hAbp7R/qAQk+n9IEasr9jyeFKo5RR35/zHLcqGrfXhDCDIUFyxUlQtRNLEvdLF68w8
 SOAo0iFhbFqyHfxTeWuB4WLOyTI+ue5rStkwfKJdYRqK0eQZjl+1DR4XavV6ZQiUoQ3N
 r17uMJI6fN5bA6uTDrEzlTj5iijxFRrRQVwVd+Pzxv55T26V5FZGAoga5LWtq0Aot4ds
 QFgAsxCU5Mzf35Du5jx9tCp06sEor+ZDgx+WtiJ8si24aP1Pp/C9M3uzYWzU9Kc+XnBs
 We/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HvRAXoFl
Subject: [Buildroot] [PATCH v3 0/2] Adding support for gpiod v2.0 and higher
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since libgpiod v2.0 breaks its api, and leads to
compilation issues with multiple other packages,
we introduce libgpiod v2.0 as a new package libgpiod2.
Furthermore swupdate is updated to support both the
old libpgiod and the new libgpiod2 package.

---

v2: https://lists.buildroot.org/pipermail/buildroot/2023-November/679812.html
v1: https://lists.buildroot.org/pipermail/buildroot/2023-November/679675.html

Changes from v2:
  - Removed unnecessary Autoreconf, since the corresponding patch has been applied to the source.

Changes from v1:
  - Added myself to DEVELOPERS for the new libgpiod2 package
  - Removed the dependency on the linux headers
  - Updated from version 2.0.2 to 2.1
  - Added comment in the commit message to swap the dependency in the future
  - Added a note in the commit message, that the libgpiod2 does not correspond to the libgpiod2 debian package
  - Updated the help text to explain the difference between libgpiod and libgpiod2


Boerge Struempfel (2):
  package/libgpiod2: new package
  package/swupdate: Add compatibility to libgpiod2

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/libgpiod2/Config.in                   |  27 +++
 package/libgpiod2/libgpiod2.hash              |   4 +
 package/libgpiod2/libgpiod2.mk                |  41 ++++
 ...cfw-Refactored-switch_mode-signature.patch |  74 +++++++
 ...pio-chip-and-lines-in-gpio-structure.patch | 129 +++++++++++
 .../0004-ucfw-Refactored-gpio-handling.patch  | 132 +++++++++++
 ...d-compatibility-with-libgpiod-v2-api.patch | 209 ++++++++++++++++++
 package/swupdate/Config.in                    |   4 +-
 package/swupdate/swupdate.mk                  |   5 +-
 11 files changed, 626 insertions(+), 3 deletions(-)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk
 create mode 100644 package/swupdate/0002-ucfw-Refactored-switch_mode-signature.patch
 create mode 100644 package/swupdate/0003-ucfw-Save-the-gpio-chip-and-lines-in-gpio-structure.patch
 create mode 100644 package/swupdate/0004-ucfw-Refactored-gpio-handling.patch
 create mode 100644 package/swupdate/0005-ucfw-Add-compatibility-with-libgpiod-v2-api.patch

-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
