Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D7FE87849
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D6A40BCE;
	Tue,  3 Feb 2026 16:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tdjx05WI0UDx; Tue,  3 Feb 2026 16:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A982B40BC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770137671;
	bh=OvHP1nLD/noXRNVTuT3L7oNeujsnmAoOy59o4d4WjwY=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Iw1BSAz0c9PBawRwho18nmNbkLldvExqQ+X7MfYMxYjh2Yh8RHXWzt1iPhFA7iq3T
	 d5qsofrLA0f7PreGTLO3ajrMA9H/17cYQaOIX8qY1P8DbvE513B0nUsm1OvLhuart3
	 /q/TrSr6zX485WYBn5H8DhQt4L2S7YHF/cQnmoEQkcIMSSJTNMADKA1FrCbA5E8dLN
	 kt0DBhtwxRw8EynuRnc3zcPx3jQxRCm2wW4BcfUwb0SXZj3IZeQdJQg448BaA6rPa5
	 vSUSQq05NtetHMNkq11LRxkBWgr1oymqbqx/OEoRkK6y9o1TceUwssBidOUFGx9dc7
	 BpbDMP7Zb+6Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A982B40BC5;
	Tue,  3 Feb 2026 16:54:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50919F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D83D6085F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7R2Dtoa4Y77d for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 133766068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133766068D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 133766068D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:54:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43596062728so2383f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 08:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770137666; x=1770742466;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rat+/eoGlDTrb1Tfw+jF7VCsuxKXpxngJZ8uWhVH8JM=;
 b=RN+2+KY6J+eXnunrxhKTdlOdvrqLjIEH1iJJKXLgGoP3eIs8CcNFHcOYT5j2SNUhSq
 8rPcjWv5vs1xesyUnSSjqFxQBsR6IG4fJe14qvTuL/pB7Ge6bKBT2JvVd2XC6chJisPV
 ONgPLmc4RCKZ/LmEbXGmTSG+bQhxmfizhS9ovxKbdxCjUuN92yOiFam2MwdrWkFjSv6U
 AwMbtxCDoqsiqMWiHur6rny7rfwKcp1qxvXNaamKBm9PB9ezkUtxBzQ80IlQIqsp84y+
 hzZBRppCH1hf7q0XK3/xpIEL1WgC2hAUUg4TNq/jFZr3dmobz18h7Tow3CiA1TomN0ih
 d/wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXWO9zsnO69+d1xOcbNdVzCIlDMve4gpbz3x0lb/VOi9pCH/WaDxVdTnc1obUk56St2q5MDP32bao=@buildroot.org
X-Gm-Message-State: AOJu0Yzyot9W6cQvB85+SUsocvTD2ekQ8qpuKGLZTfrwNr7asz47kz8p
 zJMmes1tCBxiN0Mn1iMUHrF1NROk0Q3neXzoqN2zqj/Lnn+guJFziORTC6HJSC+sgGXmRqj4JW/
 kW0c3row=
X-Gm-Gg: AZuq6aIY/60GfvrHGkn46yGpq5u26cVugpe4WBTxUIf5gaC6auZykn8hkBkNi1Ysh1t
 43uxAMCu7yVIzoXXnC8hJmCcBIwR02aIgJh3gAlGaS4cIhYO+kM+xC08u8fttAFEO/GTi70gD2I
 CoVk62IFQya33Ij3cp3Xq4ynkgEzm0GqMSOqARZsZoOvhNLCtlc/Hd/57gmUqdDhJQQ3H6NnJxU
 HmptIGbDDDR0zxS31LvTZYPwQc8nSIBtC23I2wjtZZoaIwysOG0AtaMEYMjOQlmKbCsMYmqFB4B
 9wufcvMo1pt43hNuPLZVHTSnb23xVYVv/lwQvFMbxrxUCQAnGyJFo8qM9oJbsbEeGyeD2DkA9Da
 zIXiSHbA2d1v5cjQv/Es1Y+vgAniiRVcZx3PsA5N6SmpXDso9yQwOO0r4QqU87MWplvIPVrb+vR
 OgNirlLQYUThA4UzLw+H9ksAKlEfvD8+CpfLfIev5lQfaZPg5M6PL/rvF8YiM=
X-Received: by 2002:a05:6000:25c6:b0:431:c06:bc82 with SMTP id
 ffacd0b85a97d-4361130ea29mr6769617f8f.12.1770137666306; 
 Tue, 03 Feb 2026 08:54:26 -0800 (PST)
