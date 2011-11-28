From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 28 Nov 2011 10:39:43 -0500
Subject: [Buildroot] [PATCH] mingetty: add package
In-Reply-To: <87ipm6iq74.fsf@macbook.be.48ers.dk>
References: <1322082860-12704-1-git-send-email-twoerner@gmail.com>
 <87ipm6iq74.fsf@macbook.be.48ers.dk>
Message-ID: <CAHUNapQg56jACLC+Px8Bgm5V1f--piR6cBE5yfrAp8Jykc+Rtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for having a look at my patch.

On Sat, Nov 26, 2011 at 3:28 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> ?Trevor> +MINGETTY_SITE ? ?= http://downloads.sourceforge.net/project/mingetty/mingetty/$(MINGETTY_VERSION)
>
> Use the mirror support we have

Thanks, I wasn't sure how to use it.

> ?Trevor> +
> ?Trevor> +# Override sysvinit's implementations if it is enabled.
>
> sysvinit doesn't contain a getty implementation. What you mean is that
> you want to run after sysvinit so it doesn't overwrite your inittab.

Yes, that's correct.

> ?Trevor> +define MINGETTY_INSTALL_TARGET_CMDS
> ?Trevor> + ? ? ?$(INSTALL) -D -m 0755 $(@D)/mingetty $(TARGET_DIR)/sbin
> ?Trevor> + ? ? ?$(INSTALL) -D -m 0644 package/mingetty/inittab $(TARGET_DIR)/etc/inittab
>
> Please don't do that. People might have a custom inittab (I know
> sysvinit does so as well, but as the syntax is different than busybox's
> there isn't really much else it can do).

Okay, no problem. [I had actually used inittab as the template upon
which I based this new package, so that's why I was doing the same as
it was doing.]

> The nicest thing would be instead to replace /sbin/getty with
> /sbin/mingetty in the existing inittab, but as mingetty doesn't handle
> the same arguments as busybox getty, this gets quite tricky.
>
> ?Trevor> diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
> ?Trevor> index 4185202..5ce1447 100644
> ?Trevor> --- a/target/generic/Makefile.in
> ?Trevor> +++ b/target/generic/Makefile.in
>
> And drop this.

I'm confused by this last request. If the nicest thing to do would be
to replace /sbin/getty with /sbin/mingetty wouldn't my modification to
target/generic/Makefile.in be the way to go about it?

I have copied my original modifications to target/generic/Makefile.in below:

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..5ce1447 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -23,6 +23,11 @@ target-generic-getty-sysvinit:
       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo
$(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L
$(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
               $(TARGET_DIR)/etc/inittab

+# Set the getty to mingetty
+target-generic-getty-mingetty:
+       $(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo
$(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/mingetty --noclear
$(TARGET_GENERIC_GETTY) #~' \
+               $(TARGET_DIR)/etc/inittab
+
 # Find commented line, if any, and remove leading '#'s
 target-generic-do-remount-rw:
       $(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
@@ -40,7 +45,9 @@ TARGETS += target-generic-issue
 endif

 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+ifeq ($(BR2_PACKAGE_MINGETTY),y)
+TARGETS += target-generic-getty-mingetty
+else ifeq ($(BR2_PACKAGE_SYSVINIT),y)
 TARGETS += target-generic-getty-sysvinit
 else
 TARGETS += target-generic-getty-busybox
