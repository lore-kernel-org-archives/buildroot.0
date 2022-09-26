Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7EC32771
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 11:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42A2E60F61;
	Mon, 26 Sep 2022 11:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42A2E60F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3mdqHRsWbjxG; Mon, 26 Sep 2022 11:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D69E60F48;
	Mon, 26 Sep 2022 11:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D69E60F48
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2B111BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 11:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE460817B5
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 11:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE460817B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Go5-Hc6vl6xV for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 11:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779CE8129F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779CE8129F
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 11:12:21 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 e10-20020a05600c4e4a00b003b4eff4ab2cso7252878wmq.4
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 04:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=+nDf1zutz/udpRyzkjsJs9uG9ZyiEIl0Bjou7KgEb6A=;
 b=cveHaiNPW5nJiqpGGGh+UI1nWr43oJxPmd5ThN19anBzDDRXhrCa9eobdRRKC/z1Hk
 fszXv9GuK9mFmyd7fGpFsxRZFpS0g2Kid2IjBICHJ/spZ1b2MNiKC9wfD1Fsc9SjZ85/
 MLsBUoZ+R+kybKTZjgCwbeyHou37FTe3fpGUAFa0q9hdcUsc9/pFWywH5WuAxEgwq/g9
 CRYQXZnEqPYFaNztnDWymivK90EsmAjEyGbaSKs8eCVf3Xzry8YoMJxKrJt+pMasgQf0
 lz/rqVAeKYyBXxEM0VKVcaVdS2XiIL/aMBJuspugVYVhQIWutc2mvuhZeVBW5gQMtODy
 +irw==
X-Gm-Message-State: ACrzQf0GivE8K5VJ90Baq91iVANzoryR6YBM4Pkyubo00tvDlB1BZdlm
 FwdfOfdX28RZqzKP7ZbRM1J7cT+bzVA=
X-Google-Smtp-Source: AMsMyM68PFgjU/ND6Upq32s5IOR89djlDWkBT8y1s1ZwHr8APrkvY8Jp25iKz8Gh2AciUFy20JoF6A==
X-Received: by 2002:a7b:ca53:0:b0:3b4:90c4:e07 with SMTP id
 m19-20020a7bca53000000b003b490c40e07mr15071740wml.150.1664190739534; 
 Mon, 26 Sep 2022 04:12:19 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003b4868eb71bsm11981953wmq.25.2022.09.26.04.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 04:12:18 -0700 (PDT)
Date: Mon, 26 Sep 2022 11:12:18 +0000
From: Stafford Horne <shorne@gmail.com>
To: yann.morin@orange.com
Message-ID: <YzGJEib+tB/Vxea4@oscomms1>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
 <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de> <Yy3e9fTSv19Zxq9T@oscomms1>
 <20220926070545.GA3010@tl-lnx-nyma7486>
 <4286_1664185876_63317614_4286_458_1_20220926095113.GB3010@tl-lnx-nyma7486>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4286_1664185876_63317614_4286_458_1_20220926095113.GB3010@tl-lnx-nyma7486>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=+nDf1zutz/udpRyzkjsJs9uG9ZyiEIl0Bjou7KgEb6A=;
 b=En+lUupIk25YvyMHswOjA/OEuPGjpHMF3aItmVrVFUNxzTdPdgS9LofxMx5f0Yn/Js
 MWYnStPmtGcJyxysMhJRCSESNypdxKg0GqdCq24RJCDyDWbMGjIuAFBMEllinbtqZRWo
 V9qEkkZtlvZGKiPyDVpEzyHAhou+8Hhk+lr25CA1njNR3LcZ5mVGSJ41oLkDpvtVolZv
 0sxSYCkRMxuBoHR765Tj0SbwZAZ5MXroMCX186703l4FrSnlH1KNfN3V2CarVM1nZJwD
 CXhVBvsq7K86ey0KhWKdN7pOH0Tkh4acvXp4Sop3Jc2CaosSabSyBAYv7FwrFoSrxQOx
 aVlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=En+lUupI
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-09-22
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 26, 2022 at 11:51:13AM +0200, yann.morin@orange.com wrote:
> Stafford, Waldemar, All,
> 
> On 2022-09-26 09:05 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > On 2022-09-23 16:29 +0000, Stafford Horne spake thusly:
> > > On Fri, Sep 23, 2022 at 05:23:11PM +0200, Waldemar Brodkorb wrote:
> > > > > On 2022-09-23 14:13 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > > > > On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
> > > > > > >     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
> > > > > > This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.
> > > > > >     ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
> > > > > >     ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> > 
> > So, I made some progress in looking at this.
> [--SNIP--]
> > So, this hints at a compiler error...
> 
> I did a quick fix to libusb to workaround the issue (see attached
> patch), but this issue is more widespread. For example, libndp fails
> to build for the same reason:
> 
>       CCLD     ndptool
>     ..../or1k-buildroot-linux-uclibc/bin/ld: ../libndp/.libs/libndp.so: undefined reference to `__tls_get_addr'
> 
> So, we can't chase all libraries that will want to use some TLS
> objects, espeically as the issue may well occur in another package.
> 
> I looked at the build options for libusb, and there is absolutely
> nothing weird going on (see attached log).
> 
> The more I look at it, the more it smells like a gcc issue. Thoughts?
> 
> In the end, I wonder how we can solve this in Buildroot... Just disable
> LT for or1k?

That may be a temporary option.  I didn't get any time to look at this during
the weekend, but this investigation from you helps a lot.  The --disable-tls may
be related to the issue.  The compiler may need to do something special to
disable generation of tls symbols when building with --disable-tls and OpenRISC is
not doing that.  I am guessing we are always generating the tls code sequences
and not obeying the --disable-tls flag when we should be.

I am looking at gcc though right now and I cannot see anything suspicious.  I'll
keep looking.

-Stafford

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