Received: from [172.16.2.211] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322f40sm51387939f8f.34.2026.02.03.08.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:54:26 -0800 (PST)
Message-ID: <3f1678d6-4664-43b7-ab6a-b32a7493abf8@mind.be>
Date: Tue, 3 Feb 2026 17:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20260203135235.184869-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20260203135235.184869-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770137666; x=1770742466; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rat+/eoGlDTrb1Tfw+jF7VCsuxKXpxngJZ8uWhVH8JM=;
 b=WhAgABfVjTF74HvdnnORf2DpB9haXaGdaQJ95l/COKbQNM2OfyaEtUQa/c8/ZY75zs
 d/21Eor+kv3KD2K5JfOup9Q5incqMyqiDdeFr/HaLojo4gs/88YDOGE1Vecwv2DGUAwN
 qOaaNvwP3eC9HboQb3UsRT1H267fpzHR7Ng7bRVxnGBpGJk2ZoA8PLEz8WXAaR82beF2
 I6aWpnOKK6B5wtPGzwUW44/lnKS4up+rGE00Ed1W1KLuTNWvuguGLprrXFOom0hPCujE
 ZM6yqNz3Lj9noqBk89UFAoxXdlBORk0A2nPwyTxEo3/htfMdrDfzvYdJo1C3GIEAbSop
 JlEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WhAgABfV
Subject: Re: [Buildroot] [PATCH v2 1/5] utils/generate-cyclonedx: move
 license download in a function
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

Hi Thomas,

On 3/02/26 14:52, Thomas Perale wrote:
> Move the code that retrieve the SPDX licenses into a function instead of
> doing it top-level.
>
> This allows to pass the CycloneDX version as a function argument instead
> of defining it as a top-level constant.
> In next commit, the CycloneDX spec version might not be known when the
> top-level code is executed.
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Acked-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>   utils/generate-cyclonedx | 46 ++++++++++++++++++++++++++++------------
>   1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 2b6c6d63d3..93b648e481 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -21,12 +21,10 @@ import re
>   
>   
>   CYCLONEDX_VERSION = "1.6"
> -SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
>   
>   brpath = Path(__file__).parent.parent
>   
>   cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
> -SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
>   
>   BR2_VERSION_FULL = (
>       subprocess.check_output(
> @@ -41,20 +39,40 @@ BR2_VERSION_FULL = (
>   # 'resolved_with_pedigree'.
>   VULN_WITH_PEDIGREE = set()
>   
> +# List of supported SPDX license expression.
>   SPDX_LICENSES = []
>   
> -if not SPDX_SCHEMA_PATH.exists():
> -    # Download the CycloneDX SPDX schema JSON, and cache it locally
> -    cyclonedxpath.mkdir(parents=True, exist_ok=True)
> -    urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
>   
> -try:
> -    with SPDX_SCHEMA_PATH.open() as f:
> -        SPDX_LICENSES = json.load(f).get("enum", [])
> -except json.JSONDecodeError:
> -    # In case of error the license will just not be matched to the SPDX names
> -    # but the SBOM generation still work.
> -    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
> +def br2_retrieve_spdx_licenses(version: str):
> +    """Populate the list of supported SPDX licenses for a given CycloneDX
> +    version. If the list is not present locally it will be downloaded
> +    externally.
> +
> +    Args:
> +        version (str): CycloneDX version
> +
> +    Returns:
> +        None
> +    """
> +    SPDX_SCHEMA_URL = "https://raw.githubusercontent.com/CycloneDX/specification/{}/schema/spdx.schema.json"
> +
> +    ret = []
> +    path = cyclonedxpath / f"spdx-{version}.schema.json"
> +
> +    if not path.exists():
> +        # Download the CycloneDX SPDX schema JSON, and cache it locally
> +        cyclonedxpath.mkdir(parents=True, exist_ok=True)
> +        urllib.request.urlretrieve(SPDX_SCHEMA_URL.format(version), path)
> +
> +    try:
> +        with path.open() as f:
> +            ret = json.load(f).get("enum", [])
> +    except json.JSONDecodeError:
> +        # In case of error the license will just not be matched to the SPDX names
> +        # but the SBOM generation still work.
> +        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
> +
> +    return ret
>   
>   
>   def split_top_level_comma(subj):
> @@ -404,6 +422,8 @@ def main():
>           parser.print_help()
>           sys.exit(1)
>   
> +    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
> +
>       show_info_dict = json.load(args.in_file)
>   
>       # Remove rootfs and virtual packages if not explicitly included

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
