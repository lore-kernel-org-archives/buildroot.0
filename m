From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Aug 2016 18:26:31 +0200
Subject: [Buildroot] [PATCH 0/4] package/libegl: introduce egl-wayland
	(branch yem/egl-wayland)
Message-ID: <cover.1471968455.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series introduces support for EGL-wayland.

For Wayland, EGL implementations needs to provide a few specific
extensions so that Wayland servers and clients can easily exchange
surfaces, from a client to a server, so that the server can compose them
on screen, in a zero-copy fashion, but with the surfaces context (size,
depth...).

So far, the only such provider was mesa3d, so any package that needed
EGL with Wayland extensions would have to depend on mesa3d.

But nowadays, more and more EGL implementations do provide those
externsions. For example, the NVidia proprietary driver does. As well,
some non-public implementation may also provide them.

This series introduces a new option to the virtual package libegl,
libegl-wayland, that EGL prioviders that do implement those externsions
can state so, so that users of those externsions can properly depend on
it.

nvidia-driver is also bumped and made a provider of egl-wayland.

Regards,
Yann E. MORIN.


The following changes since commit 03f12377178e209f599f00b3fafb33dfa649abc7

  docs/manual: Document the variable $(PKG)_DL_OPTS (2016-08-23 14:59:01 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 0addd1f1dd9b75f20f96877f05d8bdcc98b44533

  package/nvidia-driver: update version (2016-08-23 18:06:44 +0200)


----------------------------------------------------------------
Yann E. MORIN (4):
      package/libegl: add option for wayland extensions
      package/mesa3d: also implements the EGL wayland extensions
      package/libgtk3: needs OpenGL-EGL/wayland
      package/nvidia-driver: update version

 package/libgtk3/Config.in                    |   8 +-
 package/mesa3d/Config.in                     |   1 +
 package/nvidia-driver/0001-use-LDFLAGS.patch |  48 +++++++
 package/nvidia-driver/Config.in              |   6 +-
 package/nvidia-driver/nvidia-driver.hash     |   4 +-
 package/nvidia-driver/nvidia-driver.mk       | 206 ++++++++++++++-------------
 package/opengl/libegl/Config.in              |   4 +
 7 files changed, 171 insertions(+), 106 deletions(-)
 create mode 100644 package/nvidia-driver/0001-use-LDFLAGS.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
