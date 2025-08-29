Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251EDCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001D5616C8;
	Fri, 29 Aug 2025 17:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6ohqRIp-2Ri; Fri, 29 Aug 2025 17:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A7B4616C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A7B4616C0;
	Fri, 29 Aug 2025 17:50:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B08A4D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 974B3616C0
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZF1MvEZdWnT for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:50:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D32BC616BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32BC616BB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D32BC616BB
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:50:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9F6DB978462; Fri, 29 Aug 2025 19:50:40 +0200 (CEST)
Message-ID: <fb4fd452-04b1-41eb-8a84-7674f57d3608@rnout.be>
Date: Fri, 29 Aug 2025 19:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250828153340.1908555-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250828153340.1908555-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756489841; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=LtRZp/++fg1G86ve2mjS9qfSLeb1IwLkAaz/3XgALvk=;
 b=JNdv74yctJ0en0yMPNRuk1WzeyLxF8YoWSuc27b43rQss+hUIg/H9qGsSyrPwZ5gCio2rm
 vf0akwyVSJXJwTV0vjnb845IzGHeGsux7zstExSk95L50DaaGmrHLB+ixNvX0w5nb1fBbX
 f5yEspFQhmaBmKuttStTH0De+ArH7J/S9ea72C326iALMeQC/LDGIJ9znfpugIL3PRecWo
 UzGxvBrL988DV6gTQWZqEzO3cOfosJh8CapbhKl2HU1NVx3bsVpG6JoXm1z7kqsgG9S2Op
 7bPVbNaVa5zFnifghn1NTc1HTPxghqNj32qAft5TfxcYveoK61pyEQCCEMu0Nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=JNdv74yc
Subject: Re: [Buildroot] [PATCH] package/libcap-ng: disable pthread support
 on nommu
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



On 28/08/2025 17:33, Peter Korsgaard wrote:
> Fixes https://autobuild.buildroot.net/results/9c40c86a42882a6d56eb6d6d1418781a980b6f8f/
> 
> The pthread support uses pthread_atfork(), which is not available on nommu:
> 
> cap-ng.c: In function 'init_lib':
> cap-ng.c:225:9: error: implicit declaration of function 'pthread_atfork';
>    did you mean 'pthread_join'?  [-Wimplicit-function-declaration]
> 
> So disable pthread support on nommu to fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libcap-ng/libcap-ng.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
> index 9c8012b238..e544e27696 100644
> --- a/package/libcap-ng/libcap-ng.mk
> +++ b/package/libcap-ng/libcap-ng.mk
> @@ -14,6 +14,11 @@ LIBCAP_NG_INSTALL_STAGING = YES
>   LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
>   LIBCAP_NG_CONF_OPTS = --without-python3
>   
> +# pthread support uses pthread_atfork, which is not available on nommu
> +ifneq ($(BR2_USE_MMU),y)
> +LIBCAP_NG_CONF_ENV += ac_cv_header_pthread_h=no
> +endif
> +
>   HOST_LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
>   HOST_LIBCAP_NG_CONF_OPTS = --without-python3
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
