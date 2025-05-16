Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1CAC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 16:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0CA5612E3;
	Fri, 16 May 2025 16:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivhb1caTLYcv; Fri, 16 May 2025 16:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC8C612C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC8C612C1;
	Fri, 16 May 2025 16:51:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CF451AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 330CF40B77
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoOEVOW41WSj for <buildroot@buildroot.org>;
 Fri, 16 May 2025 16:51:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 364E040B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 364E040B6E
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 364E040B6E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 16:51:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a1f5d2d91eso1522885f8f.1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 09:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414287; x=1748019087;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNdMngm6eS+wdg85yKgzIzowg9t1F/X21ztLq/BUUC8=;
 b=Cmz7RlJO/exAC89zlxk260uwo2MqS8WCqo4rXbZBuicpB5GdXFbzebJsYPG/koUV1t
 /HRmUaoXVeCdyC/PatRU5P0BmfiGjRCwBbSAis4MqqI3XzvGheA+xobKOjyol0as9lJ8
 Ulxkd2beuWyygLC9rZlQr25NEBM4ngsMPGz4ngZs5laBOvCdJEfDFp6MwCeSnnHiunjL
 PYeNf6aqMPoPSOVYWNWMSd2ZW7PniYe2XCd2225xdIeC0GprZepvA5VTfFHJQWLheMu3
 Hxy4RP41qVgO5lnT3teE0ybvE9AS6jGL4qbc76UzexdAX1CU0gbUaCM2zLAuxxhC+UNv
 qA/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgHvLIqZAr+PvZWE015qgENS++XJPg8yyCp8iI+M45Ff+9/i1x/xseMvCE8aIiG6p93bDel1Xr8D4=@buildroot.org
X-Gm-Message-State: AOJu0YyQqLEmz05pyVhsATPIgWh/9Tuo1clueiBTRPH3XxWRr2VXL4tN
 fuw5QjOKbMWeTmM6TjGsZU7zyN2uutGxAQgzawLYKXjxPmz8n1dyc5yru7DYioducmE=
X-Gm-Gg: ASbGncvnWsF3cLZ8s9VizB5XQee4sQhP/VGCaikLKoCaRqFIhmsEb8ONRsc2s8LnYwf
 +js6bKtvuWwy6F1VHUxe3KnyJmSwfG9zZEmLE6d4TBFWMeDjLV/uM7XM/Jbm+MgqZA9n102MyXL
 EEcU74BhVFOkDrUuVyQn+ts9WJx8Ok5sjkQcq2vVtPKH1t75HJysFB080RF2UG/LQ37BoMamtHB
 s6wZwVLApyrVhReRLtjAci/cRyzyaSk/no8Fc54/MEG3IF3NNoLXMuK9RJdgVr+0KQZBPfdbCWN
 1VctuAOACa0gGwK1g58UhbYbh7pilqXLzeBpgxiJroByFrk86Ifq6Gbvf3lMebncmU3n1kxceam
 s85dDHqtlwWj6tN3vHVE4Q2hTU72EW0cwWhY=
X-Google-Smtp-Source: AGHT+IHG3e3Mn7KRxZskORh9X7A+rWLypt8nCf/5/VLKfV7MpMRKsKQqbLfh2agJyBG/WPD/hUsilQ==
X-Received: by 2002:a5d:5985:0:b0:3a0:7faa:309d with SMTP id
 ffacd0b85a97d-3a35c840dcfmr3968207f8f.37.1747414287266; 
 Fri, 16 May 2025 09:51:27 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3631c728esm1766237f8f.60.2025.05.16.09.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 09:51:26 -0700 (PDT)
Message-ID: <ff775150-d888-4163-b953-f2acdfaea9ad@mind.be>
Date: Fri, 16 May 2025 18:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250505160327.3422096-1-fiona.klute@gmx.de>
 <20250505160327.3422096-4-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20250505160327.3422096-4-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747414287; x=1748019087; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iNdMngm6eS+wdg85yKgzIzowg9t1F/X21ztLq/BUUC8=;
 b=gQFTZ0sUgrAGk5+2mbNj6TeCvHW93+BFDtc54jLfuxZkmQ8bvlXn35BYyLHz3w/YaT
 qcyY0/mFyADXPjTExEcZoYsG49FpB8v1d7kQ4eVgYgyq1kCn5AM+Lc4cErJBO9F8MnPu
 FkfVCYNXBEY2eZ+RGYRGDwJIOi/B0vsuIQnJTdax/zoBqJrDiguUy77bQ7dLvjwdoHck
 vFGndKOiX56lpCbq+V0tqftTBBt99blJdJoBi0ABm7foycBnz1qXCynRGjqFydIZ8bSL
 znxXutU4gdtJlDLtp/4GgioA8XEZTHlAYYq11RPZorSwNBq9J2yUT78tuOcY5+ykmBxO
 +8Bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gQFTZ0sU
Subject: Re: [Buildroot] [PATCH 3/3] utils/generate-cyclonedx: include
 external tree in package properties
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

Hello,

On 5/05/25 18:03, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>
> For packages from external trees, the bom-ref of the external tree is
> listed in the BR_EXTERNAL_TREE property. The external tree is
> identified based on its path and the new "package_dir" property in
> show-info output. If the package directory is not part of the main
> Buildroot repository or a known external tree, an exception is raised.
>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   utils/generate-cyclonedx | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index cbb7ef630e..7d7adb2ce4 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -206,16 +206,32 @@ def cyclonedx_patches(patch_list):
>       }
>   
>   
> -def cyclonedx_component(name, comp):
> +def cyclonedx_component(name, comp, ext_trees: list[ExternalTree]):
>       """Translate a component from the show-info output, to a component entry in CycloneDX format.
>   
>       Args:
>           name (str): Key used for the package in the show-info output.
>           comp (dict): Data about the package as a Python dictionary.
> +        ext_trees (list): External trees that were used in the build.
>   
>       Returns:
>           dict: Component information in CycloneDX format.
>       """
> +    pkg_dir = Path(comp["package_dir"])
> +    ext_tree_info = None
> +    if pkg_dir.is_absolute():
> +        # the package is from an external tree, find it
> +        for ext in ext_trees:
> +            if pkg_dir.is_relative_to(ext.path):
> +                ext_tree_info = {
> +                    "name": "BR_EXTERNAL_TREE",
> +                    "value": ext.bom_ref,
> +                }
> +                break
> +        if ext_tree_info is None:
> +            raise Exception(
> +                f'package "{name}" is from an unknown external tree at {pkg_dir!s}, use "-e" to provide external tree data')
> +
>       return {
>           "bom-ref": name,
>           "type": "library",
> @@ -230,10 +246,13 @@ def cyclonedx_component(name, comp):
>               "cpe": comp["cpe-id"],
>           } if "cpe-id" in comp else {}),
>           **(cyclonedx_patches(comp["patches"]) if comp.get("patches") else {}),
> -        "properties": [{
> -            "name": "BR_TYPE",
> -            "value": comp["type"],
> -        }],
> +        "properties": [
> +            {
> +                "name": "BR_TYPE",
> +                "value": comp["type"],
> +            },
> +            *((ext_tree_info,) if ext_tree_info else ()),
> +        ],
>       }
>   
>   
> @@ -351,7 +370,7 @@ def main():
>           "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
>           "specVersion": f"{CYCLONEDX_VERSION}",
>           "components": [
> -            cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
> +            cyclonedx_component(name, comp, external_trees) for name, comp in filtered_show_info_dict.items()
>           ],
>           "dependencies": [
>               cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
