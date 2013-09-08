From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 08 Sep 2013 13:30:46 +0200
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <CALdGskLxtMn7uZi1OvXKBS_MMjoCCfnp0ZZNDipDfUESA3Q0-A@mail.gmail.com>
References: <CALdGskLJPNgZ+iRokvubyE0FdG=miQHTHsdC56q84pQGcZE7Zw@mail.gmail.com>
 <20130902150405.GB6918@pc-eric>
 <CALdGskLxtMn7uZi1OvXKBS_MMjoCCfnp0ZZNDipDfUESA3Q0-A@mail.gmail.com>
Message-ID: <522C5FE6.6000603@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 07/09/2013 18:52, Olivier Schonken a ?crit :

> I first tried to apply your patch to buildroot 2013.08.  Only when I
> comment out 'SYSTEMD_AUTORECONF = YES' and not apply
> 'systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch' do
> I get it to build successfully.

Yep, The 'patch
systemd-0005-core-fixed-ms-sscanf-modifier-not-being-available-in.patch'
replaces the use of the dynamic allocation conversion modifier %m when
using uClibc, as it is not implemented in it. You manage to build it
because you are using the Code Sourcery toolchain, which comes with glibc.

I made a mistake saying I had not seen the issue after removing
libgcrypt11-dev from my development machine: I had forgotten to perform
a proper clean of my environment ("D'Oh!").

See https://github.com/elebihan/buildroot/blob/udev-provider/ for a
Systemd on ARM with external toolchain configuration
(configs/elebihan_demo_systemd_arm_defconfig).

I posted an update of the systemd package. See '[PATCH 1/1] package:
udev is now provided by systemd or eudev.' In this version, I added
libgcrypt has a hard dependency for building Systemd. So it builds in
any case but it forces journal signature.

So, for AM_PATH_LIBGCRYPT to be found, you must have libgcrypt among
SYSTEMD_DEPENDENCIES, but I'd better have journal signature optional,
with something like:

ifeq ($(BR2_PACKAGE_SYSTEMD_SIGN_JOURNAL),y)
	SYSTEMD_CONF_OPT += --enable-libgcrypt
else
	SYSTEMD_CONF_OPT += --disable-libcgrypt
endif

Is there a way in Buildroot to have a library built for the target and
installed into 'staging', but not installed on the target (apart for
pruning the files in post-build.sh)?
