Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E6FED3CC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8487A42802;
	Fri, 24 Apr 2026 13:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTqKrVN_kpib; Fri, 24 Apr 2026 13:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6CEB42816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037775;
	bh=CRyW/AbCtoS4btVGXykpd2wQquyfIaKYViojV8ZBLZY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pM9BhHWei453eiOLMVgb+QCJ5WHIABjgGOwPRgtzt6Q4t2Roe4HP5hbfBMGvoE2o9
	 U9z0YZNCuG0f5hdI9kG7MeW3o6D5bYQr8t1vaLJDLjAKxwTZo8Hw4HW8J4OqqYbaEW
	 xFqJ6GgIg89nlVoxYUD/vNgOldsesNeE2UOL/uCDBT7jpAUihzpLYs7RpwOtwXDf0C
	 VJdns+n57bZzMX+I6/3YsuAK+5EmQ13QWIQKQHwcMj/AjhPG9BVNi7V/4gSD7fPu7z
	 TXzLbWPy375ViUPdo33pJjH/ubJ5AR/a0e1qYhkljR0vnQncQ4f6G+I5mzTz7Evlq1
	 OW81DjxukS9aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6CEB42816;
	Fri, 24 Apr 2026 13:36:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA72D24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B527342300
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8hkEKfJZYyH for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A6228400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6228400BA
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6228400BA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 8E21158350B
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 102F83EC17;
 Fri, 24 Apr 2026 13:23:45 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:26 +0200
Message-Id: <20260424132326.825570-12-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFzyjFUCDCqfqQMANVK54121/dpjJcklBDr2aY0SQnEiDGYI+sdxNosxexLF7zgvGi/0S9J3MFBLa1UMw+3lC8h+5TY+3VZcJ+Z0W0Zc6kwPhHWbSfKSRLJ3YuT0AQ+dkguxsrpXxYxGwZVQWkvhFYMbbk/kq2zmCaSGUnvH3vbroFmTLsW67TWGK/iccCe+cL18Atr0ku2+Chn2Y0HJvPg6NFXBrJuwMpsfLfP48H0ZjfPTmflDMKpBgsXVNYmHf/4w6ZaoQgaVFAwq2AEPN6/L4o9B3/zUqB7wzns9pmv361LiKwts7DgcCHSqbKV8Q6PiARPsxz/T/i4U8W5cDG+gH1NKqHWj3y/D3y5DtpaqlHnjoy/jNg+CI2hHz1XOtOqPZdH6J0M9KXcvI+SVqZn0SeQv1hY1x5wWbRgrmtHYKYQjJD0pxyepIYAzKUBGnNn63OAf48aRk3PH8f3pPzkUNAih8Du5Sgq2pxDiuyT3acbJaYkHokwT9FCnfjLZvknTLzvpXwgjl5tEULuZ0No+29+VJykbKYPfy3zk9e9Own4dqVTHb/btn2D5+CigPjBKNDcsp+rlHlDfbD6qLi1ErsR4gFDFmaIAlyX6vCAFkFQ8WeKChWMMb54Xfl8xEKO9lZ0Kq72c0m6668VoYDwFVQJz6K3iHR7JVNIzrkmLw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Py6PDw8dAeZkADcBp/h/J/Ko/76ZsiNwt2tuqcIaQp8=;
 b=LhAMMvGuIZ8NZhj27GP6gPM1ZGx1IrZ4wJFOO5oE9eaYNjMpO5qGaFPtMEGja8OESiWr9E
 HWTWd4DB3Rz61wwn8vHzYB1GcMAwpVjR2UGhxqNkJC5Ex2nRXYc2W7l21kIADi+HBl4MUV
 nUlpf5B2B+QvXNs0rqBg6RqQ28jUv5gEeUwyrknLFCY/R+KmV5dSt7BvjWrnW2KNj4CWqz
 ixGfCWoDOgtVmGvbRDFbKJ+fner0x/YPuPFePKR1UfBn/Cjrvy1xsxoQ+wDmiiKMNVNT/h
 y1XzrRwlzji6gU5Pus4eOuG7x7UzqHvNVmVV2Ozv7zYLqOR1gI3XR6CT4YtBqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=LhAMMvGu
Subject: [Buildroot] [PATCH 11/11] package/libglib2: add m68k ColdFire
 support
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On m68k ColdFire, libgio exceeds the default 16-bit GOT entry limit
(8192 entries). Add -mxgot to use 32-bit GOT offsets.

Also enable b_staticpic=true to allow linking static internal
libraries (girepository-internals) into shared libraries
(libgirepository), which requires position-independent code.

Disable sysprof profiling support which is not useful on embedded
targets and adds unnecessary build complexity.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/libglib2/libglib2.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cae8a85a28..8f8360e635 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -55,12 +55,17 @@ endif
 # containing ${libdir} in gio-2.0.pc. Indeed, a value depending on
 # ${libdir} would be prefixed by the sysroot by pkg-config, causing a
 # bogus installation path once combined with $(DESTDIR).
+ifeq ($(BR2_m68k_cf),y)
+LIBGLIB2_CFLAGS += -mxgot
+endif
+
 LIBGLIB2_CONF_OPTS = \
 	-Dglib_debug=disabled \
 	-Dlibelf=disabled \
 	-Dgio_module_dir=/usr/lib/gio/modules \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 LIBGLIB2_MESON_EXTRA_PROPERTIES = \
 	have_c99_vsnprintf=true \
@@ -118,6 +123,10 @@ else
 LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
 endif
 
+ifeq ($(BR2_m68k_cf),y)
+LIBGLIB2_CONF_OPTS += -Db_staticpic=true
+endif
+
 # Purge useless binaries from target
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
