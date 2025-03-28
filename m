Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9270DC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 21:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2320E6064E;
	Fri, 28 Mar 2025 21:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YB42lgLmUTAc; Fri, 28 Mar 2025 21:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EE360658
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EE360658;
	Fri, 28 Mar 2025 21:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FDAF1AB
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 21:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CACA6FC1D
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 21:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37fqUkykjj4k for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 21:38:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8148860EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8148860EC2
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8148860EC2
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 21:38:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso18836245e9.0
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 14:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743197906; x=1743802706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ValgmisHBAP3iOKM2g7GIErB6btzGUcq5BC2buLpmF0=;
 b=ao3owCsbpHgOUn18pjn8KwdLJtzhHU1bXAQlghDezwquRa0KyCL/vdkqNzBp8zGhmX
 tlXBZsKt+DQZ9VI1xK4F/BVKCfe70PSRFUbbT1fgdpzoqoXu6YjPliubPLN/hONl1qz3
 otsboN2gvQRnJoLSYPDgWmbFfxXB87Uk5Q+CsNKWzVLSSxyoEenh1tunywyTZEg23Mi1
 emWfgZyQqKfxtwlIGmyjTSKi2y85dmOQq1ooylabvItIRpwA0+Jzd219Hull7ElhcJZs
 5jYn5aed2l61csTXxyoYrzmjAzDF0AWwfl6PsLae4BiwodA7R0lmjb5XEQ9r9Lh7p/es
 obMA==
X-Gm-Message-State: AOJu0YwPhxWFHSwGGhJbwSwq9zhiBkZfVaBa36Nv+EXlOVUU8fqS7bpO
 jbo03jv3xY/fg/hXyaYlNhrF1YuKmICPvns2Xg1IG9AnkzWWUvIsqQXiKQ==
X-Gm-Gg: ASbGncuz5SvZvuAb9aSCF3Ep8vrc6Wx/rD7ZG4XJJ9bBqI+8/VoCp5nVAWhY2+TG3fG
 3MhcotKF4Nw8/iON6YeMp0B9drJxNh2QWl1h9qALumSuCFltA6OEQDaIr/vF26m6Sgd+AMI7Tr9
 vzfDgU4mvwh7nZBZ4CpJL5k7UXHhSttTUy0jwxar2u9wxpDQM1h/mYfp2BhWk5QRTw9WW1zjjng
 dxLqAmBfUi6xVAr9W9FHEaBbQS585hLnMhznlKiRKHh9RwS0bNfaTItyYbelnjRk9EpB0zF9tHa
 HzW5Cv/OI0oyjkggl5NXiRAZ80c4UmW/P6cH4a+r2sxNKij9oh6qCcDF
X-Google-Smtp-Source: AGHT+IHEz+0s/kO4ELrAVavxSNsJ8diOMt3NqolU/Ny8P5dIfL/5exAc9vk7+apRYumFu7kq1FHg5Q==
X-Received: by 2002:a05:6000:2101:b0:39c:1257:dba8 with SMTP id
 ffacd0b85a97d-39c1257dc6amr286971f8f.56.1743197906165; 
 Fri, 28 Mar 2025 14:38:26 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66ab6dsm3677123f8f.48.2025.03.28.14.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 14:38:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Fri, 28 Mar 2025 22:38:24 +0100
Message-ID: <20250328213824.4079072-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743197906; x=1743802706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ValgmisHBAP3iOKM2g7GIErB6btzGUcq5BC2buLpmF0=;
 b=g3xpJc/bsubhg+S/Fa/FSVIMtLOI2OHCQYYIxIrNswZjPc59Sq9PUD/1PPS3CwGA1J
 KFx3ucr8e2Z0XhyLXZw5JA+ZX+Bqt9KsRDYIbWfiTdeGQFkX4CT6Slmq9/WEb1Mqn4UP
 KnyoX2g2HHlGklcmtzEDCOEhyx3r0WmEJSBNCig+RdBfeNQgwST58iSENS6HGwkblXmS
 mTj8vdJfjr2Fz+pelzXTlr+inke12AQn+u6JyninYR6NYB/PneumZyT9RXe4X8XwgxR1
 b+zBZF7hxyZ3MQbIpQeqFcY+TbwLsJDuYaLMaWTDTeH0sAyQc5QpOHh8+2tLSoNfq8cm
 Ffig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=g3xpJc/b
Subject: [Buildroot] [PATCH] package/freerdp: bump to latest commit on
 legacy stable branch
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

FreeRDP fails to build on newer gcc:

    /freerdp-2.11.7/libfreerdp/core/info.c:88:39: error: initialization of 'const WCHAR *' {aka 'const short unsigned int *'} from incompatible pointer type 'BYTE *' {aka 'unsigned char *'} [-Wincompatible-pointer-types]
       88 |                 const WCHAR* domain = Stream_Pointer(s);
          |                                       ^~~~~~~~~~~~~~

There is a patch upstream [0] to fix that one, but then another similar
build failure triggers, which is also fixed upstream, but then a third
failre triggers, again fixed upstream [2], but then...

FreeRDP 2.x has been kinda discontinued, and the new stable is 3.x.
However, bumping to 3.x looks like a huge leap.

So, rather than backport, just bump to the latest commit on the
stable-2.0 branch, which carries 12 non-merge commits with build fixes:
    562ae3588 [winpr,pubsub] add NULL parameter checks
    68c7c21b9 X11 client: ignore grab related LeaveNotify events
    a9deecc99 fix [core]: 'invalid hHandle' errors
    052c525e0 [core] eliminate rdpRdp::instance
    be23ed4ba [server,proxy] deactivate capture module
    5b2b53b15 [warnings] fix -Wincompatible-pointer-types
    67818bddb [client,wayland] fix const correctness
    d2b6771c7 X11: fix pointer/integer type mismatch
[2] 7894a7dfc redirection: Fix incompatible pointer type
[1] f3ed1f1ac redirection: Fix incompatible pointer type
[0] 4f411197d info: Fix incompatible pointer type
    a383740a2 next-dev-2.11.8-dev

Fixes:
    http://autobuild.buildroot.org/results/e1b/e1b95b4fb0005d4e933b027b508cec9ad510bd73/
    http://autobuild.buildroot.org/results/ba0/ba0beae13e1be2573878ee50b1566f4427b269a3/
    ...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.hash | 4 +---
 package/freerdp/freerdp.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 1007215cd6..83b83db121 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,3 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.7.tar.gz.sha256
-sha256  5a2d54e1ca0f1facd1632bcc94c73b9f071a80c5fdbbb3f26e79f02aaa586ca3  freerdp-2.11.7.tar.gz
-
 # Locally calculated
+sha256  f7cc2bf43b9778e9079cd229ea8e37fc1843eb1c11a8e4e003034af71858ce6a  freerdp-2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0-git4.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index e8c8f320a9..3a1ba61621 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.7
-FREERDP_SITE = https://pub.freerdp.com/releases
+# Latest, and probably last, commit on the stable-2.0 branch
+FREERDP_VERSION = 2.11.7-18-g0ee17e2f8e49d56ab5b90d5160fa8f87ffc445e0
+FREERDP_SITE = https://github.com/FreeRDP/FreeRDP
+FREERDP_SITE_METHOD = git
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
