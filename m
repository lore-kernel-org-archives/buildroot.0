Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5F0C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9D534074E;
	Mon, 15 Jul 2024 14:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Vua7aFHhePm; Mon, 15 Jul 2024 14:24:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58A2B40895
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58A2B40895;
	Mon, 15 Jul 2024 14:24:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 270CD1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14F4E60640
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugIgP44ypS49 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04B4F605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04B4F605BD
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B4F605BD
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:23:59 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so3934693f8f.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721053438; x=1721658238;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6tXrnuHHzkqxx/yQWECI/7OlA4lhfoxHO1J1nScxdc=;
 b=ooGK9dPcjXIfOPNxqfciJJrqDnLlieotfySxcTcyrwF9YeR9wCVbVeYrOD8miG/bu0
 69Xfs0tS5mWoi58BkEgoGE2aH724MlBWzB5QdOP+lAYs/bHafBWJ1sYeQNFdF75zO60q
 4YA/3lTZ6yogXwzrcZXSdWd8vARHnVMHfs6ij/VCILTGeTbI79Z5u/MIC8PF/tEg+80D
 kMcqGrpX+wNtVi1/rYmpXUc4tL4UXkam2dLHuaGklju1op4GpiMAO12gdSjT/yMqLsif
 SkqoqFayNa+2hVPRjgF+An9NEOtnrgUjcP02camlB/vNb8MNWfpb2fft+nPbJuu/C6kB
 Sttg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJnks7akyG/BrXpUVUI/NJu5zn10JJksLprnImEgV7yNumLXYIJiY+Bm7bqxuWc6QD88o1bSiPscarST7Yz+zS2pgyLXJBMw==
X-Gm-Message-State: AOJu0Yyl/vCzVp8O2bWnGcou7Gjov6g/K1KlTBuQTJTNFWKimLYXphcS
 aGxTzsOiLNZFbO/BMJRawv+G3lck0fjMnJcnLZQSjLAg7RmajM3g6a70FL4oS8Xo4RciAviFEvD
 xuVo=
X-Google-Smtp-Source: AGHT+IEsev5gHcvlYYitRhEqwKj5av4PWUScCaHawvx4Dg2F0dVAsJD3y1cdPZ6yusQi5vezPXHJpw==
X-Received: by 2002:a5d:47a7:0:b0:360:75b1:77fb with SMTP id
 ffacd0b85a97d-367cea46438mr21175518f8f.8.1721053437861; 
 Mon, 15 Jul 2024 07:23:57 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3cd1sm6599988f8f.22.2024.07.15.07.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:23:57 -0700 (PDT)
Message-ID: <be4a74a6-981c-49c3-9d4e-e5f413cac1b7@mind.be>
Date: Mon, 15 Jul 2024 16:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
Content-Language: en-GB
In-Reply-To: <20240715160555.6e88961e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721053438; x=1721658238; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6tXrnuHHzkqxx/yQWECI/7OlA4lhfoxHO1J1nScxdc=;
 b=IxCrExzqLQnIFonlB06HT4HXW0b+ObKExcybgo63rhXsCOEYnUqjBg/p9pzHfbZ/18
 wmTnH4dMqFJQR8/9eZU4rhnUjXgviBw7gZs97++J92XdWiKyrkgMw/auOyWGooCSfW8a
 nvMBBTzgjUx0RbemkboOqfO8eVadNNk/UstycYYTVFLrchAT13xWQOn8w1XbtEz6/ExV
 Nqbap+KnEfp/czVvIVJ7oYTUotopRCXXqy3HXSlJFQyrHFZa5hVe4/sOYCGqDZH9efaa
 7kDcNhA0FsycoA14j4pW+Qvf/RBooLGg9GK0SEZa+6U/5y34QIGuV0hAnKgoqBw5jnAX
 IlPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IxCrExzq
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/07/2024 16:05, Thomas Petazzoni via buildroot wrote:
> Hello Dario,
> 
> On Sun, 21 Apr 2024 11:53:52 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> 
>> The patch adds an option to create, in addition to the usual image, an
>> image of type bmap that drastically reduces the amount of data that
>> needs to be written to an SD card, resulting in time savings.
>>
>> This makes it possible to activate this option easily and maintain
>> backward compatibility for all configurations already using the genimage
>> tool for creating the image to be written to the SD card:
>>
>> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/<manufacturer>/<boardname>/genimage.cfg -b"
>> +BR2_PACKAGE_HOST_BMAP_TOOLS=y
>>
>> It follows that the script now assumes a broader functionality that
>> extends beyond just being an interface for the genimage tool.
>>
>> An alternative implementation could have been to create another script,
>> such as support/scripts/bmap.sh, capable of creating the bmap image
>> using the same parameters passed to support/scripts/genimage.sh (i. e.
>> -c board/<manufacturer>/<boardname>/genimage.cfg). However, in this case,
>> the script would also need to know that the image is located in the
>> ${BINARIES} directory. This could be achieved by adding an additional
>> parameter, but it might cause genimage.sh to fail due to an unrecognized
>> parameter.
>>
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> We took advantage of the on-going Buildroot hackathon to discuss live,
> and we pushed your patch, but with some changes:
> 
> (1) We don't add an option to script, but rather we look in the
> Buildroot .config file is host-bmap-tools has been enabled. If it is
> enabled, we assume the user wants bmap images

  Instead of looking in the config, we could also look for it in PATH (with "if 
which bmaptool >/dev/null 2>&1").

  Regards,
  Arnout

> 
> (2) We generate bmap images for all images, as long as they exist in
> $(BINARIES_DIR). Indeed your trick of counting how many times the name
> of the image was referenced in the genimage.cfg to try to guess what is
> the "final" image (like sdcard.img) would fail badly if the final image
> was:
> 
> image a {
> 
> }
> 
> because the image name "a" is probably found more than once in the
> genimage.cfg.
> 
> However, with that, we are not going to apply your PATCH 2/2, because
> we don't want to force everyone to build host-bmap-tools. Now everyone
> only has to enable BR2_PACKAGE_HOST_BMAP_TOOLS=y in their configuration
> to automagically get bmap-capable images generated. Perhaps what should
> be done now is to document this somewhere in the manual. The question
> is of course where to document it, and on that I'm not sure.
> 
> Note: it might be relevant to also adjust the filesystem generation
> code in fs/common.mk to also generate a bmap-capable image of the
> rootfs image itself, also based on the availability of host-bmap-tools.
> 
> Thanks for your work!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
