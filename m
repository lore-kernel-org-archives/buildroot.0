From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 12:15:47 +0200
Subject: [Buildroot] [PATCH v4 1/3] libgtk3: new package
In-Reply-To: <20140803113535.00c160c3@free-electrons.com>
References: <1406856828-17350-1-git-send-email-hadrien.boutteville@gmail.com>
 <1406856828-17350-2-git-send-email-hadrien.boutteville@gmail.com>
 <20140803113535.00c160c3@free-electrons.com>
Message-ID: <20140803121547.0afe9f78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Aug 2014 11:35:35 +0200, Thomas Petazzoni wrote:

> Making all in gtk
>   CCLD     extract-strings
>   GEN      stamp-gtktypebuiltins.h
>   GEN      stamp-gtkprivatetypebuiltins.h
>   GEN      stamp-gtkmarshalers.h
>   GEN      stamp-icons
>   GEN      gtkdbusgenerated.c
>   GEN      gtkdbusgenerated.h
> /usr/bin/ld: skipping incompatible /home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.so when searching for -lintl
> /usr/bin/ld: skipping incompatible /home/test/outputs/gtk3/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libintl.a when searching for -lintl
> /usr/bin/ld: cannot find -lintl
> collect2: ld returned 1 exit status
> make[4]: *** [extract-strings] Error 1
> make[4]: *** Waiting for unfinished jobs....
> /home/test/outputs/gtk3/host/usr/bin/glib-mkenums: gtktextview.h:59: Failed to parse `  /*< private >*/ '
> /home/test/outputs/gtk3/host/usr/bin/glib-mkenums: gtktextview.h:61: Failed to parse `  /*< public >*/ '
> make[3]: *** [all-recursive] Error 1
> make[2]: *** [all] Error 2
> make[1]: *** [/home/test/outputs/gtk3/build/libgtk3-3.12.2/.stamp_built] Error 2
> make: *** [_all] Error 2

I've done a little bit more investigation. The problem comes from the
fact that the extract-strings program is built for the host, but using
target cflags/ldflags. The gtk3 configure.ac script has provisions to
specify a PKG_CONFIG_FOR_BUILD, but in the case of Buildroot, our
PKG_CONFIG_FOR_BUILD is just $(HOST_DIR)/usr/bin/pkg-config, but with
several environment variables to adjust its behavior (because by
default, $(HOST_DIR)/usr/bin/pkg-config is cross and returns values for
target libraries).

So, I tried something like:

LIBGTK3_CONF_ENV += \
	ac_cv_path_PKG_CONFIG_FOR_BUILD='$(HOST_CONFIGURE_OPTS) $(HOST_PKG_CONFIG_BINARY)'

but it didn't work as the autoconf code does not expect the command to
have multiple, space-separated, tokens.

I've already tried to override GLIB_CFLAGS_FOR_BUILD and
GLIB_LIBS_FOR_BUILD with no luck.

So, right now, I am wondering if we should provide a
$(HOST_DIR)/usr/bin/host-pkg-config that has built-in all the necessary
environment variables to return values appropriate for host libraries.

Any other suggestion?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
