From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 00:27:14 +0200
Subject: [Buildroot] [PATCH 1/1] eja: new package (revised)
In-Reply-To: <1462185476-18775-1-git-send-email-ubaldo@eja.it>
References: <1462185476-18775-1-git-send-email-ubaldo@eja.it>
Message-ID: <20160610002714.0705f36d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new iteration. However, I did not realize that eja was
your own creation. How widely is it used? Looking at the Github page,
it really looks like a personal project that isn't that widely used, so
I am not sure to which point a Buildroot package makes sense.

I also have some other comments.

First, your commit title should not contain "(revised)" otherwise this
will be kept forever in the Git history. See the Buildroot manual for
details on how to send new iterations of a patch: adding a version and
a changelog.

On Mon,  2 May 2016 10:37:56 +0000, Ubaldo Porcheddu wrote:

>  menu "Interpreter languages and scripting"
> +	source "package/eja/Config.in"

Does it quality as a Language interpreter, or as a web-server? I
couldn't really understand.


> +EJA_VERSION = 9.4.22
> +EJA_SOURCE = $(EJA_VERSION).tar.gz
> +EJA_SITE = https://github.com/ubaldus/eja/archive
> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +EJA_CFLAGS = -DLUA_USE_POSIX -DLUA_COMPAT_ALL
> +EJA_MYLIBS = -static -w
> +else
> +EJA_CFLAGS = -DLUA_USE_POSIX -DLUA_COMPAT_ALL -DLUA_USE_DLOPEN
> +EJA_MYLIBS = -ldl
> +endif
> +
> +define EJA_BUILD_CMDS
> +	$(MAKE) \
> +        CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
> +        CFLAGS="$(TARGET_CFLAGS) $(EJA_CFLAGS)" \
> +        MYLIBS="$(EJA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" -C $(@D)
> +endef

Instead of duplicating the Lua interpreter source code into the Eja
project, why don't you link with the Lua interpreter library instead?
This makes sure that when the Lua interpreter is updated (to fix bugs,
etc.), Eja also gets fixed.

Finally, if it's a server, shouldn't it have an initscript? I see that
you've added one in your ejabox project, why isn't it part of this
package?

But again, overall, I'm questioning the value of packaging a piece of
software that seems to be very confidential, but I admit that my
position may be controversial, and other people in the Buildroot
community may prefer that we accept patches for all packages,
regardless of their "popularity".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
