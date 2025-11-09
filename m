Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE142CCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 10:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8E8C405B0;
	Sun,  9 Nov 2025 10:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sj_tyh5Q27bv; Sun,  9 Nov 2025 10:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 046C8405AC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 046C8405AC;
	Sun,  9 Nov 2025 10:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E71CA25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D187F807F1
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3th79aU1O5Op for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 10:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9AE3807BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9AE3807BC
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9AE3807BC
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:30:23 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64175dfc338so923012a12.0
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 02:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762684221; x=1763289021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0h51TD4TJOAz6frpMh03lZ4bf1iPYwKhePy0xOp2Nk=;
 b=ZPCD+y3o5QgfSGMe37kBA+cRVAi0q0r8sDBgwoFNF8RWsFehuXHq6YK7YRkoutQivv
 0jDw4AQyYJVSGehrW336sofuIU5PuwryhyyzmeTxEOri0SpZVgfPbTXf0PC06V+NW0yQ
 XhbV7gdd5k4U3ybbV5bMwJJfqISmoHDdAy0XUZiEiETESLLEf5ku8sG997scZP2GasaQ
 +9jpG77ORaKwr50t+T6is3KM9JINvqIjyW2pNdonzz13ehVjIouSZ/Gu387BGdIzKXC4
 Q/J5nawE4afF7xdbVsD6Ywl/L6pcdDvdly+j9ojOw4PZtxbSvcvyhzFT64dflQdvcu49
 f9ww==
X-Gm-Message-State: AOJu0YxL3YFrDSZhA6tR36fCustj/Ql/DNyC5cuJFDUnoe4xcpf3ux37
 YeYXcQ9dBcgRMPDRq1c4QGcKfJEzr0/I+O5bJBRf/mubEQedSOYxnygQX6rMFKwHBSrpUUbW0jX
 HAF3O
X-Gm-Gg: ASbGncu2XT8H7IKfNy/P6xjmNlu2wVX/50DZg1Yp951jchlFruQvhTb4MmmdJ1SYjgb
 mg4CFZPbgjDS63qZXIgtIcomGz4M7Kmlsyby6uHxfBS27m49qtgfMO+TPbZFNDjJDQHxtzhrY6a
 5g0SpnDylb3iGXRcRrtmL6th/wLuyYyi6XKidAnHwtz8mGaQJ/jhmxwxrOWSzPE/CcLD6v502eI
 ZrQY7+7TUNePjPqhFsNsB++zk2OZKY5xrUxsjIPS0Z9eekNNN73AdXq7NEK8DYYa6YL4sA9vzYD
 8tbRiyhgDbF84m3mmyM1rfzijvp5/JLjXXswT14WtcS98c35+glM1zlLBXy1HFnS5vjH2e1j/iQ
 AYRKNL+Xf0acyfUwTd7sHuNhUIZRnsNob22SPUOIouejwMvVa1CKqPDDSrq+XetKQh2mwyzvva/
 qPuFMv9Ztyyq5kBUOjVJBwRN87XxO1912NwCva8r3GZMwTGSx3rSAptd/Jz8D8XQSgEqnIzAxaG
 5lRlGdor6IOff7voktYdtrgtnFIrSoOIxb0/pnTvV1TYLiQN4p9
X-Google-Smtp-Source: AGHT+IG71hWQ7OzRTVvRC4m0mbcyJqeqsTAzjfs34Bpg84GiByi+EPqAhVR3zbTiuqpasU/QLnfmug==
X-Received: by 2002:a05:6402:1e8e:b0:640:9aed:6ab6 with SMTP id
 4fb4d7f45d1cf-6415e6e4832mr3923103a12.24.1762684221420; 
 Sun, 09 Nov 2025 02:30:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-92-181.retail.telecomitalia.it. [87.0.92.181])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6415d91f486sm4034163a12.22.2025.11.09.02.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 02:30:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  9 Nov 2025 11:30:17 +0100
Message-ID: <20251109103017.499981-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762684221; x=1763289021;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k0h51TD4TJOAz6frpMh03lZ4bf1iPYwKhePy0xOp2Nk=;
 b=EfrIBqrLJI/c/UEKADGHwMw7Y0cYbr0p78Bjk9KVs7e6mQSLdSKWHLqBijL0yoWHzp
 ltmfEyy/vVrD1gVb9zVr/v4qyhy5ULSBq2DYgu+lgCHBJEjAlb1yDcvHs5FXfFUjROzF
 Q/ToswQGt/9BHlxB8fjjLgQCKtK9pttyacIck=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EfrIBqrL
Subject: [Buildroot] [PATCH 1/1] package/cpp-httplib: bump to version 0.27.0
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

For release notes since 0.25.0, see:
https://github.com/yhirose/cpp-httplib/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cpp-httplib/cpp-httplib.hash | 2 +-
 package/cpp-httplib/cpp-httplib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
index 89f9ae554018..904bca6d025b 100644
--- a/package/cpp-httplib/cpp-httplib.hash
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ac7c59fa72325d4cb9f73af266312d82632ac35a5c4c8a1be620c1f946ec9cea  cpp-httplib-0.25.0.tar.gz
+sha256  cc57615af359efda816122dcfca37bcbb9f1591396f50a1fd1ad70bbe6050581  cpp-httplib-0.27.0.tar.gz
 sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
index 3f63e3a86592..62255180f4e3 100644
--- a/package/cpp-httplib/cpp-httplib.mk
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPP_HTTPLIB_VERSION = 0.25.0
+CPP_HTTPLIB_VERSION = 0.27.0
 CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
 CPP_HTTPLIB_LICENSE = MIT
 CPP_HTTPLIB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
