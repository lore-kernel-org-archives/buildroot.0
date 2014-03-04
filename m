From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Mar 2014 21:35:07 +0100
Subject: [Buildroot] [PATCH v3 1/2] flite: new package
In-Reply-To: <1388673820-5710-2-git-send-email-s.martin49@gmail.com>
References: <1388673820-5710-1-git-send-email-s.martin49@gmail.com>
 <1388673820-5710-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140304203507.GE11474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-01-02 15:43 +0100, Samuel Martin spake thusly:
> Cc: Eric Jarrige <eric.jarrige@armadeus.org>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[--SNIP--]
> diff --git a/package/flite/flite.mk b/package/flite/flite.mk
> new file mode 100644
> index 0000000..b9859fa
> --- /dev/null
> +++ b/package/flite/flite.mk
> @@ -0,0 +1,41 @@
> +################################################################################
> +#
> +# flite
> +#
> +################################################################################
> +
> +FLITE_VERSION = 1.4
> +FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
> +FLITE_SITE = http://www.speech.cs.cmu.edu/flite/packed/flite-$(FLITE_VERSION)
> +FLITE_LICENSE = BSD-4c
> +FLITE_LICENSE_FILES = COPYING
> +
> +FLITE_INSTALL_STAGING = YES
> +
> +# Sadly, Flite does not support parallel build, especially when building its
> +# shared libraries.
> +FLITE_MAKE = $(MAKE1)
> +
> +# $ tar tf flite-1.4-release.tar.bz2
> +# ...
> +# flite-1.4-release//install-sh
> +# flite-1.4-release//mkinstalldirs
> +# flite-1.4-release//Exports.def
> +# flite-1.4-release//flite.sln
> +# flite-1.4-release//fliteDll.vcproj
> +# flite-1.4-release/config/Makefile
> +# flite-1.4-release/config/common_make_rules
> +# flite-1.4-release/config/project.mak
> +# flite-1.4-release/config/config.in
> +# flite-1.4-release/config/system.mak.in

Did you notice upstream about this issue?

> +# So, the strip-component trick does not work at all.
> +# Let's redefine the extract command.
> +define FLITE_EXTRACT_CMDS
> +	$(RM) -rf $(FLITE_DIR)

This will get rid of the .stamp_downloaded stamp file, and thus will
trigger the download everytime make is run (but fortunately, it will
find we already have the tarball, so won't actually download anything).

OTOH, this will also re-create .stamp_downloaded, which will be more
recent than the existing .stamp_extracted, so will re-run the extract
command.

This in turn removes all the .stamp_* files again, so the build and
install will be re-done again.

And when you re-run make later on, since .stamp_downloaded will be
missing, you're good for a free ride... For ever and ever...

Simply don't remove FLITE_DIR at all.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
