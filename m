Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE0EFF885C
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8EF560DD2;
	Sat, 25 Apr 2026 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3mYX09fTfUO; Sat, 25 Apr 2026 08:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DB5760DD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777105404;
	bh=KZGc5EmzVcm+YXWnIgEIdycpPfeObPmkSVT34ArlIDk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M5meGsA1RQsj6zUWoVZ6SvZMds6NJz/YrSQ2Hzkwlky2p4mtUW8XKnv3C+DnldWhU
	 vPTKGHd20xu5ePNcW6cmVHEy2ai/lM8HAOhS+nQN1oXj4jFyUzHzTAPi5VYDbs6TZL
	 rIZjrLP8GlJzaHAmtPlpBdQ+fkIGcDJJjALqYODFFP8yEjMcqO3gBYmAewZRjr5qfC
	 qTlk8VLU4wOzOP9KIUvzYMcJURCYW773VgH0LvvRPQEXZJhTgM10Ty0E2eDpTUEcxc
	 UC/zA+kdL1QlJMi+Hj2sqk0XwXKQ8gvKNf+MT+hMaACh5++2MGaNgvtuWLnat9vrm1
	 yP/67dqRC1gBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DB5760DD0;
	Sat, 25 Apr 2026 08:23:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 09E432DF
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0617411D6
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7n-f2PeeRrqK for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=nicola.dilieto@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDFFD411D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDFFD411D5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDFFD411D5
 for <buildroot@buildroot.net>; Sat, 25 Apr 2026 08:23:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso118142805e9.3
 for <buildroot@buildroot.net>; Sat, 25 Apr 2026 01:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777105400; x=1777710200;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Tlhpv6yG6OvziH5W9fefkCfZFfxw1PWr0DdghDOeR0=;
 b=IXKWkhvnwBO3Axa18cfYE3k3xFsbo0Iy6tDZjrMCMOWZeKDWhZaKzybjIW9i6HlvkZ
 d/SyBi2oTZ4L7WipwDouIOv+MIpZNqJ5QnzQ65oq5qg1LXfHqqaqieIJkSTz/9cfcq5c
 48omOMjdABliBFJKRQDGbtOzA9S6NPjKQG2pY49Zjeojra8chLDx13Qx6II1yZyPMmXW
 ccA51mqeJzrlj0/8XgV/52XmlcbhnebjWfRB0m7YBN1fRQory8vUH/w4xtVkdX+5l6dT
 6Y5n4GScoSiOrBQJEBfB3T0nSBryj3xlJMB8ib6eAQEXDTuJ2/mCqUqoOKNeORcQZGJW
 3F+g==
X-Gm-Message-State: AOJu0YzHIq0jAtgYMLWtq92PN+Zh6RMis6mhMoCtwnEX63i0EKYFF+YL
 fj1XNdUIBKbCPfsmyXb8cpl8gtOtK9mVD5hlVyygv54Ome1fEH8R0na7e2sCiA==
X-Gm-Gg: AeBDiev8POJir+cQ1bGOrClcO7bk9VK8Dpi9rvebOR3drdvDM2JTl+cjyVJvv03j3aS
 k3JZ5vFO9fewr5fj2wy5mxA1A6ukh4AbJfejtha9c9F3LzceY7TqY0H+6Fct/APSudxwxZlNDpN
 6arEY2lCaiLDEmnaZv+3rXYljiheEmaY8AB2khh11flFiaBKIcHr2vZBLTAOd3+1bWNDuCqqkT9
 LPOb8jwjMnfby/DAsQTIRZHaeQ1I4h5me8BRNWTZeu/YhNWiG4QrGXdBE6qZFIDKVxL3yC2MV1I
 vqR8MOcGBxa0cOQU83H8bq57t3utZIKbMnGB5wJtNiu+tYmcQeT21DHunGdSKdCWyVhMEPL5btN
 vQiQn1AMvLU4zKMEjOhC8WF7Guc00IZZoPux30iBY725n/26yxT4y4s9zoIuW+Ryhdwl1G5oAUd
 nDyTaIOSyYJyqVIDL1EACVa+ciLZ8BKN9kvtt+ZXJx34OQTyXu/S0YpDOKXF8KERKcKDeMPUo=
X-Received: by 2002:a05:600c:621b:b0:487:5c0:671f with SMTP id
 5b1f17b1804b1-488fb742e74mr543154835e9.9.1777105399648; 
 Sat, 25 Apr 2026 01:23:19 -0700 (PDT)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a6124d7e7sm240309175e9.5.2026.04.25.01.23.18
 for <buildroot@buildroot.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 01:23:19 -0700 (PDT)
Date: Sat, 25 Apr 2026 10:23:16 +0200
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@buildroot.net
Message-ID: <aex59F1QfRttdIDh@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777105400; x=1777710200; darn=buildroot.net;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Tlhpv6yG6OvziH5W9fefkCfZFfxw1PWr0DdghDOeR0=;
 b=jwxmwzhURRqCXMddsueshuSE+OYpBqYm0sVmLEoQwwqOkC9bXHq54LwFK81RBdJ+xw
 J/4V4B7zKXzqQAx1jU8KdXyetYBBGHQuj3izlfk3hhoioKcUoJkzvp3VvMeZpJvGIW+c
 t2c+QNXLmxckzVRkC3tJC+0axXduFMz3x/GrhR14Eld+Dqg/zDG+htiJ6h7zHpya0gMz
 4znjo2o6QrjnC2z6Aj6YMxxxG3NhZc+XKDddD5qDILE/GmpXHbVO3j3B02CraNKyIcP6
 joaLXaCbGNfjU3J23+v5SQWl9lP+k9MTJvly1ImGT8DT3p+wADLAgYISHMY/Y6Qvba4O
 W4/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jwxmwzhU
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.8.1
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

Change log at
https://github.com/ndilieto/uacme/blob/upstream/1.8.1/ChangeLog

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index c384d1ed03..bb99bcccab 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  69170ef84891a0e3ccce50833ac90db75de26b2c8432050256c1bf4ec26c8ad7  uacme-1.8.0.tar.gz
+sha256  de7588577f8298dcb0d42dfaa9452a918fa692c4e165060207ac22f72fb0425d  uacme-1.8.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index f358025c44..dfd64c2523 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.8.0
+UACME_VERSION = 1.8.1
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
