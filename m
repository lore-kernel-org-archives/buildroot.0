Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB77CF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 09:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3F2605BB;
	Sun, 29 Sep 2024 09:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dm4u5cMY77mM; Sun, 29 Sep 2024 09:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BD6E606A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BD6E606A3;
	Sun, 29 Sep 2024 09:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA591BF36A
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 09:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B69E606A3
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 09:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LR_BOzi9JpZi for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 09:58:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8908605BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8908605BB
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8908605BB
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 09:58:29 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:8b73:1a83:d16e:81df] (unknown
 [IPv6:2a01:e0a:12:eba0:8b73:1a83:d16e:81df])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id D5975BFA8A;
 Sun, 29 Sep 2024 11:58:25 +0200 (CEST)
Message-ID: <763b02bb-2b74-4afc-b670-d41183bef12c@grenoble.cnrs.fr>
Date: Sun, 29 Sep 2024 11:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew McCann <andrew.2.622266@gmail.com>, buildroot@buildroot.org
References: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1727603905;
 bh=8lTvsLHit/hKIk2yCOZm2YnhyPScZQZsMPW080jYRt0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Uxmraq2q4DqBnfCxiIzXsHnQm02CEL8537H1iQfrizmMTHufrzImJ4gVUWyyUN0cD
 V87nG+BizzuI7jS+sxitb8j5mY4zvqaCdub3AtTlbFIKP1tJd0HHTEqPvR2ck0XyaP
 k/KP3n2hylF8FSfn7fm56OnzjWg9hXpozIPcPiuBA2LqxaOvzkmvsSAoSoKrxO7Gmr
 5mrWMAzn4nD9HuD/QlkBulG/VbdD0bz/MvGbz2VvbtAZZzAtdmRszDaZFxim7mkaYl
 wMR/3f2+wHQxrHzjlcEpB48EuUbyPYVNaAXdlSze+CkmU3tr6dypHuahjCN3ked6TY
 U+D19ee1Ib60w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Uxmraq2q
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

I cannot reproduce the issue. Starting from a clean clone of the
Buildroot repo, I did:

    git checkout 2024.02.6
    mkdir -p board/andrew/rpi
    echo "# This is the copied file" > board/andrew/rpi/config_3_64bit.txt
    cat board/raspberrypi/config_3_64bit.txt >> board/andrew/rpi/config_3_64bit.txt
    make raspberrypi3_64_defconfig
    ./utils/config --set-str BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE board/andrew/rpi/config_3_64bit.txt
    make
    head -1 output/images/rpi-firmware/config.txt

and I got

    # This is the copied file

as expected.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
