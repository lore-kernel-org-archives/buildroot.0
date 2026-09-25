Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59018C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F75160BA2;
	Fri, 25 Sep 2026 06:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVgU7yZVyH7K; Fri, 25 Sep 2026 06:02:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79A1360639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790316163;
	b=X7S7id07aw2ztG1zYUR5o0+AZAzofWhzQZdQHmZxwPKxGfzCvX6fb33kNSQsu5nTxp4W
	 /QXxOadpBTdXIXDCJVaoeHR8K+NqxljFEPk2XvvjXbAyAqLEnZppzDh2PhRBkkWoRZVdR
	 Tjm14qRu3+U2bRWMmg3ssCckgmqXFKLe9Lj2y59QvkLrL/E2OSq+S2mTzQdy8wMgEomiq
	 FdCoYzHadlrdGfXsq0vWkV8KgZS9QsS2YIKQjHP000h/4afXsbH89oinsC7vVbaqbqj2k
	 c5jGkcVq+tQRbXp0Y/ko2oL6vN9mvPVs2tR6JTf7pBJ2x9WODCA47NqVaqu/8IOlKTg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790316163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JV7FvitVIJQ0UmoYy+oKFYXhoi1qLnPj2XFTyyMxmo4=;
	b=HvobZnkTlCYykapdlSknGvvZ4yMxulmdnvgTiTjqRdovylUZkqNHUvREPegf8CYqISzL
	 WIxEizowwDowGyvq218x5cC5fJwQOFPVCLJi+gfi6Fi29ngX9uwg75lZutjYtZjzvjgGF
	 ap0Sc+hc5XxLBk8dHutai/nRnLAc57iqLm6g0+cxlaXET9DID4AF8KZKkw9i4Tj9k6gpw
	 7hkupdSM9RvIxNoDdPqhcuQhQZb2LWfih5bY9UHRDj8uxMf/kE57PS5ZiIQqmPM4C8j1Q
	 sNzX0Z8Gg7RxGzvI/R/+XIjaNBGB/ip835K3Q6xHUSezjCPnnpYrYWYAXyPPf5iHu/w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790316163;
	bh=JV7FvitVIJQ0UmoYy+oKFYXhoi1qLnPj2XFTyyMxmo4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=FwfOzREbCac9zcLcCdJ4ddO105M56JSrpy1VFexFP5fQnf0YfbAiU37VRRhiSO2pB
	 Ai+u+PTQKFeZ+bcE+n84m0FBH2tIKWSSuEJPWJ7Vs7WXw+I/CP4DFtg3kzFX1m2sSj
	 o1xnfUJpxOFZTO90oiOV+PMi4QBE2iunyfN1JN1AELoAAb46NuCw7RluSGLD9edMPf
	 +aTFqclGK8orUdDslRk8bxeY9nmid1YgmKmD2WxKOHlfG32XfRv0IKpTZtLhB6Jx3H
	 iE1IshUSEe6rn1ZVx3FggI1Ehn9kmYCAmdEqZBwCUWiIpM6ObSBuo8MtW1wjBgtAll
	 qIosgcXCr93QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79A1360639;
	Fri, 25 Sep 2026 06:02:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AC77232F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AB7F40633
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w9aSq2AGMytP for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:02:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4158940621
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790316161;
 b=hQM33de0TkBlE/EvHn16VA1KGsxznz5SA8WxQyTzMGy9zsyWNWqEKBt8jD1rhXj1G2EM
 5qNkBvDhTcPEw+dfv260b1ax90Z2PudsBntukTT0Dc99s+qbQ/PE05iOfKSe67T2o6Rlk
 Kk/C4U/ucstpVS86cEnIyk2JEbiE8f3j09ZOaAO1QexXHHMllEmbm+Xj0xiHVhPdlnha5
 tmGayBzJ9gj1nGC7wZsdDVr4xHlKJBbVuzsBfcFckOKmvOkH9gs+UVZvpjPFxZdGDFf7n
 cu64jiZsx/bhWBMOMqEkp3aAa0ZTF3ncV5dEGUOkX2WrALc8w/1IDM36iYLfzbexgIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790316161;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=97n00j3PpHtnsN8ZBL0/6esi4bQJXFNdsaN823Sa6RI=;
 b=KGVE+xsrS/YPEd8VW2W56x9gs/1aoDFQi7kXj/fbCyQvUyNQDC0Tp43rRijr4KdMNnG4
 9lslyX+ATrFRSv6F2W5/3FtZJoH/gAeTYpEb3Dxu8QoicL8GyUi0pWYKjGBSRCQVjk/om
 Q3T1Dmt5cg2SZfHvWovk1Q5iH8VZSepCYLw9p/1lVLTV2Tr/jqFhuu/PBDIhn5Q0GRBuL
 JJj/5vJ3JSKlzs50a1LTkGgS1TlbU4XCbtweh4agsvD1sNup7k7NQUDE+gfTdlDqRntQj
 wX66jBcLjWLqONMCiNX0fNAf5QB+ViMIX7ZRjN3PbZ26EdIu54dVbAgVxHTJonEFlXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=jlEGeAfw; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:34::10; helo=mail-ej2-x10.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej2-x10.google.com (mail-ej2-x10.google.com
 [IPv6:2a00:1450:4864:34::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4158940621
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:02:40 +0000 (UTC)
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254f55eff0so68805166b.0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790316158; x=1790920958;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=97n00j3PpHtnsN8ZBL0/6esi4bQJXFNdsaN823Sa6RI=;
 b=MPkdDeL1a46GDg7HAS/KI/0swiPPbxN6LTytyLJjUyRyqDbyQjq0FPtGyfTZhZorfh
 oFZMnXNAYED/2mqz1OkqDC0Q6yH2ag/e4nq+nghWwxC0QmrbMww+ssNsrDeEtr3+ng/Q
 UJM6QQ0v9YBvLIP5gqX/gsR05fisMqnEw4/XSNFBHlwMlbJQdNTlMlYqXpYT6GlkCn/g
 TO7hC6Pa3fqjPVEo5X/tAoBw8oHLse/SPEfs51XXN/4XRMM0T+QswTTTswNckyG+Uy5f
 bOT+nFhS85hOXAhsGggfLH9HtnyHbQ4x42iKdU2nm3aT+Fx+EjBiOvNN9onbYwkyEsnw
 VVxQ==
X-Gm-Message-State: AFuF++mSsag26z0XCEUODaNLr60EWf7Zigap9qvVqtuNaVVxSBi8xeiG
 Ee5fQvP271aCvcARUmeOR4IdXA2Veq1236Pe1TZCijBduNpYUYvF+yLU2JPjtA==
X-Gm-Gg: AYBFou1JlzOYf1oD5q2LZLbFYMbsdPyBNPRCstZJBmpLC8/mqFTcxG+QxkJMWcwYMGc
 RagHQgpyhuWpGNS4/S5sA9ipUmi+p8kxf48mD0RU0ROelCO/PqZChd2wbr+3HpYrH0eHTzpCNe8
 0gFyyh6Dw4gAzbGhir+INOsbyq/WDcY4EIjYDQOF6aGV7UrFivxkGu+Mh10tMNW9bt862M77qa7
 2u/0ePfe5E0oBciqAvqfgn47UozewcJ+Xar6LlI35wTWVG5q92vhxfI6QspHxZLJkG2u8T4gFwA
 w1WJr/311883uCcI8RoUUS2pJscjh0xm5F/1bwXT6qN1eCi8uUqQGpotBwFKf0vGvgX3GY2ANzz
 zA+xAnM3KhGIo+4sQgcv2pmYLDIZIx/I7cXyByF51ShhgmTcandL0hsnNcel5M1InhTAZDHkYsg
 /MGgnT5WzqubBC+yl8JVLQAVOHqH4d5NO/kRqdtpcSV2kzE97qb/ggyC597ddbqOe7bB577PYXb
 Sg3SWoKNmR4ALhnzXMQfwivYfvnF1wZVRCD5a6wy0C65Rifrt+Dmw==
X-Received: by 2002:a17:907:e983:b0:c26:1691:b364 with SMTP id
 a640c23a62f3a-c2ac24d881fmr400432666b.29.1790316158117; 
 Thu, 24 Sep 2026 23:02:38 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2ae7356d06sm64984766b.19.2026.09.24.23.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:02:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:02:37 +0200
Message-Id: <20260925060237.2488685-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/haveged: needs threads
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump to version 1.9.15 in commit
2a28d25d0c61 ("package/haveged: bump to version 1.9.15"), haveged
unconditionally includes <semaphore.h> and uses named semaphores
(sem_open() and friends) to synchronize command instances. As a
result, the build fails with toolchains without threads support:

haveged.c:37:10: fatal error: semaphore.h: No such file or directory

Add a dependency on BR2_TOOLCHAIN_HAS_THREADS. Since threads are now
always available, unconditionally pass --enable-threads.

Fixes:
  https://autobuild.buildroot.org/results/814cb7b5537d8b7b2c23f3d90e37b2b41de7ee3f

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 package/haveged/Config.in  | 5 +++++
 package/haveged/haveged.mk | 7 +------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/haveged/Config.in b/package/haveged/Config.in
index 0e49a2db7c..8862792824 100644
--- a/package/haveged/Config.in
+++ b/package/haveged/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_HAVEGED
 	bool "haveged"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS # semaphore.h
 	help
 	  The haveged project is an attempt to provide an easy-to-use,
 	  unpredictable random number generator based upon an adaptation
 	  of the HAVEGE algorithm.
 
 	  http://www.issihosts.com/haveged/
+
+comment "haveged needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index e22712f016..bf3209cfdc 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -18,18 +18,13 @@ HAVEGED_CONF_OPTS = \
 	--disable-nistest \
 	--disable-enttest \
 	--disable-olt \
+	--enable-threads \
 	--enable-tune
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HAVEGED_CONF_OPTS += --enable-clock_gettime
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HAVEGED_CONF_OPTS += --enable-threads
-else
-HAVEGED_CONF_OPTS += --disable-threads
-endif
-
 define HAVEGED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/haveged/S21haveged \
 		$(TARGET_DIR)/etc/init.d/S21haveged
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
