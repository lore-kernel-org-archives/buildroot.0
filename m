Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD25FCA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8090340566;
	Thu,  7 Aug 2025 18:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ez-gSuMLuA-G; Thu,  7 Aug 2025 18:25:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DDDC405BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DDDC405BF;
	Thu,  7 Aug 2025 18:25:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 314244C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 179AB60604
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXYElmtZ2QC9 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 020AB605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 020AB605F0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 020AB605F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78bca0890so636647f8f.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591077; x=1755195877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIyUNym1rREOEzO+mtjt3SZ+LvCLiPsXAZSEVzkb1Lk=;
 b=SzwOZGP9+PEj2XyNhz22lZnZwhK2h9uiMVSPFShnq9xLton3YWuhDldH9sF0B0w3xB
 mvXfxo3MHT6aqMu+o3lJXhM/gayYeU/G1sSL3yih/qJMOqgdv0XHHjr+pS/8xG6KPvYD
 5PdDdX8MAhOxigLAcwYXxYNQ99Fe0rHsbDbBZ+7W5n89FFxrGw0IMtvnv9SLlSvRDhwJ
 W9YcJISf3wP/vWXMILH7aeTnP3YhcWHoPiWjVANrEoEvKbn9EiPKup76JHHNcXlLpeKR
 +DL9Nbv0W/nv7uAKSMw6LUuWCDz5ybLs/pdSNWrbEh+tqyS0yFYf1sh1rT/0c/zJZ/eA
 tpCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU62ILeuwnE1AxOhPj9i/8J73lWSl3vvmuRGtzQtkAE5qA9/9ECFJUQNjacOkgqVRugvnR/nG5qyxo=@buildroot.org
X-Gm-Message-State: AOJu0YxzKxJ18MZJ6an3zo3pTkcxOuZOvKUaX2Fyuvuq2Yzr7zc6H2HD
 PJ/ameRslTkWraIloo/Yn744ktHvbDighbE8tXqu71/f9EjJJ5f/uW+u2jGSAeuPx2U=
X-Gm-Gg: ASbGncuUuI3LsZpCHnd49DZaonAjpEc+3xP0Riceeer+/RfhGro75ZwC5T+OzPCp7SH
 XqJntKo8xPy8PeHBl7r7b5IEIGPxE2pwGkAF/djFCrhWhwNQMnFUxzSnvolDEh9lcw+I3eI+Ekk
 9POQGqIL64fnsHPlhSlpFRHE44+N9fNJPC1qGSn3b9PsDWqKyHHmMFogfVecrLMtwJbl3wVy5At
 IJ+daVChbW+0rusT/9IjhaXjDjf3Bd9cg4UOMT3k0bfhQ8RBqNyb4L+U3vjsizsRr+OPMAAs50A
 hTL+CRFv/l4aFyaAwDH7lMUOgnFcK6uMc3Lv8Nvt6mIW6kmzp5rNWrFgk9KowJ7gCPfD6dF8nAY
 9YGk8BdZikEmDuQ==
X-Google-Smtp-Source: AGHT+IG/bjZJNMa5LORJC2dJ8jMFuiAuA146zE2vvwtFvhd2aQO6b3XsPEUz0VXhls54sSuSb230gQ==
X-Received: by 2002:a05:6000:402a:b0:3b7:96c0:4172 with SMTP id
 ffacd0b85a97d-3b90092fd6amr215426f8f.11.1754591077020; 
 Thu, 07 Aug 2025 11:24:37 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5843021sm116623415e9.3.2025.08.07.11.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:36 -0700 (PDT)
