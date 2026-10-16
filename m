Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FDCCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A424F40A97;
	Fri, 16 Oct 2026 15:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBlKOA3GQmPa; Fri, 16 Oct 2026 15:02:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D60440A61
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162974;
	b=NNAkxsQgHuL81GlvAZGUtczQ1ZsDAfVU2WY0wc7FqSU6niT6GR0ls7eIH2MjCwLU0NoC
	 ouFIaK0TzixWwbXDjtmr1vpusZeJntdqow3yKaiB6zhl8VTeNxbAi0i6lmBwj/GS8n8Kt
	 aUMBdQeO2jJ3OTQDn5IqDG18WU22RFx2s+7sm0HlMmnxj53PEcDeJkLYBklkOFE38Xtmh
	 Z/YatIjk1XDMlvmlLGeNJVjkFUJWpOlKYbELUxVJ2HnjJnuj7RLNc/nBNrjJoO/biRvF1
	 juloNI/YdOg1xqdMSn900YsVssYkhy2SFHpE1zu0msz/W5Q6/S1Huzzhw0TXiCHYxqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162974;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IVQVmj8EfRgmiDEqQbdo5dunkq4cIG8/bDK5whmkFd4=;
	b=rzEezCLGW6DfKDO2M51Zw4j4CHsybhAqRgyzT8FetZKhBF5YBxZbbD9ckISNU8guQyEW
	 cfULa/z9l66o392ePIZvwD2+pSqh/KGjO1gIviCqNukt11fn6IKLJcCpaYIe9yFEdB2U3
	 R//RZ3WMgxubJZ8nTgksNXSi+PrINNY9I0hnAv5W582whm/707csLWyFtcys8avsNIthb
	 SbIOhQUSkI9MvuyEjtQatpaa8SxT+yFPzQRjXmzj/qqQcbrXlZOP2xU0pbROPRljUah08
	 oVoWChZ3RPfEIHIKnSMc0wHmmGwmTnw/R3URLOfS8lybMX8hZK3jDEYB5aw9RPc8vhg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162974;
	bh=IVQVmj8EfRgmiDEqQbdo5dunkq4cIG8/bDK5whmkFd4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MwFmscCQ+yTSAVozHR4HBp1wOR6GlTMHaTmVzTKPJ8VXcuUYL0xXyR06R0RWYbBRY
	 9mlteLs0e4TrGTfIT5jk2cuGGr3rkL9eJyj9t+ju2i0Ov0HNpKbtWklMo06MB8adq+
	 +6Q2Ns+tchei4iNBv0lQbZgMW6j8lsptjTiEOCh91tjwPa4cu1QR9wUDlF2jGUWwF6
	 VIexfnKu32TyuCUzyXU++uUNprs6E9BLF/NmtoNJswpz+1D8OOW/M8vlaqC2cs+rkv
	 GMOq9KkqKEtp/sMeSS+p8UPYhMOQQwk43UWtiBOlcLrTM8Xzp/yRH+IMxEIj7bsdwL
	 dWcmGZagbFp3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D60440A61;
	Fri, 16 Oct 2026 15:02:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C144255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E56C4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 33f0bBs4eNRZ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3A35C40042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162971;
 b=AzD0Vu4esmR5EhBUCInGg3QyIycVQLxwPi5KT33oXMcEDH1IVYrU6DQeXaHBW5Lw91WM
 2pEMxZBhSb4QXkOAEeaPdyQj/+PFKy2IStpldTxShKjVjJQw4/z/LaLNF0W+VhRGc19DJ
 9Z8oU4s72E8m548q7sJhA1SXJtsP+Oz1h2XHpfiMpCxeXRXh2jrrg5x3qfL8mLrN5aT6d
 VIrTB/njJtItg+Kq0h6a9fvuzEj+WrpuPfUO312478dd3epy/FtRcdjwPqnCQ9otmzHw7
 8y/Tc8t6tnvEWW6pJOXeS8tGWBPgZGuLuVH4NgUz1cNwycJkFXNoEb6DJIB/u+je4Dg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162971;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=5rXWRwSCkBlIqDYjGl/ThQe2Pf0xH2o87sYcZJhoObc=;
 b=O8cCv6ARhe8WsLB3o+q8CMoDnp1LUvD4n3KgwXIoMWVksu156t8b9RvhiIwVmBt50OUj
 3jbYgDgqiShpTvUL49Frjri+uIetEqWszP3EAJZBPWMpxlvhBBECaOSwQnKfzSmb9CMF2
 FBv2sBHuzaQD4cfoh5QYwJ/0Bvv79yMhWB0j+pxI6PEx0WfK6bSj41l/twAw3uWzbgp+J
 Mei4mNql7LQxqTQfY83LbNUeexcK/uLQ6aA1AdQFcsWscT7vIo3L6IK8V5JrF8J5Djqq7
 81tsCkfO3zYJXmH9m55aQYZtEPiiNO3/lVwNmbUpYCjYInhOJ9VmDmPfrK1FuCzJfyg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GOOy2C7Q; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A35C40042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:50 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso4750637f8f.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162969; x=1792767769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5rXWRwSCkBlIqDYjGl/ThQe2Pf0xH2o87sYcZJhoObc=;
 b=NIr820Gx1BwFuSXzEXCGPXatU8XfhBytHqzbPd1+HLCCvQw3AsfFWnjOZl8zg04ZT1
 rLHEQF/I7exV+qX89Qz/LMVWUBMpLnTLRyIEB/bPIYG94OwsGZJqyk6ovU4jLhKvA58z
 agzjiPjeTfTbwl/5v/dyhbfCPbur8At0xe7GqSMhslWPqtnbtbWF7k2uk67P+FragWuV
 gVbJrzu35gxZDxwypJhbnhLHBwZFJvE1xNUdENwqy0Zngv8GjtuvygAjEC2Vlex/guNp
 frmuqXbfN2Zs5AXH9Df+lygPak5KnwzDRewK1+bRBXZgGQq4cg3c29BD+tn6HbAdoDYg
 jN5w==
