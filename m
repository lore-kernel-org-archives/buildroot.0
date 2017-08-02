From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 23:20:07 +0200
Subject: [Buildroot] Buildroot 2017.08-rc1 released
Message-ID: <20170802232007.50a3e5bf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Buildroot 2017.08-rc1, you can download it as a tarball from:

 https://buildroot.org/downloads/buildroot-2017.08-rc1.tar.bz2
 https://buildroot.org/downloads/buildroot-2017.08-rc1.tar.gz

or as usual from our Git repository, using the 2017.08-rc1 tag:

 git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

We've got 1450 changes merged during this cycle, which means we've been
very active, and even more active than the previous cycles (1287
changes and 1218 changes respectively). The changes came from 99
different developers, which is in line with the usual participation
level.

We've got quite a lot of interesting changes in this release:

Infrastructure:

- The skeleton package has been split into multiple packages:
  skeleton-sysv (when Busybox or SysV init are used),
  skeleton-systemd (when systemd is used), skeleton-none (when
  no init system is used) and skeleton-custom (when a custom
  skeleton is used). Those packages, except skeleton-custom,
  share common logic and data in a new package called
  skeleton-common. The skeleton package becomes a virtual
  package. This change allows to generate a filesystem that is
  compliant with systemd expectations.

- Support for using a read-only filesystem with systemd has
  been fixed.

- Major revamp of the gettext handling, with user-visible
  effect:

  - prior to this revamp, when BR2_ENABLE_LOCALE=y, each
    package could decide to enable or not NLS support. When
    BR2_ENABLE_LOCALE was disabled, NLS support was forced off
    by passing --disable-nls to packages.

  - after this revamp, a new BR2_SYSTEM_ENABLE_NLS option
    controls whether NLS support should be enabled or not in
    packages. This option defaults to disabled, which means
    that now, NLS support is by default disabled in all
    packages.

  Therefore, if you need NLS support in packages, you must now
  explicitly enable the BR2_SYSTEM_ENABLE_NLS option.

- The host directory no longer has a usr/ component. This
  makes it much more natural to use that directory as an
  externally used toolchain. For compatibility with existing
  scripts, a link usr -> . is still added.

- Hashes are now checked on tarballs by Buildroot when a
  package is sourced from a Git repository.

- Patches are no longer being downloaded from Github, since
  auto-generated patches could change over time, and break
  hashes. All patches that were downloaded from Github are now
  stored in their respective package directories.

- Hash files in packages can now contain hashes for the
  license files contained in the package source code. This
  allows to detect changes in such license files.

- Binaries in $(TARGET_DIR) are now cleaned up from invalid
  RPATHs at the end of the build.

- A new "make sdk" target prepares $(HOST_DIR) to be
  relocatable: turns RPATHs in host binaries into relocatable
  ones, removes bogus RPATHs from staging binaries/libraries,
  and provides a relocate-sdk script that can be executed to
  relocate the SDK after installation.

- Addition of utils/genrandconfig which generates a random
  configuration based on a set of pre-defined toolchain
  configurations (support/config-fragments/autobuild/) and a
  random selection of packages. It is now used by the
  autobuilders to generate the random configurations.

Filesystems:

- ext2/3/4 filesystems are now generated using mkfs.ext from
  e2fsprogs instead of using genext2fs.

Architecture:

- Addition of support for ARM big.LITTLE variants
- Improved MIPS support, with options to select NaN encoding
  and FP32 mode.

Toolchain:

- Switch to gcc 6.x as the default gcc version, add support
  for gcc 7.x, remove support for gcc 4.8
- Switch to binutils 2.28 as the default binutils version, add
  support for binutils 2.29, remove support for binutils 2.26
- Support added for gdb 8.0
- uClibc-ng bumped to 1.0.26
- CodeSourcery toolchains for x86 and SuperH have been
  removed, they were using a too old glibc version
  (2.17). External toolchains with glibc 2.17 or earlier are
  no longer supported.
- The version selection in the glibc package has been
  removed. Like musl and uClibc-ng, we now use the latest
  glibc version.
- Improved support for Xtensa toolchain overlays, which can
  now be downloaded.

Tools:

- Numerous improvements to the runtime test infrastructure
- Tests are now executed by Gitlab CI on a regular basis
- Tools that are directly useful to the user have been moved
  from support/scripts/ to utils/: brmake, check-package,
  get-developers, scancpan, scanpipy, size-stats-compare,
  test-pkg.

New defconfigs: A13 Olinuxino, Engicam platforms (i.CoreM6
Solo/Dual/DualLite/Quad, RQS SOM, GEAM6UL SOM, Is.IoT MX6UL
SOM), Nano Pi M1 (Plus), OrangePi Zero and Plus.

