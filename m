Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D206CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E126381DFD;
	Fri, 29 Aug 2025 17:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOX47nyoRAyt; Fri, 29 Aug 2025 17:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB2482235
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB2482235;
	Fri, 29 Aug 2025 17:53:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C3AD2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B660381DFD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw04ELuB8Z9j for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:53:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD90682235
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD90682235
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD90682235
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 275A9B9782D8; Fri, 29 Aug 2025 19:53:12 +0200 (CEST)
Message-ID: <7fd3dee0-3950-4dfd-81a5-3d9d6f5d6fb4@rnout.be>
Date: Fri, 29 Aug 2025 19:53:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>
References: <20250828215927.2281857-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828215927.2281857-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756489992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=gQN9TmxQuMV2vtz+ZIKJS3k95UUcuRVsuDQl6rzeKRs=;
 b=HDYDUNJBnSlXXP/fXW1o3NO9eRlqaiQ354t92oCJlt6FtxjtjhPI8SRmooDEf5B92u4nxi
 30hmYjn+MxUpCoHViEq76l9SJpNU9NbpT9Ai3P9BGEivgk/nbSOPqTeh39wvLZueSCkJfr
 Aa6fN440VsFuCQU2MQuZxxDQvLm0yjOli8InzT1VpuI8DrdTuz31Sh6i9jmc4thkpghRAa
 nGAlXi7ZmtEQNIRYCRrNqatrI9E7lHes6vjxtJ8+QviGf9hLVBTXAg3egKbQcuHxTAzUxd
 n3/Qpv0ZVddZqNzoD8eLD0/KwY4Hrvb7EwqlYl60kYFeg2z+opjtj/XdrwjTUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=HDYDUNJB
Subject: Re: [Buildroot] [PATCH] package/ipmitool: move to codeberg
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



On 28/08/2025 23:59, Peter Korsgaard wrote:
> The github repo was deleted and moved to codeberg, so use that instead:
> 
> https://lwn.net/Articles/926101/
> 
> It is unclear if the auto generated tarballs from codeberg are reproducible,
> so instead fetch through git.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/ipmitool/Config.in     | 2 +-
>   package/ipmitool/ipmitool.hash | 2 +-
>   package/ipmitool/ipmitool.mk   | 5 +++--
>   3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
> index dd2b0e6b6d..f759caa08f 100644
> --- a/package/ipmitool/Config.in
> +++ b/package/ipmitool/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_IPMITOOL
>   	  it can be provided by the iana-assignment package or by a
>   	  rootfs overlay.
>   
> -	  https://github.com/ipmitool/ipmitool/
> +	  https://codeberg.org/IPMITool/ipmitool/
>   
>   if BR2_PACKAGE_IPMITOOL
>   
> diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
> index c3b298e3ba..c65fdb0342 100644
> --- a/package/ipmitool/ipmitool.hash
> +++ b/package/ipmitool/ipmitool.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
> +sha256  78bc6fdbb0487652a3d0220072b9428d4ab6dfc198de2f28e8493932e6b893af  ipmitool-IPMITOOL_1_8_19-git4.tar.gz
>   sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
> diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
> index 159bb7c8b6..04c77bcae3 100644
> --- a/package/ipmitool/ipmitool.mk
> +++ b/package/ipmitool/ipmitool.mk
> @@ -4,8 +4,9 @@
>   #
>   ################################################################################
>   
> -IPMITOOL_VERSION = 1_8_19
> -IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
> +IPMITOOL_VERSION = IPMITOOL_1_8_19

  Meh, this breaks release monitoring and CPE. So either we have to remove 
CPE_ID_IS_VALID, or we have to set the CPE version.

  We really should fix that VERSION/DL_VERSION mess.

  Marked as Changes Requested.

  Regards,
  Arnout

> +IPMITOOL_SITE = https://codeberg.org/IPMITool/ipmitool.git
> +IPMITOOL_SITE_METHOD = git
>   IPMITOOL_LICENSE = BSD-3-Clause
>   IPMITOOL_LICENSE_FILES = COPYING
>   IPMITOOL_CPE_ID_VALID = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
