Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B645BEDEBEF
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0FA81517;
	Tue,  3 Mar 2026 20:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9SuxD2KufBO; Tue,  3 Mar 2026 20:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E932D814BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568826;
	bh=RYNMKqo07BphJ8ffBjtX0NYASByVVWLAypGU9ig9d2w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TIBda8pYgvw9nHvC9tFgF9QMmX8KRzpeEo1bJ9Bg9cEJ1vdEVg39xDsDdGUtkFRso
	 +C740SFTFoOp7OfdRqAfgp6KMonxmxsD/+uauz3KEz9YjUeSoKAh0isLlp/wMU7mby
	 FIYZ1PzOB5CUsPtBn+b4BAXXT0J/pe6Fk7fAZjVzXptU6PNFse0Ha7M8bAMIQHdM1G
	 7hnaRkPhxtvwy6PuyJN4mm/ew3fZVtGq7tcH8ux/Y9K86sVwgDQsZZ0kNKSoNdRggr
	 j3rKXZeJcMuDNyCc/X33PwTVlUhWYTkNLTugaMOSDx9Ms6qySf4CuUolU1k/4HMp2A
	 tKcM6yDal7TWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E932D814BF;
	Tue,  3 Mar 2026 20:13:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAF2925B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD01140A39
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlUlg44pH7nY for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA36140A34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA36140A34
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA36140A34
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:13:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B00BB97B55A; Tue,  3 Mar 2026 21:13:40 +0100 (CET)
Message-ID: <1706f2bc-7132-4d4b-9c43-895710f000fb@rnout.be>
Date: Tue, 3 Mar 2026 21:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Mark Corbin <mark@dibsco.co.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260208143604.1477756-1-ju.o@free.fr>
 <20260208143604.1477756-4-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260208143604.1477756-4-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1772568820; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Jef0WzGgsexXRV1XMop9TbyqpH3TghiU3padMBMxWGQ=;
 b=oIUTS99C7goXcSqbCxNYBPYdd+uEqexsN4pHv7hUkN6uMn2YU9TatfmZ5X8OcWXgHAPObJ
 T9PzmvJE9zlsGlSp5PwHYlb//b5l8nwuZuDqLduJAMNFMXwFGMnM9qsXSyB90eoT6ZA9tm
 aXqgqCEPKB7T0oq5SdD165d8r/FWwVRFVJQvhjBnsRD+J6AiDFbmpndowRmbmNC0FhsOgj
 RYnz1ZN8IyTlSMMTl363x4ohJlQD0paxytwVrp2wTa95BJYFG7VLikTtwHXWEzVInSD4E8
 a0ZI/Mfh+9DGhkp5nSYbJntJhsr1c1A7PHAHGGRnRW4R4WIAjvIJ9+/Run5C3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=oIUTS99C
Subject: Re: [Buildroot] [PATCH RFC 3/5] Config.in: add
 BR2_HIDE_SECONDARY_TARGET_OPTIONS
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



On 08/02/2026 15:36, Julien Olivain wrote:
> This patch is needed with the current kconfig version in Buildroot.
> If kconfig get updated with the series proposed in:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=490997
> the current patch might not be needed.
> 
> Suggested-by: Arnout Vandecappelle <arnout@rnout.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index d730f2034b..71120e0d7c 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -15,6 +15,10 @@ config BR2_HAVE_DOT_CONFIG
>   config BR2_BROKEN
>   	bool
>   
> +config BR2_HIDE_SECONDARY_TARGET_OPTIONS
> +	string

  Better make this a bool option, cfr. SKIP_LEGACY.

  Regards,
  Arnout

> +	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
> +
>   config BR2_VERSION
>   	string
>   	option env="BR2_VERSION_FULL"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
