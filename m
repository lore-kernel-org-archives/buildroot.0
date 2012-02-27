From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 27 Feb 2012 21:37:24 +0100
Subject: [Buildroot] Failure building udev (version of tar too old)
Message-ID: <1330375044.2882.8.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after updating buildroot to 2012.02-rc3 today, our builds broke with the
following error:

 udev 181 Building
PATH="/var/lib/buildbot/build-geode-1.8/build/output/host/bin:/var/lib/buildbot/build-geode-1.8/build/output/host/usr/bin:/var/lib/buildbot/build-geode-1.8/build/output/host/usr/sbin/:/usr/local/bin:/usr/bin:/bin:/usr/games" PERLLIB="/var/lib/buildbot/build-geode-1.8/build/output/host/usr/lib/perl"  /usr/bin/make -j4  -C /var/lib/buildbot/build-geode-1.8/build/output/build/udev-181/
make[1]: Entering directory `/var/lib/buildbot/build-geode-1.8/build/output/build/udev-181'
  GEN    test/sys/kernel/uevent_seqnum
  GEN    src/extras/keymap/keys.txt
  GEN    src/extras/keymap/keys-from-name.gperf
  GEN    src/extras/keymap/keys-to-name.h
  GEN    src/extras/keymap/keys-from-name.h
tar: invalid option -- J
Try `tar --help' or `tar --usage' for more information.
make[1]: *** [test/sys/kernel/uevent_seqnum] Error 64
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/var/lib/buildbot/build-geode-1.8/build/output/build/udev-181'
make: *** [/var/lib/buildbot/build-geode-1.8/build/output/build/udev-181/.stamp_built] Error 2


Looks like udev requires a version of tar that supports xz compression.
Our buildbots have tar (GNU tar) 1.20.

I see several options to fix this. I could update tar on the build
hosts, but then others are likely to hit the same problem. Then one
could probably patch udev to skip the particular test that requires
extracting the xz-compressed archive. Or one could make udev use
host-tar in case that the version of tar provided by the build host is
too old.

I guess that the latter would be the preferred solution, but I have to
admit that I don't quite understand how the check-host-tar.mk works and
what I would have to change to fix this udev problem. Perhaps someone of
you can hold my hand?

Also while trying to understand the check-host-tar script, I found that
there are at least two packages that are using TAR_STRIP_COMPONENTS with
tar instead of $(TAR):

toolchain/gdb/gdb.mk:   $(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(GDB_DIR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
toolchain/kernel-headers/kernel-headers.mk:     tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -


Regards, Sven
