From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 16 Jul 2016 14:02:04 -0400
Subject: [Buildroot] grub2 installation query
Message-ID: <CANxTyt45ajPv1av2X=EFHEKTDy8mEiKx2-j+66kPZi_89-MDng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I recently noticed that grub2 will fail to install if stripping is turned off.
This is because $(STRIP) is used to make a "kernel.img" from another file
during installation, and the `true` command won't simulate that.

I think that grub2 is not unique in this.  I notice these lines in openldap.mk:

  # Somehow, ${STRIP} does not percolates through to the shtool script
  # used to install the executables; thus, that script tries to run the
  # executable it is supposed to install, resulting in an error.
  OPENLDAP_MAKE_ENV = STRIP="$(TARGET_STRIP)"

And indeed the comment is true - there is at least two instances of openldap
makefiles installing things to $(DESTDIR) via $(STRIP).

So I'm wondering:

- Should not the autobuilders be hitting these?

- Should there by a TARGET_STRIP_FOR_REAL that is actual a strip, in
  addition to TARGET_STRIP, for these cases?

Danomi -
