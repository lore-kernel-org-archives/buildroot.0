From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 17 Apr 2013 17:40:30 +0800
Subject: [Buildroot] [PATCH v5 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <20130417105615.7af600cd@skate>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-6-git-send-email-sonic.adi@gmail.com>
 <20130416232925.759eb9df@skate>
 <CAJxxZ0PoEysfHc23PHfqkVktvoGiQoDBNd+-z3PTOL40=Zfwhg@mail.gmail.com>
 <20130417100512.5433f4c6@skate>
 <CAJxxZ0NHZM75Nctd6fy-9K8t1jf1hdKiTXn+0aR9E2qB=R+LVA@mail.gmail.com>
 <20130417105615.7af600cd@skate>
Message-ID: <CAJxxZ0MFoAf1YrKfbjUt5BW8Pd=uX1NxTN9EgYvfHiM-g1uZgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Wed, Apr 17, 2013 at 4:56 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Sonic Zhang,
>
> On Wed, 17 Apr 2013 16:16:21 +0800, Sonic Zhang wrote:
>
> > > # When the FDPIC binary format is used, we force the installation
> > > # of the corresponding libraries. When a different binary format is
> > > # used, we offer the option of installing the FDPIC shared libraries
> > > # (typically in addition to the FLAT shared ones).
> > > config BR2_BFIN_INSTALL_FDPIC_SHARED
> > >         bool "Install FDPIC shared libraries" if !BR2_BINFMT_FDPIC
> > >         default y if BR2_BINFMT_FDPIC
> > >         help
> > >           ...
> >
> > Because current library installation scripts in
> > toolchain-external/ext-tool.mk always install FDPIC libraries when
> > BINFMT_FDPIC is selected. No necessary to set
> > BR2_BFIN_INSTALL_FDPIC_SHARED y in this case.
>
> Ok. But then why do we have to duplicate this code in ext-tool.mk. If
> it already has the code to copy the FDPIC libraries when FDPIC is
> selected as the primary binary format, we should be able to re-use this
> code when FLAT shared is used as the primary binary format, but we want
> the FDPIC libraries to be installed in addition.
>

Yes, I do reuse the function copy_toolchain_lib_root() in the code to
install shared FDPIC libraries when FLAT format is selected. But, rest part
of the library installation code depends on current TOOLCHAIN_EXTERNAL_CC,
which is different from the FDPIC one in this case. And the following
sysroot to staging installation code depends on macro SYSROOT_DIR,
ARCH_SYSROOT_DIR, ARCH_SUBDIR, ARCH_LIB_DIR and SUPPORT_LIB_DIR, which are
based on current TOOLCHAIN_EXTERNAL_CC as well.

I feel the individual FDPIC installation code for FLAT format is a simple
and clear solution.

Regards,

Sonic
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130417/dfddaa42/attachment.html>
