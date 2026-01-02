Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D440FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 16:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3804960595;
	Fri,  2 Jan 2026 16:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nfVcZrLN3iE; Fri,  2 Jan 2026 16:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3096064E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767370196;
	bh=OnxdzRR1RhU2VKoxyX1jgpRi2u25h00JlMzs4BPBufY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JO7tpyERo/SSO+XsNjk55XdHJCSDj9X5tyoIf4G5Sm/M+tT4ghQ7aDwwZfMLu+O71
	 YWSrFDI6x9u0ppgNexN5Ie5gS8I7OoT8rroKspMQNhSDoaxnh6N71lw1k70sWi1zFg
	 rDve8ykdVdTg2MTEP4+/ZRvS1Qgr0UT1V0caV4yV0sLJZFm7X0ZmfWySSeOL6KsMe/
	 8nUhMHvWUYbaLJeQWMuubK6MtH7XEoSGjFqnlJVeQZlNA70DpElM0YzA2IFKSWkOXp
	 oTIalyfCda5EMCOF+LdxjlHBUGZAoSGQkh0YPblEynIINVcNhs4x9Sb7kPKsC3COGi
	 yIs/ww5+45baQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3096064E;
	Fri,  2 Jan 2026 16:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83D4F351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AFB34064A
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cthogMXgtuV for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 16:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74268404C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74268404C1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74268404C1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 16:09:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so94825215e9.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 08:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767370191; x=1767974991;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zCyZ5xsp105C3tLw4YQTQr+0D6D3rbcUaJPYqHrm1Ls=;
 b=cOD0ZkmJWW90br5pvSa2t1hQQ5wkPp9MCR0uYztRfu1bamohGjb7g74pCmuyubl4Wd
 7qs/qFyig8tH4UuGBK0Zti2MUfKvzTLmShFiZiDfEen8SO7DFX2M2z2nRY6MZQSjeZ9W
 abaDRV/GuzfA94q9AqXndKoN7IhDGIiX2l/V7YWtM/eQKDeLK2XRoboHUsPEPWEoVQ0c
 HldfWSIDFzwpA4F43Usz90mPXyn7Ei9/+Yh2AaWN+66yMQYpyU/MjozUW7jEh9lC/TyV
 W0DCk4LaSIalQbht95VdD2LI06ZwRZhM6R9LCZpoEOXR86iYAvqLfIVkGR1c+2Xgedu3
 Xzfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPxBJdffiGh74UYJdqI6pnkJoWtcgHsNKpGJnWF7yvf94KuuTgpHmZycCWUTJh4ye2h91VRerHX14=@buildroot.org
X-Gm-Message-State: AOJu0Yy41lbQKc5TxqBJFYR74kYl/aR+65ZKFI58dUAp7iSu0XTJ7b/d
 KVd7ddHhZU2HZv+RmAXeWTL5CLiy8HSpiYyq1rRiPgMomammk4KXOAKFL8kCl1+7pHkQ3n03onP
 Utrmtedg=
X-Gm-Gg: AY/fxX5jucQ5ZovjOWmVCqHc6FG9CSWSpH36bvEbVEf/4+rdq/VpoW/96Rbg2EdBtkp
 D2Pi82ueeWh0vf+7flemroBn5KUlFnxgUiMtEAi7S/ezIzQ0qN5V6f/0moq1YzZNDbOJaz7b7cv
 RVfDZeY+H70FMtmdLS3MvNsl6nvHBcR8FrWhULr8fk3uFhss7vqYcVWa64uZtoHwnAY9sH6IpfI
 ZTRyB6VJlBOzlllHWI0E+w+drYiJQxb8WZkGNVqG6xD6D3//64qb+nhgbqWXIAiCbpUJ+ugYTM8
 dEq6irFmYZ8c0Sl9hGB8+gVWDdxamvoNSvpC5Scv7cgT5MdM7zTK+dfFKQehitxzJOwZcs3nHEg
 Ehc+wRRrVNdb5vziVqYUlz6yRrBs8i9XwXV/9k18QLiChj9WsBb34k/1YxlQtBF1cqOUGRt83vx
 o/XMMRHcdjU1nIXwvlo4Nl51uTFUL1lAnmO4IhhIjV6Ud9zw==
X-Google-Smtp-Source: AGHT+IENCb512GlHpn4kWIb3Hc+quBwXPvV6ih7w4XmYHYvvzspHGmbRER72v9McrcpCSPTWSdb8Zw==
X-Received: by 2002:a05:600c:4fd4:b0:477:7bca:8b34 with SMTP id
 5b1f17b1804b1-47d1955b744mr488526695e9.6.1767370191379; 
 Fri, 02 Jan 2026 08:09:51 -0800 (PST)
