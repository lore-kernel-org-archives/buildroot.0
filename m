Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A396C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 23:46:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5096360F94
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 23:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5096360F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA36383C7F;
	Fri,  8 Oct 2021 23:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0aHA_aeH95uR; Fri,  8 Oct 2021 23:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 249DB83C34;
	Fri,  8 Oct 2021 23:46:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F611BF4E4
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 23:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4707783C34
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 23:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTzVnqjxLy76 for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 23:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AA383C28
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 23:46:01 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r2so4525965pgl.10
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 16:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUNcimiyXSWy+9T5SCYqp034hlII9TxGkmZT1Rz5ESg=;
 b=32bb2SfyiXO6iOCxUWm1bQMd4Ym7WojilRrBv6dVpAS9Ddz3AyWz3nHzw7Z6CB+X7Q
 6OVPm828nXpPFrKkBVcy7KlU7SklflSkDJvtN4Ej4SgcVfGmLd1JqXlLy3HmrkNv+IBr
 B5wOyonqR7ijuIpCFm724DKyDwm0HjuGW9XdbWdV5YROwJYcxYQs0ddPYmurIMF7y8hh
 CwlOkAPGeETcyJY9PW/eFxM8eN/DPZYy7qDred6xa17nxS+W3MzU6KvOEGBgT5k+frDw
 JhfY7++QtTKOV55JnW1NOivxvdyVaDsCrQvsL7yMA+ZDMh5mZ7ldzSPKpOJGZ8YpVNdn
 aOvg==
X-Gm-Message-State: AOAM532YwplX61BbYL6cLJvptEeauI34Tii4HZ/XAcD/m+kufjQ3Vv/z
 l7okkM/pTx8CD7DEbcAF6FRFRuGCYY9C/w==
X-Google-Smtp-Source: ABdhPJwOuEKLP6bV/YjM4PgWdWxGG8blZDyBMRpHYlYW7FlQ4HVAUtVpQ3ewWHldy8eXOnbJ37V90A==
X-Received: by 2002:a62:6411:0:b0:44c:bf9f:f584 with SMTP id
 y17-20020a626411000000b0044cbf9ff584mr11735738pfb.29.1633736760235; 
 Fri, 08 Oct 2021 16:46:00 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id j6sm412563pgh.17.2021.10.08.16.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:45:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 16:45:57 -0700
Message-Id: <20211008234557.90956-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-NEXT v1 1/1] package/go: security bump to 1.17.2
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.17.1 (released 2021-09-09) includes a security fix to the archive/zip
package, as well as bug fixes to the compiler, linker, the go command, and to
the crypto/rand, embed, go/types, html/template, and net/http packages.

go1.17.2 (released 2021-10-07) includes a security fix to the linker and
misc/wasm directory, as well as bug fixes to the compiler, the runtime, the go
command, and to the time and text/template packages.

https://golang.org/doc/devel/release#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index d35d6ed572..f5e6492da7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d  go1.17.src.tar.gz
+sha256  2255eb3e4e824dd7d5fcdc2e7f84534371c186312e546fb1086a34c17752f431  go1.17.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 09d9f60cd4..f8bea45c08 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17
+GO_VERSION = 1.17.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
