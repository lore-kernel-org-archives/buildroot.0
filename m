From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Aug 2019 09:04:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: disable opencl
In-Reply-To: <20190823191417.8748-1-juju@cotds.org> (Julien Olivain's message
 of "Fri, 23 Aug 2019 21:14:17 +0200")
References: <20190823191417.8748-1-juju@cotds.org>
Message-ID: <8736hp4tg1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien Olivain <juju@cotds.org> writes:

 > Some packages installs libOpenCL without declaring
 > BR2_PACKAGE_PROVIDES_LIBOPENCL (e.g. imx-gpu-viv). ImageMagick will
 > detect the library and will require libtool. Since libtool is not in
 > dependencies, build might fail.

 > To prevent that situation, this patch explicitly disable opencl
 > support.

 > Signed-off-by: Julien Olivain <juju@cotds.org>
 > ---
 >  package/imagemagick/imagemagick.mk | 6 +++++-
 >  1 file changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 > index 0bac0b4fc3..58c8637efc 100644
 > --- a/package/imagemagick/imagemagick.mk
 > +++ b/package/imagemagick/imagemagick.mk
 > @@ -18,10 +18,13 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
 >  IMAGEMAGICK_CONFIG_SCRIPTS += Magick++-config
 >  endif
 
 > -IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
 > +IMAGEMAGICK_CONF_ENV = \
 > +	ac_cv_sys_file_offset_bits=64 \
 > +	ax_cv_check_cl_libcl=no

Why is this needed? From a quick look at m4/ax_opencl.m4, this only
seems to be used when we do not pass --disable-opencl?

-- 
Bye, Peter Korsgaard
