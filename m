Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F39C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 18:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E114613A2;
	Fri, 16 May 2025 18:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3aSLNNEHVvg5; Fri, 16 May 2025 18:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5912C61352
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5912C61352;
	Fri, 16 May 2025 18:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2225E1C7
 for <buildroot@buildroot.org>; Fri, 16 May 2025 18:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0735A407E6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 18:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pIH_rmoCk9Q for <buildroot@buildroot.org>;
 Fri, 16 May 2025 18:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24B2840742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24B2840742
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24B2840742
 for <buildroot@buildroot.org>; Fri, 16 May 2025 18:00:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 185BE1C0FCB; Fri, 16 May 2025 20:00:25 +0200 (CEST)
Message-ID: <d9b898d0-657c-4335-8ba5-433b474b2ade@rnout.be>
Date: Fri, 16 May 2025 20:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
References: <20250516175351.308323-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516175351.308323-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2jHGNu590Df6ol7J/z4R6ZNsk1kWNoPyNMCrc4/lUmQ=;
 b=TDdRq3DzAlvIvHvqI9li3q1DO+x+uubnaqwOdgHh9FDuGMkuiPD6yZ122Ebvo/9WItX6Wu
 Ru1jHddJ9yetCRpFJcxZWBJ+UhaCnXyGAyEtQstqDcc5wumNqfy+VQtqgKlEhWWlRr9L5t
 BPT5Vkh8SrtnV2xMSJxAQuIYxklTrb/1oK6oy7TQMxQ+z+AHnaYI/oK+acoU5sUCcW/akA
 IeCIXPFVw9TUOImImjz0BDOeYakfPrpsT8PI2vBSoZkqEe5Xdjx42sR8dYru/t/2TC2P7E
 2LH89BfwYn7Ef6bL0FgBTKt4ftWocpWcJq18wHMgpZ4GocwcJ8cvA07ywMPtMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TDdRq3Dz
Subject: Re: [Buildroot] [PATCH v2 1/3] support/download: replace deprecated
 .cargo/config
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



On 16/05/2025 19:53, Thomas Petazzoni via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> With the current vendoring process, any Cargo build emits the
> following warning:
> 
> warning: `.../.cargo/config` is deprecated in favor of `config.toml`
> 
> .cargo/config.toml was introduced in 1.39 [1], so there shouldn't be
> backwards compatibility issues in Buildroot. However, because the
> generated config file becomes part of the vendored archive, this
> changes the hashes of all Cargo-based packages.
> 
> [1] https://doc.rust-lang.org/cargo/reference/config.html#hierarchical-structure
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied series to master, thanks.

  Regards,
  Arnout

> ---
>   support/download/cargo-post-process | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> index 12198051a4..b0e59ad74d 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -31,14 +31,14 @@ post_process_unpack "${base_name}" "${output}"
>   # Do the Cargo vendoring
>   pushd "${base_name}" > /dev/null
>   
> -# Create the local .cargo/config with vendor info
> +# Create the local .cargo/config.toml with vendor info
>   mkdir -p .cargo/
>   mkdir -p "${CARGO_HOME}"
>   flock "${CARGO_HOME}"/.br-lock \
>   cargo vendor \
>       --manifest-path "${manifest}" \
>       --locked VENDOR \
> -    > .cargo/config
> +    > .cargo/config.toml
>   
>   # "cargo vendor' outputs on stderr a message directing to add some data
>   # to the project's .cargo/config.toml, data that it outputs on stdout.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
