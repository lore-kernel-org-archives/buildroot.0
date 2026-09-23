Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9661DC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5408E4113F;
	Thu, 24 Sep 2026 18:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQbqM00xbQqb; Thu, 24 Sep 2026 18:59:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E31F41130
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276359;
	b=Phds4vv8apJN3UQYRpXjwszvdNFYdWvTjj3ff/jk71ziZauYRg5H6S7cw0niWJkukfww
	 Rfjnu0cTEAqN5AHglserMRTpghvrMa1SQ5hUNxWmxnSlPfWOZ/e0g617ONc2EJ09ZJpxl
	 1yODw9fDZpK6KM6Mblu+74MSK1f3ECkZmDtZRRINLz1k7te5W6GOHJbt8/h/4smheC8jW
	 0UpwXfaAdj0P8Kj+Kr1esaH6m5peoWxLc6F9DhR8u2j8nfDlgstghS6TL3HWv4/gU2mrX
	 qQFeSrP8a2okNy3kYG/RqgIOeRqKdzUa1Ur7J+OZBpsLs3fs+H8UCqgsJbVmbE2MFIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VKnr1/OmqhiPQ/+MAx2wPHgqsgZgSOpSgHHnJpeKJes=;
	b=JM27amf+DqoCaduZ+4TtOT7v914b6XhKHgafw+uovpOFUg+F/iv7ka9ho3YTc951V5Am
	 eTJPBZPlzyMsAWqrX7VOWurwMliOAm8Z05KO83RgDXDGgeutBC5Qrmntz7GZGHTKzOtZt
	 oSE4wkqTUFFN+mVyP0n0CxtCJXTqr+/1AXGLEfQ4N4U2bPiUUMh2qT5QV/h0ySQd/hBXr
	 xZ63FgYEV6am6dePFIf+DZozTtN4lUY2nupxjJBEELdgv8lOfnAaSitovlKh4C90OhrzP
	 frfynNfw67kDRU76/aNL1Hom4q51XwR3TvN9Xuk0izwNazjZs4qbrBiVzIsVJtCxP9Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276359;
	bh=VKnr1/OmqhiPQ/+MAx2wPHgqsgZgSOpSgHHnJpeKJes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjiaIeD3GgGV/A1H54NEwkex5qq9tmeqbdqtTD6uzJseePENySiiBOStqGABNdf8j
	 UFCh/3wbWau0Zd2ma0bdc5qxyvfdPMwcPDwOy7mjQwxiuGn1UrvUYEad4cNRKqzC7B
	 2RuU5xWrNGJLGHTRIXZi8hARqY6hUlJ3EFnoVBxf8o1+DqTFBVW70aGCtWmYUXAVPy
	 T/4pl30WMheuvn0baBPDag4ZrKHj17nhRdp2BrEjI2UaHIZ1By4Di174fwgOPKbfTh
	 TZn0s7hjrpAPtn8IU9jUM2lJ3JpKMAfWJvDDUyvNXaT2mq6ZK4/BhlGFlSoUxm2tlF
	 29+Qo26iJFsDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E31F41130;
	Thu, 24 Sep 2026 18:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B27DE332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF27A8124B
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U74jsaCCKX4s for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5B6E881236
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=gKe9NNwwuv5ecdGaMG06roeRv5R5kPz7YdG/2RIcaa9aNqU7adz6QCuEJwZvKWsr9xkV
 Z0hyX553ISnzOkq6A1Z+zzH+x67RIiQLJR/HvU8h9ILm7Nq8RUDG73u+ciX+2OSC/Mja+
 8hF605QILpd+EvUGQQfLnEXCkmNQOgXNEaDxcC7l3HEz5zyLN0rWmMQlZO+skK2AR6fy8
 GVWNR5n2fY/vMgyM+a8eHMjQbEwn0PdDNplEp2mF8TdoBlYcjLqIwKzRlrA/ElHjlIXAD
 YwtZHj13gFeWhFBXNjKe2oyiZNXK18tof5y6NqS3LN0beCm0hNOXt+Y+veQo/gLvZPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=S0Hfoox7ek8QPXyZKR1hfS56qS8Pb00vLdv5eCfVgmw=;
 b=V+K1GbeZkhUdK2tF9ZTPzDeXXhs77fivWZ13MLhVEz956oXisvLhLa4xJeOOutvvr/xm
 SXtN+mYtzMzhjbb1zbRfL89LFqyO1I2qK0QnqTpu1NOvUt+oU+wRC6rJmTwQBnSxjaXvH
 ZhFPvzbewVu3La2CzM73hUDJtZ/NGTuE95NavA12qLC7ZCHTCsKl4pBVnIUODJ2hjau5z
 3dbXST1F0T3x+sdBcqZCvsgwfnZjLpJAJ9N4NqHIAZwF+z3twfq+WCD93O0jdg0UID7h4
 k4UcMKB9xIkuTLvHJSeNscy5G3aKs90GGk+akmVYuTetCtB0Ucmo4PJ/RBhDpOetoMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B6E881236
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2E8E9835A; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:49 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ebce679ef608828f5576efdbc3397ecb25d30f6c
X-Git-Newrev: 269dc6ea315f5213cf3437cb29924ef5e7ce3ba0
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.F2E8E9835A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libest: needs
 OpenSSL engines
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7070726679223232992=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7070726679223232992==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/269dc6ea315f5213cf3437cb29924ef5e7ce3ba0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes build error:

