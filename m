Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72B4E73170
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6680B4091D;
	Mon,  2 Feb 2026 13:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L89AtNWV30YY; Mon,  2 Feb 2026 13:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85E1E4092B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770039660;
	bh=7Q9soyb4VsqEym/1qhMuh9lmm2dkNdUpsn/zGiJGDh8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmrMjbpZfCJZ8pVYiKLBdNqZzOUCUL3r2t0EamONbPZ4QSYSZiEr4HPPG0gHALYpF
	 wJZRz9Qn+rHphg1NDVxGeEAyFR9yQZkEnoHBdhWzvE5H1dl/5tahhzohb3e3K/6YAk
	 hosdxWiytCBkQC1bU5E8uTmiCtveVF0viy3ru0MPtvw9mDsiFS8fUMSLwvG3ququUF
	 48z1BOWXevaIhWWiB4ukNIZKrHdxigRfutRAdAYqrV2vidzHwS/C7i1f/mb7rhEAcJ
	 xnsdOR7WlEywQqDpSkPa9zYdVgpwznCMnqP1Jzcj2HstWhWPWBGtAvMXNfBcUIzqHU
	 41RdJ0fJasxMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85E1E4092B;
	Mon,  2 Feb 2026 13:41:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5096149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C95F34092B
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b75v31JDpYTT for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD7504091D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD7504091D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD7504091D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:40:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1717093127; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 13:40:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmuAf-000000066Ht-3RLC;
 Mon, 02 Feb 2026 14:40:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Adrian Perez de Castro <aperez@igalia.com>, Julien Olivain <ju.o@free.fr>
In-Reply-To: <cc93ebe7f1b702a71c48e410766eaf54@free.fr> (Julien Olivain via
 buildroot's message of "Sun, 19 Oct 2025 23:31:07 +0200")
References: <20251017131035.224739-1-aperez@igalia.com>
 <cc93ebe7f1b702a71c48e410766eaf54@free.fr>
Date: Mon, 02 Feb 2026 14:40:53 +0100
Message-ID: <87ldhb1cwq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=H8CZoK2+l8WKXEFB9YnPtm2kUQhhcjeyC7+0thrvLNBJLTxTp4lyvvNLVbYcGjho7SZRYO5y9sPmKLUasSKqdRJyUoMstLzZ7MlX5bRb78zlVEfSaAU3KAxumMCDB7yJQ6fFZd89ZPzgi57vqBVhVudAqY4/v0oACnC89lVyr40H8S8u+Mr4gqZm22fRssEPWF+yOYRBaj23tMi2d2/r4Ny2g/WKQbBY5sozji1PkxLTG4wNDySJFBoF1VvZ+UMC58BiZC25i41YxqM5jHgK4ke3QDQymeSFsalS2DIv1gfc9PipGchFFA/5jWpQZ7mH2I6/fMFZwaXKaPD0io1OJQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=eOIeWtjYpkx7Adyf3/wPbjeA4UMtTeWCW+uDyU6OcbM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=H8CZoK2+
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.50.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

Hi Adrian,

 > I naively tried to compile the package with this patch on top of the
 > master branch at commit 7095e120a2 with the following commands:

 >     cat >.config <<EOF
 >     BR2_aarch64=y
 >     BR2_TOOLCHAIN_EXTERNAL=y
 >     BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 >     BR2_PACKAGE_MESA3D=y
 >     BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
 >     BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 >     BR2_PACKAGE_MESA3D_OPENGL_ES=y
 >     BR2_PACKAGE_WPEWEBKIT=y
 >     BR2_PACKAGE_WPEWEBKIT_SANDBOX=y
 >     BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y
 >     BR2_PACKAGE_WPEWEBKIT_MEDIA_STREAM=y
 >     BR2_PACKAGE_WPEWEBKIT_WEBDRIVER=y
 >     EOF
 >     make olddefconfig
 >     make wpewebkit

 > And it failed at configure time, complaining about missing
 > freetype (then fontconfig) libraries, with the following error:

 > Could NOT find Freetype (missing: FREETYPE_LIBRARY
 > FREETYPE_INCLUDE_DIRS)
 > (Required is at least version "2.9.0")

 > I also tried with BR2_PACKAGE_WPEWEBKIT=y only (without the
 > sub-options) and it fails the same way. I don't think the issue
 > is introduced by this patch, as I see the same issue without this
 > patch.

 > I was not able to compile the package without manual modifications.

 > Could you have a look if you can fix this issue, please?

Could you please have a look at this Adrian? Having a wpewebkit package
with known security issues since October is not great :(

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
