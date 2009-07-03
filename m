From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Fri, 03 Jul 2009 08:01:43 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <20090702145011.6b9f3fe9@surf>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr> <20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr>  <20090702145011.6b9f3fe9@surf>
Message-ID: <1246600903.8052.8.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le jeudi 02 juillet 2009 ? 14:50 +0200, Thomas Petazzoni a ?crit :
> Hi,
> 
> Le Wed, 01 Jul 2009 23:43:34 +0200,
> Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :
> 
> > Ok, I had another look at the ext-tool.mk makefile, and the sysroot
> > dir is not copied because of the locale...
> > 
> > This current command to get the sysroot dir is :
> > 
> > SYSROOT_DIR=`$(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" |
> > grep -- "--with-sysroot" | cut -f2 -d=`;
> > 
> > which call (in my case) sh4-linux-gcc using the default locale and as
> > my email address could suggest, my current locale is fr_FR.UTF-8. So
> > grep ^Configured just fails.
> > 
> > Please apply the attached patch to your external-toolchain branch.
> 
> Ok, thanks for patch. I should probably add a little bit of error
> checking in this external toolchain thing.
> 
> > >  * Buildroot version
> > 
> > Your external-toolchain branch
> 
> Which doesn't exist anymore since it has been merged in the official
> Buildroot :-)
> 
> But ok, fine, I know what you're using.

I'm now up to date on the last git.

> 
> > >  * Error messages
> > 
> > I will try to retry with the fix on the locale first.
> 
> For sure if Buildroot didn't properly copy the sysroot to the staging
> dir, the rest of the compilation could not work.
> 
> That said, your configuration file enables a relatively large set of
> packages that I haven't tested with the external toolchain
> configuration. Most if not all of the packages using the
> Makefile.autotools.in machinery should build flawlessly, but the
> packages using their own stuff in the .mk might break. Don't hesitate
> to report the breakage with the associated error messages (or the full
> build output), it's usually relatively easy to fix.

Ok, so I just rerun buildroot again with full staging directory copied
from the external toolchain, and I got that when compiling glib2 :


libtool: install: (cd /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1/gmodule; /bin/sh /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1/libtool  --tag CC --mode=relink /opt/STM/STLinux-2.3/devkit/sh4/bin/sh4-linux-gcc -O2 -O2 --sysroot /home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/ -O2 -O2 --sysroot /home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/ -Wall -version-info 2000:1:2000 -export-dynamic --sysroot /home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/ -o libgmodule-2.0.la -rpath /usr/lib gmodule.lo -ldl ../glib/libglib-2.0.la -lintl -inst-prefix-dir /home/djdeath/src/buildroot/buildroot/project_build_sh4/uclibc/root)
libtool: relink: /opt/STM/STLinux-2.3/devkit/sh4/bin/sh4-linux-gcc -O2 -O2  --sysroot /home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/ -shared  .libs/gmodule.o   -Wl,-rpath -Wl,/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/lib -ldl -L/home/djdeath/src/buildroot/buildroot/project_build_sh4/uclibc/root/usr/lib -L/usr/lib -lglib-2.0 -L/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/lib -L/home/djdeath/src/buildroot/buildroot/project_build_sh4/uclibc/root/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/lib -lintl -lc    -Wl,-soname -Wl,libgmodule-2.0.so.0 -o .libs/libgmodule-2.0.so.0.2000.1
/usr/lib/libdl.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
libtool: install: error: relink `libgmodule-2.0.la' with the above command before installing it
make[6]: *** [install-libLTLIBRARIES] Erreur 1
make[6]: quittant le r?pertoire ? /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1/gmodule ?
make[5]: *** [install-am] Erreur 2
make[5]: quittant le r?pertoire ? /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1/gmodule ?
make[4]: *** [install] Erreur 2
make[4]: quittant le r?pertoire ? /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1/gmodule ?
make[3]: *** [install-recursive] Erreur 1
make[3]: quittant le r?pertoire ? /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1 ?
make[2]: *** [install] Erreur 2
make[2]: quittant le r?pertoire ? /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1 ?
make[1]: *** [install-strip] Erreur 2
make[1]: quittant le r?pertoire ? /home/djdeath/src/buildroot/buildroot/build_sh4/libglib2-2.20.1 ?
make: *** [/home/djdeath/src/buildroot/buildroot/project_build_sh4/uclibc/autotools-stamps/libglib2_target_installed] Erreur 2

As you can see, there is a -L/usr/lib and -rpath /usr/lib.


-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
