Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F288CA0FF7
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B77A840F5;
	Fri, 29 Aug 2025 10:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m9wsC-SNRyS; Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 130F68412C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 130F68412C;
	Fri, 29 Aug 2025 10:33:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E886C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B124C8412D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NxH6kpWOcpO for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 10:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE158840F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE158840F5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE158840F5
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 10:33:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a3b3a9so284738966b.2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 03:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756463622; x=1757068422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6xS/MSYXMUs4P+DIv+w4XFzCs01ZFEKG6xV6/+UN2K4=;
 b=NH20H3JYX+ZSXmZBYG9bEMv7zEZzpaomG3bVs49NGSqTPWDOtQtzi9ct+KOZYdwF6T
 JGsMMBP7eKbIEQ1Xbi7yoDfAu9Iy2k4BcJtrm+Fni3sRjVoC2V4Y0cZK7vEOFLE2kdf5
 OacaKTP0lajgN1Zr0THMyvPt7mTc0Eh7RfOwUklKTQW/iavpcUIdO/N4FZSv5oSDo/JU
 02GvsQQOfDxh0DFu5eJaIxo3eacs89adN77+kjbXd5UGyxAoBgzIkJAGWHhK+jHOhbgj
 SmM8HMM5rXAYFxYIDUEvO2/kN+9kl5w+xOHv4hrH6v8+G5fbNJBg7/MCaf3RWciy6BY5
 tXIw==
X-Gm-Message-State: AOJu0Yx/DMjQTbJ5D/hg1xsk1TbeunrWGB9xvLZ6wlwAHFNWGys8NIJS
 jG5JvXMvSmy2Z9Iubj+M6qy6fB/ef5WvhPwak8cziQ+1aq0ud99rXXmguqvLcc5/nmymwfrOs+z
 t1CLN7fQ=
X-Gm-Gg: ASbGnct2/o2AhWd8gBXecPwRHSLB53RhsNSPyKl9g5zcr6nQh2VFflKDJ5RYo8D1jiR
 7uikDF+0FxZDqr0tT7/HWXvv1ooupsr/JziM6+7+V0Ecas8DyQrhPsU6VG8dc/ibObaesDst0GP
 H9BojfTzXkXdSnoZYoYXdPAeR9ZNf4gqhHEvPuJ2L/OJAlHeamBNLcly5mmiHxuttSMDZkvwRtW
 eGUtgNZ3E9mNshe4vUsS9NO1Lq/zOwwOswObtnBD6pCWxqMKQ3yK3Wi8fLCQJMscLvE5xBP4HD+
 tMOI+6lArjbdQwn4amuYHTQBuPW2dl8Rpch/2Dpi/6I00csB2fX9HNmXEwRB6wqvUSDNVLULn34
 OcSuul4V+DRdBj83ONtq3LVNYBYQW24xn8Up1fCyoXfBznBLWrnc=
X-Google-Smtp-Source: AGHT+IGux/aFqDEGnq5OV77QQPudUldHXeLiQZjV+qx66sVfRVY7It2D6cbpleLKILzcXr4g0lru0w==
X-Received: by 2002:a17:907:9808:b0:afe:ceee:87fa with SMTP id
 a640c23a62f3a-afeceee8d52mr822070766b.52.1756463621455; 
 Fri, 29 Aug 2025 03:33:41 -0700 (PDT)
Received: from mindpad (31-207-9-44.static.ef-service.nl. [31.207.9.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefcbd86ccsm166392366b.58.2025.08.29.03.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:33:40 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 12:33:26 +0200
Message-ID: <20250829103340.158873-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756463622; x=1757068422; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6xS/MSYXMUs4P+DIv+w4XFzCs01ZFEKG6xV6/+UN2K4=;
 b=IutLI8QyvS6X3aaNnSvNiFOIi/rjhmlJdpGUyuo2JsJo7/7ki617YJ0QvS3FXpxn48
 aPThTqQKAUqB1rcDmOH2thkLa7fZ1QrKZwGXnKV5nYit8OvDvcXkhclYGD/KCQ9rOZe9
 OOd1OY4p5cmQVES5Ihql375OD3Ffy2LgYTpvctgxO/XzO9A8WT8PFgGa3LGn8l8AydqA
 N5ksMXDjfZtQF0r88FlGmC7WwkeRd7ZWdJ/jhOUSdwL5TcvGPvSVHzpgSiPMveV4eogH
 bwTDVM7qBauA54VcziYsGVNy6nkY7YtxJkziZEQEH5NpIJYzsl8Nmf04nxIKLcbRJ0Ew
 Cjlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IutLI8Qy
Subject: [Buildroot] [PATCH 01/15] docs/migrating.adoc: document static JS
 library
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Simon Dawson <spdawson@gmail.com>, Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds information on how to provides static JS libraries in
Buildroot with the release of the 2025.08.x version.

Because the way JavaScript project development is working the chances that your
project is using the same version of the buildroot package, and you provide
this library from `/var/www` to your users is actually really low ...

If you want to bundle JavaScript libraries in your project you should probably
either use a cdn, handle the package version and location of your choice in
your external or overlay, or just bundle it in your assets from a NPM workflow
to benefit from some minifications from your bundler.

Historically many of those JavaScript libraries were added in the 2010 eras
where it could make sense for them to be part of Buildroot.

Most of them are also way outdated/not maintained.

For more informations see https://elinux.org/Buildroot:DeveloperDaysELCE2025

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/manual/migrating.adoc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 4e6225a987..862fee28df 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -222,3 +222,14 @@ from +-cargo2+ to +-cargo4+.
 In 2025.08, starting with systemd version 257, systemd-networkd requires kernel
 5.4 or later. If you are still using a kernel older than 5.4, please update
 your kernel or use an alternative network manager.
+
+Starting 2025.08, JavaScript libraries that were just copied to `/var/www` on
+the target filesystem are not part of the Buildroot packages.
+If you want to provide such libraries either:
+
+- Use a CDN to target the library version of your choice.
+- Serve it by adding the package to your external and installing the content to
+  the destination of your choice
+- Serve it by adding the library to your overlay.
+- Install the libraries from your project with NPM and bundle with a JavaScript
+  bundler.
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