X-Gm-Message-State: AFq9FYIfULEjlZQSk+5KzVDjomQlgNRrn73/MaH08TkeXTVnUp3iuJ4C
 p/eX5/mNmFyw1lyXSyHfmvH0LevgNF4Va31tbClDqDJykFmAiqlovpTbEal1hz0h8w/7ATo0ya2
 Lwgn2EkM=
X-Gm-Gg: AYBFou0fWCRoxUs4r2LN5TTQ0vpUIsjXSpuvbdZbwEGqRCgXAS94EMabq1Z1FldRaAG
 EiBad53QdzcZzkdlB8ZbsWIDyl+uzQwdi4yNRwVFUrUZ2acPoW1esVvle7Y1TqfBBosWMJk4dkX
 rDgHuorK/1jl4Bhrz9zwrhgGRhFpfEYEgq66GLrHZ1NfTVs3JkhdhSFIkORYj6JFpuBARqOYi9q
 b3I7pHjCDg9uYULR5kyE7vUvbcAfb8qaJ6p47iWhjdJ9LTPDXsbdFOniCoIn/tCSAb6e8xz4XBJ
 GPpEowfP119Jzj9xCIIpEZhZdAPINFLKbAtjY0kGQ1e3/DHT0uWiuLRG68xUIRADOjmwHw/AjuO
 6V9jQsSmR/nb4bvElEvG3s48n4aoRE9mWxZZQxxDILfzDLbxNEL6md4x+P1R+umD+B2CisuSXw6
 2vN3c77KY9iXiqJKAWB2oQH9gCRhg0HN1AOwIR/SVz8NXX4klV92eekAiMXNMMBJr4svgl0cIFF
 PgV85tj2v1ajGlyElUql1lLt4JSNNW2CK4L8jBSWQ==
X-Received: by 2002:a05:6000:2c06:b0:48d:ed3c:4cdd with SMTP id
 ffacd0b85a97d-48ded3c5789mr17819850f8f.49.1792162968812; 
 Fri, 16 Oct 2026 08:02:48 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd50aafbsm5607677f8f.52.2026.10.16.08.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:48 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:46 +0200
Message-ID: <20261016150247.60725-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-6-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 6/9] utils/generate-cyclonedx: support
 custom version
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
> Support using minor revision for CycloneDX 1.6 by passing the version
> from the command line. Currently supported:
> 
> - 1.6
> - 1.6.1 [1]
> - 1.6.2 (default) [2]
> 
> This is used to fetch the latest SPDX license list available upstream.
> 
> [1] https://github.com/CycloneDX/specification/releases/tag/1.6.1
> [2] https://github.com/CycloneDX/specification/releases/tag/1.6.2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  utils/generate-cyclonedx | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 9738db71d6..8d055c3bbd 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -22,7 +22,7 @@ import sys
>  import re
>  
>  
> -CYCLONEDX_VERSION = "1.6"
> +DEFAULT_CYCLONEDX_VERSION = "1.6.2"
>  
>  brpath = Path(__file__).parent.parent
>  
> @@ -538,6 +538,9 @@ def main():
>                          help="Specify the project name to use in the SBOM metadata (default:'buildroot')")
>      parser.add_argument("--project-version", type=str, default=f"{BR2_VERSION_FULL}",
>                          help="Specify the project version to use in the SBOM metadata (default: builroot version)")
> +    parser.add_argument("--cdx-version", type=str, default=DEFAULT_CYCLONEDX_VERSION,
> +                        choices=["1.6", "1.6.1", "1.6.2"],
> +                        help=f"Set CycloneDX version (default: {DEFAULT_CYCLONEDX_VERSION})")
>  
>      args = parser.parse_args()
>  
> @@ -545,7 +548,7 @@ def main():
>          parser.print_help()
>          sys.exit(1)
>  
> -    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(CYCLONEDX_VERSION))
> +    SPDX_LICENSES.extend(br2_retrieve_spdx_licenses(args.cdx_version))
>      show_info_dict = json.load(args.in_file)
>  
>      # Remove rootfs and virtual packages if not explicitly included
> @@ -553,10 +556,11 @@ def main():
>      filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
>                                 if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
>  
> +    cdx_spec_version = ".".join(args.cdx_version.split(".")[:2])
>      cyclonedx_dict = {
>          "bomFormat": "CycloneDX",
> -        "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",
> -        "specVersion": f"{CYCLONEDX_VERSION}",
> +        "$schema": f"http://cyclonedx.org/schema/bom-{cdx_spec_version}.schema.json",
> +        "specVersion": cdx_spec_version,
>          "metadata": {
>              "component": {
>                  "bom-ref": args.project_name,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
