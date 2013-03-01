From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 11:18:56 +0100
Subject: [Buildroot] [PATCH] opkg: Add option to enable package
 verification support with GnuPG
In-Reply-To: <2380880.Y2Uig4QfWB@arawn>
References: <64891469.UzFDExKfyb@arawn> <20130228153819.57a2c5ae@skate>
 <2380880.Y2Uig4QfWB@arawn>
Message-ID: <20130301111856.4753d13b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philipp Claves,

Please keep the Buildroot list posted for this discussion. Thanks!

On Fri, 01 Mar 2013 10:55:44 +0100, Philipp Claves wrote:

> > Thanks, they look (almost) good! Could you submit them, one mail per
> > patch, preferably using git send-email?
> Never used that and having my mail server password (--smtp-pass) logged in 
> .bash_history does not sound too appealing. Is there a good reason to use it?

You don't have to put your password on the command line. You can put
your password in ~/.gitconfig:

[sendemail]
smtppass = foobar

and of course make this file 600.

Another solution is to install msmtp, and then tell git to use it. In
this case, you have your SMTP password in the msmtp configuration file,
~/.msmtprc, which should be 600.

There are good reasons to use git send-email.

 * It allows to send the patches inline instead of as attachements.
   This is something most open-source communities want, because it
   allows anyone to hit the "Reply" button and make some review
   comments inline. See
   http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L219.

 * When sent inline, many e-mail clients wrap the lines, or do some
   funk replacement of tabs with spaces or stuff like that, which makes
   your patch impossible to apply.

 * When sent inline, one patch per e-mail, all patches get
   automatically picked up by our Patchwork tracking system. For now,
   only your last patch has been seen by Patchwork:
   http://patchwork.ozlabs.org/patch/223967/.

So really: one e-mail per patch, and patch inline. And to achieve that,
git send-email is the best solution.

> > On libassuan, please wrap the help text, and add a final newline at the
> > end of the .mk file.
> 80 columns in 2013? Anyway, it will be fixed.

Yes, 80 columns in 2013. The help text gets displayed in "menuconfig",
it isn't wrapped automatically by menuconfig and we want it to fit on
reasonably sized windows.

I guess all good text editors know how to automatically wrap stuff at
~80 columns, so it's just a matter of hitting a keystroke.

> > On libgpgme, please wrap the help text, add the final newline at the
> > end of the .mk file.
> Will be fixed.

Thanks.

> > The --with-gpg=/usr/bin/gpg doesn't look very
> > good. gpg is not a mandatory dependency of Buildroot, so if libgpgme
> > really needs gpg, then we should build host-gnupg I guess. But does it
> > really need it? Can you detail this --with-gpg option? Or maybe it's
> > just the path where gpg will be installed on the target? If it's the
> > case, then maybe a comment would be appropriate to clarify this.
> It is the install path on the target. Will add a comment.

Ok, thanks.

> > In the opkg patch, in the .mk file, you should use
> > BR2_PACKAGE_OPKG_GPG_SIGN in your condition rather than
> > BR2_PACKAGE_LIBGPGME.
> Oops, this is a leftover from testing. Will be fixed.

Perfect.

> 
> > Also, in your Config.in, you add GNUPG as a
> > dependency, but it is not listed in the .mk file. This is sometimes
> > correct if it is only a runtime dependency, in which case we usually
> > put a comment in the Config.in just above the corresponding select line.
> The dependencies are a little strange. Neither the libs nor opkg actually 
> require gnupg to build, but libgpgme and therefore opkg signature support 
> don't work without the binary in place. libassuan is standalone.
> 
> My solution is to hide (depends on) libgpgme if gnupg is not selected (because 
> it makes no sense without), but force gpg and libgpgme on if you want opkg 
> signature support. This option is intended as a user friendly way to select 
> all you need for it.
> 
> As an alternative it would be possible to make libgpg always visible and let 
> it automatically select gnupg.

If libgpgme practically cannot operate without /usr/bin/gpg being
present, then I would do:

config BR2_PACKAGE_LIBGPGME
	[...]
	# gnupg needed at runtime, but not a build dependency
	select BR2_PACKAGE_GNUPG

This way, if one day some other package uses libgpgme, it will
automatically ensure that gnupg is built/installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
