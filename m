Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE30BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  8 May 2022 18:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A0EA60EEF;
	Sun,  8 May 2022 18:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvWX6T1dy-hF; Sun,  8 May 2022 18:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C61260ACD;
	Sun,  8 May 2022 18:09:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92AB41BF306
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 18:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F74A408C8
 for <buildroot@lists.busybox.net>; Sun,  8 May 2022 18:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=freenet.de
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fR3fYbVD3EXz for <buildroot@lists.busybox.net>;
 Sun,  8 May 2022 18:09:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout1.freenet.de (mout1.freenet.de [IPv6:2001:748:100:40::2:3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9D74408C3
 for <buildroot@buildroot.org>; Sun,  8 May 2022 18:09:49 +0000 (UTC)
Received: from [195.4.92.124] (helo=sub5.freenet.de)
 by mout1.freenet.de with esmtpa (ID earthquake.de@freenet.de) (port 25) (Exim
 4.94.2 #2) id 1nnlLk-002Wz5-9l; Sun, 08 May 2022 20:09:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tE7VNCQGmGnKMbYTdbXFwuTMRZYns9TuFHP/JIgEcFs=; b=SwK4k4/JI+JmeVLJLj+FEfbvFq
 m8tBKIrRKMmilSzbtVVmR421QDpnIxEZ83FcnewBMJEXlB8irqQ9etuC5ebNVZVarRc/TKZhy89Y8
 Iw5c4iIwP/p29DHExrAEKyD5Ix3iY7PEwMXuLmQvptdm2fNTSma4e739tjkR/jwG7JrM9tocQSYDY
 vmVKpwByxKfhaAJkLl0BAsl/R1UdKYIFsjl6CcRLI1EeHmt/i/C+REUqXVdSP8fgxH3/k01XeS6pu
 dteFpHbihrbx/pimU3IGFZjrMpNu3KkvXp2Pf3lvDVghONWHNxrsZSQklszkg0DYNthXXILeepr7i
 Ecy+4RrQ==;
Received: from ipbcc0e031.dynamic.kabel-deutschland.de ([188.192.224.49]:49260
 helo=[192.168.0.12])
 by sub5.freenet.de with esmtpsa (ID earthquake.de@freenet.de)
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (port 465) (Exim
 4.94.2 #2) id 1nnlLl-00AW54-DB; Sun, 08 May 2022 20:09:45 +0200
Message-ID: <fec240d1-19eb-93fa-24b3-e1292d471605@freenet.de>
Date: Sun, 8 May 2022 20:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <80d6f58b-a36e-6148-c6b6-37a29d3244e5@freenet.de>
 <874k221y8l.fsf@dell.be.48ers.dk>
 <eb164229-ac1c-764a-b9e5-bd86018611ff@freenet.de>
 <87zgjsxujk.fsf@dell.be.48ers.dk>
From: Alex <earthquake.de@freenet.de>
In-Reply-To: <87zgjsxujk.fsf@dell.be.48ers.dk>
X-Originated-At: 188.192.224.49!49260
X-Scan-TS: Sun, 08 May 2022 20:09:45 +0200
Subject: Re: [Buildroot] buildroot host builds with g++
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Am 08.05.2022 um 11:06 schrieb Peter Korsgaard:
>>>>>> "Alex" == Alex  <earthquake.de@freenet.de> writes:
>   > Hi,
>   > I created a target package for ACE(+TAO).
>   > From the package I need the Idl compiler for the host.
>   > Therefore I created a host makefile for building the IDL compiler
>   > (just the idl compiler (with static option...)).
>
>   > So, if I build the idl compiler for the target, compile is
>   > successfull. (make with TARGET_CONFIGURE_OPTS)
>   > But buiding for the host (make with HOST_CONFIGURE_OPTS) the build
>   > fails with
>
>   >  g++: error: /usr/bin/g++": No such file or directory
>
>   > In buildroot-config, BR2_TOOLCHAIN_BUILDROOT_CXX is set.
>
>   > So how can I get a g++ for host building?
>
> You need to instal g++ on your build machine.

g++ is installed on my build machine where I create my buildroot system.
The project compiles outside of buildroot on my build machine.
Does buildroot environment need a link/variable to the g++ on the built 
machine?

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
