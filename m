Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD33C76196
	for <buildroot@archiver.kernel.org>; Fri, 31 Mar 2023 19:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB64E84720;
	Fri, 31 Mar 2023 19:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB64E84720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwOQVyAKbQol; Fri, 31 Mar 2023 19:18:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91A3A8475D;
	Fri, 31 Mar 2023 19:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91A3A8475D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C38E1BF329
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 19:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA42C8470E
 for <buildroot@lists.busybox.net>; Fri, 31 Mar 2023 19:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA42C8470E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0f5sQFgPyR2 for <buildroot@lists.busybox.net>;
 Fri, 31 Mar 2023 19:17:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1511184711
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1511184711
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 19:17:58 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id u10so22199098plz.7
 for <buildroot@buildroot.org>; Fri, 31 Mar 2023 12:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680290277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2QJZ6p6RmDl9XMoxlPdvpcRqCI0ANgaMvHd7BjRdmqo=;
 b=eECyBoXcEgQT64OI5yqaPiD7EY5AhI0OiE63v4cFKAILybPEOcw15CqNt50lem1Zet
 /RRjB20hJeKwY8PwGyBMcjhqkviNcFUotc4jClMz0mb2YH/s0KNzp+Cq/ipfZ32lGEd0
 IE2KtsFMPzOWkQxUWrPaFC5ouzauzxkvhGD+yH3TBRVL1irb2ALnkFx/Bk7GctZNShIZ
 kmmjYLO6lPqhPyeCudE6MuftdOZTzLfqWiorgnYlYxGa9edO1uluyZBHijpPsFrc0xAM
 f4wBg9ihtyiCX+3OjOxC3cclVLUwkbsRmXUnUXQPNRnnEyqSKJNF5EjNyBpsSGVBC1eu
 qR6A==
X-Gm-Message-State: AAQBX9fb8qKA2+WajSARk7kWN2PfOaoS3gmWksdsTbdRb2qhzBsyyZOa
 gJaEXNBdJIYV5jVGYsmCWuymcRZPy68=
X-Google-Smtp-Source: AKy350ZRbwxnysELtdEZOVChRNktNhN2yIxEX3TL5y2U1su9J7RPgl8hR0U4nKk6f5IJCmg08eOnIg==
X-Received: by 2002:a17:902:d14b:b0:1a1:b440:377d with SMTP id
 t11-20020a170902d14b00b001a1b440377dmr23632250plt.2.1680290277076; 
 Fri, 31 Mar 2023 12:17:57 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jd12-20020a170903260c00b0019e8915b1b5sm1928268plb.105.2023.03.31.12.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 12:17:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 31 Mar 2023 12:17:52 -0700
Message-Id: <20230331191753.28826-2-christian@paral.in>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331191753.28826-1-christian@paral.in>
References: <20230331191753.28826-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/3] package/go: adjust comments
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adjust comments in the Go package to improve clarity:

Config.in.host:

 - Add comment mentioning list of supported architectures.

go.mk:

 - Improve formatting of comment about NOCCACHE
 - Reword comment re: copying src/ to host/
   - the previously linked issue is not relevant.
   - instead: mention that src/ is needed for stdlib.
 - Adjust comment re: adjusting file timestamps.
   - mention this is needed to avoid rebuilding stdlib

Signed-off-by: Christian Stewart <christian@paral.in>

---

v3 -> v4:

 - move these comments to a separate patch
 - Thanks Thomas for the review.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/Config.in.host |  2 ++
 package/go/go.mk          | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 90a54f0da6..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	# See https://go.dev/doc/install/source#environment
+	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
diff --git a/package/go/go.mk b/package/go/go.mk
index 13fff792af..126d8ea46b 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -121,8 +121,8 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+# The go build system is not compatible with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
@@ -154,12 +154,11 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
-	# There is a known issue which requires the go sources to be installed
-	# https://golang.org/issue/2775
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
 
-	# Set all file timestamps to prevent the go compiler from rebuilding any
-	# built in packages when programs are built.
+	# Set file timestamps to prevent the Go compiler from rebuilding the stdlib
+	# when compiling other programs.
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
