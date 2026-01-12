Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D14FCF45D5
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 22:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2CEA60F48;
	Mon, 12 Jan 2026 22:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 89Bqf1_EYD3G; Mon, 12 Jan 2026 22:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CC4F60B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768255966;
	bh=81JqpANLXEDCKqAenqkHurRtaRv8IKCUTqDVpUq+8Q4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lE8B+y53MRpSubQDfQwOC/+yYA8NfLcjyOEOaing9s3ST9mD7NXr/vy8SS+gn/RVh
	 MSDdDzKrm/4ZjNZzA8bzDLHBTEtOC7kWLTZP7bmRmwytqERzeu1v3aV16qurKz4Y0y
	 fVf51FLmBOV8pCkqPwNvxFqO9ztQC2zx3bNPDR0HsIX6L2XKsH+Pz4q0+CYMhvnFva
	 BxQVNG+QfCEnQ5uIX9DKwJpy/Zfe8Z0I1p1bsHj8Mat/KzYjjZJerwh/yytb22pyhD
	 jnp1gUdSOKYsJaPGDNP7CjXWcQZJwIAhCXcjBBCnqB+cndZm19pqMKPO1bnYb1Tp3X
	 QfxY0IR+DYVvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC4F60B5B;
	Mon, 12 Jan 2026 22:12:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8E521CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88343404D1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEZ4eWSi7syk for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 22:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::734; helo=mail-qk1-x734.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C930F40217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C930F40217
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C930F40217
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:12:43 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-8c07bc2ad13so480395085a.2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 14:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768255962; x=1768860762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87ddFoXwWSmyozLKZDpIC2GOTB9x30PmrbI6CeqK26s=;
 b=lPxUk0eJ//KQ2rui+fVRr7U8ZfWrYeomyg18Qzz68p29axXROhzuP2K9H6f0XIaMFM
 7pfF4fJzBYJXTNYBgxbKIL0bLuxZ4yU37AIfCH6CgY8xJRssctTJtjCHXEjS2S2Gy5oS
 5iEhH4nOEzh+r8iGA2BEVKkwp74ZWBbv845jEO50KIIqSYmRBQkym+1cbD0NSXtF4JVA
 nkOsLI/b+HbPYiU7mfATgZuhrazs4qhCm8u+tWgBHkyIpys3UGrLbDPVwZZsC41nOCas
 GL9dHeBNQhwsY4sqGQq0TFl47u8U+i954w4w1HzHBdbB6Oef75kKOazSSKYSkClLom6Z
 /FKw==
X-Gm-Message-State: AOJu0YxpFa5oXs8E6lbgXiDFml6IAwVm90837mxbyBQ7LrnsdjfEcYYz
 LNSdlwgEoyfHXgwIb/oUGfE/Fh0NErhF3jXvFvzUhDz1IE2MqIquEt1iIEZICQ==
X-Gm-Gg: AY/fxX7OyT3l56eLnJ4yv2NnJhS3Ha3IN6Y4Uv4iouyeDa9kYqHMrjT13rDWwFr7J3u
 Z3VMZGK+ANMZdN97LRXZ0pH9rb9EQbQZtpbwrESgEO9bk2XAAhKXyxePTjA180nRKBygRiitRQe
 8fkmRvGXzCr2GgHxdYzhdGz5IyMljcGpqYi1IRISnVvOcrch+goMWfHBdB+aKiqJHrRB/GoA7qt
 a0TRHGM82gG/drkeSoJlCSM3yg2bdBPcjVQrE7U+BYJWR7VFUscvpJVuhQFUChPVywkCEfb0d5X
 ktmtj5aV6kA/ygnIju5S7nKgJ/kRthfSWya6SAdXmCq80NzCJH+qXQU6MDXDmMWskg/40XyOXfD
 2dpde+V2F7MPvT0wKrWH1mlCTkdAnKirnKjdJU3uyzqKeCMK2SShTBLfa0O7+7+v2OC2uV7Czv+
 wp52ndkQafznrPLyhNVhUEEikmMDQqD+BioKzEqY3eqocEGRspFX8R/nHnYU2UKqjc
X-Google-Smtp-Source: AGHT+IFoLRViVmnssDwWuCHr6frz/8CPayRf0VIlYiAPdhjSN7k1n3NY7w9lzGlZ8BPwHvYMjF5GOg==
X-Received: by 2002:a05:620a:4041:b0:850:b7ad:c978 with SMTP id
 af79cd13be357-8c3893cda61mr2599867485a.49.1768255961993; 
 Mon, 12 Jan 2026 14:12:41 -0800 (PST)
