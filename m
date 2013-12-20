From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Dec 2013 23:27:55 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem/providers
Message-ID: <cover.1387578401.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series is a third attempt at trying to fix the BR2_EXTERNAL issue,
in that packages in BR2_EXTERNAL can't be providers of an implementation
for a virtual package, such as libegl.

The basic idea behind this series is that Arnout found it ugly that
virtual packages had to each be aware of all their possible providers.
For example, libegl.mk had four conditional dependencies, one for each
of the builtin providers (freescale's vivante, rpi, TI's gfx, or
Allwinner's sunxi mali).

This would prohibit a package in BR2_EXTERNAL to provide another
implementation (eg. with an in-house proprietary, non-public package),
since the virtual package's rules were evaluated even before we had
a chance to parse BR2_EXTERNAL, and thus either requiring the new
dependency to be added to the virtual package (hence defeating one
of the selling-point of BR2_EXTERNAL0, or not allow external packages
to provides implementations (hence killing that same selling-point of
BR2_EXTERNAL as well).

So, Arnout suggested (and I was already working on it) that packages
would declare themselves as providers, all in a single Kconfig variable,
so the virtual package would just have to depend on that single,
Kconfig-set variable.

This is what this series does for each virtual packages:
  - moves the virtual package definition to its own Config.in
  - introduces the string option BR2_PACKAGE_PROVIDES_xxxx
  - changes all providers to default that variable to thier own name

for each of: opengl-egl, opengl-es, openmax, openvg, and powervr.

If anyone is feeling like writing a blurb in the manual, just feel free
to go ahead and add a section about virtual packages! ;-p


Changes v1 -> v2:
  - use qstrip when setting *_DEPENDENCIES  (Thomas)
  - convert jpeg and cryptodev  (Thomas, Gustavo)


Regards,
Yann E. MORIN.


The following changes since commit 2746158497cdaf80a5b85584e3972857ac2e7e82:

  util-linux: Add config switches for some more binaries (2013-12-20 22:45:31 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/providers

for you to fetch changes up to de12afe6412691eab4a049309636aa6bd627dd60:

  package/cryptodev: switch to package-defined providers (2013-12-20 23:17:18 +0100)

----------------------------------------------------------------
Yann E. MORIN (7):
      package/opengl/libegl: switch to package-defined providers
      package/opengl/libgles: switch to package-defined providers
      package/opengl/libopenvg: switch to package-defined providers
      package/opengl/libopenmax: switch to package-defined providers
      package/powervr: switch to package-defined providers
      package/libjpeg: switch to package-defined providers
      package/cryptodev: switch to package-defined providers

 package/bellagio/Config.in                       |  7 +++++++
 package/cryptodev/Config.in                      |  5 +++++
 package/cryptodev/cryptodev.mk                   |  9 +--------
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |  6 ++++++
 package/jpeg/Config.in                           |  5 +++++
 package/jpeg/jpeg.mk                             |  9 +--------
 package/opengl/Config.in                         | 15 ++++-----------
 package/opengl/libegl/Config.in                  |  6 ++++++
 package/opengl/libegl/libegl.mk                  | 17 +----------------
 package/opengl/libgles/Config.in                 |  6 ++++++
 package/opengl/libgles/libgles.mk                | 17 +----------------
 package/opengl/libopenmax/Config.in              |  6 ++++++
 package/opengl/libopenmax/libopenmax.mk          |  9 +--------
 package/opengl/libopenvg/Config.in               |  6 ++++++
 package/opengl/libopenvg/libopenvg.mk            |  5 +----
 package/powervr/Config.in                        |  4 ++++
 package/powervr/powervr.mk                       |  5 +----
 package/rpi-userland/Config.in                   | 16 ++++++++++++++++
 package/sunxi-mali/Config.in                     |  6 ++++++
 package/ti-gfx/Config.in                         |  9 +++++++++
 20 files changed, 93 insertions(+), 75 deletions(-)
 create mode 100644 package/opengl/libegl/Config.in
 create mode 100644 package/opengl/libgles/Config.in
 create mode 100644 package/opengl/libopenmax/Config.in
 create mode 100644 package/opengl/libopenvg/Config.in

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
