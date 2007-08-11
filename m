From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 12 Aug 2007 00:01:12 +0200
Subject: [Buildroot] AUTOTARGETS is not working correctly when
	applying	x11r7 patches, was (  X11R7 packages available )
In-Reply-To: <46BE1C56.60508@promwad.com>
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
	<20070810185512.GA4186@codepoet.org>  <46BE1C56.60508@promwad.com>
Message-ID: <1186869672.4742.19.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-08-11 klockan 23:30 +0300 skrev Ivan Kuten:
> >> Any feedback is welcome... once this is tested I think it would be a good
> >> idea to add the whole thing to Buildroot.
> > 
> > Fantastic.  I've merged your patches with very minor changes.
> > It doesnt quite build for me, but hopefully we can get that
> > sorted out soon.  This was clearly a huge undertaking and a
> > true labor of love.  Thanks!
> > 
> 
> Hello,
> 
> $(eval $(call AUTOTARGETS,xlib_liblbxutil)) is not working correctly when applying patches:
> 
>  >>> xlib_liblbxutil 1.0.1 Patching
> 
> (if test -d package/xlib_liblbxutil ; then \
>    if test "" ; then \
>      toolchain/patch-kernel.sh /root/buildroot/build_arm/xlib_liblbxutil-1.0.1 package/xlib_liblbxutil xlib_liblbxutil-1.0.1\*.patch || exit 1 ; \
>    else \
>      toolchain/patch-kernel.sh /root/buildroot/build_arm/xlib_liblbxutil-1.0.1 package/xlib_liblbxutil xlib_liblbxutil\*.patch || exit 1 ; \
>      if test -d package/xlib_liblbxutil/xlib_liblbxutil-1.0.1 ; then \
>        toolchain/patch-kernel.sh /root/buildroot/build_arm/xlib_liblbxutil-1.0.1 package/xlib_liblbxutil/xlib_liblbxutil-1.0.1 \*.patch || exit 1 ; \
>      fi; \
>    fi; \
> fi)
> 
> should be package/x11r7/xlib_liblbxutil
> 
This will help, but will make the "package/Makefile.autotools.in" file
x11r7 specific.




Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in       (revision 19425)
+++ package/Makefile.autotools.in       (arbetskopia)
@@ -145,13 +145,13 @@
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER =
$($(PKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
        $(call MESSAGE,"Patching")
-       (if test -d package/$($(PKG)_NAME) ; then \
-         if test "$(wildcard
package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
-           toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME)
$(NAMEVER)\*.patch || exit 1 ; \
+       (if test -d package/x11r7/$($(PKG)_NAME) ; then \
+         if test "$(wildcard
package/x11r7/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
+           toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME)
$(NAMEVER)\*.patch || exit 1 ; \
          else \
-           toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME)
$($(PKG)_NAME)\*.patch || exit 1 ; \
+           toolchain/patch-kernel.sh $(@D) package/x11r7/$($(PKG)_NAME)
$($(PKG)_NAME)\*.patch || exit 1 ; \
            if test -d package/$($(PKG)_NAME)/$(NAMEVER) ; then \
-             toolchain/patch-kernel.sh $(@D)
package/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
+             toolchain/patch-kernel.sh $(@D)
package/x11r7/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1 ; \
            fi; \
          fi; \
        fi)

Best Regards
Ulf Samuelsson
