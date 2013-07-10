From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Jul 2013 19:12:18 +0200
Subject: [Buildroot] [PATCH v2 1/2] linux: install firmware to staging.
In-Reply-To: <20130710091145.7b8529d1@skate>
References: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
 <20130710091145.7b8529d1@skate>
Message-ID: <20130710171218.GC3297@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Spenser, All,

On 2013-07-10 09:11 +0200, Thomas Petazzoni spake thusly:
> On Tue,  9 Jul 2013 12:39:54 -0500, Spenser Gilliland wrote:
> > Install firmware to staging when the hidden option
> > BR2_LINUX_KERNEL_INSTALL_FIRMWARE is selected.  This allows parts of the
> > firmware provided by the linux kernel to be installed in the target.
> > 
> > Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> > Cc: Peter Korsgaard <jacmet@uclibc.org>
> > Cc: Yann E. Morin <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> As discussed on IRC, I'm not really happy with the idea that one
> package (linux) installs things in staging, and then another package
> (beagle-capes) takes what the linux package has installed in staging,
> and copies it to the target. Normally, it's the responsibility of a
> given to package to install its stuff to the final destination.
> Possibly with sub-options in this package to find out what should
> actually be installed.
> 
> So normally, the situation you have should be solved with a Linux
> Kernel package sub-option to select the list of in-kernel firmwares to
> install.

Altenatively, as I suggested before, this could be delegated to a
post-build script:
  - the package (linux) always install its files in staging
  - a post-build scripts cherry-picks what is relevant

What I don't like with this solution is that the Linux kernel would
always install its firmware files, and that people will start using that
as the source of the firmwares, while we do have linux-firmware for
that.

I really can't think of a better approach, considering that:
  - we want to use linux-firmware to install 'standard' firmwares
  - we want the use to be able to install capes' firmwares
  - we do not want to have cross-package build/install procedures (what
    I suggested and Spenser implemented in this patchset)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
