From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 10:46:58 +0200
Subject: [Buildroot] [PATCH 0/2 v4] package/libglvnd: introduce the GL
 vendor-neutral proxy (branch yem/libglvnd)
Message-ID: <cover.1595839612.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This is a respin from the original series by Jakub, heavily massaged
by me (Yann); thanks Jakub for your initial work! :-) What follows is
Jakub's original cover letter (tweaked to drop the reference to other
patches not include in this respin):

Here comes support for GLVND which is a GL Vendor-Neutral disaptches,
initially proposed by NVidia, currently done within the Freedestop/
RedHat project team as libglvnd.

It's useful not only for NVidia (they were first to adopt it though)
but might be also beneficial for others, for example allowing you to
deliver an image running on multiple machines with different GPUs and
their respective OpenGL providers, which happens quite often on x86_64
and was the major reason to implement it in Buildroot for me.

On the other hand, if your board has multiple GPUs it also helps a lot
- for example when you have a "display" unit and "compute/accel"
graphics units from different vendors. Happens on some ARM boards
recently and there are already efforts to integrate it in these GL
stacks.

The only EXT needed by GL provider is to implement GL_EXT_libglvnd
which is a dummy extension allowing GL lib to "register" to let it
receive GL calls.

In practive it's very simple, the libglvnd delivers its own set of
"dummy" libraries:

  - libGL.so
  - libGLX.so
  - libOpenGL.so
  - libEGL.so

and needs the actual providers to be present as they already are but
with names like libGLX_nvidia.so.

It allows developers to link against vendor-neutral dummy libs and
openGL contexts without thinking about target GPU too much as long as
it supports desired GL/EGL standard.

Also delivers GL API headers (GL/gl.h, GL/egl.h, etc.) so removes need
of mesa3d-headers in GLVND-supported drivers.

Currently it's supported by all Mesa-compatible drivers and NVidia. For
simplicity sake, and to ease introduction of libglvnd, only mesa3d is
converted to be compatible with libglvnd. Other providers, like NVidia,
can be converted (or added!) in follow-up patches.

Changes v3 -> v4:
  - bump to libglvnd 1.3.2


Regards,
Yann E. MORIN.


The following changes since commit 1640b0c1f967e394f87eb7a0ca04ae40aade11b4

  package/mbpfan: new package (2020-07-27 10:13:06 +0200)


are available in the git repository at:

  https://git.busybox.net/~ymorin/git/buildroot

for you to fetch changes up to c48baa11cd0c06ec5af3fd4989306c3ec581d0e9

  package/mesa3d: make it aware of libglvnd and support it when present (2020-07-27 10:45:34 +0200)


----------------------------------------------------------------
Jakub Skrzypnik (2):
      package/libglvnd: new package
      package/mesa3d: make it aware of libglvnd and support it when present

 package/Config.in              |  1 +
 package/libglvnd/Config.in     | 42 +++++++++++++++++++++++++++++++++
 package/libglvnd/libglvnd.hash |  7 ++++++
 package/libglvnd/libglvnd.mk   | 53 ++++++++++++++++++++++++++++++++++++++++++
 package/mesa3d/Config.in       | 15 +++++++-----
 package/mesa3d/mesa3d.mk       | 15 ++++++++----
 6 files changed, 123 insertions(+), 10 deletions(-)
 create mode 100644 package/libglvnd/Config.in
 create mode 100644 package/libglvnd/libglvnd.hash
 create mode 100644 package/libglvnd/libglvnd.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
