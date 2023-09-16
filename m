Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A811C2BA12
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 21:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAE72404AF;
	Sat, 16 Sep 2023 21:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE72404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKN_ESpPHxOA; Sat, 16 Sep 2023 21:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FFAF408E8;
	Sat, 16 Sep 2023 21:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FFAF408E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43EC41BF30D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 21:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 164F060B6A
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 21:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 164F060B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DyyKq9a3A7f8 for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 21:53:08 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09A6660B2E
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 21:53:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09A6660B2E
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40479f8325fso22902595e9.1
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694901186; x=1695505986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ACt69KcwjlKorZsyPsmNvpznYsA2KLWszNmzt5xZCQ=;
 b=htvKBdFQxCQEoPZ+Y4SnKgmzauZtbzsNaO5k5sb7hDJwVTnJQ3BRVBC5vIwq6kbb2b
 gKgOjjQIgaYNN+cGf2oIMo394+dNp+IcScEcl7P4cJHmnSkAaYmtoK0VMMEOxuR6sx9D
 pNKMt+mtBtWkYiX/vD/Ke8pBmaRnt35QDXXr95d5nr2qPOtsbLTGv5y3gxvXWCmAKg3Z
 cTobkhuOTF01HmjrlO9YyQ3q8hMbGBDIhESu2CgcmjYKxVwX6eUgyLAZbneTTSqgMlA/
 VATKU0GA8oCn/dyoBmK/w58Bob3TTV3ux7Y7Iz++mg+OlrNAtqODYHodXxtEVvMHxN8w
 1ogQ==
X-Gm-Message-State: AOJu0YwG+8fgTcVr86NbINZ3D8yM/quHlUhAOV3DneoMhjWj27fgXlDf
 Bck2lK+ea16yrPenQSVum2YAB8MYqmw=
X-Google-Smtp-Source: AGHT+IFL29H8HhG2OMTanan/yu/wIAthhCYFpYbd/2z2fTtXARaMdS98goHSsvCvfLeoThMuEbUnwA==
X-Received: by 2002:a05:600c:229a:b0:3fe:25b3:951d with SMTP id
 26-20020a05600c229a00b003fe25b3951dmr4484199wmf.5.1694901185468; 
 Sat, 16 Sep 2023 14:53:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x7-20020a05600c2d0700b00404719b05b5sm7777609wmf.27.2023.09.16.14.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 14:53:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 23:53:01 +0200
Message-Id: <20230916215301.1498648-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694901186; x=1695505986; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3ACt69KcwjlKorZsyPsmNvpznYsA2KLWszNmzt5xZCQ=;
 b=d9mhSmfQlsYAjdPyGJaCaspy7pQRRxzXDWXyRrRChsAgZnhOZJOe2S9resc7bDJt99
 MJgrrH1lfZ1ElPwoDHh8wYYXmT9BGj7eCZWI62Za7xFMWICuHw6CLffarRqUDh7+RiZq
 Sg3yQtL96jaikFI8JI+xgxJruB+Is1UdyoLl1AP1MpIRhIGCc2uWn/rDSINAYGF3wBmx
 FRHNz/k2tkklYAs/2BtqDb3VItlrMdy4/gJwRgbECX9lYY8SNfIkcF7kTMcJERnkQdhx
 /wMoTLdY6UcpWLStFSJ6xhxrG/1abpzbcnJeIcnf9kX4JfQiXgXXgkoWC1PVoLyErukm
 2STg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d9mhSmfQ
Subject: [Buildroot] [PATCH 1/1] package/mutt: security bump to version
 2.2.12
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

Mutt 2.2.12 was released on September 9, 2023. This is a bug-fix
release, fixing two crash bugs. One is possible by viewing a crafted
message header, so upgrading is strongly recommended.

Fix CVE-2023-4874: Null pointer dereference when viewing a specially
crafted email in Mutt >1.5.2 <2.2.12

Fix CVE-2023-4875: Null pointer dereference when composing from a
specially crafted draft message in Mutt >1.5.2 <2.2.12

http://www.mutt.org/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 78bce76585..8c4aae3c1c 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  12325cf66d5ff8ac4bd87fac8db52c869de52dd278fc301cfd57d5a1f9f465cc  mutt-2.2.11.tar.gz
+sha256  043af312f64b8e56f7fd0bf77f84a205d4c498030bd9586457665c47bb18ce38  mutt-2.2.12.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index c5e4e4a14e..09f547a091 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.11
+MUTT_VERSION = 2.2.12
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
