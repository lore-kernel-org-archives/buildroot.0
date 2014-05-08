From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 8 May 2014 09:04:57 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <d2a5d78d-c512-4fad-ae86-fbb5bcc42d8f@email.android.com>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
 <3dba42f3-d595-4415-bd38-3220738fe4b6@email.android.com>
 <CAAXf6LUKatxzDZOWC4tWq28rS3m_BcYT7Zg80Ea5HDz-C0O=nQ@mail.gmail.com>
 <d2a5d78d-c512-4fad-ae86-fbb5bcc42d8f@email.android.com>
Message-ID: <CAAXf6LX19u3q95iMO5sUReKPdHwiuAnup0mXFJN2_-14mqnOMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, May 7, 2014 at 9:37 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
[..]

>>> I tried using virtual-package in toolchain/toolchain/toolchain.mk, but TOOLCHAIN_VERSION becomes empty, while HOST_TOOLCHAIN_VERSION is virtual.

[..]

Some more feedback: I stepped away from toolchain and added a simple
test package 'mytest' as below.
I added a debug target 'bar' and some variable assignment in pkg-generic.mk.


diff --git a/package/mytest/mytest.mk b/package/mytest/mytest.mk
new file mode 100644
--- /dev/null
+++ b/package/mytest/mytest.mk
@@ -0,0 +1,10 @@
+
+$(eval $(virtual-package))
+
+bar:
+       @echo MYTEST_VERSION = $(MYTEST_VERSION)
+       @echo HOST_MYTEST_VERSION = $(HOST_MYTEST_VERSION)
+       @echo MYTEST_X = $(MYTEST_X)
+       @echo MYTEST_Y = $(MYTEST_Y)
+       @echo HOST_MYTEST_X = $(HOST_MYTEST_X)
+       @echo HOST_MYTEST_Y = $(HOST_MYTEST_Y)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -262,6 +262,12 @@ define inner-generic-package
 # sanitize the package version that is used in paths, directory and file names.
 # Forward slashes may appear in the package's version when pointing to a
 # version control system branch or tag, for example remotes/origin/1_10_stable.
+
+ifdef $(2)_VERSION
+  $(2)_X := $(subst /,_,$($(2)_VERSION))
+  $(2)_Y := $(subst /,_,$$($(2)_VERSION))
+endif
+
 ifndef $(2)_VERSION
  ifdef $(3)_VERSION
   $(2)_DL_VERSION = $($(3)_VERSION)


In pkg-generic.mk, the _VERSION variables are defined, and there is a
subst() statement to replace / with _.
My conclusion is that the line with the subst statement does not work
when _VERSION is set like in virtual-package.

The output of 'make bar' is:
MYTEST_VERSION =
HOST_MYTEST_VERSION = virtual
MYTEST_X =
MYTEST_Y = virtual
HOST_MYTEST_X =
HOST_MYTEST_Y =

X is using the standard subst line as pkg-generic is using, while Y
adds an extra dollar sign.
When the version is set directly, as in MYTEST_VERSION = bla, then X
seems to be correct. This is the way buildroot works today. However,
when the version is set indirectly from an inner-xxx-package, like
$(3)_VERSION, then X no longer works but Y does. However, adding an
extra dollar by default doesn't work for the normal packages.

So how to proceed? Any experts in the inner-xxx-package and make internals?
Arnout, ThomasP, Yann?

Thanks,
Thomas
