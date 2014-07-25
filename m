From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 22:38:40 +0200
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix includes for recent
	toolchains
In-Reply-To: <CADCpmyP8LYRy15MpB3hhF88SM_WkrQnBu_i29WbEFesM_h4AEQ@mail.gmail.com>
References: <1406270536-17145-1-git-send-email-bisson.gary@gmail.com>
 <20140725164056.GA3955@free.fr>
 <CADCpmyP8LYRy15MpB3hhF88SM_WkrQnBu_i29WbEFesM_h4AEQ@mail.gmail.com>
Message-ID: <20140725203840.GF3955@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-07-25 10:51 -0700, Gary Bisson spake thusly:
> On Fri, Jul 25, 2014 at 9:40 AM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
[--SNIp--]
> > > However it has been reported and verified that this package doesn't
> > build using recent toolchain such as CodeSourcery 2013.11.
> >
> > Care to share a defconfig with which I can reproduce the issue, please?
> > I would like to see if there is not another solution to using -I and
> > keep -idirafter if possible.
> >
> Please find a defconfig attached.

Thanks, I'll give it a spin.

> >     diff --git a/package/gstreamer/gst-fsl-plugins/Config.in
> > b/package/gstreamer/gst-fsl-plugins/Config.in
> >     index 309e745..e0d961a 100644
> >     --- a/package/gstreamer/gst-fsl-plugins/Config.in
> >     +++ b/package/gstreamer/gst-fsl-plugins/Config.in
> >     @@ -10,6 +10,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
> >             depends on BR2_LINUX_KERNEL
> >             depends on BR2_arm # Only relevant for i.MX
> >             depends on BR2_TOOLCHAIN_USES_GLIBC # libfslcodec
> >     +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # Old v4l2 API
> >             select BR2_PACKAGE_GST_PLUGINS_BASE
> >             select BR2_PACKAGE_LIBFSLVPUWRAP
> >             select BR2_PACKAGE_IMX_LIB
> >
> > After all, the minimum kernel headers version can be used backward, too.
> > That would need confirmation by others, though...
> >
> Are we sure we want to limit the toolchain for that?

Well, if gst-fsl-plugins uses the v4l2 API from the kernel version
(3.10) but other packages use the v4l2 API from the kernel headers
(3.11), there will be a mismatch at some point, no?

Allowing to use different APIs in this way is a way to get unexpected
and hard-to-debug failures.

> Is there a way to do a "make headers_install" somewhere in staging area?

No, you do *not* want to overwrite the headers in the toolchain with the
ones from the kernel, because the C library depends on them.

So, I believe restricting gst-fsl-plugins to toolchains with the proper
v4l2 API is the best solution. I'll cook a proper patch.

Yes, this means we can't use 'recent' toolchains. But anyway, we're
already stuck with a 3.10 kernel because Freescale uses that. And there
is no guarantee that the C library will accept to run on a kernel older
than the version that was used for the headers.

Well, that's possible by default, but glibc can be configured not to
support older kernels. So, even if the glibc from this CS toolchain
(using a 3.11 kernel for headers) would run on a 3.10, a similar
toolchain built with (e.g.) crosstool-NG would not, as by default
crosstool-Ng configures the glibc to not support anything older than the
kernel version used for the headers.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
