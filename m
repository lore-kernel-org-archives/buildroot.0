From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 21:56:57 +0100
Subject: [Buildroot] [PATCH v2 1/5] lttng-libust: bump to version 2.8.1
In-Reply-To: <20161030195649.6415-2-eeppeliteloop@gmail.com>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
 <20161030195649.6415-2-eeppeliteloop@gmail.com>
Message-ID: <20161030205657.GF18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
> The two current patches are removed because they were merged upstream.
> 
> The new patch is needed to build with uClibc. It was also submitted
> upstream, but not merged as is yet.

Not sure I got that correct: did upstream apply another patch, or did
upstream have comments that require this patch to changed before being
applied?

This is a case where a pointer to the upstream submission would be
handy.

> Defining `NT_GNU_BUILD_ID` to 3 when
> it's not defined seems like it's something done in other projects. This
> definition's value should never change (number of the build ID note
> section in ELF objects).

Yes, it seems that '3' is the value associated with this 'note' entry.

> LTTng-UST now has its man pages written in AsciiDoc and they get
> converted to troff at build time. This is not needed in a Buildroot
> image anyway.
> 
> I add the `--enable-python-agent` configure option to build the
> LTTng-UST Python agent when Python 2 or Python 3 is also part of the BR
> image. The LTTng-UST Python agent is a Python package which adds LTTng
> tracing to Python's standard logging when imported.

Enablng the python agent should be done in a separate patch. But see
below for more on this...

> I tested this updated package for build and good behaviour at run time
> with glibc, musl, and uClibc.

Uncessary to state this in the commit log; it is expected that testing
has been done. ;-)

You can however puth such messages as a "post-comit-log note"...

> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> ---

... here, just above (or below) the changelog.

> Changes v1 -> v2:
>   - Detailed commit message.
>   - Detailed patch messages.
> 
>  ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch | 31 ++++++++++++++++++++++
>  package/lttng-libust/lttng-libust.hash             | 12 +++++----
>  package/lttng-libust/lttng-libust.mk               | 10 +++----
>  3 files changed, 42 insertions(+), 11 deletions(-)
>  create mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
> 
> diff --git a/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
> new file mode 100644
> index 0000000..7fc2148
> --- /dev/null
> +++ b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
> @@ -0,0 +1,31 @@
> +From d400314757a8d5d52bd5722d263bfd5886bb6595 Mon Sep 17 00:00:00 2001
> +From: Philippe Proulx <eeppeliteloop@gmail.com>
> +Date: Sat, 29 Oct 2016 13:32:57 -0400
> +Subject: [PATCH] lttng-ust-elf.c: define NT_GNU_BUILD_ID if not defined
> +
> +On uClibc, NT_GNU_BUILD_ID is not defined, so we define it
> +manually in this case.

But neither are NT_GNU_ABI_TAG nor NT_GNU_HWCAP nor NT_GNU_GOLD_VERSION
which can also appear in the notes section...

> +Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
> +---
> + liblttng-ust/lttng-ust-elf.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/liblttng-ust/lttng-ust-elf.c b/liblttng-ust/lttng-ust-elf.c
> +index 5f27920..beaa7f3 100644
> +--- a/liblttng-ust/lttng-ust-elf.c
> ++++ b/liblttng-ust/lttng-ust-elf.c
> +@@ -29,6 +29,10 @@
> +
> + #define BUF_LEN	4096
> +
> ++#ifndef NT_GNU_BUILD_ID
> ++# define NT_GNU_BUILD_ID	3
> ++#endif
> ++
> + /*
> +  * Retrieve the nth (where n is the `index` argument) phdr (program
> +  * header) from the given elf instance.
> +--
> +2.9.3
> +
> diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
> index 1494acf..eddbc84 100644
> --- a/package/lttng-libust/lttng-libust.hash
> +++ b/package/lttng-libust/lttng-libust.hash
> @@ -1,6 +1,8 @@
> -# http://www.lttng.org/files/lttng-ust/lttng-ust-2.7.1.tar.bz2.sha1
> -sha1  597ebecb885debb58c263de57f30b1096d4eefc6  lttng-ust-2.7.1.tar.bz2
> +# From http://lttng.org/files/lttng-ust/lttng-ust-2.8.1.tar.bz2.md5
> +md5     be505077245dc05f93370a565eec15f4  lttng-ust-2.8.1.tar.bz2
> 
> -# Locally computed
> -sha1  2e79c98e458b2e052930fb81441e6ca8377a2ed7 787364e8bac9a146f9d65c763633c2b75eb76463.patch
> -sha1  cf77ec415111f77573be7917d9b62d8e49dc6304 30307a67b48641875b122d8f832bbfb454e95d92.patch
> +# From http://lttng.org/files/lttng-ust/lttng-ust-2.8.0.tar.bz2.sha1
                                                         ^
Typo, should be 2.8.1    --------------------------------'

But you could just write:

    # From http://lttng.org/files/lttng-ust/lttng-ust-2.8.1.tar.bz2.{md5,sha1}
    md5   be505077245dc05f93370a565eec15f4          lttng-ust-2.8.1.tar.bz2
    sha1  8bebdcbcb453d2643fb226dbe92de61764f1ee3b  lttng-ust-2.8.1.tar.bz2

> +sha1    8bebdcbcb453d2643fb226dbe92de61764f1ee3b  lttng-ust-2.8.1.tar.bz2
> +
> +# Locally generated
> +sha256  6e41349107e83e7b43c69ed358e48788ca2fd095bad61737b850e3f3d2c0508a  lttng-ust-2.8.1.tar.bz2

I never remember what the policy is. We do want to add a localy computed
strong hash (like sha256) when only md5 is available from upstream. But
when sha1 is avaiulable, do we want to add a sha256? I'm not sure...

> diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
> index 61ffed4..da54c5a 100644
> --- a/package/lttng-libust/lttng-libust.mk
> +++ b/package/lttng-libust/lttng-libust.mk
> @@ -5,22 +5,20 @@
>  ################################################################################
> 
>  LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
> -LTTNG_LIBUST_VERSION = 2.7.1
> +LTTNG_LIBUST_VERSION = 2.8.1
>  LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
>  LTTNG_LIBUST_LICENSE = LGPLv2.1, MIT (system headers), GPLv2 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
>  LTTNG_LIBUST_LICENSE_FILES = COPYING
> -
> -LTTNG_LIBUST_PATCH = \
> -	https://github.com/lttng/lttng-ust/commit/787364e8bac9a146f9d65c763633c2b75eb76463.patch \
> -	https://github.com/lttng/lttng-ust/commit/30307a67b48641875b122d8f832bbfb454e95d92.patch
> -
>  LTTNG_LIBUST_INSTALL_STAGING = YES
>  LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
> +LTTNG_LIBUST_CONF_OPTS += --disable-man-pages
> 
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  LTTNG_LIBUST_DEPENDENCIES += python
> +LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
>  else ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  LTTNG_LIBUST_DEPENDENCIES += python3
> +LTTNG_LIBUST_CONF_OPTS += --enable-python-agent
>  else
>  LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"

You should explicitly disable the python agent here:

    LTTNG_LIBUST_CONF_OPTS += --disable-python-agent

Regards,
Yann E. MORIN.

>  endif
> --
> 2.9.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
