From: Gary Bisson <bisson.gary@gmail.com>
Date: Fri, 25 Jul 2014 10:51:15 -0700
Subject: [Buildroot] [PATCH] gst-fsl-plugins: fix includes for recent
	toolchains
In-Reply-To: <20140725164056.GA3955@free.fr>
References: <1406270536-17145-1-git-send-email-bisson.gary@gmail.com>
 <20140725164056.GA3955@free.fr>
Message-ID: <CADCpmyP8LYRy15MpB3hhF88SM_WkrQnBu_i29WbEFesM_h4AEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Fri, Jul 25, 2014 at 9:40 AM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Gary, All,
>
> On 2014-07-24 23:42 -0700, Gary Bisson spake thusly:
> > Build was failing starting with CodeSourcery 2013.11 due to
> > new v4l kernel headers.
> >
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> >
> > ---
> > Yann, all,
> > I know this patch will look bad as we already discussed the use of -I
> instead of -idirafter.
>
> [can you wrap lines at < ~80 chars, please?]
>
>
My bad, I'll be careful with my comments next time.


> Indeed. WQe should be very (extremely!) carefull with this. Playing with
> non-sanitised kernel headers is really dangerous, and can come bite you
> at the most eunexpected moment.
>
> > However it has been reported and verified that this package doesn't
> build using recent toolchain such as CodeSourcery 2013.11.
>
> Care to share a defconfig with which I can reproduce the issue, please?
> I would like to see if there is not another solution to using -I and
> keep -idirafter if possible.
>
>
Please find a defconfig attached.

> It seems to come from the fact that the kernel headers in the toolchain
> have been updated which brings some incompatibility.
>
> Hmmmm.. I seem to recall with had another such issue reported about CS
> toolchains a while ago... Can't find it again, however... :-/
>
> > Using -idirafter, the v4l header picked up is from the toolchain which
> is missing some older structures like v4l2_dbg_chip_ident.
>
> This was removed between 3.10 and 3.11, indeed.
>
> I think the best fix would be something like:
>
>     diff --git a/package/gstreamer/gst-fsl-plugins/Config.in
> b/package/gstreamer/gst-fsl-plugins/Config.in
>     index 309e745..e0d961a 100644
>     --- a/package/gstreamer/gst-fsl-plugins/Config.in
>     +++ b/package/gstreamer/gst-fsl-plugins/Config.in
>     @@ -1,7 +1,7 @@
>      comment "gst-fsl-plugins needs an imx-specific Linux kernel to be
> built"
>             depends on BR2_arm && !BR2_LINUX_KERNEL
>
>     -comment "gst-fsl-plugins needs an (e)glibc toolchain"
>     +comment "gst-fsl-plugins needs an (e)glibc toolchain w/ headers <
> 3.11"
>             depends on BR2_arm
>             depends on !BR2_TOOLCHAIN_USES_GLIBC
>
>     @@ -10,6 +10,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
>             depends on BR2_LINUX_KERNEL
>             depends on BR2_arm # Only relevant for i.MX
>             depends on BR2_TOOLCHAIN_USES_GLIBC # libfslcodec
>     +       depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # Old v4l2 API
>             select BR2_PACKAGE_GST_PLUGINS_BASE
>             select BR2_PACKAGE_LIBFSLVPUWRAP
>             select BR2_PACKAGE_IMX_LIB
>
> After all, the minimum kernel headers version can be used backward, too.
> That would need confirmation by others, though...
>
>
Are we sure we want to limit the toolchain for that? Is there a way to do a
"make headers_install" somewhere in staging area?

Thanks,
Gary

Regards,
> Yann E. MORIN,
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>       |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140725/6a7d05cd/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mx6_2013.11_defconfig
Type: application/octet-stream
Size: 44405 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140725/6a7d05cd/attachment.obj>
