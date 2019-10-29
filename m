From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 29 Oct 2019 01:24:59 +0100
Subject: [Buildroot] [PATCH v2 1/1] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20191028073544.GA2485@scaer>
References: <20191028054057.8049-1-petr.vorel@gmail.com>
 <20191028073544.GA2485@scaer>
Message-ID: <20191029002458.GA25999@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

> [--SNIP--]
> > diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
> > new file mode 100644
> > index 0000000000..97de449d0d
> > --- /dev/null
> > +++ b/package/ima-evm-utils/ima-evm-utils.mk
> > @@ -0,0 +1,34 @@
> > +################################################################################
> > +#
> > +# ima-evm-utils
> > +#
> > +################################################################################
> > +
> > +IMA_EVM_UTILS_VERSION = 1.2.1
> > +IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
> > +IMA_EVM_UTILS_LICENSE = GPL-2.0
> > +IMA_EVM_UTILS_LICENSE_FILES = COPYING
> > +IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl
> > +
> > +# configure is missing but gpm seems not compatible with our autoreconf
gpm is obviously copy paste error.
I'm going to send v3, which won't need this section anyway.
> > +# mechanism so we have to do it manually instead of using IMA_EVM_UTILS_AUTORECONF = YES
> > +define IMA_EVM_UTILS_RUN_AUTOGEN
> > +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> > +endef
> > +IMA_EVM_UTILS_PRE_CONFIGURE_HOOKS += IMA_EVM_UTILS_RUN_AUTOGEN

> Looking at the code, it looks like their autoregen.sh is just creating
> the missing m4/ sub-directory.

> Have you tried:

>     define IMA_EVM_UTILS_M4
>         mkdir -p $(@D)/m4
>     endef
>     IMA_EVM_UTILS_POST_EXTRACT_HOOKS += IMA_EVM_UTILS_M4
>     IMA_EVM_UTILS_AUTORECONF = YES
In the end IMA_EVM_UTILS_AUTORECONF = YES is enough, it's the only change.
I also got previously this error:
autoreconf: 'configure.ac' or 'configure.in' is required
But I somehow managed to fixed it.

> > +# build just sources in src subdirectory as root directory requires asciidoc
> > +# and xsltproc for manpage
> > +define IMA_EVM_UTILS_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all
> > +endef

> Have you tried:

>     IMA_EVM_UTILS_SUBDIR = src
This would produce
/bin/bash: ./configure: No such file or directory

So, whole diff for v3 will be:

-# configure is missing but gpm seems not compatible with our autoreconf
-# mechanism so we have to do it manually instead of using IMA_EVM_UTILS_AUTORECONF = YES
-define IMA_EVM_UTILS_RUN_AUTOGEN
-	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
-endef
-IMA_EVM_UTILS_PRE_CONFIGURE_HOOKS += IMA_EVM_UTILS_RUN_AUTOGEN
+IMA_EVM_UTILS_AUTORECONF = YES

> Regards,
> Yann E. MORIN.

Kind regards,
Petr
