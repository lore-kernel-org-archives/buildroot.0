Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111FCF6496
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC9E6070F;
	Sat, 28 Sep 2024 20:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cAQC_UOOPkUS; Sat, 28 Sep 2024 20:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C59D60710
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C59D60710;
	Sat, 28 Sep 2024 20:58:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B60A31BF33C
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 20:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A519B81499
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 20:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GoGm-FDkaska for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 20:58:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DE1EF81498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE1EF81498
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE1EF81498
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 20:58:27 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:986e:c481:d6c4:acc1] (unknown
 [IPv6:2a01:e0a:12:eba0:986e:c481:d6c4:acc1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 07458BFA84;
 Sat, 28 Sep 2024 22:58:23 +0200 (CEST)
Message-ID: <b6eff46e-374f-4f4e-8caa-7ad9c5d40ce0@grenoble.cnrs.fr>
Date: Sat, 28 Sep 2024 22:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew McCann <andrew.2.622266@gmail.com>, buildroot@buildroot.org
References: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1727557104;
 bh=oadWdXXZNh/Enx7QWrlbvjwxSuMP+2q9kYi8Fb6qoJw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=AEYxKLHOS7+JOAFnmBH1wcC0naswWwswnzA2PXCFEXxLdRLKZ2MVO8lstL0hs6taA
 0NIZt6xfAWKuSJGWkCUpjDpX5dwwhQqylKz2AxB0ZkMgyznmbA0aBr4gGvwVGb+B+B
 +TfOhq2yiq4YlGoxmdQgYIgXLkBK/eEXf03DeWZYuONZ+Tn33Nih8WagBbWvmrCynn
 y9mb2uitC9f0jg+gXWHoXbU3iwvIBNgZ7s+9gJGVoepJvdPSufCIDL6Mckumn03FLs
 7JhuJsUXgi+/D+SU1Wyo1T1gEhPXSPKpE4tFZ3rz/ndvVOwCwKSojaUm5F8/F9q3sM
 RTjcP8HqDvESA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=AEYxKLHO
Subject: Re: [Buildroot] Change config.txt Not Working
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Andy wrote:
> I change the menuconfig option for the path to a file stored as
> /boot/config.txt (image below) I then exit and then run 'make', I'm
> expecting the file at board/output/images/rpi-firmware/config.txt to
> be changed to the file at the specified path. Instead, there is no
> change to the file; it is still the default file. Am I missing
> something?

Are you sure you saved your .config before exiting menuconfig? What is
the output of the following command?

    grep BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE .config

Otherwise, you may try building your .config from the command line, like
this:

    make raspberrypi3_64_defconfig
    ./utils/config --set-str BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE board/andrew/rpi/config_3_64bit.txt

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
