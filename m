Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED34CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359E9409BA;
	Sun, 18 Oct 2026 09:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4Q87S29lCiA; Sun, 18 Oct 2026 09:51:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DF150409C6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317072;
	b=k7UL7f2G2eGQA4suMIaIuIjNSJDVIcFn5Uuu/t0zcBt86Wna62LuO7suHlksuqQcDZ7X
	 W/jwLyR+F83AayAemtFkzTntFq2HKmQ9PEUz51QnTYkYqpIQsPbreQvQREzC30+Q24lgz
	 WFDzFEvzdL012DrRraLEG0mvGeFo9ITJSEIjMzqw87m93SCzzg0qtP+b+q+Ydq6ZctaVT
	 ATDRHOeFjnWjDIPy93PDKG1WeoNMpPVe5xwNDrRdHrTeeUOXYj/v0/lGCtZcU9Aiu8OuN
	 /EC0RYDMZTOJ45pNr90u39euIQfTNLziqLQeZED3dYoeh1hOPtJumWsKBcUX8ONwWdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317072;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IcIDa2jbT2ddglYung7m9L//pBJ60PDbc5qHa4+WTt8=;
	b=beK4TWp8F1NKY+TG3fnOjABphLhJyaMNtOjQR3CLZXvE222kZ2V9MB4928DM887pe53L
	 kkgc/JUJZcdGQSBAwCx+PLQHk62+UkGyCoDzYzd/rG48SutIJ87KgojatiiZX78hv5dcS
	 DEflkDQm/n8esSt5HNpZOacHU6iughjHFDaNsbBa74QQtFJ8ejS/RhzffCZ5IUTfoDDVL
	 Z28rqee25RKNUAMLE/P8UiN7cyM9vn8YHg8eLc0jU1MzFanLl5uXzw24qPIHmeuo76lwx
	 pIZ9WzZjTc5QEhOZOk/u2AvSNzj9vfa0kxRJNOLBQyz+vz5i1R63XWoRJDXvcrDqE1w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317072;
	bh=IcIDa2jbT2ddglYung7m9L//pBJ60PDbc5qHa4+WTt8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LT5WZ0UCpj5KBbDorBHvsK3o36HEBRvLvzjcKyZ8aeTonSNR8F4cZWtMLE3m9VAwV
	 UaWk/7jotDwBPNKPRjmRudwP2O5pW84ZjgExjARYaH7ChoIiRnzHRM0svHYOkg0xh4
	 qxSR0zfPYm8vhzhY+ElUNUuGToiWMKKiAclKKif1TO4lGIZfbP96Ap2hJT03RyfBM5
	 Q2ksMI3AoN0NEqlyNdd5/bdPc986X8HFIz0x0prARtfAZ06f5onQYTYFTeDtvh8jbT
	 G48+in9h4SYd4f8gzMywX5wM5Aa+VMJg+EFyVmH6zaBEQEh3g0Wj0zqE2mcOHqwQML
	 W/cRV5ejqjcPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF150409C6;
	Sun, 18 Oct 2026 09:51:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 341BB263
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 267F1606BB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LboVA5RkQ9LD for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D50FC606AA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317062;
 b=DockFVJu/oJZuGKX4rD4V3UNvKf4AkL9HuIGRbShI5EQPkyek1DNB/jgQ+e6+/Y85uka
 N1rNaTq3tQi9dLgu1AIE2/U1re3vd7xC5+XXvAtIus3iNUdd5x0QOZZsg+gbuvOe0V8Id
 HQeGxaEz5y4d8C6jCFhMF3YvfpCNjeZJ1wfaiYtJdGGckTVZdU6i1moGLGprsXJdegg/N
 9UWlq3XsIhYwt1vKLvC4Mf6CJNvQnAmooa6qZvK+teZFlAnV23gfKoBADyBqH+g/dSPmk
 tdCOYeW6EADRHrFTU9jW+WvKffpjEfD4wCFZgRbc33Dtm40Z8+kh7huCmOSJIvEMcog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317062;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WEBzvz4wJiZ/Bp8zOZOjS66DzHJeMXbTEs1y3X6MaT8=;
 b=c+fy4nYPMkfOnXPlwztg5o7Hm3OA7ohZzupHTuxd7QZYKUtIXPsaoc391ZTrl+39eAAb
 X8QPVhRNAblJbgwbl8NBN16ZN2YBp2e2N2QrpHqBOMIp55Xh/q6JSHdoy1QVXk/Qtj1IN
 SCeOpJwsbBOEwncwQZU805HJFbsB5+Kpv5q9lp+BdqB//wiO9sNI9go6ZlX/Lr4C100r4
 z/o7u+0oJDotNEyoK1wsd4Dx59Vuea4Lrads3cW71yqsJaYb/+CPPl6RAdqPxSLgMHR2i
 oOf72newS/WJMdt9s0EZalcEuVr3f4U60WzcdWpedrIGNfc7wqsiAx4R5pYSB77A8FA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D50FC606AA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7CAE96ADB; Sun, 18 Oct 2026 09:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 11:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1923f760bbf8ac7ed43f90d2e7df33faebe9afb8
X-Git-Newrev: 6d666b46f2d35adf6462300dbc959ecccbd4a5b0
X-Patchwork-Hint: ignore
Message-Id: <20261018094940.D7CAE96ADB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: do not require
 OpenSSL PKCS#11 provider
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6d666b46f2d35adf6462300dbc959ecccbd4a5b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Patch 0003-Add-support-for-OpenSSL-Provider-API.patch makes
package/uboot-tools build without the OpenSSL engine API, but it fails
at runtime if pkcs11-provider [1] is not available. That provider is
not packaged in Buildroot, and should not be required when not
actually using PKCS#11 keys.

The problem has been discussed on the U-Boot mailing list [2], and
part of the reason this patch has not been merged into U-Boot yet. It
causes tests.package.test_uboot_tools.TestHostUbootTools to fail with:

=== STDOUT/STDERR ===
At main.c:259:
- SSL error:12800067:DSO support routines::could not load the shared library: crypto/dso/dso_dlfcn.c:115
- SSL error:12800067:DSO support routines::could not load the shared library: crypto/dso/dso_lib.c:147
- SSL error:07880025:common libcrypto routines::reason(37): crypto/provider_core.c:1026
mkimage: OSSL_PROVIDER_try_load(pkcs11)

This commit adjust the patch as suggested in [2] to continue if the
PKCS#11 provider fails to load, making the test work. However,
actually using PKCS#11 keys will not work until pkcs11-provider [1] is
packaged.

[1] https://github.com/openssl-projects/pkcs11-provider
[2] https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629348.html

Fixes: f87cf2d6239d676147dec1fef088d81ee873277a ("package/uboot-tools: Fix build with OpenSSL 4.0.0")

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
index 9a5071cae3..2403e3ebab 100644
--- a/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
+++ b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
@@ -29,6 +29,8 @@ Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
 Upstream: https://github.com/u-boot/u-boot/pull/918
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Fiona: apply fix from https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629348.html to make pkcs11 provider optional]
+Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
 ---
  lib/aes/aes-encrypt.c |   4 +-
  lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
@@ -149,10 +151,10 @@ index 0e38c9e802f..f456f3c58e6 100644
 +	EVP_PKEY *private_key = NULL;
 +	OSSL_STORE_CTX *store;
 +
-+	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
-+		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
 +	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
 +		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
 +
 +	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
 +	ERR(!store, "OSSL_STORE_open");
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
