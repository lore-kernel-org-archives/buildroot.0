From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 2 Apr 2014 21:08:34 -0400
Subject: [Buildroot] busybox installation with --noclobber
Message-ID: <CANxTyt4JBk+nF2fWxxGvZOfGzYCuUAUaP7Y71fqXN+U89h4HZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

A tangential work flow issue came up while helping some co-workers
recently.  Basically, they have a busybox configuration that must be
duplicating the "real" version of apps installed by other packages.
When they rebuild and re-install busybox (say, after a "make
busybox-menuconfig"), their rootfs becomes unusable, presumably
because the re-installation of the busybox symlinks must be wiping out
something important.  To recover functionality, they have to either
delete all of the .stamp_target_installed files to re-install
everything, or else rebuild from scratch.

As it turns out, the busybox install script has a --noclobber option,
where symlinks will not be installed if something already exists at
the destination (be it file or symlink).  This makes the busybox
re-install work for my peers without subsequent head ache.  I provided
a patch to them to force this option on.  So I'm now considering if
such a change should be considered applicable more generally.

I was originally inclined against such a patch, to encourage the
active trimming down of busybox to eliminate the redundancy (by not
dulling the pain).  But the reality is that identifying the duplicates
sometimes is not so easy for my co-workers, so I fear that the project
maintainers simply won't bother.

There is also an argument that the --noclobber can be beneficial to
the effort to trim down busybox.  For example:
1. Build project from a clean state
2. Delete busybox from that target directory:
        rm -vf $(TARGET_DIR)/bin/busybox
3. Delete broken symlinks from target directory's bin, sbin, usr/bin, usr/sbin:
        find -L $(TARGET_DIR)/bin $(TARGET_DIR)/sbin
$(TARGET_DIR)/usr/bin $(TARGET_DIR)/usr/sbin -type l -print -delete
4. Re-install busybox:
        make busybox-rebuild
5. During install, take note of which symlinks are reported as
"blahblah already exists"
6. Remove the noted items from busybox configuration if appropriate

Opinions?  Would there be interest in such a patch?

Danomi -
