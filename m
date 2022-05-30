Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3DDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D100F82BC4;
	Mon, 30 May 2022 20:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsPnelAmSVpx; Mon, 30 May 2022 20:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F310C82730;
	Mon, 30 May 2022 20:57:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CEB721BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD86760AE8
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kIt_GVF_GUx for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:56:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B25B4607A3
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:56:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AA9D20008;
 Mon, 30 May 2022 20:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653944215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfqR1a9Ewlfpv7iHBtQ9gT9OYD/wCS52BhkJqr7NyrQ=;
 b=d45QTQiwr+BfSEZX80iYrTVuMy2R0FwT0rYcMMOclt3+fPGpxZhS8z5aDXre6h1qiqaFAZ
 H5efALkLzGYLdkX69CqTZzVDBz/48vXSc/dSoddIzWavRsLZQEpqxuB1HI8e+5kffDcZ4j
 GB84Q7yPPjHKa4D0VgZp+A+NalbIxgErtpkTzbW4ubNbg+k9A2Z2yjkGo0kO5pMCQ+yfDg
 WJltPXr45VBsEcw4fAO/Xo09kVCa4+bK1pI/Apq4rMDnLB26vIPmVSXIZxVT/COjzxXQyn
 kG65ipCyqR7LZ9pTGKMVvU76JqnOXsxAQAJ/FAc5rZob2Kubvd4rIzJZ32Jzdw==
Date: Mon, 30 May 2022 22:56:54 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220530225654.3b93904e@windsurf>
In-Reply-To: <20220521115055.33789-1-fontaine.fabrice@gmail.com>
References: <20220521115055.33789-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcec: fix build with gcc 10
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 21 May 2022 13:50:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 10:
> 
> /nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h: In function 'bool LibCecBootloader(const char*)':
> /nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:175:14: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
>   175 |       return NULL;
>       |              ^~~~
> /nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:184:12: error: converting to 'bool' from 'std::nullptr_t' requires direct-initialization [-fpermissive]
>   184 |     return NULL;
>       |            ^~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e34bd78cc81e6da12a85c1e4ee76931818d91073
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-cecloader-h-fix-null-return.patch    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/libcec/0001-cecloader-h-fix-null-return.patch

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
