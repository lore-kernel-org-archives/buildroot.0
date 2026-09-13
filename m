Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA24C88E65
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E8080D84;
	Sun, 13 Sep 2026 19:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbr1AH0zI_UI; Sun, 13 Sep 2026 19:34:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D1C4E80D23
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328069;
	b=FeqvQdktJpOoUt+EOIrn8a/oCAXSpFVgEw2dS3rEWDUtEw4USgh1R2uy/27KiQ4MXVgM
	 7tOQmzyNKTIq+nYGEj13x75My9RcJgKIrFxEjm2d9WHNTeEGHASgCYK8W8cNInnVFc4fc
	 yOpeRf8vRQ7373j9EDnt/xvgvhNV2N4/gqL0NqVNBkitgvx312zWop7rw3vjXiGeM+Nn9
	 zcSQsh3nDM6tR+B+J21d6EBZqNz+nSdw2ZWOGBgpIVNZ2v64uAR15qRG4vRJN5wgvGmPt
	 cEFid7JvOKrZkMFWCkWeKD26bRJrmClSS+KbAAdVBXc8ozqBiqfA322tpsDaqijvJ6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZRtbzdNqHvv3Ky38fluVvKYUziIo+hgYjhEAZvaWLlA=;
	b=sdTOv1H+oXHJhhMvMyExEyEt/SNBew+kDC4Fh41PB3EBXUunsfuw6d3wgsWy0zWuhemn
	 YTQAZr531H+0ICwhqWbPYFAcwbA18JKcgsnCBhQGyL2DDUlXUaEZqm0hBBDy1YweyEkyS
	 7EvwjWklLy4Ak9AOTyU/732alF65t9MU9phu42Y3jZ2jRPcxvD3PMBD5pj8Ocnk3R6KHP
	 7We4jv2MeH9hAvh43+QtP7ZLS37HtPWmgDJYGoWpWcaGxBGUfGkGZAahFzo2bjI4jtQ96
	 /wEQREisvK9flwslpSeZ7/dUJ/DkyWHb2M23f1gs5Jkb5fyYvVPDycefuy7f39yJf/g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328069;
	bh=ZRtbzdNqHvv3Ky38fluVvKYUziIo+hgYjhEAZvaWLlA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fTMa3qWCBYdBK82F5KBtE9aYES7K9AHEWQOBSIQY3ZgFJ5Taa9CZcYR+cDvuSl3NF
	 N5i/QlNjgQUnnNk4jYLHcF3Bkei+H+KXHsb/owqsV16Zar2SpPyA6XD9SimZCl3ouP
	 40pRHhFYTudJYnqvue14o/hydWUuHPtNExSFpJmh8xbyeOFvKNFMeibDTquVFPzTDE
	 ZEDBgK/Xe+EgVxwwvPH9/SE6OVAgZEt7xJ+8eiyzENK88u/EqjRw6RX4KplfsFA/E4
	 es+S8RxVyJExCtZOmveicgiGzQZybIHAb5Ce6tpKmE527MDAKshvPiXci+VI7c5Ne1
	 F5BIx1//Trjvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C4E80D23;
	Sun, 13 Sep 2026 19:34:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BD5B79D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5402E605F9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C8z3W6JyXwaI for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69F8A605F3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328060;
 b=OUaNzENKVsJJDyudDfZVNLZ3o7KzTc4YjWKyOUemisArEx75d0F9kM9djUuHtqHO3h6w
 hDn+Jujf1pgL75iqVG7vl3GyY6TVWUUqvMcOrTl6OoDtT8qkRNWxPYbU3aqonPoPgxS8b
 FxPa+9dX2in6hxlSUGDV5vk0niRkE1ri1sonUgljjrYq85P3xOahhdiudmGPdwJ6JIFSt
 Shd2MBiSbNH/eQvbgtm1jfF7wvW8vNGPQBis/I7lWP59IN2ZbBrK621qeNcGYQgZLqTKw
 OKIWcHCVAvMLWJEwhMuGZIatvUxmzzKjUqizPX/q/O7g1txlbnphm+pT2DDh7uamZEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328060;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yGX/lkddiQt3LANei2GwCiAWetPYaOt8vpou0ex0MNg=;
 b=SnJaPcHslxy25e98LT8/ukB2LdKMgfvjbcKKgECv1OH2P8VzCgcac8kbvAnfzXO7jV1z
 +eNn7XYOJgWrENR8ETkEQCCKAlxtZISZSfslasSwCzYzIhDkEMRx5XbyvD7ZK7Ojqz7QO
 ypmgmUeRgunJRnFfHhabhZr6SIWsGruV/9RF3LxMyK7NOURdYeZ8xChM4JyHxe6TKk8Zt
 9kSUnU9Va93F8psq3DAJCrlXAlSKOvGx9yY1I4jEslHDInq9bWPKuMd1nJn0uDIddWj+C
 pRuxVN/3ESc8oW1ieJysFkP4dbAQENFwj0jopSQ/TYFX6XHSXQG52E28ta6h3bRBk6g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69F8A605F3
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:34:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6221C95C73; Sun, 13 Sep 2026 19:33:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 21:23:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e96b7a0ef203ef2937a6fffe8bd9d8f3a9b58cb6
X-Git-Newrev: f7fe354adadac3d2425fbe59da0744f1e4103726
X-Patchwork-Hint: ignore
Message-Id: <20260913193315.6221C95C73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh: fix select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7fe354adadac3d2425fbe59da0744f1e4103726
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_LIBSSH_OPENSSL unconditionnally selects
BR2_PACKAGE_LIBOPENSSL_ENGINES even though libressl is also supported
as an OpenSSL provider (and BR2_PACKAGE_LIBOPENSSL_ENGINES doesn't
make sense for libressl).

This causes the following Kconfig warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBOPENSSL_ENGINES
  Depends on [n]: <choice> && BR2_PACKAGE_LIBOPENSSL [=n]
  Selected by [y]:
  - BR2_PACKAGE_LIBSSH_OPENSSL [=y] && <choice> && BR2_PACKAGE_OPENSSL [=y]

We checked that libssh, with OpenSSL support and libressl selected as
an OpenSSL provider works fine, using the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_LIBSSH=y
BR2_PACKAGE_LIBSSH_SERVER=y
BR2_PACKAGE_LIBRESSL=y

Fixes: 62103be918e7a155749b1b3b680a9e4ecba6af87 ("package/libssh: select BR2_PACKAGE_LIBOPENSSL_ENGINES")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libssh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index eaec754414..bc9a02d9b0 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
 config BR2_PACKAGE_LIBSSH_OPENSSL
 	bool "openssl"
 	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
 
 endchoice
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
