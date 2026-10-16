Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E812CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1729381514;
	Fri, 16 Oct 2026 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ibsWX30JTKv; Fri, 16 Oct 2026 15:02:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1C65D8154E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162971;
	b=QjwjJQ+NphBlF4BvBaJKj8YE3J3BB4gavG/OC/X7ES14p7kfHOQQEBc/DSKT9E4w2LXB
	 PzBfNm4t/fJ9qG6tRbsrgD+51Wn8T3IM2nP3uyo3GEeTwZ7vXTqiU9wC6XKw9DA8v8JM5
	 LUGz1elqhh3jdZZxQUfmIOUFz1GkO11er9n0u1DtqmxnA6Qi8z7fVr2uh252+4W68HZIn
	 62FtKu74TsjBJJMeQLq9dbWLmo7nWVzBSjZGMORP663t9wGQ4M9jnm4V6QkuGxpukt2kF
	 222pVFTlPuzMntP3tgkWSTWmUiehRiXIPbLsr5N18KiyGIoITBqnGIdSgnJHNPQgvWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162971;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZIMEnBbV5CK0Nxm3btHqGXVyb0yQZLmPnM4+GYzxiyQ=;
	b=WtjNSqNlGVxWSPghhlyZy1xtZLtNAyLQ8bD9XPi5kuR+rx4TZLcyaxyy7FppdGrYy/YF
	 g2xMNBuDqwvNO/t8fsEMt384dTzM6jHdfQGEqy+iwkV+l+ncoKlL/AbKjvr26MknKOPWZ
	 YcK6CnVL+d3mEtyVEukDqVFooubgoZEkQsaO3QxN3RcmXdcwrVDdcmzofoUBM6DlzljKx
	 0puOBmAc0MwHOix64JAzWDNT6lqKwnHgwS3ome2TXERNvAK4z2oylD8j9aThbGIDTSZbU
	 WEFQqScKCIlGCPUzQNfLzTTiFyEBiNqI1iPkipR9fSyKnJazgeiRHroEqC14P6OORlw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162971;
	bh=ZIMEnBbV5CK0Nxm3btHqGXVyb0yQZLmPnM4+GYzxiyQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oFOQJB+jIcfg0gDbAMXEjhQ1TkvFufJSOB5NwBEiT4QKjpBni4x7gV2Hhrp06UFnF
	 9iUHyKfQ34hp24GQq6/zxG+ueCTxhWYs2Bc+ERy9Aa5qUNYI0BVbvCrlOWmONbkMtR
	 2iLjdM/2aO/w56hi0sIYXK7Jcf4tbkGe73YwEnLcwNKNdpYbuY0xNacyPa2B/u/+m3
	 IInpqNrqnqpGyqulUei0qWL3Puqt30yRldEyjiC+r31R+ynddY34rU/8FIokCkgGLh
	 5YGYOxvuaDE6dsObFi8Pt075l7W60+GgJ1VQi2C/4gQVXAtgWGGB2F0NjtAjfQF8Qj
	 9zy8tA7MAHDFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C65D8154E;
	Fri, 16 Oct 2026 15:02:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C6F7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95BD740042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSa__rSOpldU for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 554364016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162968;
 b=Bcjibz+CR/xp33ow3MgzJsi3ZLhanGGW8Sg91M1vSy5XmEpmNrx3yBq2xddtWO4BFivf
 AjIAx9APA0Z+QTDyqYxR5qhyS73v5xAGkM6RVF5iiy/vQsmFdLGptoZllEetoS374pyj2
 BJMXcJ5M3KzcQIJGJqgrog+KJxKyoN2QE2I7XsKfuZSr/upsYa4DCoW1/VULJHM16Od3s
 EXZVbbagDYCPzWrBsxnfinu+HmgKx4MejMGUQ848p6XZ7iy6YMBs6p5B24j8drQPS3UBE
 1gCJIrymYzZ6ciuzCn2ADrrz3tJOc7j2xg4eujd4frW5S5rZRuZHgR9Aqs1nCNq9Fpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162968;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=tKHT0dY/QMln+Z7RBmX95EVTLvp7uBCiv6ggpFrneBo=;
 b=YGTzxstEN8i5fCiVhg4pBOBh2b9080B9hYoZlj+VXpfatLHHau4RFveztOdKJHrQEZbW
 HlKdZRknJ7KPOjY0AE5QdEa0OstAqUlDOqUCUpAmyyPHCwzY4467dfrDYY2jHawFaIE4f
 VUbWSJbUzBycIr8gVZ7LMZuQdBUoG61CaQHqXfh5285YSIvR9l2933dqHPFB4EC6XDZ+m
 SRnBU41lcU0+HSNi4o6/p4ecBiVMLoNpEHQ2IBPIsw/65wTfzrRvLBNfpOtpo4IK2gjdF
 KSW5/EwXob8QQYf7OKywcXQdH/miJThWYas5m3JaZjeL3yqfdCVq7sYpVt3mugVCXrA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZgLozE+B; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::629"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 554364016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c2dcbcc546fso798001666b.3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162966; x=1792767766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tKHT0dY/QMln+Z7RBmX95EVTLvp7uBCiv6ggpFrneBo=;
 b=X/eUXrwDRJ9WsS+K12MiAWtEiR5pju0cX23QkSwRBRCrgBD3YVhllpeJC447cMz9dZ
 NpA2EEC4cuV3ICeMvZv/NL0Mza6dZwgQ6jnldrYysrtTJMrDwVfDTKrcP+cIyzSx1UTS
 9xeimwhOFWMpiXU9YG9S6cJ4e5ForcJJVXhNT1cHolJNbPC5nrS9LwpspvEkNzRbdBS7
 vn8xrHC8BPad6rFW6+fTSztkqwSy6ACejRWQWZLuWfyBxEAEh+ZEN9wJBKsW0qpA02ZH
 +eVJSRHmMhCOYnmhM4czqXvrPicsR9X4Hwx7Bb+QHC1rNrNl255dn/LV93bPPhtFhZv8
 eKgQ==
