From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Apr 2019 15:28:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/ngircd: fix static build with
 openssl and atomic
In-Reply-To: <20190411214927.30188-1-fontaine.fabrice@gmail.com>
References: <20190411214927.30188-1-fontaine.fabrice@gmail.com>
Message-ID: <20190414152822.665050a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 11 Apr 2019 23:49:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# We're patching configure.ng, but package cannot autoreconf with our version of
> +# autotools, so we have to do it manually instead of setting

Actually, it *can* autoreconf with our version of autotools: that's
what the ./autogen.sh script does, i.e it calls our autoconf/automake.

However, it does that after doing some patching on
configure.ng/Makefile.ng, depending on the detected version of
autoconf/automake.

> +# NGIRCD_AUTORECONF = YES
> +define NGIRCD_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +
> +NGIRCD_PRE_CONFIGURE_HOOKS += NGIRCD_RUN_AUTOGEN

You forgot to add host-autoconf and host-automake to the dependencies.
host-libtool doesn't seem to be needed.

However, even with that, it doesn't build properly here:

>>> ngircd 25 Patching libtool
>>> ngircd 25 Configuring
cd /home/thomas/projets/buildroot/output/build/ngircd-25 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin/:/usr/libexec/python3-sphinx:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin:/home/thomas/projets/git-wrappers/:/home/thomas/.local/bin" ./autogen.sh
Searching for required tools ...
Detected automake 1.15.1 ...
 - Disabling de-ANSI-fication support.
 - Enforcing serial test harness.
Generating files using "autoconf" and "automake" ...
configure.ac:315: error: possibly undefined macro: AC_CHECK_LIB
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.
Error! Check your installation of GNU automake and autoconf!
make[1]: *** [package/pkg-generic.mk:230: /home/thomas/projets/buildroot/output/build/ngircd-25/.stamp_configured] Error 1

This is maybe because autoconf is not called with the right -I
arguments. See the AUTORECONF macro in package/autoconf/autoconf.mk.

If that's the case, perhaps it's easier to use <pkg>_AUTORECONF = YES,
and simply re-implement in ngircd.mk the two tweaks that ngircd
autogen.sh does ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
