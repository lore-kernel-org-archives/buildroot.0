Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7534EC43458
	for <buildroot@archiver.kernel.org>; Sat, 11 Jul 2026 11:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6F3860D89;
	Sat, 11 Jul 2026 11:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGrHWVtu0gAg; Sat, 11 Jul 2026 11:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81BAE608E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783767816;
	bh=19N/7dL/1SROe4hyh9zxlZBngYmr1jveJ9RfAQwgzQ8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ltgF9NsI+BbPPyez6kYGHp9inOuZbAebJKFY4ycXM3SN8SjzEWIxlUVb8F/fk8fH4
	 DGJaNSCuE4Vtv8bfzTJwx+kfXmrqnhlXFQPZ5nAA93O2j8eecjPj9jNRMepmYivCMg
	 MhMw5gUYqwMqsk+6JGtjqS1D6OYB62+P28+iLGuyjxInSnKHoh7XAqLxnFzifDFN/I
	 NKy0aZ/3nyKUwzU2gijS4eJSHYSOStOhR1yWMDQsNbD5uutI8zd4vSjyqp9Z6WBeiR
	 usu5ttWA6FMh2eq8v2d8WAfRuQy/NGeboRXWlDlybj0PqjUHNvnao8Fpmx+4SeHed6
	 +qlsivPJ1XiHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81BAE608E0;
	Sat, 11 Jul 2026 11:03:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F5CE22F
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4109B8179A
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dca07pvxG5gT for <buildroot@buildroot.org>;
 Sat, 11 Jul 2026 11:03:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D508A816E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D508A816E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D508A816E4
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 11:03:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB8DEA4C1B72
 for <buildroot@buildroot.org>; Sat, 11 Jul 2026 13:03:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44176)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wiVUV-000000005Zg-2QP3
 for buildroot@buildroot.org; Sat, 11 Jul 2026 11:03:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Jul 2026 13:03:27 +0200
Message-ID: <20260711110327.862832-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783767808;
 bh=VcBRh2OSaJv5WTvYYUIu38j332Bys+TzB45VNm2TiEA=;
 h=From:To:Subject:Date:From;
 b=k09PVr7bWsBmoGfITCnzXtl0P1Lh8vdbaeR6RnMWk81yDw05hmc8XFBrtc4OvHWHq
 6vOkh1xjSi0a9/f+plCVY8k33y16Fg9Mk4mbM00y3EZ5c4SGPCQ54Mc5fO5JsDbVP6
 ocaDPycc3NrtZbsLuYM1huksgHCk9VVAwM4rpe/JzHZ3fIxWlbRht8X0vsTZjYFhpC
 H11oDZeb1SBwA9azxj7Q58rybuufxgQmSddBoPAbwtXvbyNOyd9qYB1Wq6ahZfBrfH
 Sh1Uzt1hI+hZAz66JuhyDRNRGx5slNPrco+x/roE5h8I5Ipqql973cdaszo+XklTpH
 RqWCdW0wIOwRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k09PVr7b
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: force -O2 on i386 with
 gcc >= 15.x
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

Fixes build error on i386:
pcm_dmix_i386.h: In function 'mix_areas_16':
pcm_dmix_i386.h:52:9: error: 'asm' operand has impossible constraints
 or there are not enough registers
   52 |         __asm__ __volatile__ (

Fixes:
https://autobuild.buildroot.net/results/fd9/fd9e6a6f9e2d37df3cfc1ed36707aef9a338f24d/

The oldest build error to be found dates back to Nov 2025:
https://autobuild.buildroot.net/results/3b6/3b606e0c6160563e410535d38a0e7bb09041f223/
so a backport to LTS branches should be considered.

The build error does not occur with gcc 14.4.0 and was reproduced with
gcc 16.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d022d480a4556f21d86172a593a92288018ed116

 package/alsa-lib/alsa-lib.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index b6000b3cf3..40dbe0600d 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -18,6 +18,10 @@ ALSA_LIB_CONF_OPTS = \
 	--with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
 	--with-ctl-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS))"
 
+ifeq ($(BR2_i386)$(BR2_TOOLCHAIN_GCC_AT_LEAST_15),yy)
+ALSA_LIB_CFLAGS += -O2
+endif
+
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 ALSA_LIB_CONF_OPTS += --without-versioned
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
