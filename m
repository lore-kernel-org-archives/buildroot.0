Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895B1CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587B480E30;
	Fri, 29 May 2026 17:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jc2Q45NZ82X; Fri, 29 May 2026 17:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C64F80DA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077283;
	bh=jW5AETxqZL+WqxjpwVApYfGttn5qcoPr6UPjTUBq+sI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=PvxCBxjcIrt75HFEF6soY40cBfzFlsN7IxixeVNYfZimf8h/00NhOsHKZTNFYuj8E
	 gc8TUNnrlSF8md57I4sdYvkIwROasc5/ZMrUR1nhOPLKSsgXXYgfkKRQk+91JGQ9eP
	 CHiYuu2tzYSwVmEHFmuye5BS699bs3I5pAJNWy8gZVwRhc8mEXCamfyKqkmMPRxGw1
	 h5Y36Yeqr7VVrsaAxsYv9FNM45lYcK0dVUZfRbGzDAeMuVnFatjbacZcCbsdwkG0n4
	 D6AqZwdVexSyajHzhyEoo6L1Ogj53xs3BiUjrc8nOSL3tkZOt1FbhStm8ScgH+mUt+
	 VnkuBQl5KSnOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C64F80DA9;
	Fri, 29 May 2026 17:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA702D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98B6341FD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbBDsZmLLIHn for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BD7440431
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BD7440431
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BD7440431
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:54:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13893B97C6DE; Fri, 29 May 2026 19:54:38 +0200 (CEST)
Message-ID: <77a20abe-a404-442f-92f7-3839904a3a63@rnout.be>
Date: Fri, 29 May 2026 19:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260524153436.919328-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260524153436.919328-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780077278; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=mJjsbU1/IRtolXxcRRVc3tp4bPKv8ghdTIRc36XmK+4=;
 b=G+w8RZNP+DbOjUzOXCAvM5216vn32LSPHcjfxBBVY/haUK1WWG3WsDyRI9UbKiKerRuUew
 S5LHQ7C1VXSV8evaUKC3JeiEL6k/B9EdTFH7FKzTlX5+vSbEgIctgpkLXKiodMAZ9mzeSh
 29BL7jIJD9Q+Aph0oPUKHabKxGcs/n7bWcBxD5YoAJ84lsmuF/inT+qldpTtXQaD1sl5b6
 83iob2YCMTpxbgBfQclC3vt9G8pYTRnZf+g6yWQby9SWkYqMKeOdEQ377wVrvfSYGmDqiH
 NFYp8PSAqL6CUwWGN1xx1lQH/K71H0UBTcJaj7zST5DVAZAT8JrkcQF0Z1zZNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=G+w8RZNP
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 disable qsv support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/05/2026 17:34, Bernd Kuhls wrote:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/64ed6075b782578d57edd09b3463071d6e5a4342
> added support for the Intel Quick Sync Video Encoder with version 1.22.0
> that was added to buildroot with commit
> 895840edd2784492d9b7066330b43842b703343b.
> 
> On unsupported platform the build is broken:
> 
> In file included from ../sys/qsv/libmfx/api/vpl/mfxdispatcher.h:10,
>                   from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.h:24,
>                   from ../sys/qsv/libmfx/dispatcher/vpl/mfx_dispatcher_vpl_log.cpp:7:
> ../sys/qsv/libmfx/api/vpl/mfxdefs.h:75:6: error: #error Unknown packing
>     75 |     #error Unknown packing
> 
> caused by
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/blob/1.24.13/subprojects/gst-plugins-bad/sys/qsv/libmfx/api/vpl/mfxdefs.h?ref_type=tags#L75
> 
> For now we disable qsv support to fix build errors on
> 
> arc: https://autobuild.buildroot.net/results/2d5/2d5666324db2fca7ab0419e28481829edca949b3/
> m68k: https://autobuild.buildroot.net/results/53b/53ba2e9d09c25fe85e96b6e1fc9adbfcf5a637b2/
> microblazeel: https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/
> or1k: https://autobuild.buildroot.net/results/17e/17e3dac016a08da8db58d735d0f2d3acc259f81f/
> sparc: https://autobuild.buildroot.net/results/f07/f07995804faa0be38bbba462c52be86c6c69822b/
> 
> Fixes:
> https://autobuild.buildroot.net/results/bc2/bc2b2324f385d2cafdae71ac19804f27f7a7414b/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index c6fb669e13..ac554749c9 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -39,6 +39,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>   	-Davtp=disabled \
>   	-Dopensles=disabled \
>   	-Dmsdk=disabled \
> +	-Dqsv=disabled \
>   	-Dvoamrwbenc=disabled \
>   	-Dbs2b=disabled \
>   	-Dchromaprint=disabled \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
