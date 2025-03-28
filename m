Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5859C28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 19:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E9E84F79;
	Fri, 28 Mar 2025 19:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VzavvLYGKo9o; Fri, 28 Mar 2025 19:27:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7536384FEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7536384FEE;
	Fri, 28 Mar 2025 19:27:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 059B51B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D868842522
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFNgcsocKVqo for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 19:27:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1177B40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1177B40147
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1177B40147
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 19:26:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so27769985e9.3
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 12:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743190018; x=1743794818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=11+AAbdmE7gWZDqWhWQ/eFLWRlDn/ePYVZGMsGAvQNU=;
 b=ejA5CKmO5/acYTTpqgPkz2ryUtlG24W0nb+udY6cgiILaxHO43sahd65XdhLrfbv9s
 /T+D+eS/s1lhQ6ZnBAUW4622nQf86TpIWFccsVXL3ufEk1j+ORoeSyyYQVpmCW71CHBu
 +NuXsNt+i/2vorGEiWZjm978ky14J//sD0Y/5sgxnZAdMjQMIOxD0/vgZqOSlo/h8bra
 AULWFpzbY997jrDN1e66KksUmzVQBq76SHJS16aolbAn9Y6M2yLg9SQuhm/1ksfHY0iQ
 Aj3mAmMqv71IvUC6Xz8Hi8ZK/s5Jw7cb6R4IoqpbhDBB/kkYiUE+9cnFgAj+G+G7iOpO
 +I7A==
X-Gm-Message-State: AOJu0YzHUCj1UPacJjwS1mFjPRN5qmOPU6NG7nB+NYuUIWGw7apeCelW
 0LuwBVYS58qFdxeqOuYVvI79jDC9XlfBZwafT4BZnWGBzJIy0fB+XlWFpQ==
X-Gm-Gg: ASbGncumnI7QIgHl8iiJlJ+XmqQuE30WN/x8HbBuD3/iEiwiARtZ7y945g0J/8imYhc
 5H7VHO9OknH4qP3pLEuuaQYmSgfWGX9+PSpWJS9u2kL6vuk1PdfgaIWIQYjWmNW209I1KXYkcuc
 /UKSdX+ud+P2241EAUtZ4aSFKgS4rZKnVz0CMThrle0IdQraO9HpNuqZPs2iMncRbs+bDDbkwTv
 A90sbNf4jtNqTf6dDorSdG7APqofIK+hGAml6pblm2XThksMbfFvD1Qwi7Iy7tYVGebnTTqIm1q
 qN1byLeEPUQTQJkL4/oF3r0+hkrCtiGT6fR7lF4Klc1LDkZj/8m1Is8=
X-Google-Smtp-Source: AGHT+IHeSRiBQR52Bfdi7sv52Xp8AyCHdMqBUeS/1XdcXOPW4gMogiWPtgveFc0367Jb+RVTriHUGQ==
X-Received: by 2002:a05:600c:474a:b0:43d:7588:6688 with SMTP id
 5b1f17b1804b1-43db622a023mr6190205e9.12.1743190017585; 
 Fri, 28 Mar 2025 12:26:57 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fbc10e1sm36853045e9.12.2025.03.28.12.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 12:26:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Mar 2025 20:26:56 +0100
Message-ID: <20250328192656.2035235-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743190018; x=1743794818; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=11+AAbdmE7gWZDqWhWQ/eFLWRlDn/ePYVZGMsGAvQNU=;
 b=SNndmbwdgir8N2ghI90ZKsi4VM3/dogS2qoKPXQ3eUpjm/ZWjaR8a12MYeKrt4LPaK
 mZ1VAUIkkQMLkJGuTDkg4TgjtP6icrNYwtWf0Mi9XYskOD+8iOCL7pDQD1mr3P8eFzQe
 foKUeVIM9lKT+htigYZoLSNlHs1u29Lw3n5qsJYft0D8PTEiiix/9DsLtoDN2dBSmKC7
 mOeXJ2zMOWbmBBGY49spdVPctBx7bzfHZpwDjcotQOiOzzZcHgNhmoJAB0CQkFb/MGYA
 c2cladKefQwcBo451hg7ceUXNMOIsff695fRaPO0VUbwdoAbT3G1mMR3c12LWau9t66V
 1IHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SNndmbwd
Subject: [Buildroot] [PATCH] package/libcap: do not attempt to run ldconfig
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libcap Makefile is hand-coded (i.e. not autotools), and hard-codes
calls to /sbin/ldconfig, unless it is installed out-of-tree. For target
packages, this is done, but for host package this is not done, as we
do set PREFIX instead, which causes libcpa's Makefile to call ldconfig
and emits a spurious warning (twice):

    install -m 0755 libcap.so.2.73 /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so.2.73
    ln -sf libcap.so.2.73 /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so.2
    ln -sf libcap.so.2 /home/ymorin/dev/buildroot/O/master/per-package/host-libcap/host/lib/libcap.so
    /sbin/ldconfig
    /sbin/ldconfig: Can't create temporary cache file /etc/ld.so.cache~: Permission denied
    make[4]: [Makefile:200: install-shared-cap] Error 1 (ignored)

This is just a warning, but it is incorrect still.

Fake an out-of-tree install with a non-empy DESTDIR that is just '/',
and thus does in fact not install out-of-tree. This is enough to
actually silence the warning. Add a little comment to explain that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap/libcap.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 5a6ed5b494..25b3a46c44 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -64,8 +64,11 @@ define HOST_LIBCAP_BUILD_CMDS
 		$(HOST_LIBCAP_MAKE_FLAGS)
 endef
 
+# Set DESTDIR to a non-empty path, so that libcap's Makefile
+# does not trigger calls to ldconfig
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) \
+		DESTDIR=/ install
 endef
 
 $(eval $(generic-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
