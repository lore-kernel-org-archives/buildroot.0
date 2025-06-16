Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0619C71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5120381104;
	Mon, 16 Jun 2025 19:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OU1Io1t-k5V5; Mon, 16 Jun 2025 19:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91D3081112
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D3081112;
	Mon, 16 Jun 2025 19:39:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BA04D79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E6B840B0C
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V-MWazpy_aJH for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:39:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB3C040B05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB3C040B05
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB3C040B05
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:39:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EA8F1C05C0; Mon, 16 Jun 2025 21:39:17 +0200 (CEST)
Message-ID: <6a281b10-ae91-4721-8070-a0d68f8f2b22@rnout.be>
Date: Mon, 16 Jun 2025 21:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-2-fabien.lehoussel@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250613110559.2665663-2-fabien.lehoussel@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750102757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CAVjyvRIY0UnKp5tnHaXPLD2gu2yzhs/LH/ZnE8miXc=;
 b=AiFDi3tpYgKWLw4usozNSy/TUZh3HxhFbYtA2Kv6LZ7lFm084y9jztn5lQ6ZJfTtvStYQr
 brDikusrnW/b2l0AQ9W3LKcioNcWiisxwvv9MPupjPvjQvounUyLkHA1ZtsrDn852K5D1S
 UdXrGcY94q/eKprGJQuyO9fzupo09zLX8aH8VfMjX9NtEi6pU6M5Yt018JN7slY4IljMuf
 lnmkfcuXZy0OPwY/6p74wptC3E5XI6A7IrzM/qSEvXRPRqiHNbUUFJpZn/3s6hR5q2aqP/
 Zikb+O9TbBdlxfk+M8EcfP/kyh+wp2785cfjOAFrKOH8jB3+fL1cwL2XHKmOJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=AiFDi3tp
Subject: Re: [Buildroot] [PATCH 2/7] utils/generate-cyclonedx: exclude
 skeleton packages
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



On 13/06/2025 13:05, Fabien Lehoussel via buildroot wrote:
> Skeleton packages are not associated with CPE identifiers and therefore
> cannot be tracked for vulnerabilities. This change excludes them from
> the generated SBOM to improve accuracy and reduce false positives in
> security scanning tools.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
> ---
>   utils/generate-cyclonedx | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 08c591e86b..2c234e1a45 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -293,7 +293,8 @@ def main():
>       # Remove rootfs, host (if not included) and virtual packages (if not included)
>       # from the cli arguments
>       filtered_show_info_dict = {k: v for k, v in show_info_dict.items()
> -                               if ("rootfs" not in v["type"]) and
> +                               if ("rootfs" not in v["type"]) and
> +                                  (not k.startswith("skeleton-")) and

  I don't think this is the appropriate way of filtering. What we actually want 
to eliminate here is packages without an upstream. There are a number of other 
packages where the source is included within Buildroot and that therefore should 
be excluded from the SBoM (and instead, Buildroot itself should be included): 
initscripts, mkpasswd, environment-setup, many more.

  I think the best way to do that is to check if _SITE is set. To be checked if 
there is any package with a real upstream that doesn't have _SITE set, but I 
don't think so.

  As a bonus, you can also drop the virtual and rootfs exclusions: those don't 
have _SITE set either.


  Regards,
  Arnout


>                                     (args.virtual or v["virtual"] is False) and
>                                     (not args.no_host_packages or "host" not in v["type"])}
>       cyclonedx_dict = {

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
