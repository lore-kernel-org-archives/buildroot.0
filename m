Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0010CC07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 14:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA5081AF5;
	Mon, 26 Sep 2022 14:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA5081AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCmzkI33X8ag; Mon, 26 Sep 2022 14:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F62B81AC1;
	Mon, 26 Sep 2022 14:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F62B81AC1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCF5D1BF369
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 14:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1971402E5
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 14:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1971402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fYhP3VR0J74l for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 14:45:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 474E3402B8
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 474E3402B8
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 14:45:06 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id n12so10570234wrx.9
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 07:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=dckPSnCSMMmhZt5EK8SUacE803qBXUo/kJckW7pK1Q8=;
 b=WbMlvI4kdnXslCCEog/l0YO6rCDPUUdXFvvtgmP1WsTlhJPAH2RIlaF8zZhdnD4Y7c
 qubYajcnk9tRIZPlMGwyKbSiEw9KB7HFwy+rHqbZev7OLmG+JsMTrv8oTOVlOo9YMXl3
 XIEn96r2Mn7ez4zHbX7n1oKtvV5CLPDCB4UIxST7VeBP0y9aN+xLfmLCbDvVRLCko1pH
 KH9lvxG7eiAgqSUCrK4gLs8iVZInYQJ92oCQ2ANwkvkSp1c1ANWmX1gQjr9D8mqr6vVj
 ztxMN8r9e99nUHY/TAi08E4oFlqmg+hhZSe6czqaqsrYZ8SWt86sgikDmW+bBCQA1rW2
 DCRw==
X-Gm-Message-State: ACrzQf2Z84OKZzAOBT3lHl/rPKcmJilpQ3vw0Pje/g2b8zF4+paAt/jf
 55fREc4nOOivP4gMFiH5ChfKWIFgpDE=
X-Google-Smtp-Source: AMsMyM5a//feYk+iJ9e67tUCPP5bEfYljUwyuHQHHg8oS7AJOo8THGnmBhFPRDmGvnms4F8hEFpjrA==
X-Received: by 2002:a5d:598f:0:b0:22a:f77e:869a with SMTP id
 n15-20020a5d598f000000b0022af77e869amr14819954wri.357.1664203504256; 
 Mon, 26 Sep 2022 07:45:04 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c089400b003a845621c5bsm10779716wmp.34.2022.09.26.07.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 07:45:02 -0700 (PDT)
Date: Mon, 26 Sep 2022 14:45:02 +0000
From: Stafford Horne <shorne@gmail.com>
To: yann.morin@orange.com
Message-ID: <YzG67nkiklO1Fzmp@oscomms1>
References: <20220923053057.9373660C2A@smtp3.osuosl.org>
 <20220923121334.GC2981@tl-lnx-nyma7486>
 <10091_1663942719_632DC03F_10091_295_1_20220923141837.GD2981@tl-lnx-nyma7486>
 <Yy3PX2eJUrQWvxw+@waldemar-brodkorb.de> <Yy3e9fTSv19Zxq9T@oscomms1>
 <20220926070545.GA3010@tl-lnx-nyma7486>
 <4286_1664185876_63317614_4286_458_1_20220926095113.GB3010@tl-lnx-nyma7486>
 <YzGJEib+tB/Vxea4@oscomms1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YzGJEib+tB/Vxea4@oscomms1>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=dckPSnCSMMmhZt5EK8SUacE803qBXUo/kJckW7pK1Q8=;
 b=ISKmlldqZP8Y5pFj8p995nUqeiE9XYzAdX9krOILKOT/2uVZb5SeafQb3c+J+voDoJ
 ezkRxYxpVqH/F2D5JKq0IdQxnrHz/rcg+WxJCJqHOP7hBC2rUuyCSQO680b9bXaOSBgk
 jDCR05LVTW+nKpw8v5nbRdpwpsQXkCHrR5/CtKpXEeZM3e16gvn6S1lgGJ9KHDT3hfnt
 nBEcyc+PeG4TsqQL3MClGQjBYZgKwMwojdvFfDIDeLs7a6aGSoc44vkaJ63XzjonXVTu
 MHx9MNiDAzZ3LwcaBB6q/BenWEWB5jFJylMv5ATohFH8oroorKKe+St3QdTeqxcH4JNN
 nwTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ISKmlldq
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

