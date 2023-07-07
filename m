Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05BEEB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 08:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9E081EFC;
	Fri,  7 Jul 2023 08:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9E081EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULitEBgyFB6O; Fri,  7 Jul 2023 08:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D059C813E4;
	Fri,  7 Jul 2023 08:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D059C813E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4411BF228
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 08:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 852F140108
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 08:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 852F140108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Wdo_90-SwZG for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 08:59:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E14E40106
Received: from mail.femto-st.fr (lifc.univ-fcomte.fr [194.57.88.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E14E40106
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 08:59:12 +0000 (UTC)
Received: from x230 ([194.167.45.227]) (authenticated bits=0)
 by mail.femto-st.fr (8.15.2/8.15.2/Debian-22) with ESMTPSA id 3678x9Ft018357
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 10:59:10 +0200
Date: Fri, 7 Jul 2023 10:58:51 +0200
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230707105851.0a3f3244@x230>
In-Reply-To: <503759ef-8263-e971-cfdb-5d2d2c395c27@mind.be>
References: <20230626070536.311268-1-gwenj@trabucayre.com>
 <20230626070536.311268-2-gwenj@trabucayre.com>
 <503759ef-8263-e971-cfdb-5d2d2c395c27@mind.be>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 194.57.88.66
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnuradio: fix gnuradio
 python libraries for cross-compile
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

On Tue, 4 Jul 2023 22:51:57 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 26/06/2023 09:05, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > By default, module libraries have a suffix based on cpython version + host
> > architecture: this is fine for a native compile when these libraries are
> > used on  
> 
>   I think that this is solved in the python infrastructure by setting
> 
> _PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)"
> 
> Or it may be some other environment variable that is set. For sure though,
> the same problem would exist in normal python packages, and it is resolved
> there. So ideally we should use the same solution for gnuradio.
> 
In fact I see I have missed to explain in my message this issue is related to
pybind.
If PYTHON_MODULE_EXTENSION is unset, .cmake uses a python script containing
sysconfig.get_config_var('EXT_SUFFIX')
This one return .cpython-311-x86_64-linux-gnu.so, because host-python is used.
>   Regards,
>   Arnout
> 
Regards,
Gwenhael

> > the same computer (or similar computers). But when target architecture is
> > not the same python is unable to find libraries due to the wrong suffix and
> > produces unclear errors messages:
> > 
> > # python3
> > Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
> > Type "help", "copyright", "credits" or "license" for more information.  
> >>>> from gnuradio import blocks  
> > Traceback (most recent call last):
> >    File
> > "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py",
> > line 18, in <module> ModuleNotFoundError: No module named
> > 'gnuradio.blocks.blocks_python'
> > 
> > During handling of the above exception, another exception occurred:
> > 
> > Traceback (most recent call last):
> >    File "<stdin>", line 1, in <module>
> >    File
> > "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py",
> > line 22, in <module> ModuleNotFoundError: No module named
> > 'gnuradio.blocks.blocks_python'  
> >>>>  
> > 
> > By adding -DPYTHON_MODULE_EXTENSION=".so" at configure time, pybind11 will
> > use this option instead of using host-python to forge suffix.
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > ---
> > Changes v1 -> v2:
> > - replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
> >    but less "noisy")
> > ---
> >   package/gnuradio/gnuradio.mk | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> > index 1453b78493..d7b3b86c31 100644
> > --- a/package/gnuradio/gnuradio.mk
> > +++ b/package/gnuradio/gnuradio.mk
> > @@ -119,6 +119,8 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
> >   # mandatory to avoid pybind11 to overwrite variables provided
> >   # by gnuradio and buildroot
> >   GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
> > +# force libraries suffix (avoid to have libxxx.PYTHONVER-HOST_ARCH.so)
> > +GNURADIO_CONF_OPTS += -DPYTHON_MODULE_EXTENSION=".so"
> >   # mandatory to install python modules in site-packages and to use
> >   # correct path for python libraries
> >   GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