To: Scott Fan <fancp2007@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:36 +0200
Message-ID: <20250807182436.725845-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726040120.250482-1-fancp2007@gmail.com>
References: <20250726040120.250482-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591077; x=1755195877; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIyUNym1rREOEzO+mtjt3SZ+LvCLiPsXAZSEVzkb1Lk=;
 b=OSn4K6uEUe24y4fmEYshKJhioEkngxUZ43i0w84CwHFWqaaj+fiNVA9DIE2HiGaQ5R
 8lx/m4XGiP9neisa08d6n7bdziPdKTD+V7q9VwTpcMnJ6n458+SZUxzuSqdSfCrcNzrP
 Z+ozyo+GA30qyZb4YAyDYGPcZ1zCwgAbWbz9rc3tRUQDdvc12gGfkVIdinmZwFmCmp0G
 jew35SQrdoGOQkvfXfdlU9V9YZcicyGdRVD3+XfFl782kY1sVst9ZwMTnF2Q3FxMt5/S
 BAmC/xt1WI7gG6FJDVZyJ11GxRkku3jkCSuCGirDtkMOoD2HvTce+eGaU3OOKoHp6Q9n
 MgiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OSn4K6uE
Subject: Re: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.22
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

In reply of:
> Drop the patch that was fixed in the v2.0.22, see the closed issues and PRs:
> https://github.com/eclipse-mosquitto/mosquitto/issues/3246
> https://github.com/eclipse-mosquitto/mosquitto/pull/3256
> https://github.com/eclipse-mosquitto/mosquitto/pull/3227
> https://github.com/eclipse-mosquitto/mosquitto/pull/3252
> 
> However, a new issue was reported by GasparQ, when WITH_TLS option is off.
> https://github.com/eclipse-mosquitto/mosquitto/issues/3318
> 
> Fortunately, besmarsh had pushed a PR that fixed this issue.
> https://github.com/eclipse-mosquitto/mosquitto/pull/3321
> 
> The patch file was quoted in this commit.
> 
> For more details of v2.0.22, see the changelog:
> https://github.com/eclipse-mosquitto/mosquitto/blob/v2.0.22/ChangeLog.txt
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...1-Fix-CMake-builds-with-WITH_TLS-OFF.patch | 50 +++++++++++++++++++
>  ...-compile-failed-when-WITH_TLS-is-off.patch | 35 -------------
>  package/mosquitto/mosquitto.hash              |  4 +-
>  package/mosquitto/mosquitto.mk                |  2 +-
>  4 files changed, 53 insertions(+), 38 deletions(-)
>  create mode 100644 package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
>  delete mode 100644 package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
> 
> diff --git a/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch b/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
> new file mode 100644
> index 0000000000..9445148f44
> --- /dev/null
> +++ b/package/mosquitto/0001-Fix-CMake-builds-with-WITH_TLS-OFF.patch
> @@ -0,0 +1,50 @@
> +From 1ecc94d7b4ff495afd7f32c42072cdf4ea5407aa Mon Sep 17 00:00:00 2001
> +From: Ben Marsh <ben.marsh555@googlemail.com>
> +Date: Mon, 21 Jul 2025 17:46:16 +0100
> +Subject: [PATCH] Fix CMake builds with WITH_TLS=OFF
> +
> +Recent CMake changes caused CMake builds with the WITH_TLS option set to OFF to fail. The OpenSSL package is only found (find_package()) if WITH_TLS is ON, but linking to OpenSSL for the broker and library is not guarded by WITH_TLS. The build therefore fails.
> +
> +Guard linking to OpenSSL, only linking if WITH_TLS is set.
> +
> +Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3321
> +Signed-off-by: Scott Fan <fancp2007@gmail.com>
> +---
> + lib/CMakeLists.txt | 4 +++-
> + src/CMakeLists.txt | 5 ++++-
> + 2 files changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
> +index 21b61497..e6b8235b 100644
> +--- a/lib/CMakeLists.txt
> ++++ b/lib/CMakeLists.txt
> +@@ -60,7 +60,9 @@ set(C_SRC
> + 	util_mosq.c util_topic.c util_mosq.h
> + 	will_mosq.c will_mosq.h)
> + 
> +-set (LIBRARIES OpenSSL::SSL)
> ++if (WITH_TLS)
> ++	set (LIBRARIES OpenSSL::SSL)
> ++endif()
> + 
> + if (UNIX AND NOT APPLE AND NOT ANDROID)
> + 	find_library(LIBRT rt)
> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
> +index d4bae7cd..6fd0ee53 100644
> +--- a/src/CMakeLists.txt
> ++++ b/src/CMakeLists.txt
> +@@ -163,7 +163,10 @@ if (WITH_DLT)
> +     set (MOSQ_LIBS ${MOSQ_LIBS} ${DLT_LIBRARIES})
> + endif (WITH_DLT)
> + 
> +-set (MOSQ_LIBS ${MOSQ_LIBS} OpenSSL::SSL)
> ++if (WITH_TLS)
> ++	set (MOSQ_LIBS ${MOSQ_LIBS} OpenSSL::SSL)
> ++endif()
> ++
> + # Check for getaddrinfo_a
> + include(CheckLibraryExists)
> + check_library_exists(anl getaddrinfo_a  "" HAVE_GETADDRINFO_A)
> +-- 
> +2.43.0
> +
> diff --git a/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch b/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
> deleted file mode 100644
> index 9c69c6a9c2..0000000000
> --- a/package/mosquitto/0001-fix-compile-failed-when-WITH_TLS-is-off.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 47c015e0d3fb5c5c71a68fe21c8e5eb2a5fbfc1d Mon Sep 17 00:00:00 2001
> -From: "chunbo.bai" <chunbo.bai@tcl.com>
> -Date: Fri, 7 Mar 2025 14:16:45 +0800
> -Subject: [PATCH] fix: compile failed when WITH_TLS is off
> -
> -Upstream: https://github.com/eclipse-mosquitto/mosquitto/pull/3227
> -Signed-off-by: "chunbo.bai" <chunbo.bai@tcl.com>
> -Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ----
> - src/conf.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/conf.c b/src/conf.c
> -index 74ca66fcb..bfccf729c 100644
> ---- a/src/conf.c
> -+++ b/src/conf.c
> -@@ -2313,6 +2313,7 @@ static int config__check(struct mosquitto__config *config)
> - 		}
> - 	}
> - 
> -+#ifdef WITH_TLS
> - 	/* Check for missing TLS cafile/capath/certfile/keyfile */
> - 	for(int i=0; i<config->listener_count; i++){
> - 		 bool cafile = !!config->listeners[i].cafile;
> -@@ -2333,6 +2334,7 @@ static int config__check(struct mosquitto__config *config)
> - 			 return MOSQ_ERR_INVAL;
> - 		 }
> - 	}
> -+#endif
> - 	return MOSQ_ERR_SUCCESS;
> - }
> - 
> --- 
> -2.43.0
> -
> diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
> index ff74d9c534..cf031f91e5 100644
> --- a/package/mosquitto/mosquitto.hash
> +++ b/package/mosquitto/mosquitto.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking gpg signature
> -# from https://mosquitto.org/files/source/mosquitto-2.0.21.tar.gz.asc
> -sha256  7ad5e84caeb8d2bb6ed0c04614b2a7042def961af82d87f688ba33db857b899d  mosquitto-2.0.21.tar.gz
> +# from https://mosquitto.org/files/source/mosquitto-2.0.22.tar.gz.asc
> +sha256  2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68  mosquitto-2.0.22.tar.gz
>  
>  # License files
>  sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
> diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
> index 900d1e65cb..8539f28d08 100644
> --- a/package/mosquitto/mosquitto.mk
> +++ b/package/mosquitto/mosquitto.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MOSQUITTO_VERSION = 2.0.21
> +MOSQUITTO_VERSION = 2.0.22
>  MOSQUITTO_SITE = https://mosquitto.org/files/source
>  MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
>  MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