New packages: azure-iot-sdk-c, cracklib, dt-utils, easy-rsa,
erlang-jiffy, erlang-p1-oauth2, erlang-p1-xmpp,
ifupdown-scripts, irrlicht, kodi-inputstream-adaptive,
kodi-inputstream-rtmp, kvazaar, let-me-create, libloki,
libpwquality, libressl, libspatialindex, libva-utils,
linuxconsoletools, linuxptp, luaossl, lua-sdl2, lua-stdlib,
lsscsi, paxtest, pcre2, pixz, python-asn1crypto,
python-backports-shutil-get-terminal-size, python-bcrypt,
python-cheroot, python-h2, python-hpack, python-hyperframe,
python-hyperlink, python-ipython-genutils, python-pathlib2,
python-pickleshare, python-priority, python-portend,
python-scandir, python-systemd, python-tempora,
python-traitlets, python-typepy, qt5virtualkeyboard,
ratpoison, rauc, refpolicy, rhash, sdl2_mixer, sdl2_net,
xr819-xradio, zstd

Removed packages: cloog, input-tools, mke2img

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.08-rc1

Many thanks to the people contributing to this release:

git shortlog -s -n 2017.05..

   274  Bernd Kuhls
   196  Thomas Petazzoni
   120  Arnout Vandecappelle
    85  Vicente Olivert Riera
    76  Peter Korsgaard
    75  Yann E. MORIN
    69  Baruch Siach
    51  Adam Duskett
    41  Yegor Yefremov
    39  Romain Naour
    30  Fabio Estevam
    22  Andrey Smirnov
    22  J?rg Krause
    19  Peter Seiderer
    18  Johan Oudinet
    17  Martin Bark
    17  Ricardo Martincoski
    14  Eric Le Bihan
    14  Waldemar Brodkorb
    13  Francois Perrad
    12  Bartosz Golaszewski
    12  Wolfgang Grandegger
    10  Rahul Bedarkar
     9  Adri?n P?rez de Castro
     9  Carlos Santos
     9  Martin Kepplinger
     8  Luca Ceresoli
     7  Fabrice Fontaine
     7  Jagan Teki
     6  Andr? Hentschel
     6  Beno?t Allard
     6  Marcin Niestroj
     6  Sergey Matyukevich
     5  Angelo Compagnucci
     5  Chakra Divi
     5  Matt Weber
     5  Maxime Hadjinlian
     4  Alexandre Esse
     4  Andrey Yurovsky
     4  David Lechner
     4  Max Filippov
     4  Samuel Martin
     4  Stefan S?rensen
     3  Alistair Francis
     3  Christian Stewart
     3  Frank Hunleth
     3  Hugues Fruchet
     3  Joel Stanley
     3  Koen Martens
     3  Ludovic Desroches
     3  Marcus Hoffmann
     3  Mario Rugiero
     3  S?bastien Szymanski
     3  Thomas De Schampheleire
     2  Alexander Dahl
     2  Alexey Roslyakov
     2  Calin Crisan
     2  Erico Nunes
     2  Gary Bisson
     2  Joshua Henderson
     2  Julien Viard de Galbert
     2  Markus Mayer
     2  Naoki Matsumoto
     1  Andre Renaud
     1  Antony Pavlov
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Ben Leinweber
     1  Bradford Barr
     1  Charles Hardin
     1  Christophe PRIOUZEAU
     1  Clayton Shotwell
     1  Corentin GUILLEVIC
     1  Dmitrii Kolesnichenko
     1  Evgeniy Didin
     1  Ga?l PORTAY
     1  Gon?alo Salazar
     1  Graham Holland
     1  Guilherme G. Piccoli
     1  Gwenhael Goavec-Merou
     1  Jens Maus
     1  Keguang Zhang
     1  Lothar Felten
     1  Marcin Nowakowski
     1  Matthew Shyu
     1  Micha? ?yszczek
     1  Oleksandr G Zhadan
     1  Olivier Schonken
     1  Petar Koretic
     1  Petr Kulhavy
     1  Petr Vorel
     1  Philippe Reynes
     1  Rodrigo Rebello
     1  Ryan Coe
     1  Sam Mendoza-Jonas
     1  Sam Voss
     1  Thomas Claveirole
     1  Tobias Blass
     1  Venkateswara Rao Mandela
     1  Vincent Stehl?

And a special thanks to our patch reviewers:

git log 2017.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     64 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     31 "Yann E. MORIN" <yann.morin.1998@free.fr>
     22 Yegor Yefremov <yegorslists@googlemail.com>
     16 Romain Naour <romain.naour@smile.fr>
      6 Romain Naour <romain.naour@gmail.com>
      4 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      4 Peter Seiderer <ps.report@gmx.net>
      3 Yann E. MORIN <yann.morin.1998@free.fr>
      3 Matt Weber  <matthew.weber@rockwellcollins.com>
      3 Alistair Francis <alistair.francis@xilinx.com>
      2 Matt Weber <matthew.weber@rockwellcollins.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Jagan Teki <jagan@amarulasolutions.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Fabio Estevam <festevam@gmail.com>
      1 Carlos Santos <casantos@datacom.ind.br>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Andreas F?rber <afaerber@suse.de>
      1 "Adrian Perez de Castro" <aperez@igalia.com>

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2017.08 is released.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
