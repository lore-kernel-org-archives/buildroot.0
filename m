From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Thu, 23 Feb 2017 11:54:53 +1100
Subject: [Buildroot] [RFC PATCH 0/2] add gobject-introspection
Message-ID: <cover.1487811280.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Buildroot,

Here's my attempt at the gobject-introspection package, presented for comments.

The basic design is:

* Build host-gobject-introspection normally, but slightly patched to allow an
  alternate "ldd" to be used (this handles it's use of "ldd", it already has a
  way to add a wrapper when it directly executes binaries).
* Manually construct some wrappers in the staging
  directories so that it can be used from there on target packages (via QEMU
  usermode).
* Build the target packages that use gobject-introspection using the wrappers
  in staging.
* Build the target version of gobject-introspection (I think this is necessary
  at run time, but I can't remember for sure).

The part I'm least happy with is the ldd-cross script, and the way it has to
scrape information out of "/usr/bin/ldd" to find the target's dynamic linker.
Is there a better way to find the dynamic linker in the target?

Note: ldd-cross can be useful separately, as it lets you easily inspect target
binaries from the host. Perhaps it should be it's own package?

I've included a patch to a random package (libvips) that uses
gobject-introspection to enable it's use and exercise build dependencies.

I'm sure it needs more cleanup, but at least it works.

Cheers,
Sam.

Sam Bobroff (2):
  package/gobject-introspection: add package
  package/libvips: enable introspection

 package/Config.in                                  |  1 +
 .../0001-ldd-cross-launcher.patch                  | 22 +++++++++
 package/gobject-introspection/Config.in            | 12 +++++
 package/gobject-introspection/create-ldd-cross.sh  | 46 ++++++++++++++++++
 .../gobject-introspection/gobject-introspection.mk | 55 ++++++++++++++++++++++
 package/libglib2/libglib2.hash                     |  4 +-
 package/libglib2/libglib2.mk                       |  4 +-
 package/libvips/Config.in                          |  1 +
 package/libvips/libvips.mk                         |  4 +-
 9 files changed, 143 insertions(+), 6 deletions(-)
 create mode 100644 package/gobject-introspection/0001-ldd-cross-launcher.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100755 package/gobject-introspection/create-ldd-cross.sh
 create mode 100644 package/gobject-introspection/gobject-introspection.mk

-- 
2.11.0
