Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B93CC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 16:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32DF08227B;
	Fri, 12 Apr 2024 16:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6BxHyZ4vx9s; Fri, 12 Apr 2024 16:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE8782288
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AE8782288;
	Fri, 12 Apr 2024 16:40:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 157E91BF31A
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 16:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02286400D6
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 16:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aULzzBwRgyph for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 16:40:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9E91400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E91400D0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9E91400D0
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 16:40:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41804f10c68so3922375e9.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 09:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712940020; x=1713544820;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yP/Tjo14gqubbEbw5UGax3dlyI++SB3n49K3exG6Hc4=;
 b=BN9hcLfTvJOKkuDX+DRVmSCa950FBkSnlzAI1USoEG9KVXgEbnRhgTR2JN/KYkSiM8
 j8C03dwjDOQsb7sNhPL8WE72zD9lgyCf1mavfBR1iq6RH4n+sf9wQulrZuucASRGeMCS
 gDAHdhdGLxbAHN7U2z3Nk3Rada5enNBm8VBOEq67pln7JzBFzHNuQc9FAv1fOn3qhw2J
 7+s+LbBcdbkoXfXiXTG8xkrpOPn3cwdG5FEEnhG2OIGpkChd7vZ9E+hyrnJ1aEjF56pM
 Hovdzfq2c0ebwURAViGgruP0H7QdeTKGC3kLG4M+OBdypirq3fWHu5VVqFGUkBNDPXvi
 pnCA==
X-Gm-Message-State: AOJu0YyPxgzYAMDXRx2DnQTfMySLHrOnnmfwLbqt737HurATXWTAV+ki
 Acx6Zec7nOuZBJ/BsBekMv1cJrfaDjOGyHwIfDhXkG1h5Hojt1MxYEj4lCJU
X-Google-Smtp-Source: AGHT+IHJf5PGoxfsjkD8mTSgWIamQHz7bc4RBiZ7e8F8dRWxs9XPv2BUsW3nNxaGKLQ6QzzY8AiE9A==
X-Received: by 2002:a05:600c:5493:b0:416:a0a9:213e with SMTP id
 iv19-20020a05600c549300b00416a0a9213emr2165422wmb.13.1712940019848; 
 Fri, 12 Apr 2024 09:40:19 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c358100b00416b28651e1sm6159549wmq.36.2024.04.12.09.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 09:40:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 18:40:17 +0200
Message-ID: <20240412164017.3574-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712940020; x=1713544820; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yP/Tjo14gqubbEbw5UGax3dlyI++SB3n49K3exG6Hc4=;
 b=CKpWdX0H7SwTjauhFw9JhINawztzEAS+2LdQILAc9nBwsUDrGGtHwGKERyDyQIl/UQ
 QhoGCx4IdUQHr38s1LwtmU+T2FRi2RXjMqrAJ2G4qruoL4F96WcH1kFBg0Q4xURTSio2
 sLRX4HKJzGmo0bn3rulro5JJ60ME8vyNYmBERZVg2cfE+lsDKhB6Rkaew3j92H5OPkSz
 OcyZBCH+46oZ9bMlh8MVr2Tm4RU5eHdj2KfDKaEVyZqvuja+9vKx2RUyjQJstipB0DS3
 yeAYw99C8OmONqVYzR3RGKcHPaTby4r/th7HxFkoQES9bXuqWTGFhRIzoJTcvjAqwjiU
 16Sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CKpWdX0H
Subject: [Buildroot] [PATCH 1/1] package/mdadm: do not hardcode -fpie
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

Set LDLIBS to -ldl to remove -fpie and fix the following build failure
raised since bump to version 4.3 in commit
99e9ff08d0705279532ca0cf3de22ea54660cbdc and
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=55a1150c7438afcb7756fccd49713ede20a58e4a:

/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/or1k-buildroot-linux-gnu/12.3.0/../../../../or1k-buildroot-linux-gnu/bin/ld: mdmon.o: non-pic relocation against symbol

Fixes: 99e9ff08d0705279532ca0cf3de22ea54660cbdc
 - http://autobuild.buildroot.org/results/827b714deeaf091b368d59791e4306b85a8f7f26

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mdadm/mdadm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index c6178700ef..6de9467092 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -20,7 +20,8 @@ MDADM_BUILD_OPTS = \
 	CWFLAGS="" \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
-	CHECK_RUN_DIR=0
+	CHECK_RUN_DIR=0 \
+	LDLIBS=-ldl
 
 MDADM_INSTALL_TARGET_OPTS = install-bin
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
