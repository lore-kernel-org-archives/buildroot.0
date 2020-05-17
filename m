From: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
Date: Sun, 17 May 2020 22:39:59 +0200
Subject: [Buildroot] [PATCH v2 0/4] Initial GLVND support + NVIDIA drivers
 upgrade
In-Reply-To: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
References: <20200512132859.15189-1-jskrzypnik@novomatic-tech.com>
Message-ID: <20200517204003.2187318-1-jskrzypnik@novomatic-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone!

This set of patches went a wild ride within last couple of weeks, being
tested and revised at least a few times, but in this form they're ready
to be reviewed I think.

They are related to two important tings I'd like to explain and discuss
here:

  * Firstly, here comes support for GLVND which is a GL Vendor-Neutral
    disaptches, initially proposed by NVIDIA, currently done within the
    Freedestop/RedHat project team as libglvnd.

    It's useful not only for NVIDIA (they were first to adopt it though)
    but might be also beneficial for others, for example allowing you to
    deliver an image running on multiple machines with different GPUs
    and their respective OpenGL providers, which happens quite often on
    x86_64 and was the major reason to implement it in Buildroot for me.

    On the other hand, if your board has multiple GPUs it also helps a
    lot - for example when you have a "display" unit and "compute/accel"
    graphics units from different vendors. Happens on some ARM boards
    recently and there are already efforts to integrate it in these GL
    stacks.

    The only EXT needed by GL provider is to implement GL_EXT_libglvnd
    which is a dummy extension allowing GL lib to "register" to let it
    receive GL calls.

    Currently it's supported by all Mesa-compatible drivers and NVIDIA

    In practive it's very simple, the libglvnd delivers its own set
    of "dummy" libraries:

    - libGL.so
    - libGLX.so
    - libOpenGL.so
    - libEGL.so

    and needs the actual providers to be present as they already are
    but with names like libGLX_nvidia.so.

    It allows developers to link against vendor-neutral dummy libs and
    open GL contexts without thinking about target GPU too much as long
    as it supports desired GL/EGL standard.

    Also delivers GL API headers (GL/gl.h, GL/egl.h, etc.) so removes
    need of mesa3d-headers in GLVND-supported drivers.

    If any other proprietary GL provider beyond Mesa and NVIDIA gets
    support for it, I'll happily adopt its definition in Buildroot.

    Mesa has glvnd suppoort when there's "-Dglvnd=true" switch in
    its build config, which gets enabled when you select libglvnd as
    package or any other pkg supporting it.

  * The second one is to update NVIDIA from old 390-series release to
    390.132 which is a current one in "legacy" branch, and to introduce
    the concept of "version branches" witizn its Buildroot package:

    - "legacy" (390.xx) - it's what we currently have, the last version
      supporting i386 (which is adjusted properly in makefile/kconfig)
      yet still needed as supporting older cards
    - "long lived" (43x.xx) - will be chosen by default, supports both
      i386 and x86_64, has support for majority of GPUs but doesn't get
      ad-hoc performance fixes
    - "short lived" (440.xx) - the "bleeding edge" branch but not that
      much, first to support RTX raytracing cards as well as fixes from
      independent developers complaining about NVIDIA performance

    Selecting the version might help adjust your build to the specific
    requirements of the application running on your image.

    Also, the nvidia-driver got hard dependency on libglvnd. NVIDIA did
    a weird trick bundling the libglvnd already in their builds but
    without any notice, hiding it inside libraries. In general it's
    advised to run against the upstream implementation and works fine
    there.

    The controversal question might be why I didn't used "manifests"
    from NVIDIA installer as Makefile inputs and did the "library list"
    on my own. This manner was thoroughly discussed on IRC at least
    a few times so I'll just put some points here without elaborating
    on them too much:

    - it's not reliable, the format is made to be understood only by
      nvidia-installer
    - there are some quirks in installer itself to deal with files in
      way not directly exposed by manifests
    - not all "modules" are defined correctly and not every "file
      class" is whatt always it says, making the input painful to parse
    - in general, we might succeed with it (and the problem might be
      approached next time for sure) but doing all the workarounds and
      hacks for each module/lib won't make the Makefile easier
    - not all libraries (for example the libglxserver) are even SONAMEd
      so we can't symlink them "smart" so I did list of manual symlinks
      for them.

