From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Nov 2015 15:22:45 +0100
Subject: [Buildroot] suckless.org dwm / dmenu package for buildroot
In-Reply-To: <1446467960.4528.0@smtp.n3o.at>
References: <1446467960.4528.0@smtp.n3o.at>
Message-ID: <20151102152245.4044fff6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 02 Nov 2015 13:39:20 +0100, buildroot at n3o.at wrote:

> I missed the two packages named in subject so i decided to try to add 
> em.
> 
> here's my patch: https://neu3no.de/dwm_buildroot.patch
> 
> I'm not quiet sure if I did it the right way, so plz tell me if I 
> didn't.

Thanks for this! Could you submit those two packages as proper patches,
as per the instructions in the Buildroot manual at
http://buildroot.org/downloads/manual/manual.html#submitting-patches.

A few comments:

 * You should make two separate patches, one per newly added package.

 * 0001-buildroot_env.patch is most likely incorrect. The PREFIX
   variable should simply be overridden from the environment, and the
   X11LIB/X11INC variables should be changed to not use TARGET_DIR,
   which is a Buildroot-specific thing and it should creep into the
   package build system. Also, all patches to packages should have a
   description and Signed-off-by line, see
   http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

 * "depends on BR2_PACKAGE_XLIB_LIBXINERAMA" should be a select.

 * DMENU_DEPENDENCIES = xserver_xorg-server -> this is not correct. A
   X11 application never depends on the server, but on X11 client
   libraires.

 * LD_LIBRARY_PATH="$(TARGET_DIR)/usr/lib/" is terribly wrong. Using a
   LD_LIBRARY_PATH on the host pointing to target libraries simply
   cannot work.

 * CC=$(TARGET_CC) LD=$(TARGET_LD) -> use $(TARGET_CONFIGURE_OPTS)
   instead

 * Hash files are missing

 * License information is missing

 * There are some remaining debugging messages in DWM_BUILD_CMDS.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
