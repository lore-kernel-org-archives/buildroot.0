Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F759C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 06:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9088983E9C;
	Mon, 18 Jul 2022 06:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9088983E9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52zOeizOpLsc; Mon, 18 Jul 2022 06:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 890F083E87;
	Mon, 18 Jul 2022 06:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 890F083E87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7DEE1BF97C
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 06:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8126760AC3
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 06:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8126760AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDcR9qN34H1p for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 06:35:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84DE760774
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84DE760774
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 06:35:50 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id y2so8520956ior.12
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 23:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g19EXdEvzyNtXQy2P9uS6qg+GgCej3YWKeR20SaZEiU=;
 b=aNNjTrvc5S/se2vbmRm39EvaA6QNlwH1buy3AMp7LDAK6IhVMQtPTMbBEGalMXnrFj
 DSCX4cnGtU4X2cmXI2VAes39BuqtE/OzZ2s257mgVko+xlMJ7fMe4Llwr/8Mb07L19GJ
 ZL+Sb5sqkQNuPDh5dY9xJ1CR54A5ab/vBEi0SoH7QJing6kn0ykePOLjeCTV42YqqnNx
 y9TWGvmywtbatnjmAN/jYxTwWlSykjgIluuv+cZQ1OrxgQB5Czmn8nGne8n0LDJ36zgA
 eczLxzS93ayclntFnla1KKHGIfHe2T4IIPE8NCyEnQePahM9/dG9MKqA1/av5hpJS1Dn
 u+hg==
X-Gm-Message-State: AJIora9JRcUi8IcYBXYFCGWxfDh5RmtC3eNAPgH+pR22fyDF5kITc+Vy
 U0CuMbe7zQVsqMk0+50TKduaZ8MNaNip8g==
X-Google-Smtp-Source: AGRyM1uTtFKN54yHtYFeeU7MhKV93ipFjpypD9icp4DePy41Yo86z8l5OUfN27SjYxjtVtSwQ/sbFw==
X-Received: by 2002:a05:6638:63a:b0:33f:2630:8755 with SMTP id
 h26-20020a056638063a00b0033f26308755mr13696892jar.182.1658126149297; 
 Sun, 17 Jul 2022 23:35:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-222.hlrn.qwest.net.
 [71.218.105.222]) by smtp.gmail.com with ESMTPSA id
 i31-20020a023b5f000000b0033f027c2dbcsm5156400jaf.156.2022.07.17.23.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:35:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 00:35:45 -0600
Message-Id: <20220718063545.3481147-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g19EXdEvzyNtXQy2P9uS6qg+GgCej3YWKeR20SaZEiU=;
 b=X1plto1cJuAX1TeJzMxwWbvtzJ5Z8+q9XrYsp//7nOrdQNRkbmCx0TljwaEMF3QDix
 /8QRdA2DgAQ/cVzKP5FA68HLglEZ6YXeyldFlflUeV+u3yj+0k8FWFjyl3JW51IMDRA9
 yWFMOZvAcoFQPR/ZlFZlOdzJCf/BzNGnWUCbw6KwE0d46XS+1COvjSuzxaWfujFSQ1da
 DJg/ZXE27vKBAd4N6k+i50QsE1bB2zz7IUZdK0K3WvbCPbdrRYTDg0gV8UsMRzQJU39i
 qEJhiJv1TrQ4xjnCWS+RwZLsdgZX+UZjAZ3lOe2X4V8QeZxJQoM8r002gzSKbP/VjehX
 +3jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=X1plto1c
Subject: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: fix/update
 version to v11.0.0-269
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It appears that we were using a release branch instead of a stable
tag, since spirv-llvm-translator doesn't provide normal release
tags for clang v11.1.0 lets use a commit-ish based on the closest
tag.

Fixes:
 - http://autobuild.buildroot.net/results/157/157e85ab3445b0852d999b747765a0a020e90c06

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 02d8c20d08..6133b1326a 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  8df057ceb2e08792f87c1e01209ccd32d0fd5858f0e5c8797a96555e4a78565a  spirv-llvm-translator-llvm_release_110.tar.gz
+sha256  bcb0e5ae2d15f9876551fda46b222f911ed5afd626dfbcc66ddea9d36563ac9c  spirv-llvm-translator-v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 22f8765582..73f7fe02de 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-SPIRV_LLVM_TRANSLATOR_VERSION = llvm_release_110
+# Generate version string using:
+#   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
+SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
