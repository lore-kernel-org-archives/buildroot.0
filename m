Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BB4C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 451CD40CE9;
	Thu, 24 Sep 2026 18:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wg5DRU6yIteA; Thu, 24 Sep 2026 18:57:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 23EE940CDA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276252;
	b=ZjmV3AGCRyrOV3gKpa4suN/8sYzUjN0Jo7GLHbKN4krqMYYmH3RFzGJoNrrNwyXmB63u
	 Kq8KWTwPOUXXCt/KNPa828sHA1ffhnWe/drm+v7bOJwBExloTfKwPhohmB9av5Z61XuEo
	 PBfXXUPOkSndglWFEJUMn7dKkEbOmmQdAb1+cp2e37WE6n44JrV5D1/QTwWQuIa53D1xX
	 j9UQ5rEM+j1C0TBmRv8jPlVlQ4dQGZkx5V/FHtW9SyC8w2rdAtBLA4b/2e/1FJcD1f882
	 QUTvsZ4E0eB7t/WiNcfAZPIdmwQqRwPmTCQi4Ok3fwBSFP+bKRUbN8EfR2pCOr1fdWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276252;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2g64XCd7B2YseKgROreLMDUohOGFISKrgsz3Nsra0vg=;
	b=Jeh8GPWJWw/gRbhKKO7Z26qw7vnvV3gJaKb9DTnUZCu+TxBX0f2JwFrDO/3UYljZP49g
	 aImQ9m1JEWHadT53OGA8NK/8CYb+4n/dz3W3/PbK9IIzxJXts2I89K0V8keQcJSrgGfrY
	 4/ohgE51MDHm1LDYxqIBZ6dtPd2HlEvv1xQK8YHSnFlIq5vXZJVzLWaMfz4HsoQ2nM4Gk
	 lnxmxYiKxgO8Jsmek3j3p1/fEERQAmMen65nEj9OvoWRQFrgVqywZJpkN8GzKwj3MrfFn
	 X69p9hCVGNeGBbZGw5xBGyeVLRtmCJBjZpUuMiGdspWelnjN0Nd4nNnlENgsCRHfauA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276252;
	bh=2g64XCd7B2YseKgROreLMDUohOGFISKrgsz3Nsra0vg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pjw1hvo31kXQ6+lH6j499SKub7lYW2ojvTCiNewk7aCDI3PofOhE81QihBqCZg3lw
	 xjoK7G2yybL4XRq240o4zD7tB1Wh/oUqlWGKFGgocm7nyNW5K4/Lt2VuK1nMc5+bPG
	 JhkrIlTkTroE7KsUEGpjwnmdYrSTtuNgzhJjX3g/5K8iSeFXpGvT8kcagS3zsJv8lc
	 DG73QqA5ObNwcXEi9N/+2Q3H8U+AKtFBN9pDYSVkuq//p2Un2zD/0gaTbD+hk1ADZl
	 Gr1D0R/pd0TooVn2qq7uoLrWINhK2hWrnrBGY1yZA4AMPwf1Fcz3o/mz2GZ2968NYT
	 dvGmkOoUYSKgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23EE940CDA;
	Thu, 24 Sep 2026 18:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD3D9392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB3C540ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lixQ8D9f2Dat for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC7D340ACC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=l1AX5s1j9a8DAPJTEBdk3gKPUvZ6e3xqxd5mqxfNlCx3v0f7/tvdQ+RW+NxDOy7Ec1CG
 Lwbc4QrAKz111capkO/4ziBgfPCMLfmvEGO07q3d/4tmyn/VG0OiRaWPcOqkigNGTxcS0
 7pqg5AP6ZBSDwQkiOo8bDZwZuXwmizKNYqVfM3BHbvlzVinsn16YgvlgFW8CylsbCmScl
 AapjDu2FYaINLMosIg8qs0a8hO5rJ33KDrcUSbLUpoorFiRa2jP1FdSWuqkvHj/4beNCU
 zQ4DEiJRhl1xzWvUO/MATLJ2tqf1NjZLKe41Qy/TwWlDqUmC3AWpWsaMtPhGPJgnq7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ezISbKPiTR72+0xpy0UyFOi9RbiWdQaR02qHlKSMn9g=;
 b=qkqvqt3upnOB1uQEcDUeOBtSjbyX9E0YpUeydmjpuBwJGFy8ZLIuV/WOMgy3lLAXefki
 4HOs6avmD2TI6ZJUAqOB6Sm9Wv66QJ4C5SHJkXieHeUiD60764Q44R2OWeT4R7jYmzM8N
 syd13RhVu2L+skqxKIo6bYTiytM/FaydpwKWLnqUWCaemu0dRVxGNN2qk4qVO5LLlYpmr
 B3ZsxvP05cf1/7VSp6DFd+FAlInqjSe1Eu1q1giyLJM5Rsnx/ZhUnowZA6TCKjqd1rVGF
 ElxkvHXFuY8HQvrn6FEzpA44neoEkXtQ67Yy+McJkh/FRKTY/shv883vuxFoxHktC2w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC7D340ACC
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FE9298383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e673c80cb759f592700cc5fa0496f082496f4601
X-Git-Newrev: 9cb09c7c477b97570a5bb1a060868e96318e3f3c
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.4FE9298383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libest: needs
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
Content-Type: multipart/mixed; boundary="===============8152526881119954708=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8152526881119954708==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9cb09c7c477b97570a5bb1a060868e96318e3f3c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8152526881119954708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8152526881119954708==--
