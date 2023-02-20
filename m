Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487F7C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA9081F74;
	Mon, 20 Feb 2023 20:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFA9081F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VIsFu-HLmKax; Mon, 20 Feb 2023 20:39:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB9881F21;
	Mon, 20 Feb 2023 20:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FB9881F21
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B72231BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E1C840900
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E1C840900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JiDEdx1RPJjN for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:39:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F22D1408DE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F22D1408DE
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:39:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C004C240003;
 Mon, 20 Feb 2023 20:38:58 +0000 (UTC)
Date: Mon, 20 Feb 2023 21:38:58 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230220213858.2104ae5e@windsurf>
In-Reply-To: <20230220192125.555632-1-fontaine.fabrice@gmail.com>
References: <20230220192125.555632-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676925539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58k3KQAYWRjxVmat5oe/PSrjrU3kGaOezWRJVPLP+NU=;
 b=jdVAAyN3Lf+BRJaoTDFHfYT3xpcoTNw/z44nGaaOeW9v82a5C2ibH6ULf2/Arn232AOSP+
 mVMfNrDNJD4JV8SK/u2qorkCbNvRnrk0dHBbMx/C0+hS36EEcrFvLAfGM4xVOhSt89wU/R
 vHUKckJOvnVaW3YS1BP9vsue7ktmS8KYWJLkW40XPYeqyCKV3JTno0I9b26+KOVZeIQOMF
 sOGpyZ6ll1N7xME+h7zWJsrRqyx3ajRApZ9zVuk4IwMnNQbdNBbihWfYDVKgRC/TeSTER7
 CysSxErQjiw1g0CR+60sjCcNfDlaDiRwqfEG5ThLwbb16LqOEMQq0GU22sqxrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jdVAAyN3
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: fix uclibc with
 libiconv build
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 20 Feb 2023 20:21:25 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace patch added by commit 9525bc7e64e8f44c31ab9dfd3f516ecb35982429
> as current patch is not correct, build failures are still raised by
> uclibc-ng with libiconv on fwup/gvfs/...:
> 
> configure: error: Requires libarchive. Libarchive must be built with zlib support.
> 
> [...]
> 
> Run-time dependency libarchive found: NO (tried cmake)
> 
> ../output-1/build/gvfs-1.48.1/meson.build:405:2: ERROR: Dependency lookup for libarchive with method 'pkgconfig' failed: Could not generate cargs for libarchive:
> Package iconv was not found in the pkg-config search path.
> Perhaps you should add the directory containing `iconv.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'iconv', required by 'libarchive', not found
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/05a5496495e51da2c9caf7570695cc95e1745e30
>  - http://autobuild.buildroot.org/results/98dc4b415115cca65b53e4cd986144ef85bf17ad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...y-add-iconv-to-the-pc-file-if-needed.patch | 44 -------------------
>  ...o-not-add-iconv-for-Requires.private.patch | 28 ++++++++++++
>  2 files changed, 28 insertions(+), 44 deletions(-)
>  delete mode 100644 package/libarchive/0001-Only-add-iconv-to-the-pc-file-if-needed.patch
>  create mode 100644 package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch

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
