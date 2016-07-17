From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 14:50:35 +0200
Subject: [Buildroot] [PATCH 0/3 v3] aufs: new kernel extension (branch
	yem/aufs)
Message-ID: <cover.1468759218.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!


This series is an attempt to introduce the aufs stacking filesystem as a
Linux kernel extension, along with the corresponding userland tools.

It is based on a work by Christian Stewart, refined by Atul Singh, with
further cleanups by me.

The first patch introduces the extension proper: a no-prompt package
provides the source files, then used to patch the kernel code.

The second patch allows packages to instruct the kernel to isntall its
userland headers, when such package needs those headers rather than the
one from the toolchain (e.g. to gain access to inernals of the running
kernel, like filesystems or the netrwork stack, possibly added by a
kernel extension).

The third patch adds the userland aufs-util suite, used to assemble and
otherwise control any aufs stack. This needs the userland headers of the
running kernel because it needs to talk to the uafs internals.


Changes v2 -> v3:
  - cleanups in the aufs extension: better version handling and check,
    squash the extension and the package in the same patch;
  - add the kernel patch to install userland headers;
  - fix build of aufs-util, make it not depend on the kernel extension
    so it can be used on already-patched kernels;
  - misc other minor cleanups


Regards,
Yann E. MORIN.


The following changes since commit 97308d8e9ae0f096ec2df8275deb063266583b91

  package/ti-gfx: list supported SoCs in Config.in help text (2016-07-16 22:53:55 +0200)


are available in the git repository at:

  https://gitlab.com/ymorin/buildroot.git

for you to fetch changes up to e5d42509736f56a587767b61bf0f9ceb8efd41e4

  aufs-util: new package (2016-07-17 14:35:13 +0200)


----------------------------------------------------------------
Christian Stewart (2):
      aufs: new kernel extension
      aufs-util: new package

Yann E. MORIN (1):
      linux: add an option to install runtime headers

 linux/Config.ext.in                                | 52 ++++++++++++++++++++++
 linux/Config.in                                    |  9 ++++
 linux/linux-ext-aufs.mk                            | 21 +++++++++
 linux/linux.mk                                     | 12 +++++
 package/Config.in                                  |  2 +
 package/aufs-util/0001-remove-user-settings.patch  | 16 +++++++
 package/aufs-util/0002-no-check-ver.patch          | 24 ++++++++++
 package/aufs-util/0003-no-strip-lib.patch          | 18 ++++++++
 package/aufs-util/0004-no-override-readdir64.patch | 27 +++++++++++
 package/aufs-util/Config.in                        | 36 +++++++++++++++
 package/aufs-util/aufs-util.mk                     | 41 +++++++++++++++++
 package/aufs/Config.in                             | 16 +++++++
 package/aufs/aufs.mk                               | 28 ++++++++++++
 13 files changed, 302 insertions(+)
 create mode 100644 linux/linux-ext-aufs.mk
 create mode 100644 package/aufs-util/0001-remove-user-settings.patch
 create mode 100644 package/aufs-util/0002-no-check-ver.patch
 create mode 100644 package/aufs-util/0003-no-strip-lib.patch
 create mode 100644 package/aufs-util/0004-no-override-readdir64.patch
 create mode 100644 package/aufs-util/Config.in
 create mode 100644 package/aufs-util/aufs-util.mk
 create mode 100644 package/aufs/Config.in
 create mode 100644 package/aufs/aufs.mk

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
