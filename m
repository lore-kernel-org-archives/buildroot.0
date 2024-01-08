Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68602C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CDF383B10;
	Mon,  8 Jan 2024 20:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CDF383B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ct3mOELT44ux; Mon,  8 Jan 2024 20:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9B083AB8;
	Mon,  8 Jan 2024 20:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9B083AB8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0DB1BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54EAF6104C
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54EAF6104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QI_JAJm1lTxL for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:46:50 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97BA66103C
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97BA66103C
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e49447463so8796355e9.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 12:46:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704746808; x=1705351608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N9V2X+3zJEKlRub3CuMciKl5202uiFZ5V2hO+hv26bg=;
 b=QEzLmFr8d8FQmx4yCpnvgUZbuJkHrWCOxhyogknFm6xJP+QSNSyWLJC0rj9GX38I4K
 vNiF/FueAIPDvQWomi20oqLa9/bvUnUoew0Zi+4i1f0+91EaOcJzZUJEDOd/IBudL9Fz
 C99LV3Ss/ZPkBrPoEg9C/VQUFljeuOEKXguemdL/JFMRRySg6gIlcYvChnSDkI56QRFe
 ekBEEHXtY3li8TINCx5/EyJxSoCsebJlotA97RcRJ15GW/k8LHTT5+9CnPD4olgAYX/1
 dmwnprTAe7/U9TkO6dBtLaPBwc3S1Z6LbsKO5h2AW+hFvjid+YB5Gs2I955dbGeYEFCT
 TIlA==
X-Gm-Message-State: AOJu0YyGjfKCalSdf27G/liH/E9E0niRjiTZ8OZUj4UslePo6lnf6jCa
 tr+vUqzQSNOrLVyyEbn0rpbWSRZqX14=
X-Google-Smtp-Source: AGHT+IEiV90YhNgoBXuvbb9qqyVIRDYcwc5VxHYkXXlNy/JKbzLnnfGDK6wRtofETl58tr4yxygRhA==
X-Received: by 2002:a05:600c:1da3:b0:40e:44e7:c91f with SMTP id
 p35-20020a05600c1da300b0040e44e7c91fmr1354977wms.19.1704746807680; 
 Mon, 08 Jan 2024 12:46:47 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b0040d91930f93sm968266wmq.11.2024.01.08.12.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:46:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 21:46:45 +0100
Message-ID: <20240108204645.321631-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704746808; x=1705351608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N9V2X+3zJEKlRub3CuMciKl5202uiFZ5V2hO+hv26bg=;
 b=IGfpidHlpE553KZ9kjsSWMn2kB3RqSN8kkVpKZRNtCrFNq+IEgCa7DkHgs/w2d7Uu3
 ihJWLRIGLlFHnDjMf+y1P+6d/WonTEm1DZ3zAvy11oYlnrkN71LjX+9hdkVOBegXt7mR
 +N9PjzodbBuZSRx5uK/WH7CVn2VpcKRkViKBuoJelDQAtBQ8f1vyMv5mHHPIMOvL5z0e
 T1pOYO55YuLEl/3PdK8/vvgxznZrjtYPz1suuVIS/eLH5wGe1efmeHe/qZOloY13zyG4
 LYwzIe35THw0ZZZ1fN3KWY4xIFG/QiqbYtqlhCUwWXGfRoBiW+IFewAFrL433t8rmiYI
 8Eug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IGfpidHl
Subject: [Buildroot] [PATCH 1/1] package/libtracefs: fix license hashes
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b1dbd3f679e6660325472e3fdca72127d74e6929 forgot to prepend hashes
of licences files with LICENSES/

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtracefs/libtracefs.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index 676fcf1111..040467af08 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  411fcbf3434ecbaefa6c2b1bf092266293a672e2d7ee46fdd6b402753cb8bd16  libtracefs-1.7.0.tar.gz
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
-sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
