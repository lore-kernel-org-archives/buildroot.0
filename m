From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 21 Dec 2009 23:51:11 +0100
Subject: [Buildroot] BR + CT-NG integration
Message-ID: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Here's what I retained from the crosstool-NG perspective. Feel to correct
me, and add any omissions. For those of you that received my initial
report, I've updated it a bit to match how crosstool-NG evolved in the
meantime.


First, it should be made globally easy for buildroot to ultimately make
use of crosstool-NG in either one of those ways:

- rely on user-supplied external toolchain, built with crosstool-NG

  AFAICS, this is currently mostly working, even if some configuration
  items should be reviewed to make it work seamlessly.
  It was also pointed out that some of the toolchain options should be
  made easily available to buildroot (such as endianness, networking
  support (IPv4, IPv6)...). I think that this is easily achievable,
  provided the list of options is known.

- internally use crosstool-NG to build the needed toolchain for the
  configured target platform

  In this respect, the idea that was suggested was to have the needed
  CT-NG configuration files for each target, bundled with buildroot.
  buildroot already brings in .config files for the kernel and uClibc
  in its target/ tree, so adding a crosstool-Ng .config file should pose
  no big issue. We could also think of a generic.config, with target-
  specific value overriding the defaults.
  That would also requires the same option-retrieval ability as described
  above.


Second, it should be noted that the current set of architectures supported
by buildroot differs from the set currently supported by crosstool-NG.

In order to completely replace the internal toolchain steps from buildroot,
the needed architectures should be first "ported" to crosstool-NG. It should
be fairly easy for "main" targets, while others may require tweaking and
heavy patching.

Here's a summary of supported architectures, side-by-side. Features marked
with '(X)' are considered eXperimental in crosstool-NG, and are in need of
being confirmed.

arch            buildroot       crosstool-NG
--------------------------------------------
alpha . . . . . . . . . . . . . Y
arm.  . . . . . Y  BE/LE. . . . Y  BE/LE, (X: Thumb + I/W)
avr32 . . . . . Y . . . . . . . Y   (X)
cris. . . . . . Y . . . . . . . .
i386. . . . . . Y . . . . . . . Y  (x86)
ia64. . . . . . . . . . . . . . Y   (X)
mips. . . . . . Y  BE/LE. . . . Y  BE/LE
powerpc . . . . Y . . . . . . . Y  (ppc)
powerpc64 . . . . . . . . . . . Y  (ppc) (X)
s390/s390x. . . . . . . . . . . Y   (X)
superh. . . . . Y . . . . . . . Y
superh64. . . . Y . . . . . . . .
sparc . . . . . Y . . . . . . . .
sparc64 . . . . Y . . . . . . . .
x86_64. . . . . Y . . . . . . . Y  (x86)
xtensa. . . . . Y . . . . . . . .

So, on the overall, it's not that bad. Crosstool-NG brings in four archs
that buildroot has no support for, while it is missing five archs. For
some archs, some work in CT-NG is still needed to support some variants.

crosstool-NG and buildroot differ in the way the arch is selected:
 - bitness/endianness:
   - buildroot   : different archs (eg. arm/armeb, i386/x86_64)
   - crosstool-NG: variant of a common arch (eg. arm BE/LE, x86 32/64)
 - variants:
   - buildroot   : choice menu (eg. armv4, armv5t...)
   - crosstool-NG: user-supplied value (-march. -mcpu, -mfpu...)

That's not a big issue, but keeping an up-to-date and functional choice
menu proved a bit cumbersome, so I'd rather keep it that way (it's easy
to man gcc and pick a fitting value).


Third, as stated in my previous post, we need find a correct timing for
releases. Switching for crosstool-NG to a 3-month cycle seems adequate,
if a bit tight. Also, releasing crosstool-NG one month ahead of buildroot
allows for at least one maintenance release prior to a stable release of
buildroot, if needed.


Well, that's all for the moment. I think we should now prepare a plan to
prepare for the migration.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
