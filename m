Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C506D4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 11:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8963E41903;
	Sun, 18 Jan 2026 11:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewrBwWuLfrg8; Sun, 18 Jan 2026 11:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A18541902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768736859;
	bh=UrzJEx+J/ojD6nGmwsnFA/rkyqpdcbr4Lum07tw9Qrk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aF4voMkwruqP1ZrsE51jQFxLIrSiHp7zzX6f0eoD69rcfmNO+w8QQSSPiU+XIzXFJ
	 afrpcL+P0gkrvq9KHYl5sLKePQYGTjPZZ4wTSNtM2+4rlWsBym5ih85V9JBzxCvvP4
	 Mb0LtDYksEHFUxPDuYamN+dn9wiaI/fNLW4l7a/0uplJmSXRzxwWCNFNbgzvdzUPDe
	 fMCH2jxTVn+4EjfKXDFyMGg66G2AB2EIhz9bfencEqUs5NAw7+qmSGNwN2spj0Nx5A
	 5BMHunV9ovQP7wPkuBGZhnuMippTxviVuZ4JpRCrWVAj2o9VPsFL/dU3z20rwbp4ZN
	 y3wNzKy0o7HmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A18541902;
	Sun, 18 Jan 2026 11:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F2462CE
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 11:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69BB6407AC
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 11:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzLHWSldVokN for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 11:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EE2040025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EE2040025
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EE2040025
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 11:47:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09ef.dip0.t-ipconnect.de [91.58.9.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7B28A4C42E9
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 12:47:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45050)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhRFl-000000004Nd-3ldp
 for buildroot@buildroot.org; Sun, 18 Jan 2026 11:47:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 12:47:34 +0100
Message-ID: <20260118114734.955796-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768736854;
 bh=fXvS8NWirsnpe/by0FmyZuInWqmNguoSA0o5YQNJYNM=;
 h=From:To:Subject:Date:From;
 b=oKGEtJUWZlUKiIsJxIEUwCXtiJxfwr9ZwiBpE7brNas3GlOgw4wKr7OJfxJN22kpI
 I06+nzT4MGrpAzh0i15oeu7++1lgVUItjXPEF3U5jnHGluaIS42PyOtBB9KqdH6lLe
 y8AGuH2c0twpfyWirA4GpVZzuliJZIWFJhxBDPmF3GeFXZGgXxTpgtHQLtm3ctR21x
 Zii3IFpARytSjV9Ar477GsNsWuX1gKCfxZ3DgAYLL8BIu+WGs5VaF+ZqlLYKIo4XIh
 6SjWCnyCQA5LMwRyUxqQf5Im6+NJPTAmRf3XIcQr/nN75JT7GM9zlWpNUslgheD4qQ
 0L7IuPwMGjMLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=oKGEtJUW
Subject: [Buildroot] [PATCH 1/1] package/screen: set socket-dir to /run
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

Buildroot commit 4769724ee2bebd671f6a9372fb8922a8c22c5079 bumped the
package from 4.9.1 to 5.0.0 which includes a major rewrite of the
configure script
https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.4.9.1
https://cgit.git.savannah.gnu.org/cgit/screen.git/log/src/configure.ac?h=v.5.0.0

Upstream commit
https://cgit.git.savannah.gnu.org/cgit/screen.git/commit/?id=78a961188f7da528c7cefcc63e07f35f04e69a93
added an option to configure the socket directory which defaults to
$HOME/.screen causing problems with read-only rootfs:

 # screen
 Cannot access /root/.screen: No such file or directory

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/issues/123

Updated project URL to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/screen/Config.in | 2 +-
 package/screen/screen.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/screen/Config.in b/package/screen/Config.in
index 81a9bbe4c3..453950bff2 100644
--- a/package/screen/Config.in
+++ b/package/screen/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_SCREEN
 	  ISO 2022 standards (e.g., insert/delete line and support for
 	  multiple character sets).
 
-	  http://www.gnu.org/software/screen/
+	  https://www.gnu.org/software/screen/
 
 comment "screen needs a toolchain w/ wchar, gcc >= 8"
 	depends on BR2_USE_MMU
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 74453faff8..c7411ab6ca 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -13,7 +13,7 @@ SCREEN_SELINUX_MODULES = screen
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_AUTORECONF = YES
 SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
-SCREEN_CONF_OPTS = --enable-colors256
+SCREEN_CONF_OPTS = --enable-colors256 --enable-socket-dir=/run
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
