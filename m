Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC0AD29DE5
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F79484222;
	Tue, 13 Jan 2026 19:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4T2YnsGAbgqd; Tue, 13 Jan 2026 19:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7209A84269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333601;
	bh=awnZ1NxIyYZC35TvZa+01kHKrT/C8+ip/ChJbsE8Fuc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z8VALmDZcpIMYr55J9aGnPnXKBVZ0MYiOJ7YU+Iz5bi1n1FccASw7waDq4xFqWLuS
	 wiwGVTxzTT2JOlGbUrEG0eocV7tvaC8Z+lmuCYEq+k9dPgIohMyj8PNBSIzpyzNo6q
	 jv5ZkTwQZpPzEzKZCeHu+LbAC80awzwYrWZdF0mbyC1vDOV3WCA9POZUD+iziLneKo
	 16TsuVmQwCz2EU9wni7jFPk6e6c1LbzDsampOmA7Du31FPufRoKLaEBX/Xzj8Gla2X
	 3WEQiC84oY/x6fWsUGE9ka5tHWrMwX55IiDsWsrpz8jQexcH4YPdH9pcYy4AB/i1J9
	 hcbBLozfKXU6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7209A84269;
	Tue, 13 Jan 2026 19:46:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E66761C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D78D660BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9UqLWkfeMcl for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA53060BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA53060BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA53060BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F2B1EB97A863; Tue, 13 Jan 2026 20:46:36 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:35 +0100
Message-ID: <20260113194635.98803-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229075539.516207-1-bernd@kuhls.net>
References: <20251229075539.516207-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333597; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=m92pDKOB3j1lgcxxrOTEH4aocLOa+6uygsUVvG8XFeE=;
 b=ffsT/WFfj3Acvf9gLrPisHpyfA0oG5l5L3mhzM1mQmORWP4+JdDJAXjSdzLkpIqwAfpfkt
 bZhS5CLmuiAwarb+kfNks0kUhK9Dbi2gmLCGkLRNl/JWxiBdLxbNFNkNpdJNHOwdt0OAnq
 +MXoNTloZ0F9w/nFkD9dqNVOeMa5BZkpugzUfrG+/JZf8gqkpdLvc5F3pmW/lLXMZkcsJu
 52AcJE64ARhhC8NPh4zrL5aXEb1BF3mhWVyeDhYfv1UPq2rQwsHc91zrR4fy6nI3GA2VJE
 MB3IJB3xrp8fKsrfy44jMXt+QkeAw+yVQoJ/TQOAje0GC9WVAiRSMVWBa2HuIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ffsT/WFf
Subject: Re: [Buildroot] [PATCH 1/2] package/utfcpp: fix comments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454 added this
> package as copy from the taglib package but forgot to change all taglib-
> related comments.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/utfcpp/Config.in | 2 +-
>  package/utfcpp/utfcpp.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
> index 19e1f21688..3a3fc339bd 100644
> --- a/package/utfcpp/Config.in
> +++ b/package/utfcpp/Config.in
> @@ -6,5 +6,5 @@ config BR2_PACKAGE_UTFCPP
>  
>  	  https://github.com/nemtrif/utfcpp
>  
> -comment "taglib needs a toolchain w/ C++"
> +comment "utfcpp needs a toolchain w/ C++"
>  	depends on !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
> index d3d7896813..4e17364e0b 100644
> --- a/package/utfcpp/utfcpp.mk
> +++ b/package/utfcpp/utfcpp.mk
> @@ -1,6 +1,6 @@
>  ################################################################################
>  #
> -# taglib
> +# utfcpp
>  #
>  ################################################################################
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
