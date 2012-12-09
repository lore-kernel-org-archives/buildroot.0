From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 9 Dec 2012 21:26:20 +0200
Subject: [Buildroot] [PATCH] libglib2: don't try to use
 DTrace/GCov/SystemTap for host build
In-Reply-To: <1355080604-27155-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355080604-27155-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20121209192619.GB3880@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Dec 09, 2012 at 08:16:44PM +0100, Thomas Petazzoni wrote:
> We really only need the host build of libglib2 for a few helper
> programs that are used for the target build of libglib2. Therefore,
> trying to use bells and whistles like DTrace, GCov and SystemTap is
> useful.

Not?

> And it is actually harmful, since it is causing build failures on the
> gcc110 PowerPC-based autobuilder that apparently has some
> DTrace-feature installed. This commit therefore fixes:
> 
>   http://autobuild.buildroot.org/results/1c62d1ce10937bd21f5afcb73782b939d10c2038/build-end.log
> 
> Which has been polluting our autobuilder logs since several weeks now.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libglib2/libglib2.mk |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index a32cab2..4427431 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -53,6 +53,9 @@ endif
>  HOST_LIBGLIB2_CONF_OPT = \
>  		--disable-gtk-doc \
>  		--enable-debug=no \
> +		--disable-dtrace \
> +		--disable-systemtap \
> +		--disable-gcov
>  
>  LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
