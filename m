From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 13 Jun 2016 18:05:25 +0200
Subject: [Buildroot] [PATCH v4] package/python-pillow: new package
In-Reply-To: <87shwhxhzy.fsf@dell.be.48ers.dk>
References: <1465731524-4109-1-git-send-email-angelo.compagnucci@gmail.com>
 <87shwhxhzy.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9Vm8Vf0i-KrpEZu_-4KKKf4KVZDawq+ATvBwMkwZMjih5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

2016-06-13 16:48 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > This patch adds python pillow, the friendly python fork, it
>  > includes a backported patch to disable configuration platfom guessing.
>
> It is afaik a fork of the python imaging library, not of python.

Ops!

>  > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>  > ---
>  >  package/Config.in                                  |  1 +
>  >  ...y-add-option-to-disable-platform-guessing.patch | 63 ++++++++++++++++++++++
>  >  package/python-pillow/Config.in                    | 12 +++++
>  >  package/python-pillow/python-pillow.hash           |  2 +
>  >  package/python-pillow/python-pillow.mk             | 39 ++++++++++++++
>  >  5 files changed, 117 insertions(+)
>  >  create mode 100644 package/python-pillow/0001-setup.py-add-option-to-disable-platform-guessing.patch
>  >  create mode 100644 package/python-pillow/Config.in
>  >  create mode 100644 package/python-pillow/python-pillow.hash
>  >  create mode 100644 package/python-pillow/python-pillow.mk
>
>  > +++ b/package/python-pillow/python-pillow.hash
>  > @@ -0,0 +1,2 @@
>  > +https://pypi.python.org/pypi?:action=show_md5&digest=7cfd093c11205d9e2ebe3c51dfcad510
>  > +md5 7cfd093c11205d9e2ebe3c51dfcad510  Pillow-3.2.0.tar.gz
>
> Please also provide a stronger hash like sha256.

Right!

>> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
>  > new file mode 100644
>  > index 0000000..f186ab6
>  > --- /dev/null
>  > +++ b/package/python-pillow/python-pillow.mk
>  > @@ -0,0 +1,39 @@
>  > +################################################################################
>  > +#
>  > +# python-pillow
>  > +#
>  > +################################################################################
>  > +
>  > +PYTHON_PILLOW_VERSION = 3.2.0
>  > +PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>  > +PYTHON_PILLOW_SITE = https://pypi.python.org/packages/source/P/Pillow
>  > +PYTHON_PILLOW_SETUP_TYPE = setuptools
>  > +PYTHON_PILLOW_DEPENDENCIES = $(if $(BR2_PACKAGE_JPEG),jpeg) \
>  > +      $(if $(BR2_PACKAGE_ZLIB),zlib) \
>  > +      $(if $(BR2_PACKAGE_TIFF),tiff) \
>  > +      $(if $(BR2_PACKAGE_FREETYPE),freetype) \
>  > +      $(if $(BR2_PACKAGE_WEBP),webp) \
>  > +      $(if $(BR2_PACKAGE_OPENJPEG),openjpeg)
>  > +
>  > +PYTHON_PILLOW_BUILD_OPTS += --disable-platform-guessing
>  > +PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_JPEG),--enable-jpeg,--disable-jpeg)
>  > +PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_ZLIB),--enable-zlib,--disable-zlib)
>  > +PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_TIFF),--enable-tiff,--disable-tiff)
>  > +PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_FREETYPE),--enable-freetype,--disable-freetype)
>  > +PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_WEBP),--enable-webp,--disable-webp)
>  > +PYTHON_PILLOW_BUILD_OPTS += $(if $(BR2_PACKAGE_OPENJPEG),--enable-jpeg2000,--disable-jpeg2000)
>  > +
>  > +PYTHON_PILLOW_INSTALL_TARGET_OPTS += $(PYTHON_PILLOW_BUILD_OPTS)
>
> If these are build options, why are you passing them to the install
> step?

Cause this package as a strange build/install system and requires the
same set of option both in build and install steps.

> Why are you using += and not just = ? The default value of
> _INSTALL_TARGET_OPTS will only be set when python-package is evaluated
> below, so this will not append to the default.

I've not dug so deep inside python-package handling, so I used +=.

>  > +
>  > +PYTHON_PILLOW_BUILD_CMDS = (cd $(PYTHON_PILLOW_BUILDDIR); \
>  > +            $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>  > +            $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>  > +            $(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS))
>
> Isn't this identical to the default build commands (with
> PYTHON_PILLOW_BASE_BUILD_TGT = build_ext)?

In a previous review [1] was said to me to rewrite both BUILD_CMDS and
INSTALL_TARGET_CMDS instead of modifying PYTHON_PILLOW_BASE_BUILD_TGT
cause this is the first package to have such need.

>  > +
>  > +PYTHON_PILLOW_INSTALL_TARGET_CMDS = (cd $(PYTHON_PILLOW_BUILDDIR); \
>  > +            $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
>  > +            $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
>  > +            $(PYTHON_PILLOW_INSTALL_TARGET_OPTS) install \
>  > +            $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS))
>  > +
>
> And this to the default target install. Why do you need to run build_ext
> again?

Cause the install step of this package doesn't work if called without build_ext.

[1] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/141233/match=pillow

Sincerely, Angelo

>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
