Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8547C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 873F180EA9;
	Wed, 16 Sep 2026 21:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbi1io00lxuD; Wed, 16 Sep 2026 21:04:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9F26D80AA3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592649;
	b=DqRTbz6ql4ecN5i4FRaBGuzPd6PkiFSzj7gDMfRRZThnpHU3NHdm49s+hvnn9I04ayAr
	 EnI34APpasZnzEtro0dPH5Pfly7tP/y23k8piciZwVc0kDgxcIvKbs+U8fZr9dj+OvTY5
	 ixhfcNvF15AEuh0oi6v8RfGyz2CGcOo044CS9tStHtJnTmTVtUwKCAsPEHVAXHY2og/xH
	 l1/HSrL1mYxChzNtFE/0B07sWNp+55/xdRb8T9TCu67YldFALmni99E+29HsI4QWbbCPu
	 iDAfiKtF99KEfvoIc9xiU+dE999YMDAQbrhSfls7CkMY/q09IeOce6EynEsfYtzss4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0B06dr4gRhXNyDvG0G91YBuusseNb5j2hu5XlXVU2/M=;
	b=MAn+ijaR/B0ddy4CWAhn/FLD451pnLzql5rmuCg0X9PkBVqjAbMkZyV5FpWTkiVEONqq
	 tkFxrLqMf3NTr7RPv2qB9yQEPQ7cvYppbhFIoo7OE3qTrxN0ceSrx+0RTBHWd50AJ29EM
	 mY2e00/P7/M/WeV8I6gImZEe7vQZUi21M3R2paYfveeytLeatc3H+xK55qoQdFz6zFx5A
	 DxQNkeYF20XM1Utvo6k/WH7aF1ulwP9aSiSb6avvv8xcNReVl9Wk1QidpeFVre4feYSun
	 2376IIODMDNcV8wkAUG6qezvXpVvh8KNScN+2WuqxoEW0yq0jfS6Lq2yGSrJtjSiXwQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592649;
	bh=0B06dr4gRhXNyDvG0G91YBuusseNb5j2hu5XlXVU2/M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tF3dlvZaskqKGCZGFP3t4ddPe8sunMhkRbRFroFJjscTHSY7AzenFCb6LR3BH+rFQ
	 TOrJgq6fI1GJ7DAKK33SUntUfjrZHcJsM+v9V2K5jydRl7BaMcqaovuB8JIM6rEt1n
	 qDb8T+2KxBKwn2kZMUQBhYYw0VN5IQXEpsHh7jmhUGzu1ulDFyaIDPwoORR+B4Kznh
	 Ipn4M9aqqvBtqDirLTi9+8svVhF6s8z6/pJ3/6SdleDjaY3CWUXO8iCDJvCvmGprZS
	 PNQ93J1icLZ/J9mVEd32rRFZrXUha+HCIOidoMswu+4GOl/JMaZPyErlBO95PcDvTG
	 mIpk0pHelaOqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F26D80AA3;
	Wed, 16 Sep 2026 21:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C6C924D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6A83400F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFio4dR_MhIl for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:04:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2AB77400B0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592647;
 b=Gc3DHH9xn2e4HJCQdWye1+yYXkAuXawFxNirE8G3i4X1R7patjoKICq1qO4L0lXfV41O
 nQ3mgTeW7BD2NVw3QlSKAwaT5jkiZNMGdhunHVJC0vkYEUC5w+tjU87pCjQGqwQsZIJmK
 Q7IAuZ/jJp9Em2OasVMNWV9tFeHYQ3L46o8rGZ7iEnMRmwzho5rULtiUPqQgvV3tlwcas
 kMaEIFhetdpxlECPeKTstgxYG88zqxTInVE97+EgkBNqpEq4hwlNexlppd2OwHkWBecgO
 c2TjEj7B4BBbC48mACDpFF5dR2hhKN7+HNE6qkN50hlJ8nyszT1HPvezaBhl1YWWMuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592647;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=43mGesoH9w8rhv3DocxMMeigtHjeDnEITEhD4vUJuuc=;
 b=JyPbI71y1Tsm04QTPKLIbAVpPpTUwAFT0wEfj9mi3pqL5bcUSs+yCgZMvT2xKmAy+1Sx
 ERJE9kW0k5xNt1SNXHCN75/yevRn34bJrfVQNLcT+3VVkYJgTbjqrDdTabgUshN+YvLiS
 O/UWchk+ZuchzZFqrdzhDE9HiDkLCo3+C8sumG0hvx22e/im9H0lq2OyJsVqoVKcWD5lE
 6RU3pPYmOzYccAY7yasjtXSDl0q/zVwQG7aSslCybYDwBVLAWx8wh0iTn4RT7Q1s188DY
 LXdIlUXns2902YsAyvJiytKiseZRnj+e8tD5Y9awAGu3SXfpn0oc+yp1hea6hpoYFuQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AB77400B0
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F0BF96B1A; Wed, 16 Sep 2026 21:03:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 23:03:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b009489f53147e652d2c197a1f814daacd33385
X-Git-Newrev: 7e34cd7c7e5094f99ee26b24493a9007b646c3f9
X-Patchwork-Hint: ignore
Message-Id: <20260916210300.9F0BF96B1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libest: needs OpenSSL engines
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e34cd7c7e5094f99ee26b24493a9007b646c3f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
