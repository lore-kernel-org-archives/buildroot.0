Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E02DEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F28848D1;
	Fri, 13 Feb 2026 19:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMqNPdGSjcqf; Fri, 13 Feb 2026 19:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 716BB84584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011560;
	bh=wOFj0pQ1jekbjNjFxtSno3pFOZY3lA0MqBBNDvjxrwA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qp0Ecf6huVPogGO1RkePBUxUr7IyEP/1ErviDl5fjQyBzTZKdoNfVtfBytLwc17pm
	 iv1wAIZI14+rMnBgSdaw9sqNxCMcWh9/l0672SIArDax58v30dDuD26IQG+9P3FUzZ
	 co5UXcXNAEsE0xsp7Y575b6Hlz4X7bESP+ri/Xkv84P7Tf/fGdGfZapkMtn2K+Km3d
	 QlHjfpO7B1ZXChd1tLS41Z8Up+pnETebUBrOtvC/r5GoKwojHlhfji/U0WwYV4021r
	 OFpTSW+HPMcfRTCXphToeONBOp9Is0WLtqYNpMq5vIqaAir2xC0DkFH3aCWFxAXEk2
	 E9oTbg2Ft8gVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 716BB84584;
	Fri, 13 Feb 2026 19:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 068A569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B6D084765
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EL-iNUSKGQP for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B82E84760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B82E84760
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B82E84760
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:02 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43621bf67ceso820257f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011480; x=1771616280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bBEirdbnqOE+sZtTG+Gsy2pQPytfYSA4VGnVUF3wrQ8=;
 b=XYHqRtz9b4AUCOHRdCBc8DTy11z/OvzA3wfRCVIXcvz2W8e9Rgf9WLZtBJwjHs5u/p
 n7E/EwKLSbhXAoAz9KS1bykD1Td2wDNnOjWaZTZqC5T3n/oNQau9FPsEVGQLQ72RmnVX
 y/YasX+KNazypeFIcxJpZIMyOajgYX1gdofY+vIi/AGviBldZLcHkhRvJHQsseEBDvpZ
 RnVLfCtpw/YHPC5Gjqb8SviZhxwmFrX8VsZIzyEvSZBIsNpPxw8vA1LrveeBG850ZDLr
 2SI1gYKBGUxckkfFLaNEyp5JFayPhJuMPd1Kir8lzPtYCaUvbEPJPE+DPjxMP6uACExa
 3rcQ==
X-Gm-Message-State: AOJu0YxgbNet074seaGMH5RiDqkp75T7VYj51aHbVLGR20RBu5vjyZIS
 HDEKLVGc+mjS9hGWsT1dhlF0SJLTaiKG7vtW3j8ozWC68bgeXOZtvDMbF4aSrnlf/5HxWUbgu7y
 RiKwn
X-Gm-Gg: AZuq6aLqrpELoVy0CzaeuOPgP/HYMCa2u3VxESWHmO0cReyqXIH/yl/SF8GWox9Cn8p
 qxdMib3jTMtmz6834ToTLDn/f5gHq1YhqggCs6ldApkhZXPeT4Hfpf0LgHxK8+tFHmiSfafYylr
 LROiAl3M7Sy+6c/AM2rOm7gAfAWCU2to/a0d3RBPF6T7XP1upysEtmzWsbdv0kZn56Fq3XP4u37
 riU6jJ1/AtLi2ClwK3gvo7j+boIR4qHeSPuU8v4ktmuwpiFOhBsvsszCyTPWM1+vzZHLXUUGyC5
 KoWWb6CT+sU/4IDnMC7E4bo6POgE3oxDsclMLXQMtIhSU2NyL9rWCw63nsUWNKeId2xQO8CQ8O8
 Zql5IRlGy1tMH7CtXPOS1pyfgc0uBwR6IRSiBBAn/0MIp4YwpxorUZbEw+SbkhlfFl5kyWzkP+a
 PzAD3cBKayJANuw5E=
X-Received: by 2002:a05:6000:4202:b0:435:e061:9e10 with SMTP id
 ffacd0b85a97d-4379db25e55mr1183756f8f.12.1771011480488; 
 Fri, 13 Feb 2026 11:38:00 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-437969fd36dsm7888708f8f.0.2026.02.13.11.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:38:00 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:59 +0100
Message-ID: <20260213193759.41260-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-1-thomas.perale@mind.be>
References: <20260126130414.59175-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011480; x=1771616280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBEirdbnqOE+sZtTG+Gsy2pQPytfYSA4VGnVUF3wrQ8=;
 b=flRtO5hcFQjbN0l0P1xVc/JuZbns7gQBjsYxWYujdxk09m2Vlj7MOzoiS9FUg0M2Gb
 NKfwP3VQAvDZ1HTwhKNvkF4bWyaKsPejC7BiOnyJXuUFeAtGyrjHTY7oJQMH2ny/MFIv
 5ZuHbeYeZQRp8B1fE4XHoUgMSYXN9520WxjZF4m++GmUMFdpLInQBKQ5FrEFkG8qQKtT
 1XSyFbTg/LC07/N9ZkWqElUDP/4d8+QHB+1NVkjpWZ7A7zg3dtMR5AScsZS7OuwEAkTm
 Viu63zT8QvbqypIt4hxIWN5fQbDW6wZUv37ul1n4HTXkeZ+Up39gRc6+S9gNnYWgWR+q
 TSWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=flRtO5hc
Subject: Re: [Buildroot] [PATCH v2 1/4] utils/generate-cyclonedx: fix
 'project' dependency
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
> The definition of the project name & version is stored under the
> `metadata:component` CycloneDX property.
> 
> Since the introduction of the `generate-cyclonedx` script [1] a
> 'buildroot' dependency entry that depends on every components has been
> part of the generated SBOM.
> Tools such as 'DependencyTrack' relies on such entry to create graph of
> the entire project.
> 
> With the commit [2] that introduced the option to pass a custom project
> name and version, this dependency reference was not updated to match the
> custom 'bom-ref'.
> 
> This patch fixes the reference to match the custom project name.
> 
> [1] dbab39e2d9 support/scripts/generate-cyclonedx.py: add script to generate CycloneDX-style SBOM
> [2] 9cbbc47762 utils/generate-cyclonedx: add project name and version options
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  utils/generate-cyclonedx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index a103b7b707..e864edf181 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -428,7 +428,7 @@ def main():
>              cyclonedx_component(name, comp) for name, comp in filtered_show_info_dict.items()
>          ],
>          "dependencies": [
> -            cyclonedx_dependency("buildroot", list(filtered_show_info_dict)),
> +            cyclonedx_dependency(args.project_name, list(filtered_show_info_dict)),
>              *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref, show_info_dict, args.virtual))
>                for ref in filtered_show_info_dict],
>          ],
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
