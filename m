Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6373C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A3D810F8;
	Mon, 16 Jun 2025 19:29:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cWoowTXeHph; Mon, 16 Jun 2025 19:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F27D810F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F27D810F5;
	Mon, 16 Jun 2025 19:29:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7AFA16B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8570540194
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0GARKkFl-zE for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:29:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AD9B400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AD9B400B1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AD9B400B1
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:29:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 804111C00DD; Mon, 16 Jun 2025 21:29:39 +0200 (CEST)
Message-ID: <c3ccb0e5-0cd6-4dcb-a536-833f04aa9f0c@rnout.be>
Date: Mon, 16 Jun 2025 21:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750102179; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rO5WVkXAVkuOHAmJ+wbzOw8udWiWFPKE0lAMwXAjmBM=;
 b=S8jtMa7SMC+UcTHiyy+7nfrV8ltVeybEhgHGClZpbuM3zxg1LtZvoeB6i4Dh5haxcuv6cD
 H0dV2x4LBbBdDDaO+pFBpg3AmtU+7INdWxkCkRQcWSl5o9OSx7l/zYj7rtaMYzAjC+iRqL
 Hyrg5T4QLsko1NvPP9iWr8/tEmWa/mWc9mH0zQ4qy7C5RsIOQmB1UYFSCL6V+6wt1JqocB
 vxkaqrSzj29bSk+nbZSEOJydWb59X4aEB7AuUYw8HSRDhfLH0MP81bxY16bS2NsBJPm+UP
 Scbx8PlGee/oqdW/eoB9h2nqT1LMbY4uPSdqtjL8JXW0x5VYwPpOLvSekQA2DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=S8jtMa7S
Subject: Re: [Buildroot] [PATCH 1/7] utils/generate-cyclonedx: add option to
 filter host packages
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

  Hi Fabien,

On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> Adds a new command-line option '--no-host-packages' that allows users
> to exclude host packages from the generated SBOM. This is useful when
> focusing on target packages only, resulting in a more concise and
> relevant software bill of materials.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 46f68ac63d..08c591e86b 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -279,6 +279,8 @@ def main():
>                           default=sys.stdout)
>       parser.add_argument("--virtual", default=False, action='store_true',
>                           help="This option includes virtual packages to the CycloneDX output")
> +    parser.add_argument("--no-host-packages", default=False, action='store_true',
> +                        help="This option excludes host packages from the CycloneDX output")

  I feel that this kind of filtering would be more appropriate as an option to 
`make show-info` rather than in the cyclonedx conversion. The idea was that the 
actual SBoM is the output of show-info, and generate-cyclonedx just converts 
from one format to another.

  That said, `make show-info` doesn't conveniently allow additional options, or 
good command-line help, so it's not that I'm strictly against this approach.

  Regards,
  Arnout

>   
>       args = parser.parse_args()
>   
> @@ -288,11 +290,12 @@ def main():
>   
>       show_info_dict = json.load(args.in_file)
>   
> -    # Remove rootfs and virtual packages if not explicitly included
> +    # Remove rootfs, host (if not included) and virtual packages (if not included)
>       # from the cli arguments
>       filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
> -                               if ("rootfs" not in v["type"]) and (args.virtual or v["virtual"] is False)}
> -
> +                               if ("rootfs" not in v["type"]) and
> +                                  (args.virtual or v["virtual"] is False) and
> +                                  (not args.no_host_packages or "host" not in v["type"])}
>       cyclonedx_dict = {
>           "bomFormat": "CycloneDX",
>           "$schema": f"http://cyclonedx.org/schema/bom-{CYCLONEDX_VERSION}.schema.json",

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
