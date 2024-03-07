Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95D0C5475B
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 01:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3725460F95;
	Thu,  7 Mar 2024 01:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l0BHln4p1aYB; Thu,  7 Mar 2024 01:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E042B6088E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E042B6088E;
	Thu,  7 Mar 2024 01:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6AF01BF5B5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A39B482085
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUCigv01bjb7 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 01:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9810582084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9810582084
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9810582084
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 01:51:12 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6e55b33ad14so226942b3a.1
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 17:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709776271; x=1710381071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tdjl17lqQQn7fLbsgf9vUqG5LggGGTAI7Lp9e3g5FnI=;
 b=kN6fWB+QXaAYzJhXJ3B6nVblTqe5jRzkUzsKij2nh3H62aVq/Bo77WFQgqBkvei+FO
 XRa0109syel/DkDJVZi3gMcDOei2cfzyW31n6ReUGBGO1/zzRXEzpFGThmqkf2FKyyR4
 iunVukKlbeWXfG3+gH+wa+KyEvz/te1a+kfkrfBF2UkvvCxranrzogAaEDoa2F9ipZdJ
 oin5TUXWhUWwqxR8PNC/ymjs4cBehxHrQYlhucOUAb3F1OvaoNONwc55MwbwHa+R+TXm
 OKK5qFIC0RTn41nB34h7fbRHI4ojDNGW+o9xcamw1LJgAnr76HRXTeoQP84PcneCrKEj
 MOcg==
X-Gm-Message-State: AOJu0YxEX6+mb/y/PdVPA3KQxrHWaedqk7U/TsHBOHsfeIA5Keal613t
 EdPgd+1Hlhnz52wNhaWD7tsq0sQq1fmvmBlNfrx09xAfAaN0dfMOjBQvXxadbZg/6Y06IBmm49t
 ZmDo=
X-Google-Smtp-Source: AGHT+IFdnXlLU28EQZHyMTOWt8nTkKbvJCG0SWAmMMtjPiqslfpSXdCPvqVSAMYcKDUKGcV8aaIfOw==
X-Received: by 2002:a05:6a20:7f96:b0:19e:c3a1:238d with SMTP id
 d22-20020a056a207f9600b0019ec3a1238dmr7234614pzj.52.1709776271579; 
 Wed, 06 Mar 2024 17:51:11 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d8-20020a170903230800b001db5bdd5e33sm13280662plh.48.2024.03.06.17.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 17:51:11 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 17:51:06 -0800
Message-ID: <20240307015107.2908128-2-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307015107.2908128-1-christian@aperture.us>
References: <20240307015107.2908128-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709776271; x=1710381071; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdjl17lqQQn7fLbsgf9vUqG5LggGGTAI7Lp9e3g5FnI=;
 b=uwxMWhaUAui8Xa/Ieu2t3tKcr4Js6UzrnCWX5oc4w3NWePKDK2lgTqqHmXvlXMsKzt
 laFidaeweCqpnmT2uDXMDri+2HATDIHV+4fSgYOYjeATPTkuSRhHg76v5u+f4Ou88ODA
 Jl7Qti+521ECCKfnmxlXqSCzDfDDoHNyu/0j4xH9SRrlAFX5BWTIKZjxB9yTGTIh5sil
 r7kuVhgs9+qSMlL7Tf5tL+5MTO9HNBSxHNmT8jIWFxcrn1mj9GXWvVnzryOAadq45zfq
 buRHgQ2r1IApCv/w5SZebKwVs26xfkBW0B73+IWgcTwnNlHBfFc8q8/IbLxFvuCL3w2d
 Imsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=uwxMWhaU
Subject: [Buildroot] [PATCH v1 2/3] package/go-bootstrap-stage3: add stage3
 for go1.22 support
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a third bootstrap stage with Go1.21.x necessary for go1.22 bootstrap.

go-bootstrap-stage1 is Go1.4.x, the final version to support bootstrap using a C
compiler (later versions require the Go compiler for bootstrapping).

See: https://go.dev/doc/install/source#bootstrapFromSource

go-bootstrap-stage2 is Go 1.19.13, the last version to support bootstrap using
the Go1.4.x compiler.

