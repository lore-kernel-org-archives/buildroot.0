From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2016 23:51:00 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160920224355.l76a3kggupuiugok@t450s.lan>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
 <20160920224355.l76a3kggupuiugok@t450s.lan>
Message-ID: <1af982ba-faf7-9cd7-73ae-c32e45286f34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-09-16 00:43, Gary Bisson wrote:
> Hi Thomas, all,
> 
> On Tue, Sep 20, 2016 at 09:04:25PM +0200, Thomas Petazzoni wrote:
>> > Hello Gary,
>> > 
>> > On Fri, 16 Sep 2016 15:10:38 +0200, Gary Bisson wrote:
>>> > > Also making each plugin dependencies clearer with comments.
>>> > > 
>>> > > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
>>> > > ---
>>> > >  package/gstreamer1/gst1-imx/Config.in   | 89 ++++++++++++++++++++++++++++-----
>>> > >  package/gstreamer1/gst1-imx/gst1-imx.mk | 32 ++++++++++++
>>> > >  2 files changed, 108 insertions(+), 13 deletions(-)
>> > 
>> > Thanks for the patch. I have a few questions/comments, see below.
>> > 
>> > 
>>> > > +config BR2_PACKAGE_GST1_IMX_EGLVISINK
>>> > > +	bool "imxeglvivsink"
>>> > > +	depends on BR2_PACKAGE_IMX_GPU_VIV
>>> > > +	help
>>> > > +	  Elements leveraging the 3D GPU
>> > 
>> > Instead of doing "depends on" everywhere, can we use "select" in the
>> > cases where the dependencies of the package to select are not too
>> > crazy ?
> Well in most cases it isn't possible, here are some details:
> - BR2_PACKAGE_IMX_GPU_VIV and BR2_PACKAGE_IMX_GPU_VIV_G2D depends on
>   BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q which isn't selectable.
> - We can't select BR2_LINUX_KERNEL since it needs to be a i.MX kernel.
> - BR2_PACKAGE_LIBIMXVPUAPI depends on the i.MX SoC being used which
>   cannot be selectable (MX5 or MX6)

 The logical thing to do would be to select BR2_PACKAGE_IMX_GPU_VIV and depend
on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q. The kernel you obviously can't
select. And for libimxvpuapi you can depend on
BR2_PACKAGE_FREESCALE_IMX_HAS_VPU. That way, the dependencies are all gathered
in the freescale-imx menu. And looking at it that way, you will see that they
are actually architecture dependencies, so no need for comments.

 And actually, looking at it that way: it might make sense to let the whole
package depend on BR2_PACKAGE_FREESCALE_IMX (with appropriate comment), so you
can add "architecture" dependencies, e.g. mx25 doesn't have an IPU. Though maybe
that's going a bit too far.

> 
> I guess I can select IMX_CODEC though, I'll add that to the V2.

 IMX_CODEC also depends on BR2_PACKAGE_FREESCALE_IMX, which you can't select
(because otherwise the platform choice would get some random incorrect value).

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
