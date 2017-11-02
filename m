From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Nov 2017 22:07:07 +0000
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <20171102224426.1900f2d5@windsurf>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
 <20171102224426.1900f2d5@windsurf>
Message-ID: <1509660426.7985.23.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2017-11-02 at 22:44 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu,??2 Nov 2017 19:14:05 +0100, Yann E. MORIN wrote:
> > 
> > The ARC gdb version requires a gcc >= 4.8 (because C++11).
> > 
> > Since the host variant uses the same sources as the target variant, we
> > must ensure that we have a host gcc >= 4.8 as well.
> > 
> > Move the architecture dependencies to their own symbol, and also hide
> > the comment when they are not met.
> > 
> > Fixes:
> > ????https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_43eae264991aa369490236c7bd59c0b6a67fcf25_&d=DwICAg&c=DPL6_
> > X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=ET-RDZJb29-
> > XWo2Ni05GPO6BH2GHBPDl7jX0OObbhtI&s=Lha759WlCLxxQvKx4XnlEtxFsfcU_c1UmAu-cpJyWRU&e=
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> > ?package/gdb/Config.in.host | 18 ++++++++++++++----
> > ?1 file changed, 14 insertions(+), 4 deletions(-)
> 
> Applied to master, thanks.
> 
> However, there are still a few cases that are not taken into account:
> 
> ?* We need C++ support in the toolchain to build the target gdb for
> ???ARC. This is already handled for !ARC, because BR2_GDB_VERSION_8_0
> ???can only be selected if BR2_INSTALL_LIBSTDCPP=y.
> 
> ???Note: I'm not sure if we need C++ to build just gdbserver, it would
> ???be worth checking. Currently, for gdb 8.x, we require C++, even if
> ???the user only wants gdbserver on the target.

From this?https://sourceware.org/ml/gdb-patches/2016-10/msg00775.html
I'd say gdbserver is also affected, i.e. we need C++-enabled cross-toolchain
for building gdbserver from GDB v8+.

Also refer to GDB's article on that regard:?https://sourceware.org/gdb/wiki/cxx-conversion

> ?* We need a 4.8 target compiler to build the target gdb for ARC.
> ???Indeed, a user might enable BR2_PACKAGE_GDB on ARC to build the
> ???target gdb. And that would fail if the compiler isn't gcc >= 4.8.
> ???I'm not even sure ARC ever had a toolchain using gcc 4.8, but in
> ???theory this dependency is missing.

FWIW I remember those days when we used GCC 4.2, then switched to 4.4 and
then to 4.8 not that long ago. So in theory pre 4.8 toolchains for ARC
exist but hopefully are not really used [a lot] so before we get any
complaint on that I'd just not think about it and would assume ARC tools
are always >= 4.8.

-Alexey