X-Gm-Message-State: AFq9FYKLKsTl+P2v0Bd2phcXmAmywu0tXjDvQP9Pr/0YgYbInQlrlcXZ
 ECaHc8gJOFoZ0E5j7lPCjyMGHkPBWa5kZsoGk1KtPHnLVuKB/wi+cEZE+SEyVDkDjmpJjrl/PD7
 BKDiCi7I=
X-Gm-Gg: AYBFou2xvyEu6ZDn2/qbreo7MfU+ROAKvg+16ack2jsFAQR9TbDvfZrr3+vW3nCKvhH
 6lIUt/wnq80dxD9RyLIwT+/xezc0+F9GUabye0AqlwiPa7RGO3rlMAhNKi4B7GurUk6vWS7SaB6
 w3Ue1BBJ3ezsmxE8Wb/l42TyRDfaTdGOcx5goMCRXfm9Y0A40mbZDcoYDfCw25qcAn8FHuiwPWr
 TG5SSgQg+IstmOg7mcPBS9BCF8ajYPj25R0zIlFyzls0jUmXus7krcz1RHJDrTwvACYs0wLJvmp
 vtpnbMFbM7QWiq7crshyyLhA0JJdiyE8jxwQaBgZR0lFGZtFb+idwuJwMBd7TB8aDB7Bp75bbAs
 YwOq1OhEOymFZleFsKuR/d2aYdvJMeKQyPBhCbrYQRjoev1QQ5a8LKxZ1O2zeyvnr71WMS9C22/
 KROA4e8B99gcVImx2FqiJv5uaEq/KS3BYa21rhSvQgfNwx13s5QHQxazCzE+wwbg2szA3ZxDyxU
 skMnyT+ejnW1tmrkrY/Tjwcm49e04WLSlBvzUb+wA==
X-Received: by 2002:a17:906:7953:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c419d540411mr6926866b.10.1792162965777; 
 Fri, 16 Oct 2026 08:02:45 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50d1bcsm5656524f8f.54.2026.10.16.08.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:42 +0200
