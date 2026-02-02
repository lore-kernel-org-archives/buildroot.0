Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04453E7DF08
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BACC260BCC;
	Mon,  2 Feb 2026 16:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spTT0l050Yir; Mon,  2 Feb 2026 16:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B43CD60BCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050418;
	bh=eKOHoRvJQk+OsBYePSCy+wtN27Q1NdfCrP/2t3HVH9M=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Do4NarpPc6dNEelrw6QREm/jdhmMdwPEk2c7MNMZPCL71z9MHdBdJCkiOF6sOsDAX
	 7fxRH+DsvmR3LbvyPXMzm2I9QuwIwPXYOgM9hjfX5sNgC7UIYni5kNiyYCBfTDDHN6
	 nWDow5JnW5ucKNs7fmvcJ104jMTod5XGrPwpvjt2gAdgB2bo4hZ+tZ4irTrOmDM7Vu
	 YJMA7YZ1WCEqYI6nx8xdzjw0ZodHXsvSIpPCmH5PEOuDmBQ9uQ2Uzzpk0PYs3oRmfC
	 Hxe5tBb2J3y/BHIyN4O5xtCpzHQcZOYD0x28w5todw227hg2PyORHt1cYrJhwbA0JF
	 BgWV+3GrAxjqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B43CD60BCF;
	Mon,  2 Feb 2026 16:40:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06B041E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F069440B89
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEXe1fw-lqYy for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:40:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D72CD40B7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72CD40B7D
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D72CD40B7D
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:40:15 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so39821985e9.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 08:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770050413; x=1770655213;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBJA8nUG9bmBAh40nxnwt1Tg4BH1golAI95Tpm30YAc=;
 b=wXNVsDK9JTBcEOTn+57U44826cll7NUfs5u2V7HfbVX0iApKG1S3bPXLByb4nQVYUO
 D9j8Swf5ubZk1SKI659mNdi6rKz1lHAQuIfby6aV8/FmKUW09Zv5/+gLqXUDX4waiars
 1+VXFZ423W/KKn3kxWowR9bDZ1QSHwL1U0qg5CYWRL+RoDmPcKdwsA+4kemqgYRINhKR
 HCPDFHF2cioOTZn9fZJWF92fz/fJMt4zTJHlz1NSdjExPgOjtMzSwCRNNtvAznQOfA0i
 WUTd5f4qN/bpOVnGhEJikNBoUuPKAi40fHDw2mD7PUOfw+DvsQ3NHetG+3cj1+7A3kFJ
 y/cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuFCoDJb5pebzJ4V1uI55ZwETLC0L2JlWLIb6Ysg2Yxi0jnxBaZP9Ba4XWdnz6b6O2lXHqjpaYhGs=@buildroot.org
X-Gm-Message-State: AOJu0YwWIO9GSH39F9nzYZ11mkd8rPnpp80J/40nnBklBGXtY75LlsM4
 hWEJAhbjAbVxiH22+EK/3izd1mp4JKbkgA7xybMOTLEdNLSPpPLQ8NM/V4VTfeqX0bDkf84Zj5X
 BuKgUwXLV2w==
X-Gm-Gg: AZuq6aIQXkrzQsruthGNp0UjEJJYKV6tgxob3bcoWOplOoDqDofMJdQdmt1o+SSzyx1
 3MnDXFFICA09ZhqyjZbDSLI01QT+x9JHULU/7G9BF3brXFWN6sz0EcoB7thEfVUt84Y/hVE9jy2
 PYgC9bTol5T33JsutI9dRuoPoh/OvyNxijJkHsHB/HXbzqlun/soHYC8oIYV2AV4cyEjz5aOF79
 iayLrzpQsnA2Atz6Z35qHfRymBoVo/xrJha2l6FTnKZwsZuarVnLlCuLZL46VBfYOrydhjtTSGu
 A1hcbwTtKkpUmUcPrPVB0McTTOcjOZmO8gvj7NJaETDBgeKokg9W80BlGnb2QBnBLV3vE7LtbhM
 OASkDIIkSlUIl90uOxME/xVKSKahAZlK62SKhG/OJvqICE70uAFVNzcuA7JDHSzto6PpwpnO6oW
 XJY9zcXKuof7tuhH5m/i6wum0OloyjZ9LtZuq955vVgEJq8gLwknGsrCFDsZ/AONZhHIAtcw==
X-Received: by 2002:a05:600c:8b61:b0:477:b642:9dc9 with SMTP id
 5b1f17b1804b1-482db4866d7mr146364765e9.28.1770050413273; 
 Mon, 02 Feb 2026 08:40:13 -0800 (PST)
Received: from [172.16.2.211] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e490esm45192558f8f.9.2026.02.02.08.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:40:13 -0800 (PST)
Message-ID: <0944d737-f44b-4293-ae89-e556df7ba7ac@mind.be>
Date: Mon, 2 Feb 2026 17:40:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260202161256.104871-1-thomas.perale@mind.be>
 <20260202161256.104871-3-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260202161256.104871-3-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770050413; x=1770655213; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tBJA8nUG9bmBAh40nxnwt1Tg4BH1golAI95Tpm30YAc=;
 b=fk1CKJJsQ/bk/Ef2IxWNcE8aOVWiUDNC91CNENK5iS3gfnbKLUG6w7sj0vBggIVrI9
 JW6IVSR+h5DG+OuVWGu3HG4ChFkWI1uc6hoVIYY2f3b1q82WiCQhl0mVSygcZRID9hlt
 8tQVkmrz5Wk9QzVmYsJgWp0+MK56m3U1OHskGuMjKtRrGJCrkBvFwPGzd5SuaBZPKuVr
 DMp1jupS8wVgS9RGY1p1JCjNC1YPtEKZuCFPohAGKLPndbaRFTHU+q4I6Il4OxY4znqM
 RYPHHEUm89gyfRPTMOtqcXh2tBaI+LZvhGcr5gQ0TLeo6F043T8fFAR2NUB9LB8fdzXp
 gAlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fk1CKJJs
Subject: Re: [Buildroot] [PATCH 3/3] utils/generate-cyclonedx: mark host
 packages as external
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 2/02/26 17:12, Thomas Perale wrote:
> Mark Buildroot's host packages as 'external' with the 'isExternal'
> property. Starting CycloneDX v1.7 [1][2] the CycloneDX spec defines this
> property like the following [3].
>
>> An external component is one that is not part of an assembly, but is
>> expected to be provided by the environment, regardless of the
>> component's .scope. This setting can be useful for distinguishing which
>> components are bundled with the product and which can be relied upon to
>> be present in the deployment environment.
> This fits the usage of 'host' packages : a package provided by the
> environment and not bundled with the target.
>
> [1] https://github.com/CycloneDX/specification/releases/tag/1.7
> [2] https://cyclonedx.org/docs/1.7/json/#components_items_isExternal
> [3] https://github.com/CycloneDX/specification/issues/321
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>   utils/generate-cyclonedx | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 1ef2544e1b..097d9707de 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -293,6 +293,9 @@ def cyclonedx_component(name, comp, ctx: Context):
>       return {
>           "bom-ref": name,
>           "type": "library",
> +        **({
> +            "isExternal": True
> +        } if ctx.CYCLONEDX_VERSION == "1.7" and comp["type"] == "host" else {}),
Nit: maybe check if cylone-dx version is greater or equal for future 
proofness ?
>           **({
>               "name": comp["name"],
>           } if "name" in comp else {}),

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
