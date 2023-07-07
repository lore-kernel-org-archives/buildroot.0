Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DEDEB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 08:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E8BA81F38;
	Fri,  7 Jul 2023 08:56:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E8BA81F38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R26zMgq2o8ad; Fri,  7 Jul 2023 08:56:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB19581EE8;
	Fri,  7 Jul 2023 08:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB19581EE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E3C211BF59E
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 08:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB2A2418F1
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 08:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB2A2418F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuHQrRqoFKhL for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 08:56:21 +0000 (UTC)
X-Greylist: delayed 00:15:00 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2170B418F7
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2170B418F7
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 08:56:20 +0000 (UTC)
Received: from x230 ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-22) with ESMTPSA id 3678fHf1012175
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 10:41:17 +0200
Date: Fri, 7 Jul 2023 10:40:58 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230707104058.7e2f6a08@x230>
In-Reply-To: <c3fb3900-18cb-acf0-8bc2-63069fe3a22e@mind.be>
References: <20230626070536.311268-1-gwenj@trabucayre.com>
 <c3fb3900-18cb-acf0-8bc2-63069fe3a22e@mind.be>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v2 1/2] package/gnuradio: fix build with
 python-pybind > 2.10.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, all
On Tue, 4 Jul 2023 22:47:24 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 26/06/2023 09:05, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Since commit 0e82c360942907f5a2f379e64e0d211aaff80774 (and since release
> > 2.10.1), a new variable called PYBIND11_PYTHONLIBS_OVERWRITE was introduced
> > and set to ON by default.
> > 
> > According to comment before this option:
> > "Overwrite cached values read from Python library (classic search). Turn
> > off if cross-compiling and manually setting these values."
> > 
> > In buildroot's context this option must be disabled to keep variables
> > provided by buildroot and lib/app.  
> 
>   I guess something similar should be done for all users of pybind. And
> indeed, I see that zxing-cpp suffers from the same issue [1]. For some reason 
> python-scipy doesn't have autobuild failures though.
> 
Yes. But the question is about way:
- adding the same fix for all current (and futur) package use pybind
- using sed at pybind's buildtime to change ON by OFF?
> > 
> > This issue affect branches: master, next and tags 2023.02.x, 2023.05.  
> 
>   This kind of comment should not be in the commit message itself, but rather 
> under the --- line.
> 
> > 
> > Fix:  
> 
>   And this should be Fixes: (so it gets picked up by patchwork)
> 
> > -
> > http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b/
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> >  
> 
>   Applied to master, thanks.

Thanls;
> 
>   Regards,
>   Arnout
> 
Regards,
Gwenhael
> [1] 
> http://autobuild.buildroot.net/results/7dc/7dc04cb67280073d24dc550e5ed8aa3673a9c6b1//
> 
> 
> > ---
> > Changes v1 -> v2:
> > - move PYBIND11_PYTHONLIBS_OVERWRITE option to python support section
> > ---
> >   package/gnuradio/gnuradio.mk | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> > index d9218b533d..1453b78493 100644
> > --- a/package/gnuradio/gnuradio.mk
> > +++ b/package/gnuradio/gnuradio.mk
> > @@ -116,6 +116,9 @@ ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> >   GNURADIO_DEPENDENCIES += python3 python-pybind \
> >   	host-python-numpy host-python-packaging
> >   GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
> > +# mandatory to avoid pybind11 to overwrite variables provided
> > +# by gnuradio and buildroot
> > +GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
> >   # mandatory to install python modules in site-packages and to use
> >   # correct path for python libraries
> >   GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
