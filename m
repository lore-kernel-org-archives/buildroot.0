Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D07AC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 22:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0329760E59;
	Tue,  9 Aug 2022 22:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0329760E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96-_pzvaCWgj; Tue,  9 Aug 2022 22:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBFF660E36;
	Tue,  9 Aug 2022 22:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBFF660E36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3EF61BF5A5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBF1460E36
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 22:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBF1460E36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LdHuqPbAtEWG for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 22:04:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C40660C1A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C40660C1A
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 22:04:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n185so6923911wmn.4
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 15:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=AjqlrgwE64bl9jzZE3PbLUTNd0Zj5qtVU5Djc48rT4Y=;
 b=z8IhyazP235o2yOnYXd/Ai78xI7oWSHws+USFB06lOxfHOumQdUdOZGnifKzcK+SpX
 ZuE9AUUGtZE+OoYIyIkUMHXngc0jjoRIYPNZ2KVD9rrJhZvXTg4YGT+56pWc8oNLYCrR
 7Rqe2cczg5BP1YKElMa+z7RBXgKSP+pdnR+wDLLbJJjj4zC2b4Brw72Wf+N4DXHhkLGv
 iVmFT5YvmpwB8QplWniB32bh77tvJcd2FblaI9uKZPA+yygnkPqKAQFnKgrGiQ6dQxSk
 b2gKmpMBWua1Rb1Bocivf34Q2KxBNo8GeilVyF1C7wShxP5r8pt7A2UyYZWzeaBvL5Kg
 4MUA==
X-Gm-Message-State: ACgBeo0fmpnQieoUtxtlvKuIbW5VUDBqPfC9M3BSnMv6DvjMesOYPCow
 KzA61HryRNBM8ShVBuH12tVtQ0Re0io=
X-Google-Smtp-Source: AA6agR69162H4742Ciljc648E2dxFGC3JVad8vwBqWOHs/uq7ZRKS2CX4zErLgTrCXN5EyU6wgq5og==
X-Received: by 2002:a05:600c:1e8d:b0:3a5:74d:c61c with SMTP id
 be13-20020a05600c1e8d00b003a5074dc61cmr283567wmb.70.1660082695369; 
 Tue, 09 Aug 2022 15:04:55 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d4dc7000000b0022377df817fsm460225wru.58.2022.08.09.15.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 15:04:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 00:04:52 +0200
Message-Id: <20220809220452.2741272-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=AjqlrgwE64bl9jzZE3PbLUTNd0Zj5qtVU5Djc48rT4Y=;
 b=n+td511nr3SUQ3h3Km7uhsrhGI+KjvyzFrFXVenpOUIqWAjumGp939yuYL5LS8fbTO
 zE7kvWSnRl98Dlmyj3Ws6aWTzx8CVBoOwcPbXcQI7iByvhGfsrnFL1HktHy2y/2ngT4C
 R3BfX7Hdf3dShqjBMEd2p3XMeMRvMqKuAcu0wwbGgumRjGiIQL/KVkVaIMRuVvQaaAvq
 OdVhoz6xdD4gJUQ8XA3c/NtN2cnMEgTGJ0PRx8TIiEG8R3Y5GCfJOFcio9FSggavy3tK
 QJd9MvmqAXesUy0jkeFKW1TaiQQwSpdl97y90VLKtJhCuU6WlttZVNyNIr9a+7vmA0HF
 Wabw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=n+td511n
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: fix memcached
 dependency
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:

Makefile:575: *** mysql is in the dependency chain of freeradius-server that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/c3a9c3822b4599c1b16d27840b5663506e37a41f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 65a72ab532..2f4c118da5 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -109,7 +109,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MEMCACHED),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_cache_memcached
-FREERADIUS_SERVER_DEPENDENCIES += mysql
+FREERADIUS_SERVER_DEPENDENCIES += memcached
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_cache_memcached
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
