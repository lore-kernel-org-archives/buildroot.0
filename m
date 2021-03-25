From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Date: Thu, 25 Mar 2021 17:34:59 +0100
Subject: [Buildroot] [PATCH] boot/uboot: fix uboot build
In-Reply-To: <20210316230852.298db3b5@windsurf.home>
References: <20210204170446.15188-1-kory.maincent@bootlin.com>
 <20210316230852.298db3b5@windsurf.home>
Message-ID: <20210325173459.7d902f53@kmaincent-XPS-13-7390>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 16 Mar 2021 23:08:52 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Kory,
> 
> On Thu,  4 Feb 2021 18:04:46 +0100
> Kory Maincent <kory.maincent@bootlin.com> wrote:
> 
> > The make all command run the tools/makefile on the process.
> > This makefile use "pkg-config" command to support static link.
> > The issue is the use of pkg-config configured for crosscompiling
> > to build binaries tools for host architecture.
> > To fix it, I copied the behavior of QtWebengine by using a pkg-config
> > executable preconfigured for host.
> > 
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>  
> 
> Thanks for the patch. It would require a better commit title though, as
> "fix uboot build" is very vague.

Ok I will change it for v2.

> After discussing with Yann E. Morin on IRC, could you try this change
> instead:
> 
> 	$(TARGET_CONFIGURE_OPTS) \
> 	        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>         	PKG_CONFIG_SYSROOT_DIR="/" \
> 	        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> 	        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
> 	        PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"
> 
> The reasoning is that U-Boot anyway only uses pkg-config for host
> tools, so we could just as well pass those environment variables when
> building U-Boot.
> 
> Could you try this out?

This change works well, the build of U-boot ends properly.

> 
> Also, do you have a Buildroot .config to reproduce the issue? Perhaps
> it would be nice to have a test case in our runtime test infrastructure.

You can find the defconfig that break the U-boot build in attachment.

Regards,

K?ry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: new_defconfig
Type: application/octet-stream
Size: 215 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210325/569035d6/attachment.obj>
