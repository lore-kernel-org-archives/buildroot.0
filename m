Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA66C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 09:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DAC60FBD;
	Wed, 21 Dec 2022 09:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13DAC60FBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAn1A3uzMGlK; Wed, 21 Dec 2022 09:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E6D560BBE;
	Wed, 21 Dec 2022 09:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6D560BBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50ED61BF2A1
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 09:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2999C4177A
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 09:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2999C4177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTsiMrom0WOd for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 09:57:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0301C4175C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0301C4175C
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 09:57:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso1035517wmo.1
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 01:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6RtGpCQIXSJANhC4qS/Ks8f1TJFL/mwfiYIkhtHz/cA=;
 b=0vjrYjJ/Sq+QVfHOGGpkRm+BkNVBMSLij2nHnpXg9papXzRIhezvNn4PoGwEZdQ8aU
 mZIrBr+A1H0ag6K6z/kIhbHREFMYDwGo+MAVKk6jc/BQnK0B7+ojXIY/kPCQhuuYFI4c
 GHL1BEEcTyYBZD+RYYs7aMaR9QwMJyTFoSuWH279Fg7QuQFAxqToQb4D60tUobkEH4IO
 Ulxi+h+XFhUUDvkPV5VHdglM1a+AeFSpxsIBMK5EPBrvHICBGj6cKoAk8hnAkNIL0eJW
 xuZyS+HRtYRiTJ8Ha0CicN0y8tLLT6NMUCMqzpwCZJOuspXfdo3qO4ERjbIOV4bdRv4E
 slmA==
X-Gm-Message-State: AFqh2kp/7QOmxfGwJmsBYLL3Cfxm29io1m4iM84rPHCESCC6qyVqCW89
 ccq08Yd2dnxdw3pa/SXlVmC46/5CdwW5uOr7
X-Google-Smtp-Source: AMrXdXu6Z4V9qwkUTyCyC4oh4nKpacL+5JHc4Y4XNL0/M9YlmqOuCGOdIX/UWlo0bje195qeZZtR5w==
X-Received: by 2002:a05:600c:18a3:b0:3d6:b71c:117a with SMTP id
 x35-20020a05600c18a300b003d6b71c117amr1357527wmp.31.1671616645102; 
 Wed, 21 Dec 2022 01:57:25 -0800 (PST)
Received: from p1g2 (2a01cb000f892400bac0522898b75ff0.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f89:2400:bac0:5228:98b7:5ff0])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a05600c461800b003cfd0bd8c0asm1581265wmo.30.2022.12.21.01.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 01:57:24 -0800 (PST)
Date: Wed, 21 Dec 2022 10:57:23 +0100
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <Y6LYg4Z22P1320e8@p1g2>
References: <20221220133454.1931855-1-christian@klarinett.li>
 <Y6LEoC1iXjhW77XR@p1g2> <20221221095431.GK2909@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221221095431.GK2909@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6RtGpCQIXSJANhC4qS/Ks8f1TJFL/mwfiYIkhtHz/cA=;
 b=ZDEncU84/upj+pXWU+RLY3l5nrsKdawJVCEoUNmzBHV/BBiMaCVxeZ2V516ZcjFsbl
 iSZ7lPavy8BNaoqYYCSI7pCSi0Qtutb0R6cPX7TsPbJ/f+ylKFeFZJ0Qg8ZnRpXKVj17
 yIB4vR34L2iZLXP2EL+foKlajC7DuHkXAdRL0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=ZDEncU84
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 installation with merged usr dirs
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Christian Hitz <christian@klarinett.li>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Wed, Dec 21, 2022 at 10:54:31AM +0100, Yann E. MORIN wrote:
> Gary, All,
> 
> On 2022-12-21 09:32 +0100, Gary Bisson spake thusly:
> > On Tue, Dec 20, 2022 at 02:34:53PM +0100, Christian Hitz wrote:
> > > From: Christian Hitz <christian.hitz@bbv.ch>
> > > 
> > > Currently, the firmware files are installed to /lib/firmware/imx. With
> > > BR2_ROOTFS_MERGED_USR=y /lib is replaced with a symlink to /usr/lib
> > > effectively deleting the installed firmware files.
> > > 
> > > Install the firmware files into the /usr/lib/firmware/imx prefix instead.
> > > 
> > > Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> > > ---
> > > Backport to: 2022.02.x, 2022.11.x
> > > ---
> > Thanks for your contribution, looks good to me! That brings the question
> > about linux-firmware that doesn't seem to handle that case either.
> > Thomas, should we have a generic TARGET_FIRMWARE_DIR that switches from
> > /lib/firmware to /usr/lib/firmware automatically? That way it would fix
> > it for all packages at once.
> 
> As I explained in my reply to Christian: this should not be needed,
> because the /lib symlink is created by the skeleton, which are installed
> before any other package. So, all packages should see the proper /lib
> symlink.
> 
> Note that we've introduced merged-usr quite a long time ago now (more
> than 7 years ago!), and it has been used by many people (I included)
> without that issue surfacing so far for linux-firmware, so I'd be
> surprised that there is an actual issue for any of the (well behaved!)
> firmware packages... ;-)

Indeed it makes sense. I wasn't aware of that option so I never tried
it. So my suggestion was only applicable if the problem does exist
indeed. Next time I'll make sure to give it a try ;)

Thanks,
Gary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
