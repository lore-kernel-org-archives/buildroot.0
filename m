Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8368BCD3445
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 07:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 106544159F;
	Tue, 19 Sep 2023 07:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 106544159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L8sUtjQQq7aJ; Tue, 19 Sep 2023 07:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26D6F40A68;
	Tue, 19 Sep 2023 07:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26D6F40A68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33A611BF3D8
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 07:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09144822E3
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 07:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09144822E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_IpSpgsoT4V for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 07:16:36 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBCE822DD
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 07:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EBCE822DD
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A000FCF383
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 07:02:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 985001C0009;
 Tue, 19 Sep 2023 07:02:24 +0000 (UTC)
Date: Tue, 19 Sep 2023 09:02:23 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230919090223.3c3fa8ee@booty>
In-Reply-To: <20230918201623.2639458-1-fontaine.fabrice@gmail.com>
References: <20230918201623.2639458-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695106944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTlfzwJmh7t0pNe9MSchNH7SoORA6mZ80ZKYwz3LGxo=;
 b=NvUu+53tcGsgi1zTHDSRAMrhDPaOcREwSf8k6+wk6c1KdK3s5t5kNp5EZBUA+7pVOgNfEC
 Ni2z+JzMkvAAFVCp4KElvQU+Q33PMBOdYMQ6RTun1ZtkVufzY0XwwC0WrGHfOmc/PVK74h
 CIEl3S4Ghb/ewhY/VA6X23LWfOHngf9E15mSNtQqbUKPe9GEVp6XMCTixLZMD65+WUN+Z4
 ynOH20QbHVhE8sJa6JpBZKmMlobRLabCRXd/u+Gxzh7kY4jaRONhI81YdwYiawraaL6O9j
 y1OQCm784ne0cGKvwaGnQp3tdCgKuCaxsPJRJvhncDJxrrTwfJMsZLBoxFzCdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NvUu+53t
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: fix build with gcc 4.8
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 18 Sep 2023 22:16:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc 4.8 raised since bump of snmppp
> to version 3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:
> 
> configure: error: Cannot find suitable libsnmp++ library
> 
> [...]
> 
> configure:9496: checking if libsnmp++ can be linked with flags from pkg-config
> configure:9528: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_XOPEN_SOURCE=XPG6  conftest.cpp -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib -lsnmp++ >&5
> In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/snmp_pp.h:71:0,
>                  from conftest.cpp:92:
> /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/uxsnmp.h:628:35: error: 'nullptr' was not declared in this scope
>       CSNMPMessage *snmp_message = nullptr);
>                                    ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f272473e7b588f5390b183072935a0217290ee4e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Oh, wow, we are still supporting good old gcc 4.8! :)

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
