From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Jun 2014 06:16:14 +0300
Subject: [Buildroot] [PATCH 1/1] Add support for gold linker and LTO for
 GCC.
In-Reply-To: <BLU436-SMTP187DA10D0CB5B02F7E271EEA8280@phx.gbl>
References: <BLU436-SMTP187DA10D0CB5B02F7E271EEA8280@phx.gbl>
Message-ID: <20140611031614.GT4074@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

On Tue, Jun 10, 2014 at 10:13:24PM +0000, Steve Thomas wrote:
> Link Time Optimisations (LTO) from GCC needs the linker plugin. It also
> needs support from the tools, in particular the archiver (AR) to
> properly form archives that can be used by the linker.  The linker needs
> to support the plugin also.
> 
> This patch changes the linker from BFD to GOLD and wraps the ar, nm and
> ranlib utilities with a wrapper that calls the gcc-wrapper version that
> call the actual utilities with an additional argument. This is a
> temporary measure until the GCC versions supoort this properly and saves
> having to modify a few hundres packages.
> 
> Signed-off-by: Steve Thomas <scjthm@live.com>
> ---
>  package/binutils/Config.in.host         |  4 ++++
>  package/binutils/binutils.mk            | 12 +++++++++++
>  package/gcc/4.8.3/950-lto-support.patch | 35 +++++++++++++++++++++++++++++++++
>  package/gcc/4.9.0/950-lto-support.patch | 35 +++++++++++++++++++++++++++++++++
>  package/gcc/Config.in.host              | 19 +++++++++++-------
>  package/gcc/gcc-initial/gcc-initial.mk  | 18 +++++++++++++++++
>  package/gcc/gcc.mk                      | 11 +++++++++++
>  toolchain/toolchain-buildroot/Config.in | 11 +++++++++++
>  8 files changed, 138 insertions(+), 7 deletions(-)
>  create mode 100644 package/gcc/4.8.3/950-lto-support.patch
>  create mode 100644 package/gcc/4.9.0/950-lto-support.patch
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 08540a3..a6e5ba6 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -1,5 +1,8 @@
>  comment "Binutils Options"
>  
> +config BR2_BINUTILS_SUPPORTS_GOLD
> +	bool "binutils 2.24"

Are you sure this needs to be user selectable? The comment string looks 
confusing, anyway.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