Message-ID: <20261016150244.60699-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-5-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/9] utils/generate-cyclonedx: move license
 download in a function
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Move the code that retrieve the SPDX licenses into a function instead of
> doing it top-level.
> 
> This allows to pass the CycloneDX version as a function argument instead
> of defining it as a top-level constant.
> The next commit, introduce support for different CycloneDX spec version.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 60 ++++++++++++++++++++++++++--------------
>  1 file changed, 39 insertions(+), 21 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 9e3bc9d4b8..9738db71d6 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -23,12 +23,10 @@ import re
>  
>  
>  CYCLONEDX_VERSION = "1.6"
> -SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{CYCLONEDX_VERSION}/schema/spdx.schema.json"
>  
>  brpath = Path(__file__).parent.parent
>  
>  cyclonedxpath = Path(os.getenv("BR2_DL_DIR", brpath / "dl")) / "cyclonedx"
> -SPDX_SCHEMA_PATH = cyclonedxpath / f"spdx-{CYCLONEDX_VERSION}.schema.json"
>  
>  BR2_VERSION_FULL = (
>      subprocess.check_output(
> @@ -45,28 +43,47 @@ VULN_WITH_PEDIGREE = set()
>  
>  SPDX_LICENSES = []
>  
> -if not SPDX_SCHEMA_PATH.exists():
> -    if not importlib.util.find_spec("_ssl"):
> -        print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
> -              file=sys.stderr)
> -        exit(1)
>  
> -    # Download the CycloneDX SPDX schema JSON, and cache it locally
> -    cyclonedxpath.mkdir(parents=True, exist_ok=True)
> +def br2_retrieve_spdx_licenses(version: str):
> +    """Populate the list of supported SPDX licenses for a given CycloneDX
> +    version. If the list is not present locally it will be downloaded
> +    externally.
> +
> +    Args:
> +        version (str): CycloneDX version
> +
> +    Returns:
> +        The SPDX license list supported for the argument version.
> +    """
> +    SPDX_SCHEMA_URL = f"https://raw.githubusercontent.com/CycloneDX/specification/{version}/schema/spdx.schema.json"
> +
> +    ret = []
> +    path = cyclonedxpath / f"spdx-{version}.schema.json"
> +
> +    if not path.exists():
> +        # Download the CycloneDX SPDX schema JSON, and cache it locally
> +        if not importlib.util.find_spec("_ssl"):
> +            print(f"ssl module required for downloading {SPDX_SCHEMA_URL}. Try enabling BR2_PACKAGE_HOST_PYTHON3_SSL.",
> +                  file=sys.stderr)
> +            exit(1)
> +
> +        cyclonedxpath.mkdir(parents=True, exist_ok=True)
> +        try:
> +            urllib.request.urlretrieve(SPDX_SCHEMA_URL, path)
> +        except urllib.error.URLError as e:
> +            if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
> +                raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
> +            raise e
> +
>      try:
> -        urllib.request.urlretrieve(SPDX_SCHEMA_URL, SPDX_SCHEMA_PATH)
> -    except urllib.error.URLError as e:
> -        if "CERTIFICATE_VERIFY_FAILED" in str(e.reason):
> -            raise Exception("Couldn't verify certificate. Try enabling BR2_PACKAGE_HOST_CA_CERTIFICATES.")
> -        raise e
> +        with path.open() as f:
> +            ret = json.load(f).get("enum", [])
> +    except json.JSONDecodeError:
> +        # In case of error the license will just not be matched to the SPDX names
> +        # but the SBOM generation still work.
> +        print(f"Failed to load the SPDX licenses file: {path}", file=sys.stderr)
>  
> -try:
> -    with SPDX_SCHEMA_PATH.open() as f:
> -        SPDX_LICENSES = json.load(f).get("enum", [])
> -except json.JSONDecodeError:
> -    # In case of error the license will just not be matched to the SPDX names
> -    # but the SBOM generation still work.
> -    print(f"Failed to load the SPDX licenses file: {SPDX_SCHEMA_PATH}", file=sys.stderr)
> +    return ret
>  
>  
>  def split_top_level_comma(subj):
> @@ -528,6 +545,7 @@ def main():
>          parser.print_help()
>          sys.exit(1)
>  
> +    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
>      show_info_dict = json.load(args.in_file)
>  
>      # Remove rootfs and virtual packages if not explicitly included
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
