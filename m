Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A142C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 06:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14EF961201;
	Sat, 28 Jan 2023 06:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14EF961201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puEYa68qsQhi; Sat, 28 Jan 2023 06:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C87760ADC;
	Sat, 28 Jan 2023 06:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C87760ADC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 758CA1BF424
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D1274047B
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 06:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D1274047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtTuANmAgpGQ for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 06:36:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B290340117
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B290340117
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 06:36:33 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id mf7so253118ejc.6
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 22:36:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zy/rj/n81rf62AjosWD+GbTiwt3eZxJyvongdUBQRfM=;
 b=eK6AL+3KPg1jasWaNCb7AMEbbjkrwPv1Zh3VZYw2v09b9N1JizRWhGnReYPbotqigS
 7y9XeNBH5QUM5FkmCdaJzoEiz0yF8MjIsaVtov91rMogFluSsUGaOL0XJxf2danN20SZ
 UIhjSh/7TbKFyaYh+P9LgQ3AaiXN4jSHaz9Ln5GulAJCIAZVuNfaqfeh3AuGcomcuerI
 3Jt66zpNULW67zxga0mHYg2sDhEO9O9WZTTklulZ6IPc7zCfINZ/PH+D/mjPD75f3FBU
 CUNzVRXI9+5q6WTwGq8RoudTFvxIaqpfl1aHEed3N3iU1xVAF5ee4iBv7kHsHu7zQJ7v
 skdQ==
X-Gm-Message-State: AFqh2kpoHVhmmnNDIdz5GURJjSApSAeOnGlBiJGkM1eNfJk8OVNkvHFZ
 m87b1enoh7o2kMe1AQPL058=
X-Google-Smtp-Source: AMrXdXsRmj3xSUmNVyp8GiFVNCApHVS9DW/2zCmRt55RiGVYTpsRlNQ8aX7KXQ1N8kV2SIyJTuTg+A==
X-Received: by 2002:a17:906:dfda:b0:871:e9a0:ebaa with SMTP id
 jt26-20020a170906dfda00b00871e9a0ebaamr46505121ejc.31.1674887792006; 
 Fri, 27 Jan 2023 22:36:32 -0800 (PST)
Received: from localhost (tmo-064-101.customers.d1-online.com. [80.187.64.101])
 by smtp.gmail.com with ESMTPSA id
 bs16-20020a170906d1d000b007af0f0d2249sm3498716ejb.52.2023.01.27.22.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 22:36:31 -0800 (PST)
Date: Sat, 28 Jan 2023 07:36:24 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
Message-ID: <20230128073624.00741082@tuxfamily.org>
In-Reply-To: <20230108165438.1250779-4-laurent@vivier.eu>
References: <20230108165438.1250779-1-laurent@vivier.eu>
 <20230108165438.1250779-4-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v8 3/3] support/scripts/boot-qemu-image.py:
 manage petitboot interface
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun,  8 Jan 2023 17:54:38 +0100
schrieb Laurent Vivier <laurent@vivier.eu>:

> Petitboot doesn't start a shell but a GUI.
> Manage the menu to switch to the shell.
> Use "poweroff -f" as we don't have init
> 
> Enable the test for qemu_m68K_virt.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
