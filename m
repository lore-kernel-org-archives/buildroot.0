Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30763E7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 20:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A68BB80D6C;
	Tue, 10 Dec 2024 20:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSMNUdlFL7wz; Tue, 10 Dec 2024 20:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6BB380D83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6BB380D83;
	Tue, 10 Dec 2024 20:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BA666F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A18B6090C
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6ceP26zDQw1 for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 20:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3267C608F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3267C608F2
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3267C608F2
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 20:43:19 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53df19bf6a9so6927629e87.1
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 12:43:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733863397; x=1734468197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qWgzsTy/IZIFXMik+St/lW6yARO9N3WOPleCyD5fZVU=;
 b=v58YtIXvMzmwDcByXNJFcw73b7EjiuvQLhIdGQehjFcNYpxbK8YMZhAgZf1HkEB2HK
 kFlj5ADCnBSNSOTzA8fy7PN+zL6puCoxZ2GGvraKX7mdlXfIhVCSX07SFMu4FmiU9M7Y
 kIprA98cmrp1vB4Z+8eAa1LAdj+k7IFOi4weRsI0P8aFOBOIWVSIlPl9XJtIvnP12yNK
 GE5Q+Hm+7V20C3XNbv5yH89tC49apNt0b0aerBLkvI2f3PHQQSSQgZv7woywCfRTrYfe
 wrj+7XETq+lYW0mKtBA5oYBroTRLeN+xudTmLCTjdlA590EurfyTctZR7cG9GaseRk19
 7PuA==
X-Gm-Message-State: AOJu0YwRkKLN/Fq8elqYwc1Eg7GajwW4zIfysKBcGpalX/AUZujeN9pt
 jB2ntWtlhP+dGlFe3TPj/Ovhj/YIooRNNtpj79iqfKpkWp64JwQ2
X-Gm-Gg: ASbGnctq8apZz3zncAzYmz/LFvVOxLkiPrINVDqY4yFi9oGTk+Us/hzCWUSnfbJQ3Vr
 elF70ysyHYuH/b2fhIYMI3TbMAEttz7qi+BvywcnqsI46FKuXfdbixvzxBUjhq/sit27jxK/3TF
 tOhpambFPRlqtHY/qB2A8x8Ep1HlGSdJ+r3JbF+khFZRCwBiWcMNzIRhbl1uwWMCdiy04Y2IAEV
 ho6MraXKlqqA69oF5ho2EQGZIpxor9eBCorg5GyVxdZ8w==
X-Google-Smtp-Source: AGHT+IHRTfQDECUfCjTHucQ5X8Paj6Af/CckUFOCAQ0ZsMBYnShf+Y4dac7vn/QVo+h6hs64ZGGoHQ==
X-Received: by 2002:a05:6512:b03:b0:540:1fd6:4e34 with SMTP id
 2adb3069b0e04-5402a5e48f6mr69217e87.23.1733863396678; 
 Tue, 10 Dec 2024 12:43:16 -0800 (PST)
Received: from curiosity ([5.188.167.4]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-540299b2538sm71107e87.103.2024.12.10.12.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 12:43:14 -0800 (PST)
Date: Tue, 10 Dec 2024 23:43:11 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org
Message-ID: <Z1in3yM7ddVMYEqq@curiosity>
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733863397; x=1734468197; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qWgzsTy/IZIFXMik+St/lW6yARO9N3WOPleCyD5fZVU=;
 b=HXYyKvnDTx03/DMwQ/VxqnragcFX5mdfDWa3YvbiPSWeMLqKC7U1b62BMpk3W0DV/U
 1Wcy+OZ5Q4I55OMHEn4CHJOEt3Q5c2wClqHBBlzMHOjvSfZax3x3HFdYgmWptjgSBeUU
 eSPMjKCvaIxL8Mf97uPOufOXN702mAUta4YReS3yAvmk+uUHwmbtnJKAo29l5vvZx4c9
 ujcljoS/aYphAeBeyNkcfOwHiqL2M7jFsipKldWF92ugcLN2Gp+EqYGYZSwlj91bQi0F
 K9Xn7qCAhCHggutkWQASROHPl1Y8oxYGfQBembg+vZ0OLPWnULDqJgkDCdNra7uSca1i
 5jmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HXYyKvnD
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Edgar,

On Mon, Dec 09, 2024 at 09:11:40AM +0100, Edgar Bonet wrote:
> Hello everybody!
> 
> Sergey Matyukevich wrote:
> > I have been waiting for the new LTS Linux v6.12 in Buildroot to start
> > sending Christmas updates for some of my OrangePi boards. Now v6.12.3
> > is already available, but the latest kernel is still have 6.11.x. So I
> > decided to undertake a copy-paste exercise using the latest kernel and
> > headers update series by Bernd.
> 
> Nice!
> 
> Note, however, that there is an issue with Linux v6.12: the kernel build
> process won't build the device trees provided by Buildroot. The issue
> has been raised by Chris Packham both on the Buildroot mailing list[1]
> and on the kernel mailing list.[2] I think this should be fixed before
> bumping "latest kernel" to v6.12.
> 
> In the kernel thread, there is this solution suggested by Masahiro
> Yamada:
> 
> > I have [the yet-to-upstream device tree files] in the proper directory
> > location, and add
> >
> >   dtb-$(CONFIG_ARCH_FOO)  += foo-downstream-custom1.dtb
> >   dtb-$(CONFIG_ARCH_FOO)  += foo-downstream-custom2.dtb
> >     ...
> >
> > just like how they would look when they were upstreamed.
> 
> Maybe this approach could be adapted to Buildroot?

IIUC at the moment Buildroot includes the following configurations that
make use of BR2_LINUX_KERNEL_CUSTOM_DTS_PATH:
- acmesystems_acqua_a5_256mb_defconfig (v6.6)
- acmesystems_acqua_a5_512mb_defconfig (v6.6)
- octavo_osd32mp1_brk_defconfig (v5.10)
- octavo_osd32mp1_red_defconfig (v5.10)
- s6lx9_microboard_defconfig (v4.4.7)

Kernel version from each config is specified in parentheses. Adding new
v6.12 kernel is not going to break any of those boards right away.

However if the build rule for drop-in dtbs will not be re-enabled (which
seems likely), migration to new kernels will be a problem for those boards.
I don't see how BR2_LINUX_KERNEL_CUSTOM_DTS_PATH can be supported in this
case w/o patching new kernels. Probably it makes sense to convert those
out-of-tree dts files into proper kernel patches ?

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