I hope these patches will get positively reviewed and merged, because
these are my first contributions to Buildroot and while they don't
really look so complicated, it took me a considerable amount of time
to actually prepare them within the rules and style of Buildroot, also
getting me a solid re-introduction to Makefile after a few years ;)   

With regards,
Kuba

Jakub Skrzypnik (4):
  package/libglvnd: new package
  package/mesa3d: make it aware of libglvnd and support it when present
  package/x11r7/xserver_xorg-server: disable GLAMOR support with NVIDIA
    drivers
  package/nvidia-driver: update to 390.132, 435.21, 440.82

 package/Config.in                             |    1 +
 package/libglvnd/Config.in                    |   18 +
 package/libglvnd/libglvnd.hash                |    1 +
 package/libglvnd/libglvnd.mk                  |   19 +
 package/mesa3d/Config.in                      |    2 +
 package/mesa3d/mesa3d.mk                      |    9 +
 .../390.132/0001-kernel-416.patch             |   33 +
 .../390.132/0002-kernel-55.patch              | 1286 +++++++++++++++++
 .../390.132/0003-kernel-56.patch              |  415 ++++++
 .../435.21/0001-kernel-5.4.patch              |  142 ++
 package/nvidia-driver/Config.in               |   60 +-
 package/nvidia-driver/egl.pc                  |   10 -
 package/nvidia-driver/gl.pc                   |   11 -
 package/nvidia-driver/nvidia-driver.hash      |    7 +-
 package/nvidia-driver/nvidia-driver.mk        |  366 +++--
 .../xserver_xorg-server.mk                    |    4 +
 16 files changed, 2199 insertions(+), 185 deletions(-)
 create mode 100644 package/libglvnd/Config.in
 create mode 100644 package/libglvnd/libglvnd.hash
 create mode 100644 package/libglvnd/libglvnd.mk
 create mode 100644 package/nvidia-driver/390.132/0001-kernel-416.patch
 create mode 100644 package/nvidia-driver/390.132/0002-kernel-55.patch
 create mode 100644 package/nvidia-driver/390.132/0003-kernel-56.patch
 create mode 100644 package/nvidia-driver/435.21/0001-kernel-5.4.patch
 delete mode 100644 package/nvidia-driver/egl.pc
 delete mode 100644 package/nvidia-driver/gl.pc

-- 
Changes v1 -> v2:
  - removed redundant libgl-headers virtual pkg (suggested by y_morin)

-- 
CONFIDENTIALITY NOTICE
------------------------------------
This
 E-mail is 
intended only to be read or used by the addressee.The 
information 
contained in this E-mail message may be confidential 
information. If you 
are not the intended recipient, any use, 
interference with, distribution, 
disclosure or copying of this material 
is unauthorized and prohibited. 
Confidentiality attached to this 
communication is not waived or lost by 
reason of the mistaken delivery 
to you.
If you have received this message 
in error, please delete
 it and notify us by return E-mail or telephone 
NOVOMATIC Technologies 
Poland S.A. +48 12 258 00 50. Any E-mail attachment 
may contain software
 viruses which could damage your own computer system. 
Whilst reasonable 
precaution has been taken to minimize this risk, we 
cannot accept 
liability for any damage which you sustain as a result of 
software 
viruses. You should therefore carry out your own virus checks 
before 
opening any attachments.
------------------------------------

NOVOMATIC Technologies Poland S.A., Poland, Krakowska 368, 32-080 Zabierz?w