go-bootstrap-stage3 is Go 1.21.8, the last version to support bootstrap using
the Go1.19.13 compiler. Go 1.20 requires a minimum of go 1.17.13 to bootstrap.

See: https://go.dev/doc/go1.20#bootstrap

This patch is in preparation for bumping the host-go package to >go1.22.x, which
requires a minimum of Go1.20.x for bootstrap.

See: https://go.dev/doc/go1.22#bootstrap

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 DEVELOPERS                                    |  1 +
 package/Config.in.host                        |  1 +
 package/go-bootstrap-stage3/Config.in.host    |  4 ++
 .../go-bootstrap-stage3.hash                  |  3 ++
 .../go-bootstrap-stage3.mk                    | 53 +++++++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/go-bootstrap-stage3/Config.in.host
 create mode 100644 package/go-bootstrap-stage3/go-bootstrap-stage3.hash
 create mode 100644 package/go-bootstrap-stage3/go-bootstrap-stage3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a6364cdd44..abcf29b2fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -595,6 +595,7 @@ F:	package/fuse-overlayfs/
 F:	package/go/
 F:	package/go-bootstrap-stage1/
 F:	package/go-bootstrap-stage2/
+F:	package/go-bootstrap-stage3/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index f03ca16b7b..9543a22ffc 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -46,6 +46,7 @@ menu "Host utilities"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap-stage1/Config.in.host"
 	source "package/go-bootstrap-stage2/Config.in.host"
+	source "package/go-bootstrap-stage3/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go-bootstrap-stage3/Config.in.host b/package/go-bootstrap-stage3/Config.in.host
new file mode 100644
index 0000000000..1714c2fb15
--- /dev/null
+++ b/package/go-bootstrap-stage3/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.hash b/package/go-bootstrap-stage3/go-bootstrap-stage3.hash
new file mode 100644
index 0000000000..b1aed10c7c
--- /dev/null
+++ b/package/go-bootstrap-stage3/go-bootstrap-stage3.hash
@@ -0,0 +1,3 @@
+# From https://go.dev/dl
+sha256  dc806cf75a87e1414b5b4c3dcb9dd3e9cc98f4cfccec42b7af617d5a658a3c43  go1.21.8.src.tar.gz
+sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go-bootstrap-stage3/go-bootstrap-stage3.mk
new file mode 100644
index 0000000000..553256bcb8
--- /dev/null
+++ b/package/go-bootstrap-stage3/go-bootstrap-stage3.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# go-bootstrap-stage3
+#
+################################################################################
+
+# Use last Go version that go-bootstrap-stage2 can build: v1.21.x
+# See https://go.dev/doc/go1.22#bootstrap
+GO_BOOTSTRAP_STAGE3_VERSION = 1.21.8
+GO_BOOTSTRAP_STAGE3_SITE = https://storage.googleapis.com/golang
+GO_BOOTSTRAP_STAGE3_SOURCE = go$(GO_BOOTSTRAP_STAGE3_VERSION).src.tar.gz
+
+GO_BOOTSTRAP_STAGE3_LICENSE = BSD-3-Clause
+GO_BOOTSTRAP_STAGE3_LICENSE_FILES = LICENSE
+
+# Use go-bootstrap-stage2 to bootstrap.
+HOST_GO_BOOTSTRAP_STAGE3_DEPENDENCIES = host-go-bootstrap-stage2
+
+HOST_GO_BOOTSTRAP_STAGE3_ROOT = $(HOST_DIR)/lib/go-$(GO_BOOTSTRAP_STAGE3_VERSION)
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_BOOTSTRAP_STAGE3_MAKE_ENV = \
+	GO111MODULE=off \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE2_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=0
+
+define HOST_GO_BOOTSTRAP_STAGE3_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_BOOTSTRAP_STAGE3_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_BOOTSTRAP_STAGE3_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/
+
+	mkdir -p $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg
+	cp -a $(@D)/pkg/include $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg/
+	cp -a $(@D)/pkg/tool $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/pkg/
+
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
+	cp -a $(@D)/src $(HOST_GO_BOOTSTRAP_STAGE3_ROOT)/
+endef
+
+$(eval $(host-generic-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
