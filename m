From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 11:39:55 +0200
Subject: [Buildroot] rsync forces configure step
In-Reply-To: <CAHkwnC8mKP2KyFRre_fQto7mJWop0m5D3L3ReKmpD7XGsEoNXg@mail.gmail.com>
References: <1f09233e5be11d75394054a20c4631cd@openmailbox.org>
 <20140613140908.532d1852@free-electrons.com>
 <CAHkwnC-S=+Wq7aKdXTY4Nzdk8rS29MGOS9x2jxH713Tn4pfBNA@mail.gmail.com>
 <5ad7ccb84a6c2b6d18526aeab1f9c65c@openmailbox.org>
 <CAHkwnC-4r_AFf4Y0VxAqgiW_xbAYcOyEizzLQTNhe=DMU75dtA@mail.gmail.com>
 <CAHkwnC8mKP2KyFRre_fQto7mJWop0m5D3L3ReKmpD7XGsEoNXg@mail.gmail.com>
Message-ID: <20140630113955.36416014@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Mon, 30 Jun 2014 10:55:42 +0200, Fabio Porcedda wrote:

> The problem is that the stamp file for rsync is being removed with the
> "<pkg>-rebuild" command, so i think that the right fix is:
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 54193d2..67821ec 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -569,9 +569,6 @@ $(1)-graph-depends: graph-depends-requirements
>  $(1)-dirclean:         $$($(2)_TARGET_DIRCLEAN)
> 
>  $(1)-clean-for-rebuild:
> -ifneq ($$($(2)_OVERRIDE_SRCDIR),)
> -                       rm -f $$($(2)_TARGET_RSYNC)
> -endif
>                         rm -f $$($(2)_TARGET_BUILD)
>                         rm -f $$($(2)_TARGET_INSTALL_STAGING)
>                         rm -f $$($(2)_TARGET_INSTALL_TARGET)
> 
> The problem is not related to top-level parallel build, the problem
> was present even the previous release (2014.02), the problem was
> always existed sine the introduction of the "<pk>-rebuild" feature:
> 
> http://git.buildroot.net/buildroot/commit/?id=4ed4e5016b741341059ed826416dad3291df0b2c
> Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date:   Thu Sep 29 21:57:39 2011 +0200
>    package: add <pkg>-rebuild and <pkg>-reconfigure
> 
> Thomas do you know why you removed the sync stamp file?

As others have replied, removing this stamp file is actually really
important and the core feature of <pkg>-rebuild. The idea is that when
you use OVERRIDE_SRCDIR on a package when you're doing some
development, doing <pkg>-rebuild will retrigger the rsync from the
override source directory to the build directory, before the build is
started again. This allows to make a change in the source code of some
component (in its override source directory) and just run "make
<pkg>-rebuild" to get this package rebuilt with the updated version of
the code.

So clearly, the removal of this stamp file must remain in place. Also,
notice that we have the same for <pkg>-reconfigure.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
