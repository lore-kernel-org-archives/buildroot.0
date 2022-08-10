Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22194C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 20:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB82E60D58;
	Wed, 10 Aug 2022 20:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB82E60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Kr6IUZtluAI; Wed, 10 Aug 2022 20:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26B2360B9E;
	Wed, 10 Aug 2022 20:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26B2360B9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C3151BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FC3A60B9E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 20:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC3A60B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyHDOFjbqlEj for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 20:02:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E58A60590
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E58A60590
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 20:02:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h13so18964692wrf.6
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 13:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=1RVmus2+heP+PBGnqkfo+TEGphvrb74eYYUEQp3Dodg=;
 b=IARRV0WpIK0d9927/qWb3o8/C6wyJBBjF8/ckTA6d+rQCjnpQRG1biln+oJ1bbTfrb
 Jex/ZJ8OuYmrrzWn2e253yhDdrOxyZPx7Hn/vK4LMFJvS9mJIKTANOIkbmLNvMniqUh7
 6w7zIDVd5hhj7UJmKGA3VqEw42XGgCXH3ACpBX7zM2TmGN40R1ApqOtG/69iKqxkjMuZ
 7ZvZfjHzLUu7TT+BmnBaEYGcSLClpTL6yk2kI5u75SEkIn/AiJB1V6ooI29IvFZbMMes
 M0+dpRrxPcpZMGuXNdD2xwc6U6/IpuKQLhPeEmhDLQg5U2+TmkWHxc0eZsxEiRbIL//R
 i+EQ==
X-Gm-Message-State: ACgBeo3C/PXRa8eoY/KTdOxWS4YgnbVCwk2rbyI7SgAZNKfiYx2GzDYM
 GYC3ogMqm97bD+R2ntjblG2qKG/XE3c=
X-Google-Smtp-Source: AA6agR5JjIONlpoUSqk4fleZDENJKA9lI8g4sUXuxPyTU+w3tX5Hc2Of/HYqteDlIt0f1yjZF4zbYg==
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr18588947wrr.617.1660161773312; 
 Wed, 10 Aug 2022 13:02:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0022aac6160205870c.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:22aa:c616:205:870c])
 by smtp.gmail.com with ESMTPSA id
 ba21-20020a0560001c1500b0021e5bec14basm16962952wrb.5.2022.08.10.13.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 13:02:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 22:02:41 +0200
Message-Id: <20220810200241.34141-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=1RVmus2+heP+PBGnqkfo+TEGphvrb74eYYUEQp3Dodg=;
 b=DmGBvbW5TfsVLjvZ6jHHdHCBUSo8KZFcapQ4NtkX9wZtrqUds+gawcHhKlsImX7wJ0
 SsBaLBjxv+ZmBj2DrvLHWSFU/54EyVhbGtBHbPVyizgMfS1Sg6RJ2OdyqUk6Ytm/80XA
 1o5Umgjee3TqB/tIh0frJmjFSTbGWDDD8VjGl4//ZrRv23w/Q7VFIPIpWLARcdpdzfSq
 /vKiSNuKiJ2F3j480G2b/Km5FegckqSLqZvOg4/wmQKclpzbgA50eliized/Nz6vK9a4
 OSpFHa9+Wuvd4PptshAkeFuMrDM6O8VSYRiiy9QdZ96tG0CpJ73SofhW4AQI3FuA8e0z
 y/qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DmGBvbW5
Subject: [Buildroot] [PATCH 1/1] package/ljsyscall: fix build with aarch64_be
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

luajit supports aarch64_be since commit
28e5c2f2bdd147dbb9aefbc040fc618f46ee0663

However this raise a build failure with ljsyscall because aarch64_be
directory does not exist so use arm64 instead

/usr/bin/install: cannot stat '/home/buildroot/autobuild/instance-1/output-1/build/ljsyscall-0.12/syscall/linux/aarch64_be/*.lua': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/78397c83e84dbfc09990f92be93e0b8a10d014c5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ljsyscall/ljsyscall.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index 12dfbcb4ae..b847739a08 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -18,7 +18,7 @@ else ifeq ($(BR2_powerpc),y)
 LJSYSCALL_ARCH = ppc
 else ifeq ($(BR2_arm)$(BR2_armeb),y)
 LJSYSCALL_ARCH = arm
-else ifeq ($(BR2_aarch64),y)
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 LJSYSCALL_ARCH = arm64
 else ifeq ($(BR2_mips)$(BR2_mipsel),y)
 LJSYSCALL_ARCH = mips
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
