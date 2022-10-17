Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BAAC433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 15:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 905EF417AA;
	Mon, 17 Oct 2022 15:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 905EF417AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-Ie1l6mvfOE; Mon, 17 Oct 2022 15:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C773417AC;
	Mon, 17 Oct 2022 15:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C773417AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18F771BF2A5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8EB3404D5
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 15:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8EB3404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5NBMQ2BOBez for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 15:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB8C400EF
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EB8C400EF
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 15:17:41 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e18so16531327edj.3
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ynxSndqj0hBYNl5wUN1ZvQj+Il9/sGuiNMvpNqGmv8=;
 b=ySprJjntdYr4yoCp429I+SW4wLAjAnAWN+HtYmpAzsgIyDYmDWPVkTXkAHi2KmSQGO
 8xQGU69T1B/q8x5yUONFFfOVkg5BfZAkTa42YuayGek0T82Ahpeiwdsr6wx1P4bqaTDG
 e/s3S2W8UaEuuWL4RfdPhAXnKaQXPdpJdUEELbs+ncjZMjLod85DA8OhP+ZfWwwX19ki
 yC35XI7hhZk7ryQ5pmcVA2tUpKGw+HnUpALV9SVbnA8zazoSyLy6ukCFFawxGfATv06U
 x+WxHC1MLvFof1fFMBsYyoz+aYRlW/BrVv/y1saEw9jGi0ollyLn+z9p5FJMNWDYeWGz
 1FuA==
X-Gm-Message-State: ACrzQf3MlY62vLiF4IblebUIDLXno9mO51oIhscp/yMVd0SY6IPOcxzA
 oc/DHIC//JwY768QBzFWEcMMG2cXla8yFerP
X-Google-Smtp-Source: AMsMyM4LjIOXbnp2WCLdHEAxLpAuGw6r8wIxAlpPeLQOPcBOzwcPxCT9E1gzb6p73x/z9Tj+Qt3uYg==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id
 h2-20020a056402280200b0043a909855a0mr10559679ede.179.1666019858929; 
 Mon, 17 Oct 2022 08:17:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2788:1a4:785::9])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a50d48b000000b00458947539desm7471904edi.78.2022.10.17.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 08:17:37 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 17:17:23 +0200
Message-Id: <20221017151726.44005-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20221017151726.44005-1-thomas.perale@mind.be>
References: <20221017151726.44005-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ynxSndqj0hBYNl5wUN1ZvQj+Il9/sGuiNMvpNqGmv8=;
 b=W1ub6aQTQcd3u1UfP+NIfA6ZF8BjRy9F79GeZUnsmZG6P8yN10wLYTvaCyW5NPlJh7
 1xCSBDAyZi+bySQd8mqefyxDehrJFpHdAD8uel5QKMyCEuKmjx9znXZuGPAfu80FyyB/
 0OlEYptiN4pxjLiCHXhwQPl8jcxuCDpChQ4sruAlU566AbM3rUaQ8DWivSyHDp1ZzniC
 V2ivTmlmxgIXugcpC15OTjppH0JDTNDCCZXy7XGFezG4UQW3L6CiJmMUn8QSPVlQ4yUX
 kSkoZY94h3Atn61MCMcHx1QES19Xu4FwU8Orw9wr5V/3HpTkNEiwh75AOnHCRhRKFKxc
 bEJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=W1ub6aQT
Subject: [Buildroot] [PATCH 1/4] package/goc: new virtual package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This virtual package implement the already existing go compiler compiled
from source and shows it on the host package menu.

The usage of a virtual package on top of the go compiler enable the
supports of for multiple providers for the Go compiler.
Similarly to the rust compiler, a pre-built go compiler package will be
available in parallel to the current compiled go compiler package.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/Config.in.host     |  1 +
 package/go/go.mk           |  2 ++
 package/goc/Config.in.host | 15 +++++++++++++++
 package/goc/goc.mk         |  7 +++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/goc/Config.in.host
 create mode 100644 package/goc/goc.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index f437ef680c..8c44ff0cb4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -38,6 +38,7 @@ menu "Host utilities"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
+	source "package/goc/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go/go.mk b/package/go/go.mk
index 9f0fbbde00..96c756cb11 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,6 +12,8 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
+HOST_GO_PROVIDES = host-goc
+
 HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
diff --git a/package/goc/Config.in.host b/package/goc/Config.in.host
new file mode 100644
index 0000000000..b0266b50ea
--- /dev/null
+++ b/package/goc/Config.in.host
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_HOST_GOC
+	bool "host go compiler"
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	help
+	  Compiler for the Go language
+
+	  https://go.dev
+
+if BR2_PACKAGE_HOST_GOC
+
+config BR2_PACKAGE_PROVIDES_HOST_GOC
+	string
+	default "host-go"
+
+endif
diff --git a/package/goc/goc.mk b/package/goc/goc.mk
new file mode 100644
index 0000000000..3259618989
--- /dev/null
+++ b/package/goc/goc.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# goc
+#
+################################################################################
+
+$(eval $(host-virtual-package))
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
