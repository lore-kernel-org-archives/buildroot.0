Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31411C76195
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F5A560AEA;
	Sun, 19 Mar 2023 19:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F5A560AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTwI3s7vngID; Sun, 19 Mar 2023 19:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE80660808;
	Sun, 19 Mar 2023 19:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE80660808
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96CB61BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A2D340223
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2D340223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hl8HtXQJ3mnC for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:12:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B79D4013D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B79D4013D
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:12:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m2so8516633wrh.6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679253150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kV+GQp/KqOCYu3cfJ48zJx85OUAwCqWb5wIvyl/KsSI=;
 b=Ui628OVCqEDiUvE1Cb5suhdeD3O9/q96PZbF/3Bmndlckv1lErSElcT8P3mx9XwXxA
 TQR4PzdroVvkUnw0YGb6fC0lrxustuJwSilXbdeIKuPp1yEzY37PIN7vfDqCTxj2Dbtr
 cQw+d2HkieOwlh01vM23dauAxPtymvUcFcfGa8N1hz8SQUV8iWPjJR+/VoFwPVdamUsW
 VSYZPuiZPip/uU+T/2f3T3Q8U3pN6IOVFsq5dCki1XCXo4et9aIJO/u8pBUri5ein7E5
 n5gRWAB0hz5oTpp1GHWCWYQc7jQNSNl25TVoPkp0H5VxRgu74fXx3DHE3ZWCbgU/DKyN
 7ihQ==
X-Gm-Message-State: AO0yUKUksf97OtJux/FhaRXheGYYPwDKFttgjwSsJ07BO+Coe3hj190E
 scWieNpaeCkbKIGfbhpR3T4NwaVMiyo=
X-Google-Smtp-Source: AK7set9sNZOFhH6/cPd2KAsTaFbHCsyy2SO0WOci5pOTMv0CH3udhXsAgAix7uq+zaosKKsw1tejww==
X-Received: by 2002:a5d:6ace:0:b0:2c5:594b:10d5 with SMTP id
 u14-20020a5d6ace000000b002c5594b10d5mr12625996wrw.1.1679253150055; 
 Sun, 19 Mar 2023 12:12:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6dc6000000b002c53f6c7599sm7107050wrz.29.2023.03.19.12.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Mar 2023 12:12:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 20:12:12 +0100
Message-Id: <20230319191212.666401-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679253150;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kV+GQp/KqOCYu3cfJ48zJx85OUAwCqWb5wIvyl/KsSI=;
 b=R+Omh9i5YURFskZrJuGF3rSrXjiK1eURNsdj/uIEOWQbQm3z1c5KCCJej0jbbYMAcf
 8Acd6CqAp5fg3iQNPvxQSFsD+v+TUFXWY7orxtf2Vx7LoqY0qXB+Y1+esyIfQ9Ajh3OI
 BMm+aw3B9CW5BnQzhM+z+YGlF8KfVEJR6kzE6xp106wT4H8h3bPJ9+pNX7Ao9dwgtefb
 EFmH3jvmpXKWNhSMANmq2ivycwqRDobRKnQs0TRq0EMtEwj/d/cOUi7IAwYBfbsk58mm
 2FG28kleT7qH9wq+wTzdl+wAgMmFNQbqfHQYwJoMVmLxjAMh+s92bKId/tQMfRjkagtB
 BsqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R+Omh9i5
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: security bump to
 version 0.9.76
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Will Newton <will.newton@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-27371: GNU libmicrohttpd before 0.9.76 allows remote DoS
(Denial of Service) due to improper parsing of a multipart/form-data
boundary in the postprocessor.c MHD_create_post_processor() method. This
allows an attacker to remotely send a malicious HTTP POST packet that
includes one or more '\0' bytes in a multipart/form-data boundary field,
which - assuming a specific heap layout - will result in an
out-of-bounds read and a crash in the find_boundary() function.

https://lists.gnu.org/archive/html/libmicrohttpd/2023-02/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 7f95e78a6e..ce30e2ba11 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb  libmicrohttpd-0.9.75.tar.gz
+sha256  f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c  libmicrohttpd-0.9.76.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index f75178bc0a..4e7b72b65c 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.75
+LIBMICROHTTPD_VERSION = 0.9.76
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
