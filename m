Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A9AC25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 10:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C332280DB6;
	Tue, 21 May 2024 10:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQfebMWDOHzz; Tue, 21 May 2024 10:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C887C81E83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C887C81E83;
	Tue, 21 May 2024 10:47:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2BDD1C513C
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B006C6059E
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V63wgINmQIEV for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 10:47:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9B0156059B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0156059B
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B0156059B
 for <buildroot@buildroot.org>; Tue, 21 May 2024 10:47:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7B9BFCE0F08;
 Tue, 21 May 2024 10:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF8BC4AF08;
 Tue, 21 May 2024 10:47:52 +0000 (UTC)
Mime-Version: 1.0
Date: Tue, 21 May 2024 13:47:50 +0300
Message-Id: <D1F9HIPNX2B6.12XBYOS1W36JF@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Baruch Siach" <baruch@tkos.co.il>
X-Mailer: aerc 0.17.0
References: <20240521103154.32660-1-jarkko@kernel.org>
 <20240521103154.32660-3-jarkko@kernel.org> <877cfnphyj.fsf@tarshish>
In-Reply-To: <877cfnphyj.fsf@tarshish>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716288473;
 bh=6FiTEgY94x0ElUU5GjNmVvJYZgLG5hjFbWJuhxW6bb8=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=LujUXV3DTI59bw8vhp5E7/xPdVXsz4pLvi7+VdicoKipjpiQUXjfAAD1FJEOuYuSw
 d24no/017uRElOZpNRJs8AG/7mLshfGXydViOGXb5H/i3pOHWds5ADYfPimCkV3Ske
 zNZ01POpYECg0BfJ9kh8/C31p43H5DiN5StA3bc+5yVGNG+TlDhpOUrWYTR/Z7PDe+
 lbPXzk4W7iQtReJW85bAKdGCGsucXTCG897GW76DpNVeHc8A0hYZKcrHv7bZz6UHv5
 JZsBXQncsaZyRLiTqDUxsBg+iEw6yG2Dp1xSJ6jajh0I29i7m3Z3hMK8pwsrgij7WG
 vNbdkmmEaFT7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=LujUXV3D
Subject: Re: [Buildroot] [PATCH v4 2/3] package/libtpms: add host package
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
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue May 21, 2024 at 1:39 PM EEST, Baruch Siach wrote:
> Hi Jarkko,
>
> On Tue, May 21 2024, Jarkko Sakkinen wrote:
> > diff --git a/package/Config.in b/package/Config.in
> > index 1b6a5b0dab..30b76349ec 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1569,6 +1569,7 @@ menu "Crypto"
> >  	source "package/libssh/Config.in"
> >  	source "package/libssh2/Config.in"
> >  	source "package/libtomcrypt/Config.in"
> > +	source "package/libtpms/Config.in"
> >  	source "package/libuecc/Config.in"
> >  	source "package/libxcrypt/Config.in"
> >  	source "package/mbedtls/Config.in"
> > diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
> > new file mode 100644
> > index 0000000000..335a5bc7b6
> > --- /dev/null
> > +++ b/package/libtpms/Config.in
> > @@ -0,0 +1,20 @@
> > +config BR2_PACKAGE_LIBTPMS
>
> You are not adding a target package, right? So this config symbol
> doesn't do anything.

Ugh, right. Now I need to do a check before I roll out a new version.

I think this is what I should actually do, right (diff below)? Sorry
learning the process :-)

diff --git a/package/Config.in b/package/Config.in
index 30b76349ec..1b6a5b0dab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1569,7 +1569,6 @@ menu "Crypto"
        source "package/libssh/Config.in"
        source "package/libssh2/Config.in"
        source "package/libtomcrypt/Config.in"
-       source "package/libtpms/Config.in"
        source "package/libuecc/Config.in"
        source "package/libxcrypt/Config.in"
        source "package/mbedtls/Config.in"
diff --git a/package/Config.in.host b/package/Config.in.host
index 0cf9dc3897..4e0dab0504 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -57,6 +57,7 @@ menu "Host utilities"
        source "package/jsmin/Config.in.host"
        source "package/kmod/Config.in.host"
        source "package/libp11/Config.in.host"
+       source "package/libtpms/Config.in.host"
        source "package/llvm-project/lld/Config.in.host"
        source "package/lpc3250loader/Config.in.host"
        source "package/lttng-babeltrace/Config.in.host"
diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in.host
similarity index 89%
rename from package/libtpms/Config.in
rename to package/libtpms/Config.in.host
index 335a5bc7b6..7a477d21a7 100644
--- a/package/libtpms/Config.in
+++ b/package/libtpms/Config.in.host
@@ -1,7 +1,5 @@
-config BR2_PACKAGE_LIBTPMS
+config BR2_HOST_PACKAGE_LIBTPMS
        bool "libtpms"
-       select BR2_PACKAGE_LIBTOOL
-       select BR2_PACKAGE_OPENSSL
        help
          Libtpms is a library that targets the integration of TPM
          functionality into hypervisors, primarily into Qemu. Libtpms

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
