Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6BFC3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 20:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEB86062F;
	Sun,  4 Aug 2024 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBMe4WKk2w1W; Sun,  4 Aug 2024 20:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF5C8606A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5C8606A0;
	Sun,  4 Aug 2024 20:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04EE91BF4DD
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F9D80AA5
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 20:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vR6KbnU971CS for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 20:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4E0B809DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4E0B809DD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4E0B809DD
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 20:39:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96AF51C0002;
 Sun,  4 Aug 2024 20:39:48 +0000 (UTC)
Date: Sun, 4 Aug 2024 22:39:47 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240804223947.3c7b7c1f@windsurf>
In-Reply-To: <Zq7oUoHTLxY1sgIL@waldemar-brodkorb.de>
References: <Zq7oUoHTLxY1sgIL@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722803988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1qgpUGmcQS00qbAdXrAI685e701SEP+BVPzMOmgEeQ=;
 b=CZVLBVU/YCYLMT4+G12R5oIqnlHdEE4O3zSw+2hdNaeuBaxj452Z9TxQgva+m/PBbly7Fz
 ZZcyOKEciG3AUa56zxIaiaRYM3fwTR6VGIX6tuCPcDV7j4IvHxaM298M1lscIGDA261epQ
 AmSaRtZgz0OewBhLsqKqE4ouf8FTBnKK8ZwPsFQU80q9uBRwixyk25/dBwRRltUbRIK3LX
 ED/Fw9jspN9aS6YeusDKhUFpXsVRU2K0PvvDNKmrgA7LtFg8hwEliLbCky/vc8S8MpeJzr
 bwKXVCGMmG7NIE4H6QnF2wuiZxneTSr31pR0f0u9BAN6QVa4/BaCG2VxYv3Idw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CZVLBVU/
Subject: Re: [Buildroot] [PATCH] package/libressl: update to 3.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 4 Aug 2024 04:32:50 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Release notes:
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.9.2-relnotes.txt
> 
> Patches 0002/0003 are upstream. 0004 got renamed to 0002.
> 
> Disable ASM for PowerPC target, as it fails to link binaries when
> enabled:
> /home/autobuild/autobuild/instance-15/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/13.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld:
> ../../crypto/libcrypto.so.52.0.0: undefined reference to
> `bn_mul_add_words'
> ...
> 
> Fixes:
>  http://autobuild.buildroot.net/results/ddd/dddd58def99b28c5afa9896622259b652a4287da/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...sts-txt-Fix-HOST-variable-for-ppc64.patch} |   0
>  ...02-Fix-a-few-symbols-in-EXTRA_EXPORT.patch | 133 ------------------
>  ...x-some-compat-symbols-with-libressl_.patch | 130 -----------------
>  package/libressl/libressl.hash                |   2 +-
>  package/libressl/libressl.mk                  |   6 +-
>  5 files changed, 6 insertions(+), 265 deletions(-)
>  rename package/libressl/{0004-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch => 0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch} (100%)
>  delete mode 100644 package/libressl/0002-Fix-a-few-symbols-in-EXTRA_EXPORT.patch
>  delete mode 100644 package/libressl/0003-Prefix-some-compat-symbols-with-libressl_.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
