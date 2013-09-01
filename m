From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Sep 2013 09:11:36 +0200
Subject: [Buildroot] [PATCH 1/1] pyzmq: new package
In-Reply-To: <CAAXf6LW3tKUR7hcYRef2h73XS18tCjPX4P84RPgDdeyz7NLSEQ@mail.gmail.com>
References: <1377899924-1866-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LW3tKUR7hcYRef2h73XS18tCjPX4P84RPgDdeyz7NLSEQ@mail.gmail.com>
Message-ID: <20130901091136.4d7e34e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, Thomas,

A few comments below.

On Sat, 31 Aug 2013 10:55:23 +0200, Thomas De Schampheleire wrote:

> > Please note that the reason for the hardcoded version number in the
> > python-pyzmq package is due to the following dilemma:
> > - the setup.py script tries to compile a test C program and runs it, to
> >   retrieve a version string
> > - if the cross compiler links it together, the result cannot be run on
> >   the host, due to different architectures
> > - if the host compiler would compile/link it, it would not link with the
> >   library version inside buildroot but with the library from the host

I believe such explanations fall inside the .mk file itself, so that
people looking at your code later can understand this 'bizarre' aspect
of your package.

> > +       depends on BR2_USE_WCHAR
> > +       depends on BR2_USE_MMU
> 
> For this type of dependencies, we generally add a comment in case the
> dependencies are not met, warning the user about this. Have a look at
> some other packages to get an idea.

That's true for the WCHAR dependency, but not for the MMU dependency.
So the comment should be:

comment "pyzmq requires wchar support in toolchain"
	depends on !BR2_USE_WCHAR

> > +       help
> > +         This package contains the python language binding for zeromq.
> > +         Due to issues with cross-compiling this package is hardcoded
> > +         to ZeroMQ version 3.2.3

I wouldn't mention the version of ZeroMQ here, as it will most likely
not be updated when ZeroMQ is upgraded in Buildroot.

> > +         See also: http://zeromq.org/bindings:python

No need for 'See also:', just put the upstream URL.

> > diff --git a/package/python-pyzmq/pyzmq.mk b/package/python-pyzmq/pyzmq.mk
> > new file mode 100644
> > index 0000000..a7efcad
> > --- /dev/null
> > +++ b/package/python-pyzmq/pyzmq.mk
> > @@ -0,0 +1,50 @@
> > +##########################################
> > +#
> > +# pyzmq
> > +#
> > +##########################################

80 '#' should be used.

> > +PYZMQ_VERSION = 13.0.2
> > +PYZMQ_ZMQ_VERSION = 3.2.3
> 
> I haven't thought about better ways to do this, so I'll take it as a
> given that you need to have a fixed version.
> But have you considered using $(ZEROMQ_VERSION) instead of the
> hardcoded 3.2.3. This way, pyzmq will not have to be updated when the
> zeromq version is bumped.

I agree.

> 
> > +PYZMQ_SOURCE = pyzmq-$(PYZMQ_VERSION).tar.gz
> 
> This format is the default value for FOO_SOURCE, so this line can be ommitted.
> 
> > +PYZMQ_SITE = https://pypi.python.org/packages/source/p/pyzmq/
> > +PYZMQ_LICENSE = LGPLv3 BSD-3c
> > +PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD

Check whether it's really LGPLv3 or LGPLv3+ (i.e, whether it's LGPL
version 3 only, or LGPL version 3 or later).

> > +PYZMQ_INSTALL_TARGET = YES
> 
> FOO_INSTALL_TARGET = YES is the default, so line can be ommitted.
> 
> 
> > +
> > +define PYZMQ_POST_PATCH_FIXUP
> > +        (cd $(@D); \
> > +               cat buildutils/detect.py | \
> > +               sed -e "s/##PYZMQ_ZMQ_VERSION##/$(PYZMQ_ZMQ_VERSION)/" \
> > +                 >buildutils/detect.py.new; \
> > +               cp buildutils/detect.py.new buildutils/detect.py)

I think you should use $(SED) to do an in-place replacement. See for
example what package/dmalloc/dmalloc.mk is doing. Something like:

	$(SED) 's/##PYZMQ_ZMQ_VERSION##/$(PYZMQ_ZMQ_VERSION)/' 	$(@D)/buildutils/detect.py

> > +endef
> > +
> > +PYZMQ_POST_PATCH_HOOKS += PYZMQ_POST_PATCH_FIXUP
> > +
> > +define PYZMQ_CONFIGURE_CMDS
> > +        (cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> > +                LDSHARED="$(TARGET_CROSS)gcc -shared" \

LDSHARED="$(TARGET_CC) -shared" would be preferable I believe.

> > +                CROSS_COMPILING=yes \
> > +                _python_sysroot=$(STAGING_DIR) \
> > +                _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
> > +                _python_prefix=/usr \
> > +                _python_exec_prefix=/usr \
> > +                $(HOST_DIR)/usr/bin/python setup.py configure \
> > +               --zmq=$(@D)/../../staging/usr)

No, this should be --zmq=$(STAGING_DIR)/usr

> > +endef
> 
> Python and zeromq will already have to be installed before pyzmq is
> built, so you will have to add a line like:
> PYZMQ_DEPENDENCIES = python zeromq
> 
> > +
> > +define PYZMQ_INSTALL_TARGET_CMDS
> > +        (cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> > +                LDSHARED="$(TARGET_CROSS)gcc -shared" \
> > +                CROSS_COMPILING=yes \
> > +                _python_sysroot=$(STAGING_DIR) \
> > +                _python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
> > +                _python_prefix=/usr \
> > +                _python_exec_prefix=/usr \
> > +                $(HOST_DIR)/usr/bin/python setup.py install \
> > +               --prefix=$(TARGET_DIR)/usr)

This prefix looks wrong. The prefix should normally always be '/usr'.

You also have lots of duplicated variables between the CONFIGURE_CMDS
and INSTALL_TARGET_CMDS, it'd be great to factorize them.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
