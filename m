From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Jun 2019 15:21:27 +0200
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: fix license
 hash
In-Reply-To: <629a1777-181a-2947-8326-918258ce35c0@mind.be>
References: <20190603224039.98733-1-aduskett@gmail.com>
 <629a1777-181a-2947-8326-918258ce35c0@mind.be>
Message-ID: <20190609132127.GC13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Adam, All,

On 2019-06-08 19:03 +0200, Arnout Vandecappelle spake thusly:
> On 04/06/2019 00:40, aduskett at gmail.com wrote:
> > From: Adam Duskett <Aduskett@gmail.com>
> > The new license
>  However, our default version (v1.4) doesn't have this new license... So with
> this patch, it will fail when BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION is
> selected.
> 
>  This is incredibly annoying :-( We can't add both files, since legal-info
> requires the license files to exist. So I'm not sure what we can do about it...
> except maybe set LICENSE_FILES only for the
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION case.

What else can we do?

>  Actually, also LICENSE itself only makes sense when we now the exact version.
> Since it's BSD-licensed, a custom version may just as well be distributed under
> some more restrictive license...

Not realy. The original BSD terms would still apply, but additional ones
might be added. Hence we can't known the exact licensing terms for a
custom version (or from git, or tarball).

>  At the risk of making life complicated :-), I'm pulling Yann into this discussion.

Oh so it has come to this? I'm the guy making things complicated? ;-)

As you said, there is not much we can do about the custom versions. For
all we know, the developpers may have also completely ripped-off the
license text and moved it somewhere else (e.g. to suite whatever their
legal department might have invented).

So, if it were just for me, I'd move all the licensing information into
the conditional code:

    ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
    ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
    ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.txt  # Valid for v1.4
    endif

And be done with it.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > is under license.md not license.rst, which will cause
> > "make legal-info" to fail.
> > 
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> >  boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> > index 394071865e..d67b49cae8 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> >  sha256 6dae02acd85278394bfad6e2683e186e5332a711e4491ac4632ad6480f6e5494 arm-trusted-firmware-v1.4.tar.gz
> > -sha256 487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
> > +sha256 b3eb7d1ad5552ee71bd1031c7db7300d0d184e1236e2cd41fbc1e1e7c76a0e63  license.md
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index 9a23e3d336..f87373ffe6 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -6,7 +6,7 @@
> >  
> >  ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
> >  ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
> > -ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
> > +ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.md
> >  
> >  ifeq ($(ARM_TRUSTED_FIRMWARE_VERSION),custom)
> >  # Handle custom ATF tarballs as specified by the configuration
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
