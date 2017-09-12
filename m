From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Sep 2017 08:40:33 -0400
Subject: [Buildroot] [PATCH v8 0/3] Qt WebEngine support
In-Reply-To: <3a741945-7242-c931-ad9c-231b86c70b30@gmail.com>
References: <20170815203854.14456-1-gael.portay@savoirfairelinux.com>
 <488835700.260243.1502835037832.JavaMail.zimbra@savoirfairelinux.com>
 <178556773.368025.1502922075670.JavaMail.zimbra@savoirfairelinux.com>
 <3a741945-7242-c931-ad9c-231b86c70b30@gmail.com>
Message-ID: <20170912124033.yf7eexsilmguwmc2@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoltan,

On Mon, Sep 04, 2017 at 04:56:10PM +0200, Zoltan Gyarmati wrote:
> ... 
> Dear Ga?l & All
> 
> first of all: thanks for your persistenceon this!
> 
> I've tested the current config on RPi3, and with the
> webenginewidgets/minimal example the qt.io webpage starts to load, but
> after a short while the content on the screen is collapsing, and i get
> this on the console:
> 
> > # /usr/lib/qt/examples/webenginewidgets/minimal/minimal
> > QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
> > Unable to query physical screen size, defaulting to 100 dpi.
> > To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and
> > QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
> > [0904/143017.960529:WARNING:resource_bundle_qt.cpp(114)]
> > locale_file_path.empty() for locale
> > [0904/143018.185769:WARNING:resource_bundle_qt.cpp(114)]
> > locale_file_path.empty() for locale
> > glGetError 0x505
> > [790:814:0904/143024.028196:ERROR:texture_manager.cc(3235)]
> > [.RenderCompositor-0x6c706918]GL ERROR :GL_OUT_OF_MEMORY : glTexImage2D:
> > [790:814:0904/143024.028386:ERROR:gles2_cmd_decoder.cc(5202)] Error: 5
> > for Command kTexImage2D
> > [790:814:0904/143024.028574:ERROR:gles2_cmd_decoder.cc(4169)]  
> > GLES2DecoderImpl: Trying to make lost context current.
> > [790:814:0904/143024.028688:ERROR:gles2_cmd_decoder.cc(4169)]  
> > GLES2DecoderImpl: Trying to make lost context current.
> > [790:814:0904/143024.028764:ERROR:gles2_cmd_decoder.cc(4169)]  
> > GLES2DecoderImpl: Trying to make lost context current.
> > [790:814:0904/143024.028840:ERROR:gles2_cmd_decoder.cc(4169)]  
> > GLES2DecoderImpl: Trying to make lost context current.
> 
> Increasing the GPU memory to 192MB in config.txt seems to be fixing it
> (for the qt.io homepage at least...), so i think it worth to consider to
> increase the gpu_memory for raspberrypi3_qt5we_defconfig.
>

Thanks for the report.

I have already two patches for this. It is probably the right time to
send them :)

> Apart from this (and from the general fact that Qt WebEngine is a
> PITA...), it looks good to me. Unfortunately i don't have other
> applicable HW around to test this, just a BBB which already has been
> tested by Julien, but if needed, i'm happy to reproduce his test.
> 

Another platform that everybody have (but we used to forget) is a PC.

I started to test QTWE on my laptop using pc_x86_64_bios_defconfig, but
I do not have the time to go further.

I met the following error at runtime.

	QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'
	gbm: failed to open any driver (search paths /usr/lib/dri)
	gbm: Last dlopen error: /usr/lib/dri/i965_dri.so: cannot open shared object file: No such file or directory
	failed to load driver: i965
	gbm: failed to open any driver (search paths /usr/lib/dri)
	gbm: Last dlopen error: /usr/lib/dri/kms_swrast_dri.so: cannot open shared object file: No such file or directory
	failed to load driver: kms_swrast
	gbm: failed to open any driver (search paths /usr/lib/dri)
	gbm: Last dlopen error: /usr/lib/dri/swrast_dri.so: cannot open shared object file: No such file or directory
	failed to load swrast driver
	Could not create GBM device (Invalid argument)
	Could not open DRM device
	Aborted

I enabled these configs (my laptop has an i915 chipset):

	- BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
	- BR2_PACKAGE_LINUX_FIRMWARE_I915
	- BR2_PACKAGE_MESA3D_OPENGL_EGL
	- BR2_PACKAGE_MESA3D_OPENGL_ES

All, I do not know that much about graphic/opengl. I think I will need
some help to make it works.

> Regards
> 
> Zoltan Gyarmati
> https://zgyarmati.de

Regards,
Gael
