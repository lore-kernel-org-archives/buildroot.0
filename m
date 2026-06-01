Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF79ACD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 18:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4581940742;
	Mon,  1 Jun 2026 18:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6biQFcoeAvR; Mon,  1 Jun 2026 18:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 637134073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780340395;
	bh=bBeRuDlQDPIPOMTKXz0vmzFvP1seqagXRKf/pPdS/cE=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p9iwx8a51qKOgiCMbXUCBJPIyvUDmdeTX5Tx8JjsZtJVszMHMxOW4/YMHR1rT/AH6
	 pGMu6SEybw1BIzSQqkxY3tmx7SZXSiB5PGF8tl1fxSZdWU2OfwNiZSLkZfDTNiE5Bu
	 jxvjdkgEak+iRQaxdw/WvBUdyQ46keN9lF6IPrGBPQMm8t6IotGxUPjjNkvLB0QA4R
	 LAgfDbBQlqnlwuWSSxhBrzDsJT3Gnc5ZXTjmYl523G/IkaaOUcpESzEUCzTSQvmAmD
	 c29s6rwUAtwR2LFZ1XQ5+x4a66ZJLmOEH19AttflsbJukDDFLqAESUKvdORzwkWM8p
	 a2loSEcC/DxKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 637134073A;
	Mon,  1 Jun 2026 18:59:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B77FD3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 18:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20E73400F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 18:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUc_90rt_62v for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 18:59:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 416DF400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 416DF400D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 416DF400D6
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 18:59:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EC2FFB97C776; Mon,  1 Jun 2026 20:59:50 +0200 (CEST)
Message-ID: <baac2645-5463-4caa-bfe5-53b3ad80d275@rnout.be>
Date: Mon, 1 Jun 2026 20:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260601181050.2022722-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
Cc: Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20260601181050.2022722-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780340391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=jbiiZBJGW+kKp6dwlO3Mr7mw2Xa7U7Hguen0KBK+GeQ=;
 b=VBI0Rw2RjLvUPYdYQMiEMRa70ApcBYNsgEe2lrZ639/GDVvYSA2mmb0/xopU4jXtwPQnXP
 lj8S5hM+HqzD7ZDOct2/hAR6lXIwOB8NbAqXWCe8OVIKv+BRB+AD6dKSpe86DJ9fYNYLeq
 qtszEM+9+Mk0wxe07OQa18SNMowFLS2imNK0IABxVeR5UalKqvWss1L2BvpeT1WJBZqKbX
 4O3+tUbtoNbO3NHs1R70E/oplk9ub858Xh/3DCw3rA7ymnmVqSiL1lz6QkyHyGJsxexHWx
 r6vAlDfOOqin8IRWQjTTa22uQ/OUfNHgkdyvR1IACtk6zRie8YDf9MiJTPlZYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=VBI0Rw2R
Subject: Re: [Buildroot] [PATCH 1/1] utils/bump-stable-kernel-versions:
 update for split hash file
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



On 01/06/2026 20:10, Bernd Kuhls wrote:
> Since Buildroot commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba,
> linux hash files are split between pre- and post-6.17.
> 
> With buildroot commit da01b7271a4a9048ae8e8ae18753edc5da785a44 the
> script was updated for the new situation but still needs to update the
> version-numbered links to the directories with the correct hash files.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Titouan, how did you miss this? You've used the patched script for a couple of 
weeks now, no?

  Perhaps it would be useful to also do a `make linux-legal-info` or `make 
linux-headers-legal-info` after the update to verify that it actually works. 
That also detects if the license files ever change again.

  Regards,
  Arnout

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2568080242
> 
>   utils/bump-stable-kernel-versions | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/utils/bump-stable-kernel-versions b/utils/bump-stable-kernel-versions
> index 6303bf4010..0e76cd1168 100755
> --- a/utils/bump-stable-kernel-versions
> +++ b/utils/bump-stable-kernel-versions
> @@ -78,6 +78,10 @@ update_linux_hash() {
>                   echo ">>> Updating version from ${old_version} to ${new_version} in Config.in files"
>                   sed -Ei "s/\tdefault \"${old_version}\"([\t ]+)if /\tdefault \"${new_version}\"\1if /" \
>                       package/linux-headers/Config.in.host linux/Config.in
> +                git mv package/linux-headers/"${old_version}" package/linux-headers/"${new_version}"
> +                if [ -d linux/"${old_version}" ]; then
> +                    git mv linux/"${old_version}" linux/"${new_version}"
> +                fi
>   
>                   updated_releases_list="${updated_releases_list} ${release_version}.x"
>                   updated_versions="${updated_versions}\n - ${old_version} -> ${new_version}"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
