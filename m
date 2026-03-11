Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A217A11258BE
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 20:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF78412E9;
	Wed, 11 Mar 2026 20:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjva488FZ2um; Wed, 11 Mar 2026 20:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 770DD412D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773261633;
	bh=clZrx/ZzdN10qWptDFMCUipubLb63Q4sMdog4MacHdE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ALFKpYW8JOvXFi/TdB2jrookf38ChMTdm+OUaozrQ6Nt6p84Vwcj4/vr2L95NX6LV
	 3TMAmKfzYvanuxJV5h8BFebez66gSh2QkB1T4LKXSnwefkLUKMBYezS6TprExUWRgC
	 p0y/Lte94gIPOOSXhdVYLxiM4nhknRZFApdw2JHuI37D6kZKGqjEOXMnTbnPHnUSH6
	 g+KBFEbljz4o5LQ948S7WlqRLWXoHIynfa26WzBYhsfwK/skMqx2mEDKbJPrT0Rqzd
	 VME6wd9zLiuwEYAbunE6OmNUr9vYGnwK1RXQE72nX21tan4ppghimEuBEVTnyda1Dl
	 HV1gNVIEw8HDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 770DD412D2;
	Wed, 11 Mar 2026 20:40:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6383201
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 20:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBCE7412D2
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 20:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5vmI9vh2DsCw for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 20:40:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 949A5412BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 949A5412BB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 949A5412BB
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 20:40:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E2E8B97B77F; Wed, 11 Mar 2026 21:40:27 +0100 (CET)
Message-ID: <dfcae90a-f8c3-4213-ab07-f9df63884122@rnout.be>
Date: Wed, 11 Mar 2026 21:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, Martin Willi <martin@strongswan.org>
Cc: buildroot@buildroot.org
References: <20260305115752.1861153-9-martin@strongswan.org>
 <20260311081838.23403-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260311081838.23403-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1773261629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=nWnk628CD/drwNQBmsA+AnvgtC1U8mA3A0y3jiyor2o=;
 b=CS204dfhekOC4IT/K3VavQGud6Wv0Ej5/kpRLISbPQkq7dHENVAenuEuHTDtV+AMSgJxBZ
 Ppe4VEetufCNpi0g4dEetrkxF1Jni0VSy1iK2oiEUf/07fzxjOAvfC+PVb5ICQNI0elFLG
 0DHCjM63G/McDCi1ZC8hgYS68ToYqwvqWK7/EPMcRYW/ti2m8x30YkxBjsSNMXl1Ww27Az
 mpWtKzzRRAerE9h7blOpGKLBtV0DOyvdJl1igDXFWXVEzXamBo8Q27lummkxIPX+FnRqra
 Xq7/C394kpeZ6LJnGPdPtIUIao2g0Y1Vy4xrXPqp50k+9g/vKmvCJh5nQ6MZNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=CS204dfh
Subject: Re: [Buildroot] [PATCH v2 8/8] utils/generate-cyclonedx: add hashes
 from .hash files to externalReferences
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



On 11/03/2026 09:18, Thomas Perale via buildroot wrote:
> Hi Martin,
> 
[snip]
> You should first expose the hash files from the show info output:
> 
> ```
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 288a202230..1e172a44e1 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -183,6 +183,13 @@ define _json-info-pkg-details
>   	],
>   	"redistributable": $(if $(filter NO,$($(1)_REDISTRIBUTE)),false,true),
>   	"dl_dir": $(call mk-json-str,$($(1)_DL_SUBDIR)),
> +	"hashes": [
> +		$(call make-comma-list, \
> +			$(foreach hash,$($(1)_HASH_FILES),
> +				$(call mk-json-str,$(hash)) \
> +			) \
> +		)
> +	],
>   	"downloads": [
>   	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
>   		{
> ```
> 
> The problem I spotted with this method is for packages without hash files this
> code snippet will still report `packages/<name>/<name>.hash` even if the file
> doesn't exist.

  That can be solved with a wildcard:

$(foreach hash,$(wildcard $($(1)_HASH_FILES))), ...

If the file doesn't exist it evaluates to empty.

  Regards,
  Arnout

[snip]


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
