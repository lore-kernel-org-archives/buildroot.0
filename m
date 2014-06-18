From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jun 2014 08:26:52 +0200
Subject: [Buildroot] [Patch v3] dcmtk: new package
In-Reply-To: <1403049919-3275-1-git-send-email-tsmrnd0@gmail.com>
References: <1403049919-3275-1-git-send-email-tsmrnd0@gmail.com>
Message-ID: <20140618082652.2da74ca0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear William Frost,

On Wed, 18 Jun 2014 09:05:19 +0900, William Frost wrote:
> [PATCH] Changes v2 -> v3:  (suggested by Thomas De Schampheleire):   
>  - removed version selection option, only stable release is used    
>  - added an empty new line between the comment header and the first
>    variable definition
>  - fixed license file reference    
>  - reduced and cleaning DCMTK_CFLAGS and DCMTK_CXXFLAGS declarations
>  - removed DCMTK_INSTALL_STAGING_OPT and DCMTK_INSTALL_TARGET_OPT
>  - unconditionally use --with-zlib
>  - removed duplicated build commands

All this text should not go into the commit log (otherwise it remains
forever in the git history of the project). Instead, such changelog
information should be...

> 
> Signed-off-by: William Frost <tsmrnd0@gmail.com>
> ---

... here, i.e after the "---", or in a separate cover letter e-mail
(see the Buildroot manual for more details about this).

> +++ b/package/dcmtk/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_DCMTK
> +	bool "dcmtk"
> +	help
> +	  DCMTK is a collection of libraries and applications implementing 
> +	  large parts the DICOM standard. It includes software for examining, 
> +	  constructing and converting DICOM image files, handling offline 
> +	  media, sending and receiving images over a network connection, as 
> +	  well as demonstrative image storage and worklist servers. DCMTK is 
> +	  is written in a mixture of ANSI C and C++. It comes in complete 
> +	  source code and is made available as "open source" software.
> +
> +	  http://dicom.offis.de/dcmtk.php.en
> \ No newline at end of file

There a missing newline at end of file, no?

> diff --git a/package/dcmtk/dcmtk.mk b/package/dcmtk/dcmtk.mk
> new file mode 100644
> index 0000000..ae2c265
> --- /dev/null
> +++ b/package/dcmtk/dcmtk.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# dcmtk
> +#
> +################################################################################
> +
> +DCMTK_VERSION = $(call qstrip,"3.6.0")

Huh, why would we have this qstrip here? Why not just:

DCMTK_VERSION = 3.6.0

> +DCMTK_SITE = http://dicom.offis.de/download/dcmtk/dcmtk360
> +
> +DCMTK_LICENSE = BSD
> +DCMTK_LICENSE_FILES = COPYRIGHT
> +DCMTK_INSTALL_STAGING = YES
> +
> +DCMTK_CFLAGS = $(TARGET_CFLAGS) -O -Wall
> +DCMTK_CXXFLAGS = $(TARGET_CXXFLAGS) -O  -Wall

These definitions are useless. <pkg>_CFLAGS and <pkg>_CXXFLAGS are not
used by the package infrastructure.

> +DCMTK_CONF_OPT = \
> +	--disable-rpath --with-zlib \

One line per option:

DCMTK_CONF_OPT = \
	--disable-rpath \
	--with-zlib

> +	ac_cv_my_c_rightshift_unsigned=no

This should be in DCMTK_CONF_ENV.

> +DCMTK_CONF_ENV = ARFLAGS=cru

Maybe a short comment explaining why it's needed would be useful.

> +DCMTK_MAKE_OPT	= DESTDIR=$(STAGING_DIR) install-lib

Useless spaces before the equal sign. Also, this should be:

DCMTK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-lib

Thought in this case, I wonder why we don't have a similar thing for
the target installation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
