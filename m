Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FFBC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 10:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B92608A6;
	Sat,  6 Jan 2024 10:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B92608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPRn88aEyux0; Sat,  6 Jan 2024 10:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE79160AD0;
	Sat,  6 Jan 2024 10:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE79160AD0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 403311BF3A6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1812E41E06
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 10:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1812E41E06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id biD9O_or3Urg for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 10:12:08 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8366441D81
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 10:12:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8366441D81
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-336c5b5c163so159748f8f.1
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 02:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704535926; x=1705140726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g4t+u5u6cAC4sr8BYTmgtlK0LYx/TjwkwtWARVfi0cY=;
 b=aNENIco9GwXVzXz4BcqNZ1zRPWaEHkKUgnvOAXL0MICWjMZdcrLMlEg5T8inslZY8H
 lGuMKyGyqmp/H7EUJk4/Z2QEZHPso0KWeZjzmj4/emUkMe+lRLlCrT0j12XMRkkk387V
 LhmA8n0vFVutQsLQIJsk34Afxj2a8KJvD68GHBNYMNIyD4bnq3ZadAmiaywIKuS+is6n
 LhbGdLAq+gclLtsWp76LWnA/L99tDGIiWv+5oxj9TQeayriQFioERX9nyt2k/nCu2TMY
 u6W3INYXZTOQlHmE7iLFgCSGlxtkOofmtIOCKBviyPg5StqOjyfWQw5HSWY8cwi4hKVR
 PIUA==
X-Gm-Message-State: AOJu0Yy3aR+Evzg+FFMbp6hNmj90lZDpoAVP/K8ULKnh7kU9b1SK/psQ
 ALr19PmQ0htZmmg6slYWY1S+SzUsE9o=
X-Google-Smtp-Source: AGHT+IErRahTM7QzDCBM0W7x2UX05Twnoi7g0mT54HodJj1TkxxUdlk728Ls2Z3tnVqn4VnciRss7Q==
X-Received: by 2002:adf:f7d1:0:b0:336:364c:9de4 with SMTP id
 a17-20020adff7d1000000b00336364c9de4mr2004117wrq.1.1704535926076; 
 Sat, 06 Jan 2024 02:12:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b003367ff4aadasm3058011wru.31.2024.01.06.02.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 02:12:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 11:12:02 +0100
Message-ID: <20240106101202.495801-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704535926; x=1705140726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g4t+u5u6cAC4sr8BYTmgtlK0LYx/TjwkwtWARVfi0cY=;
 b=E6g79aiIL6qZcAbJsGqLVRsRuIO0Q2qcBN+OKFhBPUdli290xWi1tL+e3yFmhnGr5X
 32fvueyuaAcsECg7rxsZb1ejK0E+cty232J9zjv4uej7P39ksIJSOcj7RS3CLvpW6Sjb
 n0hrMGu0cUpOBN8+M7kKkVcnoUy/CiiyuUDhyMkIFNHhhRKuZb6qBT39I7tpKbvqMij2
 AVWDuEFehZWHqTLwVOs7Fh3r67hEaaRhWACS3vdjOCn6uhoC59aoToSi57KbeEvghcTr
 0OHwf1oodPfE46lYj94XaPvqepNce5xgrCt0pnaal4ak9WGazGmk4jAk/TBccNs92J9J
 icvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=E6g79aiI
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ncmpc is able to automatically detect NLS support since version 0.47 and
https://github.com/MusicPlayerDaemon/ncmpc/commit/c264db04dd30af301e7d85c9d145bb1f1ae3fea3
so let it handle automatically to avoid the following build failure with
a bootlin toolchain which embeds a gettext definition in libintl.h which
will clash with the fake gettext definition provided by ncmpc since
https://github.com/MusicPlayerDaemon/ncmpc/commit/95af27ab2d3ceb9df26ebb4e0d936e392a84c153:

In file included from ../src/save_playlist.cxx:8:
/home/buildroot/autobuild/instance-2/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected unqualified-id before 'const'
   39 | extern char *gettext (const char *__msgid)
      |              ^~~~~~~
/home/buildroot/autobuild/instance-2/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected ')' before 'const'
../src/i18n.h:22:20: note: to match this '('
   22 | #define gettext(x) (x)
      |                    ^

Indeed, even if NLS is disabled by the user, libintl.h will be included
by
/home/fabrice/buildroot/output/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/or1k-buildroot-linux-gnu/bits/messages_members.h
though include <chrono>

Fixes:
 - http://autobuild.buildroot.org/results/c860e64909dd3b7fa033db0970e1cfc1376c4ec5
 - http://autobuild.buildroot.org/results/36eab556fac80124755bff4110af3e43fe6edd78

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index bc8a62daea..0965981f23 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -20,8 +20,7 @@ NCMPC_CPE_ID_VENDOR = ncmpc_project
 
 NCMPC_CONF_OPTS = \
 	-Dcurses=ncurses \
-	-Ddocumentation=disabled \
-	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
+	-Ddocumentation=disabled
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
