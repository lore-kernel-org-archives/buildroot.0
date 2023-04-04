Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C7C6FD1D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 19:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8568F40B00;
	Tue,  4 Apr 2023 19:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8568F40B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6pTXPD0xol2; Tue,  4 Apr 2023 19:08:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B669040B13;
	Tue,  4 Apr 2023 19:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B669040B13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4581BF25B
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 19:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44FB081389
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 19:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FB081389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zJDn9YIwpGH for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 19:08:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D4081377
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73D4081377
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 19:08:11 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso37163931pjb.3
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 12:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680635290;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nmVNvR/spA9fEgZlsutEAl/gwtEX54GEx83HkYkmVHs=;
 b=m6tmRiH9vorAE6y3X6YZmuThk0348gxwVPFO76nldkz8YKAXLlq0DHsNn1aJsBhJ4h
 /tFNdK9BJGJJCPJwSweLgRvWTpZkw8AriDwS8JLLzOJkJVc0N6h9b4dC9pQqTQkrXrDM
 TwqIEaLGwIOSDvo6TquApGBJBl3asE74CefcRyGy1ZX59fMDOiPeK5zMKUF0X3a1KeAN
 3/CmSJzWN4lsGXRkMz93Y1PMOnDQ1PAcbUsAJWw6F0ETwhjs1ulp4EeeU1GlgIx6wKbT
 86CJu/BrWWzgYaJLAnonQNGK/pahX4g/Hn5MtmDLB0HVf1c1+dZPl9znxDH6dIurb1yC
 TVow==
X-Gm-Message-State: AAQBX9ftBXa22TPz06NZKllmqvMlI1ABWCLES3FJGDSFk2WOYuM5WRQt
 TXnnztNZ1712Fj8Q/48KAOHusFFtMvw=
X-Google-Smtp-Source: AKy350YKmfxJuL+7MB1nnQAsryCz6vG4r1suLjZzUlXUJaSKmc3DA+4EgmVdsPLxSLzp9vmo6YelwQ==
X-Received: by 2002:a05:6a20:2a10:b0:dd:9f07:626d with SMTP id
 e16-20020a056a202a1000b000dd9f07626dmr3107989pzh.44.1680635290404; 
 Tue, 04 Apr 2023 12:08:10 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 j7-20020aa783c7000000b006251e1fdd1fsm9078674pfn.200.2023.04.04.12.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 12:08:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  4 Apr 2023 12:08:07 -0700
Message-Id: <20230404190807.250768-1-christian@paral.in>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.19.8
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.19.8 (released 2023-04-04) includes security fixes to the go/parser,
html/template, mime/multipart, net/http, and net/textproto packages, as well as
bug fixes to the compiler, the linker, the runtime, and the time package.

Fixes security vulnerabilities:

go/parser: infinite loop in parsing (CVE-2023-24537)

html/template: backticks not treated as string delimiters (CVE-2023-24538)

net/http, net/textproto: denial of service from excessive memory
allocation (CVE-2023-24534)

net/http, net/textproto, mime/multipart: denial of service from excessive
resource consumption (CVE-2023-24536)

https://go.dev/doc/devel/release#go1.19.8
https://github.com/golang/go/issues?q=milestone%3AGo1.19.8+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 89e2fd952f..5488ed9710 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  775bdf285ceaba940da8a2fe20122500efd7a0b65dbcee85247854a8d7402633  go1.19.7.src.tar.gz
+sha256  1d7a67929dccafeaf8a29e55985bc2b789e0499cb1a17100039f084e3238da2f  go1.19.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index a94603f268..37554ddf86 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.7
+GO_VERSION = 1.19.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
