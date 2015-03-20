From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 20 Mar 2015 20:02:58 +0000
Subject: [Buildroot] [PATCH v1] evtest: fix
 program_invocation_short_name undeclared
In-Reply-To: <20150320140947.38980613@free-electrons.com>
References: <1426803498-18890-1-git-send-email-ps.report@gmx.net>
 <20150320140947.38980613@free-electrons.com>
Message-ID: <1426881775.2897.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, 2015-03-20 at 14:09 +0100, Thomas Petazzoni wrote:
> Dear Peter Seiderer,
> 
> Adding Alexey from Synopsys in Cc.
> 
> On Thu, 19 Mar 2015 23:18:18 +0100, Peter Seiderer wrote:
> > Add fallback in case program_invocation_short_name is undeclared,
> > e.g. in case of some uclibc configurations.
> > 
> > Fixes [1]:
> >   evtest.c:730:20: error: 'program_invocation_short_name' undeclared (first use in this function)
> >     printf("%s %s\n", program_invocation_short_name, PACKAGE_VERSION);
> > 
> > [1] http://autobuild.buildroot.net/results/0fd/0fd36a0d79c4d82aedebb5aca8d3ce4214b1ed61
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> Shouldn't we instead ask Synopsys to rebuild their toolchains with a
> uClibc configuration that includes
> UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y, so that it matches the
> default Buildroot uClibc and we don't have to add gazillions of
> workarounds in multiple packages just to support the ARC external
> toolchain?

Thanks for this report about missing feature.
Indeed this one was disabled (not yet enabled) by 2014.12 release.
These are uClibc defconfigs we used for building GNU tools for ARC:

 [ARC 700]
https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/blob/arc-2014.12/extra/Configs/defconfigs/arc/defconfig
 [ARC HS]
https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/blob/arc-2014.12/extra/Configs/defconfigs/arc/arcv2_defconfig

And unfortunately chances are low to rebuild 2014.12 tools with modified
configs.

But! We faced some issues when dealing with perf and elfutils and
understood that we need to enable both
UCLIBC_HAS_PROGRAM_INVOCATION_NAME and UCLIBC_HAS_GLIBC_CUSTOM_STREAMS -
https://github.com/foss-for-synopsys-dwc-arc-processors/uClibc/commit/c2460b9b7b8c76098dfb1313be4aa4a4a65ff619

So in the next release (that we plan to prepare later this spring) we'll
have those enabled in prebuilt tools.

And for now I would propose to ignore mentioned build errors. Because
indeed there's no point to throw in tons of temporary patches - if
anybody really wants those "problematic" packages to be built there's
always a possibility to build toolchain in Buildroot and it will use
Buildroot's default uClibc config.

Will it work for you?

-Alexey
