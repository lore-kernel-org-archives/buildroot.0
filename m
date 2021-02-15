From: mattwood2000 at gmail.com <mattwood2000@gmail.com>
Date: Mon, 15 Feb 2021 16:28:28 -0500
Subject: [Buildroot] CMake package requires out of source build
Message-ID: <CADjezmadzNatvC8E3ybVjcv-HmOAUb8zO09jnVfRosSxu1Gokw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've found myself in a bit of a dilemma with a piece of software I'm
trying to integrate into a custom cmake package.

The software is the amazon avs-device-sdk:
https://github.com/alexa/avs-device-sdk

For whatever reason, it does not support building within the source
tree.  Under normal circumstances one would set
<PKG>_SUPPORTS_IN_SOURCE_BUILD=NO, but in this case the sdk will not
support a build directory in the source SDK whatsoever, so that config
option is useless.

The only way I can see to get around this short of Amazon fixing their
weird build requirement is to do a dirty hack like below.

Does anyone have any other suggestions?

Thanks, Matt.

--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -66,7 +66,8 @@ $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
 ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
 $(2)_BUILDDIR                  = $$($(2)_SRCDIR)
 else
-$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/buildroot-build
+$(2)_BUILDDIR                  = $$($(2)_SRCDIR)/../$(1)_buildroot-build
 endif
