From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Mar 2012 10:14:21 +0100
Subject: [Buildroot] [PATCH 4/6] Rework of the init system
In-Reply-To: <201203200045.18897.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 20 Mar 2012 00:45:18 +0100")
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <a9e780200fae5528ff46ffb3ff5351fc1a57ff84.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200045.18897.arnout@mind.be>
Message-ID: <878vivljma.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout> On Monday 19 March 2012 16:59:38 Maxime Ripard wrote:
 >> +choice
 >> +       prompt "Init system"
 >> +       default BR2_INIT_BUSYBOX
 >> +       help
 >> +         To select systemd, you first need to have dbus and udev enabled
 Arnout>  Only udev.  Anyway, the help text of a choice is never shown, so
 Arnout> this won't work.  I don't know if it's possible to add comments in a
 Arnout> choice, but that would be the way to go.

It is (it didn't used to be, but I fixed it a while ago). We have an
example in the ARM subarch selection for Cortex A8/A9.


 >> +
 >> +config BR2_INIT_BUSYBOX
 >> +       bool "Busybox init"
 >> +       select BR2_PACKAGE_BUSYBOX
 >> +
 >> +config BR2_INIT_SYSV
 >> +       bool "Use systemV init"
 >> +       select BR2_PACKAGE_SYSVINIT
 >> +
 >> +config BR2_INIT_SYSTEMD
 >> +       bool "Use systemd"
 >> +       select BR2_PACKAGE_DBUS
 >> +       depends on BR2_PACKAGE_UDEV
 Arnout>  Would it be an option to make this a select 
 Arnout> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV instead?  (With a depends
 Arnout> on LARGEFILE and WCHAR, of course.)  Or is that a bad idea?

The option should depend on LARGEFILE/WCHAR/IPV6 and then indeed select
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV. If those deps are not available
a comment should be shown, similar to how we do it for
BR2_PACKAGE_XSERVER_xorg.


 Arnout>  The latter two selects are only possible if 
 Arnout> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected.  The select/depends 
 Arnout> combination breaks the dependency of BR2_PACKAGE_SYSVINIT and
 Arnout> BR2_PACKAGE_SYSTEMD on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.  So the
 Arnout> systemd package will be selected, but it's not visible to the user.

 Arnout>  Of course, there's nothing strictly wrong with that.  It's just
 Arnout> a bit strange.

I think stating that busybox has an alternative for systemd is
stretching the BUSYBOX_SHOW_OTHERS notion a bit. Perhaps we should just
move systemd outside the conditional?


 Arnout>  Clearly, adding a select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS here
 Arnout> is a bad idea.  I also don't like much to add a dependency on
 Arnout> it either.  So instead, I propose to move sysvinit and systemd
 Arnout> out of the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS condition (in
 Arnout> package/Config.in).

.. Like you suggest here ;)

-- 
Bye, Peter Korsgaard
