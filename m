Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC9CED614
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 07:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411E28101C;
	Wed,  9 Oct 2024 07:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcZcrDiZUKG3; Wed,  9 Oct 2024 07:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 430BE81242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 430BE81242;
	Wed,  9 Oct 2024 07:26:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16CFE1BF868
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 07:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04B2140630
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 07:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEUk7dIZXjRB for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 07:26:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2A4F40621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A4F40621
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2A4F40621
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 07:26:30 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so138483f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 00:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728458789; x=1729063589;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RljUsCWO/qZHR831l77lzqzhes5kCV904WeWWBd2mhc=;
 b=EjJhRAz03wZkqgdfMDysTFzmMm918fhi6jJ51xDAgmBV2n4ITE+6r80GtaDRaoIFz8
 bPn+4qsy+BuQTLzPDv3CZ9KLytsEfWF4nWlrGjvE+HlRsRM9c1rGl9xmDqXGRaFAwTif
 jK1mpMOOqKF2GuzvBX6qTl7J/IrRCT+SAaf8WxWEiynJEjA1uZtutaNhp8wVuFdPuiOA
 rxI81lrHta21xnHv3mkEikNFxRG+z3ZmNwvFEkvTXmF8lq/CFUhRQBDey6MifgBrpgBh
 09s8xp8NBNMzOXL6Glh1yBy0zTg/iVupl7xdRJ1cpBdqu27WXrSM4eWSmCScX3yFVUtz
 +Adg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdXTt8wnRYYe/xtr7Fcp1K1Yto/z5nmKr5fv2vJjGMemHHOwtEj++Yp9EU3tfxzosNAwOe9s8KO9w=@buildroot.org
X-Gm-Message-State: AOJu0YyaA05glvZYZw13mOp3hxsg0ccCvyH4N71NcdsA9208k0STFxlU
 2FSvNy9GqR0kaM1+bWALD0hVgX0CJNV+mMdjT/GL3sopdeaTsqpD4+QCFJKrpm4=
X-Google-Smtp-Source: AGHT+IELPy1gyIV8QntntsUDU+TnuFTDCGx2Gq8VDRfCRY7Ouql63EnOWCnRMp7jCgYjbtklLYjBRA==
X-Received: by 2002:adf:ef8b:0:b0:37d:325e:dd59 with SMTP id
 ffacd0b85a97d-37d3a521a71mr768968f8f.26.1728458788591; 
 Wed, 09 Oct 2024 00:26:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1691b5ddsm9704831f8f.47.2024.10.09.00.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 00:26:28 -0700 (PDT)
Message-ID: <82be0693-3dd6-4c0d-a357-740d0a9c67cb@mind.be>
Date: Tue, 8 Oct 2024 22:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20241008073301.125344-1-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241008073301.125344-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728458789; x=1729063589; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RljUsCWO/qZHR831l77lzqzhes5kCV904WeWWBd2mhc=;
 b=BOhs2X2noorKTM+wIBxD3sxyCktTxBfT3SRiiQYjtzxjSW+mwJsJGGmfFwcPwAHnCW
 umQhcNmaOa43dPXLsMggbnm9rtJWfML7sSstq6l7U+vWX+fix4HlPOeHr/pZDZqkrCJG
 2ubQMOmtmmWjn7jZ9+4XOJ2srHvIyVdiB06AaGp1eFi2dW5rdsj/FEiQnwwWXKDFHCVb
 u1y/QM7wFUhwIKEud8cz0fT3w4rcYzSumIbM2DaZ8Qg8TM7zBvg1Dmrbdoj0SnT8QsQ1
 WrHKyRvUVyaHDXmZPbd31zH8F8IGA04Tw5NQyUmOwLqQYhDXBh7Bo6ZULzemPrYunziK
 VzSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BOhs2X2n
Subject: Re: [Buildroot] [PATCH v2 1/2] board/mender/x86_64: clean up post
 build and image scripts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/10/2024 09:33, Adam Duskett wrote:
> - Use function_name() {} instead of function function_name {}
> - Use consistent double newlines between methods.
> - Un-indent the comment aboe the mender_fixup method.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, thanks, with modifications see below.


> ---
>   board/mender/x86_64/post-build.sh     | 11 +++++++----
>   board/mender/x86_64/post-image-efi.sh | 12 +++++++-----
>   2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
> index 23d1120d45..254b0a21fd 100755
> --- a/board/mender/x86_64/post-build.sh
> +++ b/board/mender/x86_64/post-build.sh
> @@ -3,7 +3,8 @@ set -e
>   DEVICE_TYPE="buildroot-x86_64"
>   ARTIFACT_NAME="1.0"
>   
> -function parse_args {
> +

  This introduces new "two consecutive empty lines" check-package warnings. 
There were already such warnings in the other scripts, so I removed those as well.

  Regards,
  Arnout

> +parse_args() {
>       local o O opts
>       o='a:o:d:'
>       O='artifact-name:,data-part-size:,device-type:'
> @@ -28,8 +29,9 @@ function parse_args {
>       done
>   }
>   
> -  # Create a persistent directory to mount the data partition at.
> -function mender_fixup {
> +
> +# Create a persistent directory to mount the data partition at.
> +mender_fixup() {
>       pushd "${TARGET_DIR}"
>       if [[ -L var/lib/mender ]]; then
>           rm var/lib/mender
> @@ -44,7 +46,8 @@ function mender_fixup {
>       popd
>   }
>   
> -function main {
> +
> +main() {
>       parse_args "${@}"
>       mender_fixup
>       echo "device_type=${DEVICE_TYPE}" > "${TARGET_DIR}/etc/mender/device_type"
> diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
> index 97b9e06d21..c7c848e453 100755
> --- a/board/mender/x86_64/post-image-efi.sh
> +++ b/board/mender/x86_64/post-image-efi.sh
> @@ -7,7 +7,7 @@ ARTIFACT_NAME="1.0"
>   
>   
>   # Parse arguments.
> -function parse_args {
> +parse_args() {
>       local o O opts
>       o='a:o:d:'
>       O='artifact-name:,data-part-size:,device-type:'
> @@ -31,8 +31,9 @@ function parse_args {
>       done
>   }
>   
> +
>   # Create the data partition
> -function make_data_partition {
> +make_data_partition() {
>       "${HOST_DIR}/sbin/mkfs.ext4" \
>           -F \
>           -r 1 \
> @@ -44,7 +45,7 @@ function make_data_partition {
>   
>   
>   # Create a mender image.
> -function generate_mender_image {
> +generate_mender_image() {
>       echo "Creating ${BINARIES_DIR}/${DEVICE_TYPE}-${ARTIFACT_NAME}.mender"
>       "${HOST_DIR}/bin/mender-artifact" \
>           --compression lzma \
> @@ -56,12 +57,13 @@ function generate_mender_image {
>   }
>   
>   
> -function generate_image {
> +generate_image() {
>       sh support/scripts/genimage.sh -c "${BOARD_DIR}/genimage-efi.cfg"
>   }
>   
> +
>   # Main function.
> -function main {
> +main() {
>       parse_args "${@}"
>       make_data_partition
>       generate_image

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
