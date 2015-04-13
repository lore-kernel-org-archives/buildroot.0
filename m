From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 23:04:05 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python-pydal: new package
In-Reply-To: <CA+TH9V=rovjsF+-g0mMtQzAOJtebzTAQLMR778emgycxjSuOAw@mail.gmail.com>
References: <1428933447-32061-1-git-send-email-angelo.compagnucci@gmail.com>
 <1428933447-32061-2-git-send-email-angelo.compagnucci@gmail.com>
 <20150413161716.5cd8e3ae@free-electrons.com>
 <CA+TH9V=rovjsF+-g0mMtQzAOJtebzTAQLMR778emgycxjSuOAw@mail.gmail.com>
Message-ID: <20150413230405.4a3b3a78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Mon, 13 Apr 2015 16:34:44 +0200, Angelo Compagnucci wrote:

> No. Unfortunately buildroot doesn't support git submodules: the
> download helper makes a bare clone and zip the results without git
> informations, so it's not possible to do a submodule init in a
> POST_EXTRACT action.
> 
> The only way is to add a dummy package for the submodule and copy the
> downloaded content to appropriate folders. I was inspired by other
> packages (ex sunxi-mali-prop) that use the same exact method.

No, that's not the only way. Just package python-pydal as a normal
Python module, that can be selected independently from python-web2py.
Ignore completely that it is a submodule of python-web2py, because we
don't care: python-web2py simply does "import pydal", so as long as
python-pydal has been installed, everything will be alright.

> >> +PYTHON_PYDAL_VERSION = v15.03
> >> +PYTHON_PYDAL_SITE = https://github.com/web2py/pydal.git
> >> +PYTHON_PYDAL_SITE_METHOD = git
> >
> > github function?
> 
> Using this method I can use alternatively both commit id or tag.

I don't get it, with the github function you can define a commit id or
a tag.

> >> +PYTHON_PYDAL_LICENSE = BSDv3
> >
> > BSDv3 does not exist. You're confusing GPLv3 and BSD-3c.
> 
> Doh! Probably also the original author is wrong:
> 
> "License
> pyDAL is released under the BSDv3 License.
> For further details, please check the LICENSE file."
> 
> I will submit a PR to Giovanni Barillari!

Yes, the author is wrong, I looked at the license, and it's a BSD-3c.

> >> +PYTHON_PYDAL_LICENSE_FILES = LICENSE
> >> +
> >> +$(eval $(generic-package))
> >
> > A comment above this to explain why we have this generic-package that
> > doesn't do anything.
> 
> Ok!

Well, in fact, change it to a Python package that does something:

Something along the lines of:

diff --git a/package/python-pydal/Config.in b/package/python-pydal/Config.in
index eda2f77..303762d 100644
--- a/package/python-pydal/Config.in
+++ b/package/python-pydal/Config.in
@@ -1,2 +1,2 @@
 config BR2_PACKAGE_PYTHON_PYDAL
-       bool
+       bool "python-pydal"
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index a88bf8b..25eaf56 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 PYTHON_PYDAL_VERSION = v15.03
-PYTHON_PYDAL_SITE = https://github.com/web2py/pydal.git
-PYTHON_PYDAL_SITE_METHOD = git
-PYTHON_PYDAL_LICENSE = BSDv3
+PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
+PYTHON_PYDAL_LICENSE = BSD-3c
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
+PYTHON_PYDAL_SETUP_TYPE = setuptools
 
-$(eval $(generic-package))
+$(eval $(python-package))

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
