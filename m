Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB5DCD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3759B81DFB;
	Tue, 19 May 2026 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vivuNEdFrLGc; Tue, 19 May 2026 20:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0965081DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779223874;
	bh=VjDAbAOwgKuLHyAPzE1ZBSNQkqxfrcoEtJC7v23pHjU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QOai+dWtTlfgJz45u0hsFLmNxAzEdA0ortpwM7rKmrC5MXnba7v23RH4A3QLlPN3K
	 t0Ry798ie8MZyncQej1nuXRIUprR1rt+xVML9XJInb47S31VSJIkG0sCr4CLmuAZdY
	 9pv9LZLG3yrNtLJgX+crt8L0Cf206ilsJg6Xwbnq3tiDOdN2jk6opWxDclsEGHeGLs
	 wrVcQwKqiKciXN/DowgNSlFajFPnj2a+noD60VItL0PRsSDmZzcrdrDwWsnwG4TnVT
	 3BY7r6RP/RL/kYKH66YaqD0AagH8E8hK0R5YBtv1bISjQr4Jg2VPxtO3p+QApr1if1
	 BmCPlJ/89fC0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0965081DFD;
	Tue, 19 May 2026 20:51:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 959D7265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78A3D60BE1
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWaq9v9ff5aw for <buildroot@buildroot.org>;
 Tue, 19 May 2026 20:51:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A40FF60BDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A40FF60BDB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A40FF60BDB
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:51:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42C1AA4C037D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 22:51:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48242)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPRP9-000000006JM-0HDA
 for buildroot@buildroot.org; Tue, 19 May 2026 20:51:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 22:51:06 +0200
Message-ID: <20260519205106.1059607-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779223867;
 bh=Os744KoG13N/FQSD6LOjXW5x3dRnJIlew/jQz+dnCCc=;
 h=From:To:Subject:Date:From;
 b=omEAgQjsoDQwlZS3X6gViNg53CigWYeqzWZtY42sCV/6aWBKv6gVSyO1mRiiXWdMo
 HtQfkFCcLARC6pa5DVHddNg/SiY3tj+6ADgA1CmXQ2WJOiV8ztY0w5bSmlqk4W9xEX
 9fRpqAt+wTmr/ldnrExZId/MqgxLCp/nwHDSgs9Esky+wgMgzhPd2ztSlltkEc9e6y
 gAIIKXjs6g623OnhaOdc+zChuTiofhkqWaKIRfEyv+8oiBR6k/9jsAvrUNBaCa4trp
 EoHRLKP73d+O9OkzqIXEfikmnhDyghhe8ps/6lzQRPGLXNTMxN+FE17wpncFBg1Kk2
 OwZ0r8euwGwUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=omEAgQjs
Subject: [Buildroot] [PATCH 1/1] package/memcached: security bump version to
 1.6.42
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

https://github.com/memcached/memcached/wiki/ReleaseNotes1642

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index fc6ad5eb88..f241723111 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.40.tar.gz.sha1
-sha1  f2513db7079ee4c6558eb11fabb55e1adf1fdf38  memcached-1.6.40.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.42.tar.gz.sha1
+sha1  de453f58745238c70091fe243549c406aabdc3c5  memcached-1.6.42.tar.gz
 
 # Locally computed
-sha256  a3d360e9da2221a49bf9aae4e6880f2d44da6b2a2fae39b1911b9ca76488fbfd  memcached-1.6.40.tar.gz
+sha256  50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7  memcached-1.6.42.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index d3ec9d36d7..a164e82a51 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.40
+MEMCACHED_VERSION = 1.6.42
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
