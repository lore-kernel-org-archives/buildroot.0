From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:44:26 +0100
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <20171102181405.6476-1-yann.morin.1998@free.fr>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
Message-ID: <20171102224426.1900f2d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 19:14:05 +0100, Yann E. MORIN wrote:
> The ARC gdb version requires a gcc >= 4.8 (because C++11).
> 
> Since the host variant uses the same sources as the target variant, we
> must ensure that we have a host gcc >= 4.8 as well.
> 
> Move the architecture dependencies to their own symbol, and also hide
> the comment when they are not met.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/43eae264991aa369490236c7bd59c0b6a67fcf25/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gdb/Config.in.host | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Applied to master, thanks.

However, there are still a few cases that are not taken into account:

 * We need C++ support in the toolchain to build the target gdb for
   ARC. This is already handled for !ARC, because BR2_GDB_VERSION_8_0
   can only be selected if BR2_INSTALL_LIBSTDCPP=y.

   Note: I'm not sure if we need C++ to build just gdbserver, it would
   be worth checking. Currently, for gdb 8.x, we require C++, even if
   the user only wants gdbserver on the target.

 * We need a 4.8 target compiler to build the target gdb for ARC.
   Indeed, a user might enable BR2_PACKAGE_GDB on ARC to build the
   target gdb. And that would fail if the compiler isn't gcc >= 4.8.
   I'm not even sure ARC ever had a toolchain using gcc 4.8, but in
   theory this dependency is missing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
