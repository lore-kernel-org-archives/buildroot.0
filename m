From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Aug 2018 21:25:54 +0200
Subject: [Buildroot] [PATCH 1/1] libjwt: new package.
In-Reply-To: <CAMKz0Yp_0Ccwey=qKoRHFdNf55OL=ZA2GuuCA+SoBaAPNFbzuA@mail.gmail.com>
References: <20180811202925.3547-1-mikael@robomagi.com>
 <20180812143902.5dde6618@windsurf>
 <CAMKz0Yp_0Ccwey=qKoRHFdNf55OL=ZA2GuuCA+SoBaAPNFbzuA@mail.gmail.com>
Message-ID: <20180812192554.GA29650@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mickael, All,

On 2018-08-12 18:08 +0200, Mikael Eliasson spake thusly:
> Hi Thomas,
> Not used to using mailing lists so this may not be the correct way to send a follow up patch. It is attached.

Just send it again with git send-email.

Also, it is customary to not top-post like you did, but to reply in-line
(like I'm doing).

> I think I have made all the changes you requested. I had also missed including?package/Config.in.
> Tested with test-pkg -a:
> 47 builds, 0 skipped, 0 build failed, 0 legal-info failed

Great! :-)

Yet, I have a very small comment, see below...

[--SNIP--]
> diff --git a/package/libjwt/0001-Declare-project-C-only.patch b/package/libjwt/0001-Declare-project-C-only.patch
> new file mode 100644
> index 0000000000..cfb3cc8425
> --- /dev/null
> +++ b/package/libjwt/0001-Declare-project-C-only.patch
> @@ -0,0 +1,16 @@
> +Declares project C only.
> +
> +Signed-off-by: Mikael Eliasson <mikael@robomagi.com>
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 5cd1910..aefb87d 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -4,7 +4,7 @@ if (MSVC)
> + 	set (CMAKE_SYSTEM_VERSION 8.1 CACHE TYPE INTERNAL FORCE)
> + endif ()
> + 
> +-project (jwt)
> ++project (jwt C)

It would be great if you were to send this change upstream, so that we
can drop this patch next time we update the package.

> + list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
> + 
[--SNIP--]
> diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
> new file mode 100644
> index 0000000000..8863fb436a
> --- /dev/null
> +++ b/package/libjwt/libjwt.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# libjwt
> +#
> +################################################################################
> +
> +LIBJWT_VERSION = v1.9.0
> +LIBJWT_SITE = $(call github,benmcollins,libjwt,$(LIBJWT_VERSION))
> +LIBJWT_INSTALL_STAGING = YES
> +LIBJWT_DEPENDENCIES = jansson
> +LIBJWT_LICENSE = LGPL-3.0
> +LIBJWT_LICENSE_FILES = COPYING.LIB

I know there is no strongly documented ordering, but I like that the
descriptive metadata goes first, while the building metadata goes last,
with adequate spacing to separate the types of data, like so:

    LIBJWT_VERSION = v1.9.0
    LIBJWT_SITE = $(call github,benmcollins,libjwt,$(LIBJWT_VERSION))
    LIBJWT_LICENSE = LGPL-3.0
    LIBJWT_LICENSE_FILES = COPYING.LIB

    LIBJWT_DEPENDENCIES = jansson

    LIBJWT_INSTALL_STAGING = YES

It kind of follows some "logic": where to get it, what itslicensing is,
what it needs, what it provides, how we build it.

No need to re-send. If a maintainer agrees, he can re-reorder when
applying, or he can just apply it as-is if he believes that is OK as-is.

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +LIBJWT_DEPENDENCIES += openssl
> +else
> +LIBJWT_DEPENDENCIES += gnutls
> +LIBJWT_CONF_OPTS += -DWITHOUT_OPENSSL=1
> +endif
> +
> +$(eval $(cmake-package))
> -- 
> 2.17.1
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
