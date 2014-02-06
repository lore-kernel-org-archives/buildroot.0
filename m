From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Feb 2014 23:07:27 +0100
Subject: [Buildroot] [PATCH] package/weston: un-break the rpi-compositor
In-Reply-To: <1391719519-4461-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 6 Feb 2014 21:45:19 +0100")
References: <1391719519-4461-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87d2iznbds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > The rpi-compositor was broken with the 1.4.0 release,
 > but we now have a fix from upstream.

 > Add this patch, and remove the 'depends on BROKEN'.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 > Peter, I believe this should go in for 2014.02, preferrably before rc1
 > so -next has it to. Thanks! :-)

Committed, thanks.
c
 > ---
 >  package/weston/Config.in                           |  1 -
 >  ...0-compositor-rpi-fix-input-initialization.patch | 57 ++++++++++++++++++++++
 >  2 files changed, 57 insertions(+), 1 deletion(-)
 >  create mode 100644 package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch

 > diff --git a/package/weston/Config.in b/package/weston/Config.in
 > index 1ab3c2f..247efc8 100644
 > --- a/package/weston/Config.in
 > +++ b/package/weston/Config.in
 > @@ -41,7 +41,6 @@ comment "RPi compositor needs a toolchain w/ C++, largefile, threads"
 
 >  config BR2_PACKAGE_WESTON_RPI
 >  	bool "RPi compositor"
 > -	depends on BROKEN                       # rpi-backend broken in 1.4.0
 >  	depends on BR2_arm                      # rpi-userland
 >  	depends on BR2_INSTALL_LIBSTDCPP        # rpi-userland
 >  	depends on BR2_LARGEFILE                # rpi-userland
 > diff --git a/package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch b/package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch
 > new file mode 100644
 > index 0000000..8722d07
 > --- /dev/null
 > +++ b/package/weston/weston-0000-compositor-rpi-fix-input-initialization.patch
 > @@ -0,0 +1,57 @@
 > +commit bf539e39c15e9a4ef4479d03c52263a3f020ef4a
 > +Author: Emilio Pozuelo Monfort <emilio.pozuelo@collabora.co.uk>
 > +Date:   Mon Feb 3 16:57:27 2014 +0100
 > +
 > +    compositor-rpi: Fix input initialization
 > +    
 > +    The input initialization code assumes the outputs have already
 > +    been initialized; thus create the outputs first. This fixes a
 > +    segfault upon startup. It is also what the drm and fbdev backends
 > +    do.
 > +
 > +diff --git a/src/compositor-rpi.c b/src/compositor-rpi.c
 > +index 399090d..e7c0e0d 100644
 > +--- a/src/compositor-rpi.c
 > ++++ b/src/compositor-rpi.c
 > +@@ -527,13 +527,6 @@ rpi_compositor_create(struct wl_display *display, int *argc, char *argv[],
 > + 	weston_log("Dispmanx planes are %s buffered.\n",
 > + 		   compositor->single_buffer ? "single" : "double");
 > + 
 > +-	if (udev_input_init(&compositor->input,
 > +-			    &compositor->base,
 > +-			    compositor->udev, "seat0") != 0) {
 > +-		weston_log("Failed to initialize udev input.\n");
 > +-		goto out_launcher;
 > +-	}
 > +-
 > + 	for (key = KEY_F1; key < KEY_F9; key++)
 > + 		weston_compositor_add_key_binding(&compositor->base, key,
 > + 						  MODIFIER_CTRL | MODIFIER_ALT,
 > +@@ -549,19 +542,23 @@ rpi_compositor_create(struct wl_display *display, int *argc, char *argv[],
 > + 	bcm_host_init();
 > + 
 > + 	if (rpi_renderer_create(&compositor->base, &param->renderer) < 0)
 > +-		goto out_udev_input;
 > ++		goto out_launcher;
 > + 
 > + 	if (rpi_output_create(compositor, param->output_transform) < 0)
 > + 		goto out_renderer;
 > + 
 > ++	if (udev_input_init(&compositor->input,
 > ++			    &compositor->base,
 > ++			    compositor->udev, "seat0") != 0) {
 > ++		weston_log("Failed to initialize udev input.\n");
 > ++		goto out_renderer;
 > ++	}
 > ++
 > + 	return &compositor->base;
 > + 
 > + out_renderer:
 > + 	compositor->base.renderer->destroy(&compositor->base);
 > + 
 > +-out_udev_input:
 > +-	udev_input_destroy(&compositor->input);
 > +-
 > + out_launcher:
 > + 	weston_launcher_destroy(compositor->base.launcher);
 > + 
 > -- 
 > 1.8.1.2



-- 
Bye, Peter Korsgaard
