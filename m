From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 21:40:41 +0200
Subject: [Buildroot] [PATCH] python-ranger: new package
In-Reply-To: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com> (Thijs
 Vermeir's message of "Tue, 20 Oct 2015 21:01:39 +0200")
References: <1445367699-13964-1-git-send-email-thijsvermeir@gmail.com>
Message-ID: <87y4exjpl2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thijs" == Thijs Vermeir <thijsvermeir@gmail.com> writes:

Hi,

 > ranger is a console file manager with VI key bindings. It provides a
 > minimalistic and nice curses interface with a view on the directory hierarchy.
 > It ships with "rifle", a file launcher that is good at automatically finding
 > out which program to use for what file type.

 > http://ranger.nongnu.org

Please add your signed-off-by tag to the patch (git commit -s), thanks.

> diff --git a/package/python-ranger/0001-colorschemes-pyc.patch b/package/python-ranger/0001-colorschemes-pyc.patch
 > new file mode 100644
 > index 0000000..6752cb4
 > --- /dev/null
 > +++ b/package/python-ranger/0001-colorschemes-pyc.patch

And a description + signed-off-by for the patch. Have you tried
submitting it upstream? If so, was it accepted?

> @@ -0,0 +1,13 @@
 > +Index: python-ranger-1.7.2/ranger/gui/colorscheme.py
 > +===================================================================
 > +--- python-ranger-1.7.2.orig/ranger/gui/colorscheme.py
 > ++++ python-ranger-1.7.2/ranger/gui/colorscheme.py
 > +@@ -86,7 +86,7 @@ def _colorscheme_name_to_class(signal):
 > +     usecustom = not ranger.arg.clean
 > + 
 > +     def exists(colorscheme):
 > +-        return os.path.exists(colorscheme + '.py')
 > ++        return os.path.exists(colorscheme + '.py') or os.path.exists(colorscheme + '.pyc')
 > + 
 > +     def is_scheme(x):
 > +         try:
 > diff --git a/package/python-ranger/Config.in b/package/python-ranger/Config.in
 > new file mode 100644
 > index 0000000..4ded82e
 > --- /dev/null
 > +++ b/package/python-ranger/Config.in
 > @@ -0,0 +1,13 @@
 > +config BR2_PACKAGE_PYTHON_RANGER
 > +	bool "python-ranger"
 > +	depends on BR2_PACKAGE_PYTHON3_CURSES || BR2_PACKAGE_PYTHON_CURSES

We normally use select for library dependencies, so you can do
   select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
   select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3

> +	help
 > +	  ranger is a console file manager with VI key bindings. It provides a
 > +	  minimalistic and nice curses interface with a view on the directory hierarchy.
 > +	  It ships with "rifle", a file launcher that is good at automatically finding
 > +	  out which program to use for what file type.
 > +
 > +	  http://ranger.nongnu.org
 > +
 > +comment "python-ranger needs the curses python or python3 library"
 > +	depends on !BR2_PACKAGE_PYTHON3_CURSES && !BR2_PACKAGE_PYTHON_CURSES

And drop this comment.

> diff --git a/package/python-ranger/python-ranger.mk b/package/python-ranger/python-ranger.mk
 > new file mode 100644
 > index 0000000..7272fbb
 > --- /dev/null
 > +++ b/package/python-ranger/python-ranger.mk
 > @@ -0,0 +1,21 @@
 > +################################################################################
 > +#
 > +# python-ranger
 > +#
 > +################################################################################
 > +
 > +PYTHON_RANGER_VERSION = 1.7.2
 > +PYTHON_RANGER_SITE = $(call github,hut,ranger,v$(PYTHON_RANGER_VERSION))
 > +PYTHON_RANGER_SETUP_TYPE = distutils
 > +PYTHON_RANGER_LICENSE = GPLv3

Is there no license file in the tarball?

We recently started adding hashes for the packages on github as
well. Please add a (locally calculated) sha256 in python-ranger.hash

> +
 > +define PYTHON_RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
 > +	$(SED) 's%/usr/bin/python -O%/usr/bin/python%g' $(@D)/scripts/ranger
 > +endef

Please add a comment explaining why this is done.

 > +
 > +ifeq ($(BR2_PACKAGE_PYTHON3_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
 > +PYTHON_RANGER_POST_PATCH_HOOKS += PYTHON_RANGER_DO_NOT_GENERATE_BYTECODE_AT_RUNTIME
 > +endif
 > +
 > +$(eval $(python-package))
 > +$(eval $(host-python-package))

Is there anything needing this on the host?

-- 
Bye, Peter Korsgaard
