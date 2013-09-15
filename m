From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 20:15:15 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <522C5FE6.6000603@free.fr>
References: <CALdGskLJPNgZ+iRokvubyE0FdG=miQHTHsdC56q84pQGcZE7Zw@mail.gmail.com>
 <20130902150405.GB6918@pc-eric>
 <CALdGskLxtMn7uZi1OvXKBS_MMjoCCfnp0ZZNDipDfUESA3Q0-A@mail.gmail.com>
 <522C5FE6.6000603@free.fr>
Message-ID: <20130915201515.7f6963f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sun, 08 Sep 2013 13:30:46 +0200, Eric Le Bihan wrote:

> I posted an update of the systemd package. See '[PATCH 1/1] package:
> udev is now provided by systemd or eudev.' In this version, I added
> libgcrypt has a hard dependency for building Systemd. So it builds in
> any case but it forces journal signature.
> 
> So, for AM_PATH_LIBGCRYPT to be found, you must have libgcrypt among
> SYSTEMD_DEPENDENCIES, but I'd better have journal signature optional,
> with something like:
> 
> ifeq ($(BR2_PACKAGE_SYSTEMD_SIGN_JOURNAL),y)
> 	SYSTEMD_CONF_OPT += --enable-libgcrypt
> else
> 	SYSTEMD_CONF_OPT += --disable-libcgrypt
> endif
> 
> Is there a way in Buildroot to have a library built for the target and
> installed into 'staging', but not installed on the target (apart for
> pruning the files in post-build.sh)?

No, that's not possible in a clean way.

In this situation, I believe the best option is:

 (1) As a temporary measure, take the src/libgcrypt.m4 file from the
 libgcrypt sources, and create a patch that adds it to the m4/
 directory of systemd sources. This way, regardless of whether
 libgcrypt is available or not, the AM_PATH_LIBGCRYPT m4 macro will be
 available for autoreconf to use.

 (2) As a permanent measure, upstream the other systemd patches so that
 ultimately we can get rid of the SYSTEMD_AUTORECONF = YES.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
