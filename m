Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0CDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 11:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 281D76070E;
	Sat, 20 Nov 2021 11:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqM8JYulls3t; Sat, 20 Nov 2021 11:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826CA60706;
	Sat, 20 Nov 2021 11:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 719F21BF28D
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605EF41BE7
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 11:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRXRcFhMUR86 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 11:39:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57580410B6
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 11:39:45 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d24so22943654wra.0
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 03:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxoDOa+/UcJGkJPP8eVZK1y/tZwV2RQhbPfV4tIFwWY=;
 b=HoP02U9soVlsIUvnekobhauegRhhDxIB0Gqa0Ar1pO9fuXUVi1h1r4t90TDe5yIB4K
 k19b73K1gPklZadx0w0UQez8OOon3moNkeLWlDbziqMz9aa5HV+GLveU31ePwE85CvuG
 Hlcb/EAcXLvOXexv4uXYcfX5uNKtbmzeDALXJclRI+a90TxM9VlKobyevuPiR/VHZhoL
 HJ1MfaDbkhw+L00GUS/6O9f7/TYTgFlFsNectM59jF3zH4LNsEE8VlFJv+T2UwA24C8i
 18d+iKTxEmK3z/D24JjcJHZ95riqnAPdsR+fZcTDhnkgr38Wx06oqp72gDVi7myYWLfn
 mhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxoDOa+/UcJGkJPP8eVZK1y/tZwV2RQhbPfV4tIFwWY=;
 b=ciKTl4mfsPD8jN5VBd7a6a5QVSxGJT6woD0PRTdokBzTvXzPW7Z1IJOoegyr9l+NWf
 F1l+Q1hJqiuTQrOB1V6KsnKnilwQLnpqzXFcpCPLj9HAUMUheimtBlR7ZopT0fGRM4QN
 xX7KjMCCIr9SfMWhGaISs3tKDhmK39+QtHjPXHNqoYWOPmf7KFGq/V1NL8g1z7+H9aEY
 o8Hd6dPcMoMZSCXuu3yv7kflICPwf/VTqHYMfQGpYPHoOakFNDYJd0qmgZZ4mGyOKMsG
 OW/24iUcYuHhrSy4UoJIexE28g/jsu1Bdij2t04iHc4F/UAM7vWeVoxXyKF+nR+Nr1tl
 VTvA==
X-Gm-Message-State: AOAM533646+NEZ5v1s4HMBdobVNtVVK91oT8b78VQBokWhVpsCfZXK0N
 Hf3eVqAegWzbBBoJdjEU66Ce0yKseek=
X-Google-Smtp-Source: ABdhPJzvxwpDtvmR19YxwQXlzm0ZOUFys0MG7Gom6Kb3VME3IhHncry2141QfXVWoXJ49KdH9ZnfOA==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr17165770wrd.114.1637408383307; 
 Sat, 20 Nov 2021 03:39:43 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u14sm2524589wrt.49.2021.11.20.03.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 03:39:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 12:37:28 +0100
Message-Id: <20211120113728.2887574-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/micropython: replace BSD-{1,
 3}-clause
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace BSD-{1,3}-clause by BSD-{1,3}-Clause

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index c49ca23449..55c00ba08a 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,7 +9,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION)
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
 # and most of the copied code is not used in the unix build.
-MICROPYTHON_LICENSE = MIT, BSD-1-clause, BSD-3-clause, Zlib
+MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