Received: from arch (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be26a81b6sm829630755e9.0.2026.01.02.08.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 08:09:51 -0800 (PST)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  2 Jan 2026 17:09:50 +0100
Message-ID: <20260102160950.713013-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102150757.1480511-5-fabien.lehoussel@smile.fr>
References: <20260102150757.1480511-5-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767370191; x=1767974991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCyZ5xsp105C3tLw4YQTQr+0D6D3rbcUaJPYqHrm1Ls=;
 b=XrbOlpmYDgLvA6fcnMsSpK4fuiBokcK/wgfbt2bMNa8uxBC19RwAp1GFVzw4KDDoEx
 ZqDu9IvL23ZyZPkUubRCeJfEq4ZY8boiYvEwqqZnUUNm2Dd18+O3VUN/myHuDdNJlOkd
 ut6KfyVyoGZfobwFOm8aoiPLwQdVPc/aZgSMQ9OZeDy6HgDi74wHfHi9htu2BOZ2JKOT
 xBNe1d9GP9+z9ltKFqzAMhoQM55Ou0p+kBOBz82Fc4hSpQC29hKEKKOXQ6V07n+a0rmi
 GereAjLSDP/+famUp2Tp9P7XE4IUuoE+poJlkDIqsYx3HpOzHsE80ycmacZbO+4fBLYz
 puKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XrbOlpmY
Subject: Re: [Buildroot] [PATCH 5/5] utils/generate-cyclonedx: add option to
 identify packages without CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This option enables users to explicitly list components within the generated
> SBOM that do not have an associated Common Platform Enumeration (CPE) identifier.
> Needs --print-info flag for verbose output
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

To keep the `generate-cyclonedx` specific to a single goal and keep the options
as simple as possible, such reporting features (or modification to the SBOM)
are usually handled in another script.

For example, see this script we use to remove every CPE that are matching on
every existing versions for the vulnerability monitoring: 

- https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/strip-cpe

Or also https://gitlab.com/buildroot.org/buildroot-lts-tools/-/blob/main/tools/strip-pedigree

I wouldn't be against adding 'utility' scripts for SBOM manipulation directly
in the buildroot tree though.

> ---
>  utils/generate-cyclonedx | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index e47b6f2f6e..64620ee170 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -400,6 +400,38 @@ def print_dict_diff(original_dict, filtered_dict, verbose=True):
>  
>      print(f"{'='*60}")
>  
> +
> +def print_cpe_analysis(dictionary, verbose=True):
> +    """Analyze CPE identifiers in the packages.
> +
> +    Args:
> +        dictionary (dict): Dictionary of packages
> +        verbose (bool): If True, prints the analysis. Default is True.
> +    """
> +    if not verbose:
> +        return
> +
> +    packages_without_cpe = {pkg: dictionary[pkg] for pkg in dictionary.keys()
> +                            if 'cpe-id' not in dictionary[pkg]}
> +
> +    print(f"\n{'='*60}")
> +    print(f"CPE Analysis")
> +    print(f"{'='*60}")
> +    print(f"Statistics:")
> +    print(f"  - Total packages: {len(dictionary)}")
> +    print(f"  - With CPE: {len(dictionary) - len(packages_without_cpe)}")
> +    print(f"  - Without CPE: {len(packages_without_cpe)}")
> +    
> +    if packages_without_cpe:
> +        print(f"\nPackages without CPE identifier ({len(packages_without_cpe)}):")
> +        for pkg in sorted(packages_without_cpe.keys()):
> +            pkg_info = packages_without_cpe[pkg]
> +            print(f"  - {pkg} ({pkg_info.get('version', 'unknown')})")
> +    else:
> +        print(f"\nAll packages have CPE identifiers")
> +
> +    print(f"{'='*60}\n")
> +
>  def main():
>      parser = argparse.ArgumentParser(
>              description='''Create a CycloneDX SBoM for the Buildroot configuration.
> @@ -435,6 +467,9 @@ def main():
>      # Show differences between original and filtered dictionary
>      print_dict_diff(show_info_dict, filtered_show_info_dict, verbose=args.print_info)
>  
> +    # Analyze CPE coverage
> +    print_cpe_analysis(filtered_show_info_dict, verbose=args.print_info)
> +
>      cyclonedx_dict = {
>          "bomFormat": "CycloneDX",
>          "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
