Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2249C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E0E0824EE;
	Wed, 10 Aug 2022 10:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E0E0824EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zeG7nC-BwHAt; Wed, 10 Aug 2022 10:45:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70CEC82451;
	Wed, 10 Aug 2022 10:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70CEC82451
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD8371BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B909940914
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B909940914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DK6BaX9adjld for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 10:45:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 548254056E
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 548254056E
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 10:45:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l22so17284112wrz.7
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 03:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=RL0Dy3qn3peyoalbu+JHnj0NMf8FnCBrp8m9dyPtK9o=;
 b=Ev3ehdN4ateWXldar88mhtJn/8t9ErKNJVOCm7QS//U2hzbI0GCcOuHFg6n+sYixKV
 5XIvO51FlNoygT5diI8pu14msv7LRiwfK2Vp8tgKWTXjumLc7cTcVm9TzQ9DqDJ7d2bX
 IAcEfum3yZr1sbAZgKEGP1kbaUWapoCX3IBtc3H/+uCuhBo9VszJy8SicJHsRlSQCz6B
 8+SiwfCfTzZDuUtYm9M+6gc2BfHrq8EYtQYMGE4+dD3VSLifUFXXQVBgCn57Tq1vcTT5
 gTEYBB2TTZOAgJMQahLM+HRWqc0x/Drt4LgHT2bLD+/vM8Q2Q4UU2Z4fZskD4yVtyG9k
 T+LA==
X-Gm-Message-State: ACgBeo3qGWxllaR71WgzUvjlG+x1TGdLOKLMZyyhKtwzmIkqcnhVIltZ
 +2al8v1B6qp1wwyjwL4exfnwY1Rlk0k=
X-Google-Smtp-Source: AA6agR78uDIgct745bFikrcjecGlkvUWNmNT7XOWiojV94uDKNQ4f7LWd4I5fdcg0RS0DPDitwEbcQ==
X-Received: by 2002:a5d:5a9d:0:b0:21b:8247:7ec4 with SMTP id
 bp29-20020a5d5a9d000000b0021b82477ec4mr16002851wrb.561.1660128300251; 
 Wed, 10 Aug 2022 03:45:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c16-20020adffb50000000b002205c907474sm15874591wrs.107.2022.08.10.03.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:44:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 12:44:50 +0200
Message-Id: <20220810104450.3424068-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=RL0Dy3qn3peyoalbu+JHnj0NMf8FnCBrp8m9dyPtK9o=;
 b=QlSPPI6TQWwd84Nrjz/pByczyIvbdr+6MgbQbT8YWIYoUfYnSj8nJmcTXhHdsOQAF8
 qorduTpkVcjuiUKfKeea1v15ohV7k6W73hxncyYWqdRCh7Jb96mSuk3A5EMb9XcfGmOv
 3h7x5LaGCX/kDmtb8CXcXVbP95IPf/uIFRzVIyh4ykUutmcerfcWFH3gJohF4mOK8U9Z
 e6NOL0s2OszAEmBI8wkq9hrdkP6YdgvB5f+XmLyXPYHy5q1KXe/CQn/xD4d67FuYd+4a
 xH/6bauiAGe35S05d7QyPYyOvt27Rvb84O6xPXNyag/kqnc800piJQtkMNMSrrhYWM2Z
 /b5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QlSPPI6T
Subject: [Buildroot] [PATCH 1/1] package/qt5/q5doc: fix dependency
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fa917d0ca96baf4ef877a80e57d438bfbb8cdf2d forgot to add
BR2_PACKAGE_QT5_JSCORE_AVAILABLE dependency:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_QT5DECLARATIVE
  Depends on [n]: BR2_PACKAGE_QT5 [=y] && BR2_PACKAGE_QT5_JSCORE_AVAILABLE [=n]
  Selected by [y]:
  - BR2_PACKAGE_QT5DOC [=y] && BR2_PACKAGE_QT5 [=y]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5doc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5doc/Config.in b/package/qt5/qt5doc/Config.in
index 1ab5f8d333..e9685a4d50 100644
--- a/package/qt5/qt5doc/Config.in
+++ b/package/qt5/qt5doc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT5DOC
 	bool "qt5doc (includes quick demos)"
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	select BR2_PACKAGE_QT5BASE_EXAMPLES
 	select BR2_PACKAGE_QT5DECLARATIVE
 	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
