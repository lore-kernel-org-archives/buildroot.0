Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC46CFD2D88
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 13:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89A9E606DC;
	Tue, 10 Mar 2026 13:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQ7W69c3tOPX; Tue, 10 Mar 2026 13:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 996356079F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773150112;
	bh=8YIhCI9+SCncIYXqEvX57FiykbpbiQffoW3etbSPeiQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aRB/Uyh7uCijylLDVMH0GvBF9PnX1/tOqKr5zlWZm5EFZxLDDHF3ffwEtrt7i8hQf
	 niGS7q4ECQLyw/Wi2vEXHTcx2GFc5aaf8Ko3ZL4KDdKfe/SCYcqjCd2htl9ok2T+or
	 hqTcJ5AXYmx1pbm8vyZnvasOmQzCELbwxUJeXp5AZpuFOf2fVihJs0765ZkC/OVQN1
	 oyAmshRbC4cewXeTL+C7VIo9gfiwTQudQatj4479koL6K/KO+MSPIT/UmTH6tyW91A
	 CimqN1Zd06EWI+UPHzXh+6eH7rupX497+T4CTneg6PzcjTKfZNP00CeIDb54D7TdrT
	 TAM5h3UlYQa4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 996356079F;
	Tue, 10 Mar 2026 13:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E83C835C
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 13:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA19A80647
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 13:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Se784Trj-tN for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 13:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132f; helo=mail-dy1-x132f.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D0A2780599
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0A2780599
Received: from mail-dy1-x132f.google.com (mail-dy1-x132f.google.com
 [IPv6:2607:f8b0:4864:20::132f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0A2780599
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 13:41:48 +0000 (UTC)
Received: by mail-dy1-x132f.google.com with SMTP id
 5a478bee46e88-2bdfc4b191fso8297387eec.1
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 06:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773150107; x=1773754907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ciHKXnU0KiUUmF8tIjw1KndfQe51D2J2PGJGSXORnr0=;
 b=knKXaGnnRHiWR2+Srrk13uk16xEH7iSwa9ntJ1uC4s4cXj7Qq2vxW/2Jy29jwvl1Oc
 qauJFQrXJ2kjn7jMdLdtjCuABagSyOHEb01vCKrvySc+T+/AcljG6i0u+llmKo9TIuD2
 a7h/5bwVbqzewW0SD3oKSfnpNgAGMArcb2MLfmUqVCB4gt4Fzgy0th96kuc1FI4dT7HW
 wBhNkQvTTr/zibyBetezSHrfQzpofeUAsNzYWsSLzErVlFN9nGQvwAkngw4UvFCwoY5f
 BnVu1p8kcN5O+9bBqizkbjBJXZPQ3WL603EU5hG0DPXw/NYbnx7pL9JJiRbz7i603vq0
 fhwg==
X-Gm-Message-State: AOJu0YyKx3qZ2T8auA967tYqR954+6+6RFIBt5mp7kFcKFDKbtfNZykf
 v5v0EC32AbGP5a0rS+3589OQ43DSPil1BEKoHdgHdhHZPk77W/28Rs7p1pN4aw==
X-Gm-Gg: ATEYQzxhdi70poMpmXxblAHVwN194JW6CGj2Dn/7d3dFgLnVBQXStjrJdHeTLiyRCUL
 ystE6AiwrxMeFE+X2B8GLgCEYRv0732wHGplI7ZlJ6EGwOet5k1u7Gus76RBK+EF9n2kHjIOtKV
 mc/wODeEhmQb/HQcwixGK+NsdHZ+Gz21+Es0IXTRzdI4ApM4hZYWhD5ll0Nt7NtuSiDIMJMQv4K
 03lA28kGie+oKdWXYyji9Nir4SCAtuY9EEnnCKKMg941gPQtnKiX+VXIS7ay2GWfY6IbEQJ5cRs
 OIr8u8YYNicNQvyvAkBedtuuuV1nBBYvJxPuwyhtnuD8X1JoVhv4h4N8cuj/zw3qbFFDLFVMCon
 HKNNwwzJsqG88CmJS6ZszZExAoXSeeUUXa6CkVL3HQH+9PyRbSDZrmWsaxKAx4DI3GlGhkOwdRK
 dlORJQJdm5UGovVsHcjI0=
X-Received: by 2002:a05:7300:a887:b0:2a4:3593:466c with SMTP id
 5a478bee46e88-2be4de8e1cdmr6550405eec.8.1773150107280; 
 Tue, 10 Mar 2026 06:41:47 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2be4f94833bsm12963457eec.18.2026.03.10.06.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 06:41:46 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Tue, 10 Mar 2026 21:41:29 +0800
Message-ID: <20260310134131.418353-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310134131.418353-1-fancp2007@gmail.com>
References: <20260310134131.418353-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773150107; x=1773754907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciHKXnU0KiUUmF8tIjw1KndfQe51D2J2PGJGSXORnr0=;
 b=UXza9MUiCTzECIK7xfHFhJnTk/8n0KXeD6IMim5INWQW3Cl0X7LjGTIHy6kiTgOmRm
 j1r1txmf3960pSg+zbK0jCFdGjm4PZfgOeZjP9G9UMAO+zvI6oZMT52L2lw+AXhilgDE
 Xniq444I9eu+2v+w7tJm0gL2W6AAFoQq1ky2RBbyNoQrP7kvM1zDFbaFf+1zlKHqnw0G
 Vi3W8qbNMMKKM6e2gYROtjHY+/OzJwOkf/MqPfyZQDH+PidQAF+mi764tkgWas3wg6hL
 9plwKT0zNQnVB7KhLvoMn04vOAoWYG7XG/HfhnaANCW0Z9/0km2udC9uTAeOzWu15x+d
 hMWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UXza9MUi
Subject: [Buildroot] [PATCH 2/2] package/paho-mqtt-cpp: bump to version 1.6.0
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

This release bumped Paho C submodule to v1.3.16 and updated directory name
to externals/paho.mqtt.c

Release notes:
https://github.com/eclipse-paho/paho.mqtt.cpp/releases/tag/v1.6.0

Changelog:
https://github.com/eclipse-paho/paho.mqtt.cpp/blob/v1.6.0/CHANGELOG.md

As of 1.5.0, a C++17 compiler is required to compile the library.

Also add missing LICENSE to the list of license files.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/paho-mqtt-cpp/Config.in          | 6 ++++--
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 3 ++-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/paho-mqtt-cpp/Config.in b/package/paho-mqtt-cpp/Config.in
index a46c1256e8..023487c45d 100644
--- a/package/paho-mqtt-cpp/Config.in
+++ b/package/paho-mqtt-cpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PAHO_MQTT_CPP
 	bool "paho-mqtt-cpp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_PAHO_MQTT_C
@@ -9,8 +10,9 @@ config BR2_PACKAGE_PAHO_MQTT_CPP
 
 	  https://eclipse.org/paho/clients/cpp/
 
-comment "paho-mqtt-cpp needs a toolchain w/ threads, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "paho-mqtt-cpp needs a toolchain w/ threads, gcc >= 7, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 comment "paho-mqtt-cpp needs a toolchain not affected by GCC bug 64735"
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index a35cd102b3..16807257f1 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,5 @@
 # Locally computed:
-sha256  c271d521287f417102b447b3d1e8d17be0e0f6a3b0b653334ebcd2ccd20d1e46  paho-mqtt-cpp-1.3.2.tar.gz
+sha256  73bdb408ae98812c5c2b7f00b2ae7c4fdb9798424abe5a7f7afb13c8fd462156  paho-mqtt-cpp-1.6.0.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
+sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 2e0f409b96..e42c2dffdf 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.3.2
+PAHO_MQTT_CPP_VERSION = 1.6.0
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
 PAHO_MQTT_CPP_LICENSE = EPL-2.0 or BSD-3-Clause
-PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10
+PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10 LICENSE
 PAHO_MQTT_CPP_INSTALL_STAGING = YES
 PAHO_MQTT_CPP_DEPENDENCIES = paho-mqtt-c
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
