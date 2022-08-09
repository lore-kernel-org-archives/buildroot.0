Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB32C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 21:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE9F540232;
	Tue,  9 Aug 2022 21:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE9F540232
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mJXObIHD7d8; Tue,  9 Aug 2022 21:59:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D13644013B;
	Tue,  9 Aug 2022 21:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D13644013B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 080DD1BF228
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 21:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3F104013B
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 21:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3F104013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66YjY4h2rT_E for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 21:59:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D63400E4
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53D63400E4
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 21:59:32 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id z16so15679328wrh.12
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 14:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=kIpjFQEFQ1kS45tLJAlpgGTQJ61KWwr8Mj9UMPTCgaM=;
 b=bol3okI8KNT0eOgJd6rUprk2XSfDRrDfnMs4bm0Jk8sV0kcjByw7xzB2xeM/600izH
 hjGpezqERm8yTvTdxc42XK3at6ZQdq/5Qmk/u+7+ZhQhploxD+7Oc2GU+q90ZwyihqXX
 nO7wIJSRWC8IHVgCidPNTQXmtAasuJdm5bUvTT1yWS/8t/V8UScgQNvyb3avGgM3COrB
 erTLNmVIpAZI0tnUDpHXZVoDDjd7eeGRNHBgE7iqy1ei8HFbBHALhB7YISCytyNvnqte
 CLqMidQlcnfAMmCWNK8+VfwE1eiAncqcJ69kxZQFHMy69dxGY3Si93w2snBemn7byLKq
 sskQ==
X-Gm-Message-State: ACgBeo1Z4OfI2P+CITTvESj9yAYFyqyKOKWMQdwRfqi5HXaCXmq1dHpR
 +XCd7yKLwb1Gp14YaDd4ZNhfSY9eV8c=
X-Google-Smtp-Source: AA6agR6wQKMXWupRmp6LZLd8rEuneJkaOOlqrqpzZcEfNQbCc2ZWXSJNqZjCvf5SSnQwoRyLvgNVGg==
X-Received: by 2002:adf:d08d:0:b0:220:6b8a:140d with SMTP id
 y13-20020adfd08d000000b002206b8a140dmr15872441wrh.272.1660082369979; 
 Tue, 09 Aug 2022 14:59:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b003a5ad7e5b98sm130595wmq.31.2022.08.09.14.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 14:59:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 23:59:15 +0200
Message-Id: <20220809215915.2740950-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=kIpjFQEFQ1kS45tLJAlpgGTQJ61KWwr8Mj9UMPTCgaM=;
 b=OFC+pL+5hH0LrCqjGS6EPlqIrWFWOEdtEIUCoFQNv0RBQk2Pnum+M8ovJt0jyt5tgQ
 XaKXHunGwJXNjK4IVvjgumXCx1pUMs9uJVNUSeZlYhup94CZP9vv6Z2RZlO/Jicd2ZVm
 YNysaXoVL/IfYzock4zMjkh3txzSipthLDBKSCovcJEitYddkPQLwQvESSjxA1AZbJ4h
 k0/heXo46WKclq/P2I+IeKFvt3Qpf67QJ4+CJURpDKq6oVJWEtQ6oL2wiR+gTLcN5PvW
 Y648x/K3DTjuyEJ25cgw3Cnta5S+Ge6F1xl5tp2C9H24x3yUAKDh0GaS7VQQrg0OqKTC
 mQsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OFC+pL+5
Subject: [Buildroot] [PATCH 1/1] package/ficl: fix musl static build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass LDFLAGS to avoid the following musl static build failure raised
since the addition of the package in commit
814911aecb6d49bb603c34dbfcc0d86614516b41:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
/home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'

Fixes:
 - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Makefile.linux-pass-LDFLAGS.patch    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch

diff --git a/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
new file mode 100644
index 0000000000..2138089b0e
--- /dev/null
+++ b/package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch
@@ -0,0 +1,35 @@
+From 33b16f2c4f996a98c3bbbec9af542d020ac276fa Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Aug 2022 23:53:06 +0200
+Subject: [PATCH] Makefile.linux: pass LDFLAGS
+
+Pass LDFLAGS to avoid the following musl static build failure:
+
+/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/../../../../sh4eb-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/sh4eb-buildroot-linux-musl/11.3.0/libgcc.a(unwind-dw2.o): in function `size_of_encoded_value':
+/home/autobuild/autobuild/instance-5/output-1/build/host-gcc-final-11.3.0/build/sh4eb-buildroot-linux-musl/libgcc/../../../libgcc/unwind-pe.h:89: undefined reference to `abort'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bf041723ed813746c61892262630a3ac2bc43b14
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: upstream is dead]
+---
+ Makefile.linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.linux b/Makefile.linux
+index 5f1a41f..df887e6 100644
+--- a/Makefile.linux
++++ b/Makefile.linux
+@@ -14,7 +14,7 @@ MAJOR = 4
+ MINOR = 0.31
+ 
+ ficl: main.o $(HEADERS) libficl.a
+-	$(CC) main.o -o ficl -L. -lficl -lm
++	$(CC) $(LDFLAGS) main.o -o ficl -L. -lficl -lm
+ 
+ lib: libficl.so.$(MAJOR).$(MINOR)
+ 
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
