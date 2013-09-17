From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 17 Sep 2013 12:40:48 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <522F8008.1000207@mind.be>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be>
Message-ID: <20130917104048.GA13723@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 10, 2013 at 10:24:40PM +0200, Arnout Vandecappelle wrote:
Hi!

Thanks for the review, it is very instructive.

> >Systemd has been updated to version 206. Eudev v1.2 is forked from this
> >version.
>
>  I don't know if it is important, but I would have split the systemd
> bump from the eudev patch. Or would systemd 44 fail to function with
> eudev?

Next time, I will make a series of patch, but I want to keep eudev and systemd
in sync, as the developpers of eudev do: on Friday September 13th, Systemd
v207 was released and the next day eudev was bumped to 1.3. Systemd v44 is
supposed to be compliant with udev v182, but there is no eudev equivalent for
this version. In order not to provide a broken system, I suggest:

 1) first patch bumps systemd and replaces udev with a virtual package.
 2) second patch adds eudev as a "udev provider".

>  The essential info is that it is standalone. So I would write:
>
> 	  Userspace device daemon. This is a standalone version,
> 	  independent of systemd. It is a fork maintained by Gentoo.
Ack.

>  Since wchar is already required by eudev itself, putting it in the
> comment is redundant.
>
>  Also, we're in the process of standardizing on:
>
> comment "enabling all extras needs a toolchain w/ thread, wchar"
>
> (which fits in the 70-column limit, unlike your version).
Yes! This was annoying me too.

>  IIRC github supports URLs like
> http://github.com/gentoo/eudev/tarball/v1.2.tar.gz

I've found the correct URL:
https://github.com/gentoo/eudev/archive/v1.2.tar.gz
I will use it instead of the git tree.

> >+EUDEV_LICENSE         = GPLv2
>
>  Did the Gentoo people remove the +?

Typo!

> >+if BR2_PACKAGE_SYSTEMD
> >+
> >+config BR2_PACKAGE_SYSTEMD_ACL
> >+	bool "Enable ACL"
> >+	default n
>
>  n is the default, so remove this line (same below).
>
>  Is it really useful to have this option, rather than depending on
> acl automatically when BR2_PACKAGE_ACL is set? Same for some of the
> other config options below.

I was wondering what was the best for the user:

 1) offering him some fine-grained choices.
 2) offering only one "enable all extras" option.

Besides, between Systemd extra feature and ACL, which depends on which?
As a user, I prefer to choose explicitly the features of my system, not having
them activated unknowingly because I selected other packages. Gudev, Gcrypt,
ACL and journal compression can be grouped in "enable all extras", but I'll
keep the journal gateway as a separate option, as adding it to a firmware
image really eat up resources (image size and memory consumption): it is a big
feature. Enabling all extras will select Gudev, Gcrypt, ACL, xz, not the other
way round.

About the patches I provided to have Systemd v206 compile with uClibc:

 1) A truckload of patches for uClibc 0.9.33 has been added in
    055f1c02d35068d0b089f3b29ffdd4fb2717bb5c: some of them are redundant
    with the ones I provided, so I'll clean them up.
 2) For the Signed-off-by thing: I should have read contribute.txt and
    SubmittingPatches from Linux source code more carefully.

> >+SYSTEMD_AUTORECONF = YES
>
>  Please add a comment why this is needed.
I'll see if I can get rid of the reconf step, as well as the build dependency
on libgcrypt caused by AM_PATH_LIBGCRYPT.

> >  SYSTEMD_CONF_OPT += \
> >-	--with-distro=other \
> >+	--with-rootprefix= \
> >+	--with-rootlibdir=/lib \
> >+	--localstatedir=/var \
>
>  Shouldn't that be /run? Or does systemd use ${localstatedir}/run?
I'll check. I use /var in my skeleton.

> >+define SYSTEMD_USERS
> >+	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
> >+	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
>
>  Should that user only be added if
> BR2_PACKAGE_SYSTEMD_JOURNAL_GATEWAY is selected?
I'll split it: I'll add "systemd-journal" by default and
"systemd-journal-gateway" only if the "enable journal gateway" option is
selected.

>  We currently have the reverse: systemd can only be selected if udev
> was selected.  Any specific reason why you change that?  I'm not
> opposed to modifying that, but then the INIT choice should probably
> come before the DEVICE_CREATION option. And it probably should be a
> separate patch.

Yes. I'm in favor of selecting the init system first, then selecting the /dev
management method. Also, the password encoding selection should be put before
selecting the root password.

>  In this case, I would hide the choice if BR2_INIT_SYSTEMD is
> selected. Like so:
>
> choice
>         prompt "/dev management" if !BR2_INIT_SYSTEMD
> 	default BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV if BR2_INIT_SYSTEMD
>         default BR2_ROOTFS_DEVICE_CREATION_STATIC
>
> ...
> endchoice

I tried it, but the problem is that if the "prompt" is hidden, then the
"config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV" variable will not get defined
in the generated ".config": so some packages depending on it will not be
selected.

I want the selection of udev to be explicit to the user, not hidden. That's
why I came up with this solution of providing only one choice for /dev
management when systemd is selected. Maybe a comment will be better...
