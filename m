From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Wed, 17 Sep 2014 15:13:02 +0200
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: new package
In-Reply-To: <20140917140059.0eee9af9@free-electrons.com>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-4-git-send-email-cvubrugier@fastmail.fm>
 <20140917140059.0eee9af9@free-electrons.com>
Message-ID: <20140917151302.08303544@grp-cvubrugier>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for the prompt review.

On Wed, 17 Sep 2014 14:00:59 +0200, Thomas Petazzoni wrote :
> On Wed, 17 Sep 2014 13:39:56 +0200, Christophe Vu-Brugier wrote:
> 
> > diff --git a/package/python-rtslib-fb/Config.in b/package/python-rtslib-fb/Config.in
> > new file mode 100644
> > index 0000000..b2aebcf
> > --- /dev/null
> > +++ b/package/python-rtslib-fb/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_PYTHON_RTSLIB_FB
> > +	bool "python-rtslib-fb"
> > +	depends on BR2_PACKAGE_PYTHON
> 
> Is it for this package that you had the Python 3 issue? Could you
> explain a bit more the 2to3 problems you have seen?

It is for this package (and for configshell-fb and targetcli-fb) that I
thought I had an issue with `2to3`.
But I was wrong because it seems that `2to3` is correctly invoked by
setup.py when it is run under Python 3.
The installed python files are different from the source python files
and are modified by `2to3`:

--- build/python-rtslib-fb-v2.1.fb49/rtslib/utils.py
+++ target/usr/lib/python3.4/site-packages/rtslib/utils.py
@@ -435,14 +435,14 @@
             raise
 
 def set_attributes(obj, attr_dict, err_func):
-    for name, value in attr_dict.iteritems():
+    for name, value in attr_dict.items():

So if there is an issue, it is not caused by a broken `2to3`.


> > +	help
> > +	  rtslib-fb is an object-based Python library for configuring
> > +	  the LIO generic SCSI target, present in 3.x Linux kernel
> > +	  versions.
> > +
> > +	  https://github.com/agrover/rtslib-fb
> > diff --git a/package/python-rtslib-fb/python-rtslib.mk b/package/python-rtslib-fb/python-rtslib.mk
> > new file mode 100644
> > index 0000000..70b0257
> > --- /dev/null
> > +++ b/package/python-rtslib-fb/python-rtslib.mk
> > @@ -0,0 +1,13 @@
> > +################################################################################
> > +#
> > +# python-rtslib-fb
> > +#
> > +################################################################################
> > +
> > +PYTHON_RTSLIB_FB_VERSION = v2.1.fb49
> > +PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
> > +PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
> > +PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
> > +PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
> > +
> > +$(eval $(python-package))
> 
> Other than that, the patch looks good to me, and the Python 3 support
> can always be added later:
> 
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Thomas
