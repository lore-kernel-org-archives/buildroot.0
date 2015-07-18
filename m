From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 21:08:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/luajit: disable for static build
In-Reply-To: <1437137197-5278-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437137197-5278-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150718210844.3c4d9eaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Fri, 17 Jul 2015 14:46:37 +0200, J?rg Krause wrote:
> luajit requires dlopen().
> 
> Fixes:
> http://autobuild.buildroot.net/results/20d/20dfb10198f3688f92208591960192ca08280987/
> http://autobuild.buildroot.net/results/c3c/c3cfdf8dfb315bf64caa9ed0f362016111fd93ac/
> http://autobuild.buildroot.net/results/8cb/8cbf6207ecf7b254aeccd9ec5c07376a044e1f8f/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/luajit/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index f6995e2..8ce528b 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  config BR2_PACKAGE_LUAJIT
>  	bool "luajit"
>  	select BR2_PACKAGE_HAS_LUAINTERPRETER
> +	depends on !BR2_STATIC_LIBS # dlopen

You forgot to propagate this dependency to the sysdig package, which
selects luajit, so I've done that an applied.

Technically speaking, it is possible to build luajit in
BR2_STATIC_LIBS=y configuration, by setting LJ_TARGET_DLOPEN to 0 in
src/lj_arch.h, but then you cannot load any C module, which makes
LuaJIT maybe a little bit useless. If anyone is interested, they can
always work on making this change.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
