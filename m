From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 2 Nov 2017 21:31:39 +0000
Subject: [Buildroot] [PATCH] package/gdb: ARC version has stringent
 dependencies on host gcc
In-Reply-To: <20171102181405.6476-1-yann.morin.1998@free.fr>
References: <20171102181405.6476-1-yann.morin.1998@free.fr>
Message-ID: <1509658298.7985.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, 2017-11-02 at 19:14 +0100, Yann E. MORIN wrote:
> The ARC gdb version requires a gcc >= 4.8 (because C++11).
> 
> Since the host variant uses the same sources as the target variant, we
> must ensure that we have a host gcc >= 4.8 as well.
> 
> Move the architecture dependencies to their own symbol, and also hide
> the comment when they are not met.
> 
> Fixes:
> ????https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_43eae264991aa369490236c7bd59c0b6a67fcf25_&d=DwIBAg&c=DPL6_X_
> 6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=b-eGjVYMXoKYiImFRBhs00VOY_pLPUoEpAcAm77-
> fbo&s=SxA_U3jSTkTx7D0f8Am0c_uZWHh4B6AFeUeYz9ZKe9c&e=
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ?package/gdb/Config.in.host | 18 ++++++++++++++----
> ?1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index c2cfc34284..797c07c3f9 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -1,4 +1,17 @@
> +config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
> +	bool
> +	default y
> +	# The ARC version needs C++11, thus gcc >= 4.8, like gdb-8.0.x

Indeed our GDB is based on very up to date upstream sources so all
limitations for GDB 8.x are valid for ARC's one.

That said it has nothing to do with ARCH but only GDB version makes sense.
So why don't we just introduce BR2_GDB_VERSION_ARC which will be the only option
for ARC and will have the same set of "depends" as BR2_GDB_VERSION_8_0?

-Alexey
