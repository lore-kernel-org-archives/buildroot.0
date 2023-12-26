Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208F8C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD33160E50;
	Tue, 26 Dec 2023 16:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD33160E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQ3fSfhSdKFl; Tue, 26 Dec 2023 16:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2650360D5F;
	Tue, 26 Dec 2023 16:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2650360D5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7227F1BF300
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 585BD60D5F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585BD60D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cg9YMESOHmTG for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:55:24 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 617BF60B1E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617BF60B1E
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d5903677fso10311755e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703609722; x=1704214522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NVivwsQHEYQLiQoqaxDbv4SEzdtdBfmA6p42iLxrapM=;
 b=FqQuiEtWA2XycMZh1tCIjc0FC5HEA6gZinXl7zDT1YuJudAGYoliMfBsqd31F0WFEl
 HUTSDTPbWCxeySwuy44rELyqpP87xDIk2wFyTrm7JlWm9lbFwhElJdQvP8wBNrCQFMf5
 m++/5y1nM3Yw6mKUOXse/0MfrftziRs8cszVhPP5tOywsxymI74WXNuN39T7bpoyqnoi
 9e2fb3erSpxICFJLCa3us5eeum+5/Sf+8Q01IMWKTpQ/5JpA5Sc0L75IOeY79ZM2OQhm
 yVuBFMvWPNoPl2IqdrsghXvElyrUcS+zjrQO1IVAJigW/Y018lABQ+AH/KyjzhqS5Uhf
 Ta4A==
X-Gm-Message-State: AOJu0YxA6z/LcHStjO15TDMN7Wa5eQ3tVCFjS0vYCyIAi1pocZnij1dc
 nHDN9WH72O55Yf2ocnkokKdiqIHFA+g=
X-Google-Smtp-Source: AGHT+IGAfnj9n38WBjDFG7o0O6Q//Pm0r+CmbagVCBYTDjrYnK0vWIZ35wYSi5H9JemJWAHHihqndA==
X-Received: by 2002:a05:600c:4f14:b0:40d:4d68:28c8 with SMTP id
 l20-20020a05600c4f1400b0040d4d6828c8mr3098106wmq.140.1703609721927; 
 Tue, 26 Dec 2023 08:55:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c468f00b0040d4e1393dcsm13742373wmo.20.2023.12.26.08.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:55:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:55:19 +0100
Message-ID: <20231226165520.806663-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703609722; x=1704214522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NVivwsQHEYQLiQoqaxDbv4SEzdtdBfmA6p42iLxrapM=;
 b=jbr4cAhPd9x4MNHY+RZnU0ORHuX/7CEAbrkFTWEovgI7RZzMKot2lxNaRrNVzzfoLv
 patbBQv93eMlRXgruR7jOixFvKz9OzKYqmHHhpsF8VojBr85gkNPfHNPNCs/5iSB9yno
 Tmd88f8dJJ0/Tyd04h4qq0wQDZuVT98DmKwGk8AnzARkevYixzOdrsiv7df9IKvgLDmy
 OHbqTM/t9OOk9GOd8IBmWiwVrcSswQEo7jyJ2woY7v8dlsWHOBzCMmBopEvpb9WgALF6
 MOHXk3WQ/nSaxouzxlTkIBT3S6n45+8XinN4q5nQsy+Lr8UqoxPXiFc7j1amFO3HZdUA
 vuig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jbr4cAhP
Subject: [Buildroot] [PATCH 1/2] package/libcap-ng: disable python3
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

python3 is an optional dependency (enabled by default) since bump to
version 0.7.7 in commit 4314c86b0b932c3d381ae59b641366697906868f and
https://github.com/stevegrubb/libcap-ng/commit/02fc25f9d3a00c7d7ccd619d8d678511a73b940b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap-ng/libcap-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 46f72c702e..c33460d951 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -12,10 +12,10 @@ LIBCAP_NG_CPE_ID_VENDOR = libcap-ng_project
 LIBCAP_NG_INSTALL_STAGING = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-LIBCAP_NG_CONF_OPTS = --without-python
+LIBCAP_NG_CONF_OPTS = --without-python --without-python3
 
 HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
-HOST_LIBCAP_NG_CONF_OPTS = --without-python
+HOST_LIBCAP_NG_CONF_OPTS = --without-python --without-python3
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
