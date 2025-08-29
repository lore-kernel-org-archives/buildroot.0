Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F8ACA0FFD
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E938B8447B;
	Fri, 29 Aug 2025 17:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MLuF-AqPgqu; Fri, 29 Aug 2025 17:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB15584481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB15584481;
	Fri, 29 Aug 2025 17:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46D6369
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CD8440656
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWh-ytBpMTY1 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5BB254003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BB254003D
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BB254003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:46:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1F0AB9782D8; Fri, 29 Aug 2025 19:46:45 +0200 (CEST)
Message-ID: <bf5a4c5b-14d9-4276-beef-dd3eaf6e625b@rnout.be>
Date: Fri, 29 Aug 2025 19:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250828132747.1591583-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828132747.1591583-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756489606; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=tIyBov2IerI0lRra2rccEyy3ce6+wOO/15J96ErSxPU=;
 b=SQA5UaThoSCJ2T41DEby5qcUkMzattiQmLgSc1E9q3S8Jzg5ewSSrmkmwDJQAyciQIK7Rd
 XFNhz70iXlFC9HwoEyTtUhOLMWqwFj+PGEfE8nEGjhJRA/DGO0leinR5g7ROAhvr4VLjjZ
 1TYNbh0KwL4d8smwnz1iWP7+vAsS1I5E79/zj11gmKQEeKXQKBUTm6fkfDYeFGXyuZKBZM
 Rk0ysU+9yI9L4+dQKUowVWAdEGJ5lSHrTCV8rzoCMmlP43Al28ISsHKca4r8Yf6o1KaEsv
 Dkf6sPrq1AJpOf83oy3hzDtlGqqse142tFGadlNzY5/GZm8Ic5ImwleElYbQNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SQA5UaTh
Subject: Re: [Buildroot] [PATCH] package/vde2: fix build w/ gcc-15
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



On 28/08/2025 15:27, Peter Korsgaard wrote:
> Fixes: https://autobuild.buildroot.net/results/8d14173f31922a737c326be75aa24c9f9471342a/
> 
> The vde2 source code uses empty argument function pointer prototypes like:
> 
> typedef ssize_t (* ssize_fun)();
> extern ssize_fun vdehist_vderead;
> 
> In C17 and earlier, such prototypes means unknown number of arguments,
> whereas with C23 it means no arguments, leading to build failures:
> 
> libvdehist.c:39:27: error: initialization of 'ssize_fun' {aka 'long int
>    (*)(void)'} from incompatible pointer type 'ssize_t (*)(int,  void *,
>    size_t)' {aka 'long int (*)(int,  void *, long unsigned int)'}
>    [-Wincompatible-pointer-types]
> 
> Workaround it using -std=gnu99.  Vde2 is provided both as a host and target
> package, so do this unconditionally for both.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/vde2/vde2.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/vde2/vde2.mk b/package/vde2/vde2.mk
> index ab4c32143d..7c7fbfca9c 100644
> --- a/package/vde2/vde2.mk
> +++ b/package/vde2/vde2.mk
> @@ -38,5 +38,10 @@ HOST_VDE2_CONF_OPTS = \
>   	--disable-profile \
>   	--enable-tuntap
>   
> +# C23 changes meaning of empty argument prototypes like int (*)()
> +# causing build failures, so force gnu99
> +VDE2_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
> +HOST_VDE2_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu99"
> +
>   $(eval $(autotools-package))
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
