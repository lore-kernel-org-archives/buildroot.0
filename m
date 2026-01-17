Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A8C9831C
	for <buildroot@archiver.kernel.org>; Sat, 17 Jan 2026 10:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0013B41534;
	Sat, 17 Jan 2026 10:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcsqC-msAmo8; Sat, 17 Jan 2026 10:45:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BC3414E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768646744;
	bh=2yl+9RNMx365uHnZSVJQqoFVgxgtytCv7fYNRQlqGHM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Pz8HLhE06r/fCD/D8AlKHxs0Ng7s0KY2/7LimqE4PV38svPFRMEBpjwbaqx9MccRH
	 LNBuvjmQetj5GixyVk99qGDLRLAyJoJbuy1AgCwZ42JJPq5gfhmUChXaM98nD4CqWb
	 +zgOR1VYMW89bXp+7Ag8jIrCq59hHfKeu2+gXzOh+BkbALk4bTh7MVTpeVKUZd9Odu
	 9Cdps61eS2I1jHFun0xWr1roc86ItFmWMnX9zwH6m5CZvCy3Gi1IleSTiR2obekOVa
	 9w57bwQ08qnPNidTmTZ4v9+u530Ve/jTopvL26fOdctku97rNHyCcZVCFODdDmL6y5
	 D4l2CWXacbRPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96BC3414E2;
	Sat, 17 Jan 2026 10:45:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 639552CC
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A3AB8443F
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goeY2DEqHg2r for <buildroot@buildroot.org>;
 Sat, 17 Jan 2026 10:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C2B184420
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2B184420
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C2B184420
 for <buildroot@buildroot.org>; Sat, 17 Jan 2026 10:45:42 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7F47419F73F;
 Sat, 17 Jan 2026 11:45:38 +0100 (CET)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 17 Jan 2026 11:45:16 +0100
Message-ID: <20260117104516.87829-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768646740;
 bh=QrivmeCvHoN31uTlnlSAQWbPukxTdFqiXYlV/bnI9Lk=;
 h=From:To:Cc:Subject:Date:From;
 b=umLPaapP9Kq0oKisNoWwN7Tr49U1VijhHVA/5UTKHTM8VIDD1dVuyghEptRXWlQLQ
 QyusS7FJe0Ee+46BKTYsI033/M7siYT9qXMyb8HvNxSoOPd41FYLksF4nXpo1Axcc8
 r8Jcog46YQaUw1dgb6S1zmpn1Qzx1v3CUPnkfvbNcDhGJ6K9finjkOvuX8CRJsBEWY
 RjVUX5+jXMzVTuOYKhHH035aw2nxhl0ooRDUkOu4H6tD76InoNCwaTM3hbeORdNony
 bK2bvigN/a17KgHBENJOG9GncngvZzXtwE4Py2bTslhQtAfNtsNPYjqvAZb4IPKBhw
 KU3PfSjKVglXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=umLPaapP
Subject: [Buildroot] [PATCH 1/1] package/util-linux: always disable man
 pages and translations
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the host system has asciidoctor and po4a/poman installed,
util-linux detect them and automatically enable manual pages and
their translations. This can significantly increase the package
build time (in my case, from 20s to 1m50s). See upstream
commit [1] and [2].

Since manual pages are not needed in Buildroot, this commit adds in
_CONF_OPTS for host host and target variants the options to always
disable the detection of those programs (--disable-asciidoc
--disable-poman). This will always disable the generation of manual
pages.

Note: Buildroot attempts to globally disable documentation for
autotools packages by passing various --disable-docs configure
options (see [3]), but those are not recognized by util-linux.

This commit also reorder the options for UTIL_LINUX_CONF_OPTS.

[1] https://github.com/util-linux/util-linux/commit/9acfc349e0ea68a92baf818cc659121f40ab9c04
[2] https://github.com/util-linux/util-linux/commit/236421a49103ea510bcba1e7ef90b57d24aeab76
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/package/pkg-autotools.mk#L184-186

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index d0a03be404..af6044af32 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -47,8 +47,10 @@ UTIL_LINUX_DEPENDENCIES = \
 # system is not Y2038 compliant. util-linux will support year2038 if
 # the system is compliant even with this option passed
 UTIL_LINUX_CONF_OPTS += \
-	--disable-rpath \
+	--disable-asciidoc \
 	--disable-makeinstall-chown \
+	--disable-poman \
+	--disable-rpath \
 	--disable-year2038
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
@@ -57,6 +59,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
 HOST_UTIL_LINUX_CONF_OPTS = \
+	--disable-asciidoc \
+	--disable-poman \
 	--without-systemd \
 	--with-systemdsystemunitdir=no \
 	--without-python
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
