From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Sep 2017 01:46:11 +0200
Subject: [Buildroot] Buildroot 2017.08 released
Message-ID: <87y3pyoud8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2017.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

This was another big development cycle with close to 1600 changes all
over the tree and more than 100 unique contributors! I'm very happy to
see so many "new" people next to the "oldtimers".

Of noteworthy new features/changes we have:

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

Removed packages: cloog, input-tools, mke2img, simicfs

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2017.08

Many thanks to the people contributing to this release:

git shortlog -s -n 2017.05..

   299	Bernd Kuhls
   222	Thomas Petazzoni
   127	Arnout Vandecappelle
    85	Vicente Olivert Riera
    85	Yann E. MORIN
    83	Baruch Siach
    81	Peter Korsgaard
    51	Adam Duskett
    41	Yegor Yefremov
    40	Romain Naour
    32	Fabio Estevam
    26	Andrey Smirnov
    24	J?rg Krause
    22	Peter Seiderer
    22	Waldemar Brodkorb
    19	Johan Oudinet
    19	Ricardo Martincoski
    17	Martin Bark
    15	Francois Perrad
    14	Eric Le Bihan
    12	Bartosz Golaszewski
    12	Wolfgang Grandegger
    11	Adri?n P?rez de Castro
    10	Rahul Bedarkar
     9	Carlos Santos
     9	Martin Kepplinger
     8	Luca Ceresoli
     7	Fabrice Fontaine
     7	Jagan Teki
     6	Andr? Hentschel
     6	Angelo Compagnucci
     6	Beno?t Allard
     6	Marcin Niestroj
     6	Sergey Matyukevich
     5	Chakra Divi
     5	Matt Weber
     5	Maxime Hadjinlian
     5	Samuel Martin
     4	Alexandre Esse
     4	Andrey Yurovsky
     4	Cam Hutchison
     4	David Lechner
     4	Marcus Hoffmann
     4	Max Filippov
     4	Stefan S?rensen
     3	Alistair Francis
     3	Christian Stewart
     3	Erico Nunes
     3	Frank Hunleth
     3	Gary Bisson
     3	Hugues Fruchet
     3	Joel Stanley
     3	Joshua Henderson
     3	Koen Martens
     3	Lothar Felten
     3	Ludovic Desroches
     3	Mario Rugiero
     3	S?bastien Szymanski
     3	Thomas De Schampheleire
     2	Alexander Dahl
     2	Alexey Roslyakov
     2	Calin Crisan
     2	Julien Viard de Galbert
     2	Kurt Van Dijck
     2	Marcin Nowakowski
     2	Markus Mayer
     2	Naoki Matsumoto
     2	Ryan Coe
     1	Andre Renaud
     1	Antony Pavlov
     1	Arnout Vandecappelle (Essensium/Mind)
     1	Ben Leinweber
     1	Bin Meng
     1	Bradford Barr
     1	Charles Hardin
     1	Christophe PRIOUZEAU
     1	Clayton Shotwell
     1	Corentin GUILLEVIC
     1	Dagg Stompler
     1	Dmitrii Kolesnichenko
     1	Evgeniy Didin
     1	Ga?l PORTAY
     1	Gon?alo Salazar
     1	Graham Holland
     1	Guilherme G. Piccoli
     1	Gwenhael Goavec-Merou
     1	Jens Maus
     1	Jerome Oufella
     1	Julien BOIBESSOT
     1	Keguang Zhang
     1	Luis Araneda
     1	Matthew Shyu
     1	Micha? ?yszczek
     1	Oleksandr G Zhadan
     1	Olivier Schonken
     1	Petar Koretic
     1	Petr Kulhavy
     1	Petr Vorel
     1	Philippe Reynes
     1	Rodrigo Rebello
     1	Sam Mendoza-Jonas
     1	Sam Voss
     1	Sergio Prado
     1	Stefan Becker
     1	Thomas Claveirole
     1	Tobias Blass
     1	Venkateswara Rao Mandela
     1	Vincent Stehl?

And a special thanks to our patch reviewers:

git log 2017.05.. | grep -Ei '(reviewed|acked)-by:' | \
    sed 's/.*by: //' | sort | uniq -c | sort -n -r

     67 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
     43 "Yann E. MORIN" <yann.morin.1998@free.fr>
     23 Yegor Yefremov <yegorslists@googlemail.com>
     16 Romain Naour <romain.naour@smile.fr>
      8 Romain Naour <romain.naour@gmail.com>
      5 Matt Weber  <matthew.weber@rockwellcollins.com>
      4 Ricardo Martincoski <ricardo.martincoski@gmail.com>
      4 Peter Seiderer <ps.report@gmx.net>
      3 Alistair Francis <alistair.francis@xilinx.com>
      1 Luca Ceresoli <luca@lucaceresoli.net>
      1 Jagan Teki <jagan@amarulasolutions.com>
      1 Gary Bisson <gary.bisson@boundarydevices.com>
      1 Fabio Estevam <festevam@gmail.com>
      1 Carlos Santos <casantos@datacom.ind.br>
      1 Baruch Siach <baruch@tkos.co.il>
      1 Andreas F?rber <afaerber@suse.de>
      1 "Adrian Perez de Castro" <aperez@igalia.com>

Once again our autobuilders have helped us fix a huge amount of build
issues. Thanks to all the people reviewing failures and fixing issues:

for i in $(git log --format=%H 2017.05..); do \
    git show --quiet $i | grep -q http://autobuild && \
    git show --quiet --format="%an" $i ; done | sort | uniq -c | \
        sort -rn -k1

    44 Bernd Kuhls
     33 Thomas Petazzoni
     25 Baruch Siach
     21 Romain Naour
      6 J?rg Krause
      4 Waldemar Brodkorb
      4 Peter Seiderer
      3 Yegor Yefremov
      3 Peter Korsgaard
      3 Johan Oudinet
      3 Bartosz Golaszewski
      2 Yann E. MORIN
      2 Joshua Henderson
      2 Carlos Santos
      2 Alistair Francis
      1 Thomas Claveirole
      1 Stefan S?rensen
      1 Samuel Martin
      1 Rahul Bedarkar
      1 Matt Weber
      1 Martin Bark
      1 Marcin Nowakowski
      1 Koen Martens
      1 Keguang Zhang
      1 Julien Viard de Galbert
      1 Jerome Oufella
      1 Hugues Fruchet
      1 Gwenhael Goavec-Merou
      1 Francois Perrad
      1 Eric Le Bihan
      1 Arnout Vandecappelle
      1 Andr? Hentschel
      1 Alexandre Esse

The next release will be 2017.11. Expect the first release candidate at
the beginning of November and the final release at the end of the month.

This release will be supported with security and other important fixes
until 2017.11 is out. If you need longer support then consider using our
long term support release (2017.02.x) instead which will be supported
until 2018.02.

-- 
Bye, Peter Korsgaard
