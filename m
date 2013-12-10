From: David Corvoysier <david.corvoysier@orange.com>
Date: Tue, 10 Dec 2013 16:18:08 +0100
Subject: [Buildroot] [BR2_EXTERNAL] Ability to specify regular packages
 behaviour from external.mk
Message-ID: <52A730B0.3020104@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been testing BR2_EXTERNAL to generate a firmware for a target 
that provides proprietary egl and gles implementations.

I have created a custom userland package for my target that "provides" 
egl and gles, but I still need to specify a dependency towards it in 
libegl and libgles.

Before BR2_EXTERNAL, I used to patch buildroot's 
package/opengl/libgles.mk and package/opengl/libegl.mk directly:

ifeq ($(BR2_PACKAGE_XX_USERLAND),y)
LIBGLES_DEPENDENCIES += xx-userland
endif

Now, I would like to add these lines to my external.mk, but I fail on a 
LIBXX_CONFIGURE_CMDS that exits on error if LIBGLES_DEPENDENCIES are empty.

The thing is that since external.mk is included after all other 
makefiles, my modifications to LIBXX_DEPENDENCIES are applied only after 
the creation of the LIBXX_CONFIGURE_CMDS, thus causing the exit on error.

I managed to overcome this issue by moving the inclusion of external.mk 
before all other makefiles, but I have no idea if this is the right way 
to go: what do you think ?

David Corvoysier
