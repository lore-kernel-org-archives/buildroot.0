Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF5AC83F17
	for <buildroot@archiver.kernel.org>; Sat, 26 Jul 2025 09:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19A7A60BBB;
	Sat, 26 Jul 2025 09:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z78-m8OVP_2n; Sat, 26 Jul 2025 09:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C84360B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C84360B92;
	Sat, 26 Jul 2025 09:31:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 861A1177
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 09:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CE634063C
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 09:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOXiXpub8vQT for <buildroot@buildroot.org>;
 Sat, 26 Jul 2025 09:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 14D9D4054D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D9D4054D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14D9D4054D
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 09:31:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4561607166aso20922035e9.2
 for <buildroot@buildroot.org>; Sat, 26 Jul 2025 02:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753522267; x=1754127067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3VGfqq3K03zzO6nztFKryCeN213Y4kNOcLp9n1HEBdI=;
 b=B1CDzsfvm8hth7vwp2ds0NWyw7DRi1TLYR8sWzZKtDmeBcizDoajObiOVzeBHYHLTp
 xUImy1fL1aSXKo0J6ZfnrY9JFES1ydiD+RfUlLgNLuW4eBNLawz0MHCCccWQSNkxFgq6
 WPvb1Rio/4Q0+QmZvpRit0krm8G7/lZ8UWnsHLXo8AlXXti2MoZrb3bf3kEiw85CsbR2
 VxGokfF5DBrBHHz22RlGntI+4Fv4k8eNbkwA6RBJQiNSSQUP4nqkTf+gUp1BfUk/7e8z
 gFdBeUQicsWvHxFOueZjdvlgIz0G49DiRaypBAZ0g10olOAMDXZ8HCekfpmeTDG8gdaU
 eulQ==
X-Gm-Message-State: AOJu0YzEHGJeT8HXVoVARFLkc6/srSY27gxri7AGSZ0P+9SRcUzq0omR
 yyTgsMoO9NMj0GCe8YriGBcZOgtsnfhR2C2DrZlGkQN+o4IcIbD+4tZV9Uxs6AzMEXICNSFvUst
 mg0ab
X-Gm-Gg: ASbGncuDg753UyAQax8FiYZAZWLbNv21AavuoM8M7yjn/pAFnbhmo+hFF9BbXQoVV3Q
 yiYyj/ZKwb3C9skY4yJ4b9R0UI//XKB//axGPskKyMszHW7VJci8DyH3nLIvJZAGbzrcMGBHP0t
 IbUn6I5lybUUnOeoB/mtXY09wW6vSAD3yzAXhFpKuYq1MzbKDP7RMMKiy+3+AQuhp837F0tw2xP
 bTtk0xDquPVEdMOyo+5TUQTLDvDJbgvM4pYXi3hKRmL3/3rk6LXOl0OJoWJpM0gwsukMGTitnzW
 AikZ/Ts+khAw7s//UJgOuHYns8pnKZjmg34jkqIftWMYaK77bB2Nh9KYWSc6Q9Pw0S+P87fTfLs
 Z5OZSY8nuUcS23Q==
X-Google-Smtp-Source: AGHT+IEvnhfZMMB9cg/6VVWZxOnfxwzm9PQ0WUtDXVoAQ0qRGKQcu29pA2fdJMDrXLyChgq08u60fw==
X-Received: by 2002:a05:600c:699a:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-45876304b8dmr39075895e9.6.1753522267070; 
 Sat, 26 Jul 2025 02:31:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705e39b1sm77768535e9.34.2025.07.26.02.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 02:31:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 26 Jul 2025 11:31:05 +0200
Message-ID: <20250726093105.692181-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1753522267; x=1754127067; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3VGfqq3K03zzO6nztFKryCeN213Y4kNOcLp9n1HEBdI=;
 b=UdHOoX9u+E/ko4tfrUF4tEI2OtRHFhXBKyyOS1/eFy6x2muWnAH5pGmUcvm1dLTLhO
 vHTPw8ZkoKN0elKgI+Nxv5N3UIKZv73O/f27IzguFkU4hWMLOMBdGlq7Z8jFsf5H0eJY
 fxwrTexy4ekpwfVxdw+NJ23Xkrptu6lTgiTt4hegmAGK8Vc7pgCMVRXEjFC/Zz8XMaHx
 BG16jTWuLkcO5PvryoIaYyphlPOMK7yQ7y9Dh5WZhoazTKi+FPTnznQDmaWMpG8cmPZN
 eEVGJY9kxhLNp5q7JHPAXw5fQZ1P22NXIFmYJMX+Jg32YZgnfuPVnx/muEx6sLMV7B+o
 5Q2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UdHOoX9u
Subject: [Buildroot] [PATCH] package/ghostscript: fix xlib dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the package bump to v10.05.0 the xlib libraries detection has been
improved to error missing x libraries (see [2]).

The following error is happening on the autobuilder when building
ghostscript with xlib_libX11:

```
checking for XOpenDisplay in -lX11... yes
checking for XdbeQueryExtension in -lXext... yes
checking for XtAppCreateShell in -lXt... no
configure: error: X11 libraries (libX11, libXt, libXext) not available, either install them, or rerun configure with "--without-x"
make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/ghostscript-10.05.1/.stamp_configured] Error 1
```

This error can be reproduced with the following config:

```
cat <<EOF >.config
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XLIB_LIBX11=y
BR2_PACKAGE_GHOSTSCRIPT=y
EOF
make olddefconfig
make
```

This patch fixes the xlib dependencies of the ghostscript package to
correctly build with X support:

- The 'XtAppCreateShell' function is provided by the package
  'xlib_libXt'.
- The 'XdbeQueryExtension' function is provided by the package
  'xlib_libXext'.

They both select the 'xlib_libX11' package.

[1] 9abf662cfd package/ghostscript: security bump to version 10.05.0
[2] https://github.com/ArtifexSoftware/ghostpdl/commit/37eede31e12814fae69744e7842a5640004e5a65

Fixes: https://autobuild.buildroot.org/results/45d/45d0414f341feb2354478b145396fe137f9cc6a6
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ghostscript/ghostscript.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 0ddcb950ff..c9d13f5545 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -85,8 +85,8 @@ else
 GHOSTSCRIPT_CONF_OPTS += --disable-cups
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-GHOSTSCRIPT_DEPENDENCIES += xlib_libX11
+ifeq ($(BR2_PACKAGE_XLIB_LIBXT)$(BR2_PACKAGE_XLIB_LIBXEXT),yy)
+GHOSTSCRIPT_DEPENDENCIES += xlib_libXt xlib_libXext
 GHOSTSCRIPT_CONF_OPTS += --with-x
 else
 GHOSTSCRIPT_CONF_OPTS += --without-x
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
