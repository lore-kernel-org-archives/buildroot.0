Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBF7C4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 13:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D51605FF;
	Sat, 20 Apr 2024 13:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoFMydRlbsKr; Sat, 20 Apr 2024 13:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAFC260626
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAFC260626;
	Sat, 20 Apr 2024 13:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 278641BF369
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 13:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E1A40744
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 13:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiW4OCUSYRnv for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 13:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9996240728
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9996240728
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9996240728
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 13:23:05 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DB4E2B0037C;
 Sat, 20 Apr 2024 15:22:59 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 15:22:51 +0200
Message-ID: <20240420132251.1349622-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713619382;
 bh=wDyCGWAwh7LCNgLcUmEUvS2oR74UenwMYotRciLtxJ0=;
 h=From:To:Cc:Subject:Date:From;
 b=BTqIPbYeFzqVMa9qFKIHXqRi4OXEPf/76i6BZCxO4Yg6y0Qqej1vONXauKvUk7OGh
 6Qmn4E7tXIRacHeVfYyekh8GnVJBeFIzAB6riEAkm9eioJ6fO0QdIJlseLKXN+qVaG
 XaOUqck4MqOOqRhLr7kPeiEsuwvI8RCJ/U0ERxNjAnQHt0y8If29o5RDZ32jJWQwIV
 RhR4glffRk2LFjP8NSh+mEQfivvn9F0zbsEugIL7bqmkI5lw1I9Lr3GKAw3ezriB+s
 WZkatUkGyw6XfVUdlCF8eNLCVcIVJjBqtzI4QAdRTYw9HxVO1o18TRSlvmymbutN2F
 Ief2UWem2/Q0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BTqIPbYe
Subject: [Buildroot] [PATCH 1/1] package/fwts: disable parallel build
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fwts randomly fail to build in parallel with error:

    mv: cannot stat 'dtcompilerparser.tab.c': No such file or directory
    mv: cannot stat 'prparser.tab.c': No such file or directory

This is a known upstream issue. See:
https://github.com/fwts/fwts/issues/7

This commit workaround this issue by disabling parallel builds.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fwts/fwts.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index f06609777db..cf3243c437a 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -14,6 +14,9 @@ FWTS_AUTORECONF = YES
 FWTS_DEPENDENCIES = host-bison host-flex host-pkgconf libglib2 libbsd \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	$(if $(BR2_PACKAGE_DTC),dtc)
+# fwts randomly fail to build in parallel
+# see: https://github.com/fwts/fwts/issues/7
+FWTS_MAKE = $(MAKE1)
 
 ifeq ($(BR2_OPTIMIZE_0),y)
 FWTS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -O1"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
