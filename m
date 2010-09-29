From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 10:46:37 +0200
Subject: [Buildroot] Build failure of xlib_libX11 for mipsel
In-Reply-To: <20100919182345.GB28625@tarshish>
References: <20100919182345.GB28625@tarshish>
Message-ID: <20100929104637.0b4f3665@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Sep 2010 20:23:46 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> I'm trying to get TinyX running on a mipsel target (the Alchemy Au1250). I'm 
> using the latest CodeSourcery toolchain (version 4.4). The build of the 
> xlib_libX11 package fails at the very start with the following error:
> 
> cd /home/baruch/git/buildroot/output/build/xlib_libX11-1.3.2/src/util && /usr/bin/gcc  \
>         -I/home/baruch/git/buildroot/output/build/staging_dir/usr/include -o makekeys makekeys.c
> In file included from /home/baruch/git/buildroot/output/build/staging_dir/usr/include/sys/types.h:31,
>                  from /home/baruch/git/buildroot/output/build/staging_dir/usr/include/X11/Xos.h:42,
>                  from makekeys.c:35:
> /home/baruch/git/buildroot/output/build/staging_dir/usr/include/bits/types.h:129:3: error: #error
> 
> The strange thing here is that the host gcc is getting run instead of the 
> cross compiler.
> 
> Anyone got a clue?

Reproduced here. The fact that makekeys is build with the host compiler
is normal. makekeys is needed on the build machine, not on the target
machine, so we hack around in package/x11r7/xlib_libX11/xlib_libX11.mk
to build makekeys for the host. Unfortunately, we have to tell it to
look for include files in $(STAGING_DIR)/usr/include and this messes up
the compilation. Not sure what the fix is for the moment. I'll have a
look later if no-one steps up before to fix it.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
