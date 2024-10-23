Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE021CFA466
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29E4640524;
	Wed, 23 Oct 2024 20:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exf7-H_tNZTJ; Wed, 23 Oct 2024 20:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2543403D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2543403D9;
	Wed, 23 Oct 2024 20:31:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F2DC63F2E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D19676089E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UCSlmU3Rrnw for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2FBA960884
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FBA960884
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FBA960884
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:31:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10FB540002;
 Wed, 23 Oct 2024 20:30:47 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:30:46 +0200
To: Ayrton Leyssens <aleyssens@idtech.be>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20241023223046.448ff10a@windsurf>
In-Reply-To: <VI1PR06MB89260BFEC656834C6E385BFCAD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
References: <VI1PR06MB89260BFEC656834C6E385BFCAD432@VI1PR06MB8926.eurprd06.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729715448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhd1of95QIvp23EuEJgDszmE/O7Y9AjgMzEcPTWUDR4=;
 b=kbp6QAOrIIeLn57UHhALn1KDEn2l2Rtf2ALjV8YGVMRbtcMH2p0eslPKlaJuHA+raVrepn
 Pa87wFRse2xZjycTQN+OjJyVja1HoiIZZ3pT5sCrCcKxS1TrW9YGOQWPquhwEK5E9gdGlM
 3z+sHnjaDaSWHJ+U9zvGMDirUC9QkatF9EBpjTWUCz4Iux1Uj1/pesVBuNAqwehBjcI7tW
 Y3dRIY7cUab6l3BHbX4RceU43kajxKMgbfnBOI0PAtntjlIfYVr3N1PMPZXLAuTpGuSSMd
 WmGokHIzvc/8l9nyBmvmlkpvaO+9OtykJdHIEexdybjioWp6N/4icFaXYhKhZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kbp6QAOr
Subject: Re: [Buildroot] [PATCH 1/1] package/libtevent: add libtevent package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Ayrton,

Thanks a lot for your contribution! It looks pretty good, but of course
I do have a small number of comments.

First a very minor one: the commit title should be:

	package/libtevent: new package

On Mon, 21 Oct 2024 11:46:27 +0000
Ayrton Leyssens <aleyssens@idtech.be> wrote:

> This patch adds support for libtevent as a standolane library.
> Libtevent is part of samba, but one might need it for other packages without the need for the whole samba eg. Certmonger.

The commit log should be wrapped at ~80 columns.

> Signed-off-by: Ayrton aleyssens@idtech.be<mailto:aleyssens@idtech.be>

Could you fixup your Signed-off-by line to be:

	Signed-off-by: Ayrton Leyssens <aleyssens@idtech.be>

 ?

> ---
> package/Config.in                             |   1 +
> ...mba-add-disable-stack-protector-opti.patch | 116 ++++++++++++++++++
> package/libtevent/Config.in                   |  16 +++
> package/libtevent/libtevent.hash              |   2 +
> package/libtevent/libtevent.mk                |  58 +++++++++
> 5 files changed, 193 insertions(+)

You need to add an entry in the DEVELOPERS file for this new package.

> diff --git a/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
> new file mode 100644
> index 0000000000..839479a3fa
> --- /dev/null
> +++ b/package/libtevent/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch
> @@ -0,0 +1,116 @@
> +From 5885ed8e6db7648e6842d9811aace7edc4e8aba7 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine fontaine.fabrice@gmail.com<mailto:fontaine.fabrice@gmail.com>
> +Date: Wed, 20 Apr 2022 11:16:52 +0200
> +Subject: [PATCH] buildtools/wafsamba: add --disable-stack-protector option
> +
> +Allow the user to disable stack-protector through
> +--disable-stack-protector to avoid the following build failure with
> +libtalloc on embedded toolchains which don't support stack-protector:
> +
> +/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/i686-buildroot-linux-musl/9.4.0/../../../../i686-buildroot-linux-musl/bin/ld: talloc.c.5.o: in function `_vasprintf_tc':
> +talloc.c:(.text+0x427d): undefined reference to `__stack_chk_fail_local'
> +
> +This build failure is raised since
> +https://gitlab.com/ffontaine/samba/-/commit/38e97f8b52e85bdfcf2d74a4fb3c848fa46ba371
> +because stack-protector is enabled on libtalloc despite the fact that
> +libssp is not available:
> +
> +Checking if compiler accepts -fstack-protector-strong                                           : yes
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e221bde25c7622db99761d0adcd56663296beb15
> +
> +Signed-off-by: Fabrice Fontaine fontaine.fabrice@gmail.com<mailto:fontaine.fabrice@gmail.com>
> +[Upstream status:
> +]

Convert this to the new Upstream: tag, as such:

Upstream: https://gitlab.com/samba-team/samba/-/merge_requests/2493

also, please add your Signed-off-by: line in addition to the one from
Fabrice Fontaine.


> diff --git a/package/libtevent/libtevent.hash b/package/libtevent/libtevent.hash
> new file mode 100644
> index 0000000000..990998e6d1
> --- /dev/null
> +++ b/package/libtevent/libtevent.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  362971e0f32dc1905f6fe4736319c4b8348c22dc85aa6c3f690a28efe548029e  tevent-0.16.1.tar.gz

Please add the hash of the license file (tevent.h).

> diff --git a/package/libtevent/libtevent.mk b/package/libtevent/libtevent.mk
> new file mode 100644
> index 0000000000..636a6abbe2
> --- /dev/null
> +++ b/package/libtevent/libtevent.mk
> @@ -0,0 +1,58 @@
> +################################################################################
> +#
> +# libtevent
> +#
> +################################################################################

This whole file looks exactly identical to libtalloc. Is everything
exactly identical, and needed for libtevent as well, or did you just
copy/paste? :-)

Final comment: since this libtevent package is needed for the
certmonger package, please send both patches together in a patch series
(libtevent should be PATCH 1/2, and certmonger should be PATCH 2/2).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