On Mon, Sep 26, 2022 at 11:12:18AM +0000, Stafford Horne wrote:
> On Mon, Sep 26, 2022 at 11:51:13AM +0200, yann.morin@orange.com wrote:
> > Stafford, Waldemar, All,
> > 
> > On 2022-09-26 09:05 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > On 2022-09-23 16:29 +0000, Stafford Horne spake thusly:
> > > > On Fri, Sep 23, 2022 at 05:23:11PM +0200, Waldemar Brodkorb wrote:
> > > > > > On 2022-09-23 14:13 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > > > > > > On 2022-09-23 05:30 +0000, Thomas Petazzoni via buildroot spake thusly:
> > > > > > > >     or1k     |           gpsd-3.24            | NOK | http://autobuild.buildroot.net/results/7adc125e843b21b559f1e8813059d65af58feb8d |     
> > > > > > > This is an or1k, shared-only, uClibc-ng, LT (not NPTL) so no TLS, build.
> > > > > > >     ..../or1k-buildroot-linux-uclibc-gcc -o gpsd-3.24/gpsctl .... -lusb-1.0 -lm -lrt -lnsl
> > > > > > >     ..../ld: ..../sysroot/usr/lib/libusb-1.0.so: undefined reference to `__tls_get_addr'
> > > 
> > > So, I made some progress in looking at this.
> > [--SNIP--]
> > > So, this hints at a compiler error...
> > 
> > I did a quick fix to libusb to workaround the issue (see attached
> > patch), but this issue is more widespread. For example, libndp fails
> > to build for the same reason:
> > 
> >       CCLD     ndptool
> >     ..../or1k-buildroot-linux-uclibc/bin/ld: ../libndp/.libs/libndp.so: undefined reference to `__tls_get_addr'
> > 
> > So, we can't chase all libraries that will want to use some TLS
> > objects, espeically as the issue may well occur in another package.
> > 
> > I looked at the build options for libusb, and there is absolutely
> > nothing weird going on (see attached log).
> > 
> > The more I look at it, the more it smells like a gcc issue. Thoughts?
> > 
> > In the end, I wonder how we can solve this in Buildroot... Just disable
> > LT for or1k?
> 
> That may be a temporary option.  I didn't get any time to look at this during
> the weekend, but this investigation from you helps a lot.  The --disable-tls may
> be related to the issue.  The compiler may need to do something special to
> disable generation of tls symbols when building with --disable-tls and OpenRISC is
> not doing that.  I am guessing we are always generating the tls code sequences
> and not obeying the --disable-tls flag when we should be.
> 
> I am looking at gcc though right now and I cannot see anything suspicious.  I'll
> keep looking.
> 

OK, it seems this is the fix.  The --enable/disable-tls flag seems to only
control a HAVE_AS_TLS macro in the gcc build.  OpenRISC was missing the below
ifdef.  Adding it seems to fix the build for me.

Thanks Yann for the investigation that pointed right to the issue.

If you all can confirm this, I will post a gcc patch shortly and get it
upstream.

-Stafford

--

diff --git a/gcc/config/or1k/or1k.cc b/gcc/config/or1k/or1k.cc
index da2f59062ba..0ce7b234417 100644
--- a/gcc/config/or1k/or1k.cc
+++ b/gcc/config/or1k/or1k.cc
@@ -2206,8 +2206,10 @@ or1k_output_mi_thunk (FILE *file, tree thunk_fndecl,
 #undef  TARGET_LEGITIMATE_ADDRESS_P
 #define TARGET_LEGITIMATE_ADDRESS_P or1k_legitimate_address_p
 
+#ifdef HAVE_AS_TLS
 #undef  TARGET_HAVE_TLS
 #define TARGET_HAVE_TLS true
+#endif
 
 #undef  TARGET_HAVE_SPECULATION_SAFE_VALUE
 #define TARGET_HAVE_SPECULATION_SAFE_VALUE speculation_safe_value_not_needed

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
