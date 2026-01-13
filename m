Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF90D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1415840159;
	Tue, 13 Jan 2026 19:46:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSvTwYpvtqZp; Tue, 13 Jan 2026 19:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD74A403F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333561;
	bh=IdQoXeJejjsya+PaV4r9bngy+rZGAbEiNe3Hj6UNfvg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WsZRn641K3bkKlimBggDbOw+s0u/evkGLSojLO6XMRtI/Y9a7qEGYmyH4ORLXNsGD
	 mD3ANycjCEho1n6Yb7HLpFRou/3GWeD9mV2NKw8tzUGzGdTwAoAfhX+lcHHO4C3X6r
	 GyhzVRS5L7ud24uKO9ZUXXVHMqLVM9zkuNIgZjWNCKZvzr/cQNIehPpdRhtXTCcpk3
	 keFCDlqE9XK50Pg1HVZEQ6hoUVlAy/ETwxY3tC4moel4RtdJWvEt+tWG0qEYE+WD22
	 ebmbgEpKnqcwQEFJ/JeWc6FawEI+qhWqkrWC6fWqGyvBOf0eGsXjuQis4IwtuUC9oH
	 logJTdeRFGcnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD74A403F5;
	Tue, 13 Jan 2026 19:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D22CB1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B83D960B48
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaL0WTxLkVSP for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF3E260A94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF3E260A94
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF3E260A94
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5244B97A885; Tue, 13 Jan 2026 20:45:54 +0100 (CET)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:53 +0100
Message-ID: <20260113194553.98079-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aPIcBESMsMyWuILS@waldemar-brodkorb.de>
References: <aPIcBESMsMyWuILS@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333554; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=pwFRimEqthugVeDr1rZ+DMHgDT6CvwxeZYlClBz5rL4=;
 b=Wldb4qw20/QTNu8ulBCWr0zfmP/yWTUZaujNKCo2my354x48DjjujQl2QtBIGCkntxu1GZ
 XUWyVAl3yBTY6ngNg1dFvkkvLC1FTiFPb8Da3+XR/jUfuWraLnPzMgtFNZBfyvdMq5P0q8
 sNJQX8CRNCx5enUaw4GxUsIs2Vzuoti0SZymviCIc8IMdv2hJ4gv3iv7aA36hMDSWv3ngh
 d9PnnsbygyA6r0yA83t5O5GySZwq2j3L4+RSSNqqnAOlK5yv3L9GMAupw9yklSa+sA6H1A
 HBnKHkNqLyLKWa94o8CGJQKKRCd3nL1FbfFKre+u3WLkMztv62++wayXmhBHIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Wldb4qw2
Subject: Re: [Buildroot] [PATCH v2 1/6] package/fontconfig: disable doc and
 tests for host
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
> On Debian 13 doc generation fails. Disable it like for
> the target.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/fontconfig/fontconfig.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
> index d9f5dbefad..639f6ed51d 100644
> --- a/package/fontconfig/fontconfig.mk
> +++ b/package/fontconfig/fontconfig.mk
> @@ -16,6 +16,10 @@ FONTCONFIG_LICENSE = fontconfig license
>  FONTCONFIG_LICENSE_FILES = COPYING
>  FONTCONFIG_CPE_ID_VALID = YES
>  
> +HOST_FONTCONFIG_CONF_OPTS = \
> +	-Dtests=disabled \
> +	-Ddoc=disabled
> +
>  FONTCONFIG_CONF_OPTS = \
>  	-Dcache-dir=/var/cache/fontconfig \
>  	-Dtests=disabled \
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
