Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11BAC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4D6460232
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4D6460232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8188D80EDF;
	Mon,  8 Nov 2021 22:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuTadIJJquqy; Mon,  8 Nov 2021 22:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D689C80E9C;
	Mon,  8 Nov 2021 22:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7BFD1BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B801A80EA1
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRrU8Kyp2FNg for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CD5780E03
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:07:51 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g14so67792945edz.2
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 14:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JWTp01LzbRvvS/Crmp3YGAoGGRDQ26S7wCattcZ2kBM=;
 b=AI0ys/OmAn144fO2+y5yBHi7aY001KHLhZnx7o5U7/6Pb14OdYx9uEFpoogmQXgYYB
 aqpAltSj41XmG86BQ3G9NjaoSlyli4SboBpp9F0qumXTuK4ufff0wDa0pR58XXp+d4j6
 gppxoJzf8msRujTKkQ7IAB6GYVxUEt50RyXHXW4e//5QO0Ke27qtaYQPPjJJ93oUkok0
 1RrXUZfLKFy3yvaDexo13VOfOcT1nunloEtjWX4beEH+82s44q8QKWcOdGetV1HMFBSM
 co+J/INUn6Hl7TcdHWLL7hK+S5jRJlPrTaPhjFCpYRlNQEhWLd8rMU4rDcbZoa2WL6xd
 xZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JWTp01LzbRvvS/Crmp3YGAoGGRDQ26S7wCattcZ2kBM=;
 b=b95VNw6j4bWkwS9lH9JK9BtG3ITNcLMY9VtIGDsBnQjs1243rhNbJ6QlGSrpxf8k5T
 EJlMZsPhVhhKF9CA/zcd7FiwS4e2cImyQnFMCB1/xwrx0OHytB0T5m0Pog25/H+P14Fw
 0wWFzWMSyiFay26ArmYsjYJlrYk4CpkHpd9sTpVDktsnSDYhcIcvTvll0oX71DCPJKnu
 pj3+cMprGpWb9G+gF8iS4kNCQDsiYBoMaVDQdoWRj4m299vZjC1K/fYsbnuQc2w6DG7R
 crLKiC7n0657rgAhlLkz5F3iNaiOjrnG4GBCZ8yl3Tu7lo1mBkGrbNreRsfWKLu9Gy7E
 5oQw==
X-Gm-Message-State: AOAM531z6B7nZvzEB60at/AmMW1YOwoX7mVSddZQtWzgN9rM0Cd+gor/
 v1Ze/7+XqTFak3QrLZWIwcXC41/0Hps3Kw==
X-Google-Smtp-Source: ABdhPJy+HP2i/f4sm57CDxWcMF0OJInLPgObP0qyg5AXzROgrOzSgSyh6Ww33W239UbwueI7iqjeSA==
X-Received: by 2002:aa7:c783:: with SMTP id n3mr3250565eds.121.1636409269709; 
 Mon, 08 Nov 2021 14:07:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d3sm9967960edr.0.2021.11.08.14.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 14:07:49 -0800 (PST)
Message-ID: <ead8e3e9-1ee3-ff4c-5a82-7af5d78a4d12@mind.be>
Date: Mon, 8 Nov 2021 23:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211108195130.2798450-1-giulio.benetti@benettiengineering.com>
 <20211108195130.2798450-2-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211108195130.2798450-2-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: add genimage.cfg file
 coding style standard
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/11/2021 20:51, Giulio Benetti wrote:
> This patch adds the explanation for the genimage.cfg files coding standard.
> A real standard is not defined upstream by the genimage utility
> developers[1], but I try to give one here in Buildroot for consistency.
> 
> [1]: https://github.com/pengutronix/genimage
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   docs/manual/writing-rules.txt | 62 +++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
> index 3b809d5c48..28cb0fe4f1 100644
> --- a/docs/manual/writing-rules.txt
> +++ b/docs/manual/writing-rules.txt
> @@ -136,6 +136,68 @@ LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
>   endif
>   ---------------------
>   
> +[[writing-genimage-cfg]]
> +
> +=== The +genimage.cfg+ file
> +
> ++genimage.cfg+ files contain the output image layout that genimage utility
> +uses to create final .img file.
> +
> +An example follows:
> +
> +---------------------
> +image efi-part.vfat {
> +	vfat {
> +		file EFI {
> +			image = "efi-part/EFI"
> +		}
> +
> +		file Image {
> +			image = "Image"
> +		}
> +	}
> +
> +	size = 32M
> +}
> +
> +image sdimage.img {
> +	hdimage {
> +	}
> +
> +	partition u-boot {
> +		image = "efi-part.vfat"
> +		offset = 8K
> +	}
> +
> +	partition root {
> +		image = "rootfs.ext2"
> +		size = 512M
> +	}
> +}
> +---------------------
> +
> +* Every +section+(i.e. hdimage, vfat etc.), +partition+ must be indented
> +  with one tab.
> +
> +* Every +file+ or other +subnode+ must be indented with two tabs.
> +
> +* Every node(+section+, +partition+, +file+, +subnode+) must have an open
> +  curly bracket on the same line of the node's name, while the closing one
> +  must be on a newline and after it a newline must be added except for the
> +  last one node. Same goes for its option, for example option +size = +.
> +
> +* Every +option+(i.e. +image+, +offset+, +size+) must have the +=+
> +  assignment one space from it and one space from the value specified.
> +
> +* Filename must at least begin with genimage prefix and have the .cfg
> +  extension to be easy to recognize.
> +
> +The +genimage.cfg+ files are the input for the genimage tool used in
> +Buildroot to generate the final image file(i.e. sdcard.img). For further
> +details about the _genimage_ language, refer to
> +https://github.com/pengutronix/genimage/blob/master/README.rst[].
> +
> +
>   === The documentation
>   
>   The documentation uses the
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