In file included from client.c:14:
client.c: In function 'JNI_OnLoad':
./../../src/est/est.h:834:10: error: implicit declaration of function 'ERR_load_crypto_strings'; did you mean 'ERR_load_CRYPTO_strings'? [-Wimplicit-function-declaration]
  834 |     do { ERR_load_crypto_strings();      \
      |          ^~~~~~~~~~~~~~~~~~~~~~~
client.c:88:9: note: in expansion of macro 'est_apps_startup'
   88 |         est_apps_startup();
      |         ^~~~~~~~~~~~~~~~
./../../src/est/est.h:836:10: error: implicit declaration of function 'ENGINE_load_builtin_engines' [-Wimplicit-function-declaration]
  836 |          ENGINE_load_builtin_engines();  \
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
client.c:88:9: note: in expansion of macro 'est_apps_startup'
   88 |         est_apps_startup();
      |         ^~~~~~~~~~~~~~~~
client.c: In function 'JNI_OnUnload':
./../../src/est/est.h:860:40: error: implicit declaration of function 'ENGINE_cleanup'; did you mean 'EVP_PBE_cleanup'? [-Wimplicit-function-declaration]
  860 |          OBJ_cleanup(); EVP_cleanup(); ENGINE_cleanup(); \
      |                                        ^~~~~~~~~~~~~~
client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
  101 |         est_apps_shutdown();
      |         ^~~~~~~~~~~~~~~~~
./../../src/est/est.h:862:10: error: implicit declaration of function 'ERR_free_strings'; did you mean 'ERR_load_EC_strings'? [-Wimplicit-function-declaration]
  862 |          ERR_free_strings(); } while (0)
      |          ^~~~~~~~~~~~~~~~
client.c:101:9: note: in expansion of macro 'est_apps_shutdown'
  101 |         est_apps_shutdown();
      |         ^~~~~~~~~~~~~~~~~
client.c: In function 'est_client_raise_exception':
client.c:122:17: error: implicit declaration of function 'ERR_print_errors_fp' [-Wimplicit-function-declaration]
  122 |                 ERR_print_errors_fp(stderr);
      |                 ^~~~~~~~~~~~~~~~~~~

seen with this defconfig

BR2_PACKAGE_OPENJDK=y
BR2_PACKAGE_LIBEST=y

The failing code was added upstream on Jul, 6th, 2020:
https://github.com/cisco/libest/commit/ab998c0918d1d46e1d8664a89b249cac08606e53
and included in version 3.2.0.

Buildroot commit 5bbb1834a412f2fb2d9692cdc40c99097fb8a46d bumped the
package to a tree including the aforementioned upstream commit on Jul
24th, 2022 so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7e34cd7c7e5094f99ee26b24493a9007b646c3f9)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libest/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libest/Config.in b/package/libest/Config.in
index bd5f40afae..3a0328c2f8 100644
--- a/package/libest/Config.in
+++ b/package/libest/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LIBEST
 	bool "libest"
 	depends on !BR2_STATIC_LIBS # libexecinfo or glibc
 	select BR2_PACKAGE_LIBEXECINFO if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_SAFECLIB

--===============7070726679223232992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7070726679223232992==--