Received: from jesse-desktop (pool-108-26-186-76.bstnma.fios.verizon.net.
 [108.26.186.76]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c37f531207sm1569025185a.42.2026.01.12.14.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 14:12:41 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Mon, 12 Jan 2026 17:12:40 -0500
Message-ID: <20260112221240.3743863-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768255962; x=1768860762; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=87ddFoXwWSmyozLKZDpIC2GOTB9x30PmrbI6CeqK26s=;
 b=ihgJNpIKu+3bI9cjWLjtBehMOBQ2Px2nTgj5HlZjfdux3YnFFOfQ+a9CBPmi8ri65v
 xEusoQ5dQdTKB43HzpxuQkzWjnIyVj8nCVmuMXwxjoR6W+0uaK1lpw5y8TrOyQOO6Mpd
 mU6FSLuyfkblhbddcvt3wlleru+r/2DOHOlWseagHB7HAZJR2UKh0s1MY0G4MDBada9r
 WnzQyudqOhf6UMrvNJkPaJU5SKkBNBkRiBt12wZx+mXRcBobSGGSSc3vWkpPZrgd5jnw
 4qcW9qITY6FzmdfleAzBG196BexT9FRkFStLzRaYFc+fH2dccuWbfcjUEQU4/hJE+Fv2
 b1TA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ihgJNpIK
Subject: [Buildroot] [PATCH v2] package/picotool, pico-sdk: Bump to 2.2.0,
 add submodules
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

pico-sdk and picotool 2.x.x adds support for the rp2350 bump package to
latest version.

picotool needs mbedtls for --hash --sign and --offset.
Clone submodules in pico-sdk to provide the nessasaary files for
picotool to build and link mbedtls and other optional libraries.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - Squash commits
 - Fix typo of nessasaary
 - Switch to version 2.2.0
 - Remove git@
 - Use 2.2.0 instead of ref/tags/2.1.1
---
 package/pico-sdk/pico-sdk.hash | 2 +-
 package/pico-sdk/pico-sdk.mk   | 6 ++++--
 package/picotool/picotool.hash | 2 +-
 package/picotool/picotool.mk   | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.hash b/package/pico-sdk/pico-sdk.hash
index 5db7e8bdb4..7bb764a266 100644
--- a/package/pico-sdk/pico-sdk.hash
+++ b/package/pico-sdk/pico-sdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  95f5e522be3919e36a47975ffd3b208c38880c14468bd489ac672cfe3cec803c  pico-sdk-1.5.1.tar.gz
+sha256  1a6a0f76cf312d528023d093f132e6c67930fc70c360533cf155998cc9594abd  pico-sdk-2.2.0-git4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 27930651b9..3f242ab06b 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-PICO_SDK_VERSION = 1.5.1
-PICO_SDK_SITE = $(call github,raspberrypi,pico-sdk,$(PICO_SDK_VERSION))
+PICO_SDK_VERSION = 2.2.0
+PICO_SDK_SITE = https://github.com/raspberrypi/pico-sdk.git
+PICO_SDK_SITE_METHOD = git
+PICO_SDK_GIT_SUBMODULES = YES
 PICO_SDK_LICENSE = BSD-3-Clause
 PICO_SDK_LICENSE_FILES = LICENSE.TXT
 PICO_SDK_INSTALL_STAGING = YES
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
index 26b790d968..048a7f1e0d 100644
--- a/package/picotool/picotool.hash
+++ b/package/picotool/picotool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1746ead7815c13be1152f0645db8ea3b277628eb0110d42a0a186db37d40a91  picotool-1.1.2.tar.gz
+sha256  42558a239b3b8f99dfcb080300e849a2eacbd0f6571efb6ccc6e259fdfaef22b  picotool-2.2.0-a4.tar.gz
 sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
index 42f74fb244..b27f5d8dc3 100644
--- a/package/picotool/picotool.mk
+++ b/package/picotool/picotool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PICOTOOL_VERSION = 1.1.2
+PICOTOOL_VERSION = 2.2.0-a4
 PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
 PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
 PICOTOOL_DEPENDENCIES = libusb pico-sdk
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
