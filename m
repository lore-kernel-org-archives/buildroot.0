From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 22:36:05 +0200
Subject: [Buildroot] PATCH [1/2] make Makefile.autotools.in not to
	use	hardcoded x11r7 name when patching
In-Reply-To: <46FD70EC.2010104@promwad.com>
References: <46FD70EC.2010104@promwad.com>
Message-ID: <20070928203604.GW20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 29, 2007 at 12:23:56AM +0300, Ivan Kuten wrote:
>
>Hello,
>
>Here are two patches addressing hardcoded x11r7 in Makefile.autotools.in:
>The first patch removes "if test -d package/x11r7/$($(PKG)_NAME)/$(NAMEVER)" and
>adds optional additional parameter ($(PKG)_NAME_PREFIX) when calling AUTOTARGETS

What about renaming them to DIR_OFFSET or DIR_PREFIX instead of
NAME_PREFIX to make it more obvious that those are ment to be dirs.

>for example:
>$(eval $(call AUTOTARGETS,xutil_util-macros,x11r7))

That sounds very good, yes. See below
>
>---------
>
>Index: package/Makefile.autotools.in
>===================================================================
>--- package/Makefile.autotools.in	(revision 20086)
>+++ package/Makefile.autotools.in	(working copy)
>@@ -58,6 +58,9 @@
> # FOO_SUBDIR [default empty]
> #	relative path in the package source from which to run configure and
> #	make
>+# FOO_NAME_PREFIX [default empty]
>+#	relative path from packages directory to package *.mk file and
>+#	corresponding patches
> #
> ## The following variables contain hook target names
> ## by default they do nothing, they can be overriden in package makefiles
>@@ -151,25 +154,15 @@
> 	$(call MESSAGE,"Patching")
> 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
> 	$(Q)(\
>-	if test -d package/$($(PKG)_NAME) ; then \
>-	  if test "$(wildcard package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
>-	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
>+	if test -d package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME) ; then \
>+	  if test "$(wildcard package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
>+	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \

This may be obvious from the context, but is @D guaranteed to exist?

cheers,
