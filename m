From: Ormund Williams <ormundw@panix.com>
Date: Thu, 03 Dec 2009 17:26:28 -0500
Subject: [Buildroot] Qt fails to build
In-Reply-To: <87ocn3y40l.fsf@macbook.be.48ers.dk>
References: <1257367062.3465.51.camel@station1.ormlab.com>
	<87ocn3y40l.fsf@macbook.be.48ers.dk>
Message-ID: <1259879188.1750.47.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2009-11-15 at 20:36 +0100, Peter Korsgaard wrote:
> >>>>> "Ormund" == Ormund Williams <ormundw@panix.com> writes:
> 
>  Ormund> Hi All,
>  Ormund> I did a git pull this morning and now I get this error, no change to
>  Ormund> the .config file:
> 
>  Ormund> Creating qmake. Please wait...
>  Ormund> make[1]: Entering directory .../buildroot/output/build/qt-embedded-linux-opensource-src-4.5.2/qmake'
>  Ormund> g++: @: No such file or directory
>  Ormund> make[1]: *** [project.o] Error 1
> 
> Hmm, it builds here - Could you post your .config?
> 
If I undo this change:

commit: 03bdf67f438ad66a652e860474fc65b9342656f2
Tested with 4.5.2.

Signed-off-by: Michael Roth <mroth@nessie.de>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 77e7f1a..6fe122c 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -17,10 +17,6 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-# BUG: There is a workaround below (search for x86x86fix) for
-# x86 crosscompiling under linux x86. Please remove it when the
workaround
-# is no longer necessary.
-
 QT_VERSION:=4.5.2
 QT_CAT:=$(BZCAT)
 
@@ -329,17 +325,6 @@ endif
 QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,
$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
-# x86x86fix
-# Workaround Qt Embedded bug when crosscompiling for x86 under x86 with
linux
-# host. It's unclear if this would happen on other hosts.
-ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
-ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
-QT_CONFIGURE+= -platform linux-g++
-QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
-endif
-endif
-# End of workaround.
-
 # Figure out what libs to install in the target
 QT_LIBS=#empty
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)

qt builds. It seems that the x86 fix is still required and still seems
to be required with 4.5.3.

-- 
Ormund Williams
OrmLab LLC
