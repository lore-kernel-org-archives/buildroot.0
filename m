From: Charlie Turner <cturner@igalia.com>
Date: Wed, 29 Apr 2020 15:07:28 +0100
Subject: [Buildroot] [PATCH 0/1] [RFC] add support for icecc
Message-ID: <20200429140729.3325-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I would like to use Icecream for my builds, primarily because I rely
on WebKit at work which is a horror to on small-iron. For now I focus
only on distributing compilation of target packages.

In theory this should be easy,

  1) Create a tarball containing the cross-toolchain buildroot pulled in
  for the cluster machines to compile with.
  2) Point at this tarball from `ICECC_VERSION'
  3) Arrange for buildroot's toolchain wrappers to call `icecc'.
  4) Enjoy faster builds?

1) can be done using the `icecc --build-native' command. As an example
of what it produces, here's the output on my x86-64 host. The logic for
what files is here[1],

?????
? $ icecc --build-native
? [...]
? # Outputs c54a871ca4de453cdba3ddda4e92a802.tar.gz 
? $ tar -tf c54a871ca4de453cdba3ddda4e92a802.tar.gz 
? bin/true
? etc/ld.so.cache
? etc/ld.so.conf
? lib64/ld-linux-x86-64.so.2
? lib/x86_64-linux-gnu/libbfd-2.31.1-system.so
? lib/x86_64-linux-gnu/libc.so.6
? lib/x86_64-linux-gnu/libdl.so.2
? lib/x86_64-linux-gnu/libgmp.so.10
? lib/x86_64-linux-gnu/libisl.so.19
? lib/x86_64-linux-gnu/libmpc.so.3
? lib/x86_64-linux-gnu/libmpfr.so.6
? lib/x86_64-linux-gnu/libm.so.6
? lib/x86_64-linux-gnu/libopcodes-2.31.1-system.so
? lib/x86_64-linux-gnu/libz.so.1
? usr/bin/as
? usr/bin/cc1
? usr/bin/cc1plus
? usr/bin/g++
? usr/bin/gcc
? usr/bin/objcopy
? usr/lib/gcc/x86_64-linux-gnu/8/liblto_plugin.so
?????

This seems fairly unsurprising, bin/true is there for sanity checking,
the other files are basically resolving the `ldd' chain from a
compiler binary. There will be details here I am missing surely as a
toolchain ignoramus.

First attempt in buildroot, `make qemu_arm_versatile_defconfig' and,

?????
? $ icecc --build-native ./output/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc
? '/home/cht/igalia/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-g++.br_real' is no executable.
?????

The path
`/home/cht/igalia/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-g++.br_real'
does not actually exist. Turns out this defconfig does not come with C++
support, strange that icecc's toolchain crawler somehow felt it needed
this. Maybe a hardcode in icecc.

It works when I enable C++ support, (need to investigate the icecc
source about why this is necessary)

?????
? $ icecc --build-native ./output/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc
? adding file /bin/true=/usr/bin/true
? adding file /lib/x86_64-linux-gnu/libc.so.6=/usr/lib/x86_64-linux-gnu/libc-2.28.so
? adding file /lib64/ld-linux-x86-64.so.2=/usr/lib/x86_64-linux-gnu/ld-2.28.so
? adding file /usr/bin/gcc=/home/cht/igalia/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real
? adding file /lib/x86_64-linux-gnu/libm.so.6=/usr/lib/x86_64-linux-gnu/libm-2.28.so
? adding file /usr/bin/g++=/home/cht/igalia/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-g++.br_real
? adding file /usr/bin/cc1=/home/cht/igalia/buildroot/output/host/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/8.4.0/cc1
? adding file /usr/lib/libmpc.so.3=/home/cht/igalia/buildroot/output/host/lib/libmpc.so.3.1.0
? adding file /usr/lib/libmpfr.so.6=/home/cht/igalia/buildroot/output/host/lib/libmpfr.so.6.0.2
? adding file /usr/lib/libgmp.so.10=/home/cht/igalia/buildroot/output/host/lib/libgmp.so.10.3.2
? adding file /lib/x86_64-linux-gnu/libdl.so.2=/usr/lib/x86_64-linux-gnu/libdl-2.28.so
? adding file /usr/lib/libz.so.1=/home/cht/igalia/buildroot/output/host/lib/libz.so.1.2.11
? adding file /usr/bin/cc1plus=/home/cht/igalia/buildroot/output/host/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/8.4.0/cc1plus
? adding file /usr/bin/as=/home/cht/igalia/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/bin/as
? adding file /usr/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/8.4.0/liblto_plugin.so=/home/cht/igalia/buildroot/output/host/libexec/gcc/arm-buildroot-linux-uclibcgnueabi/8.4.0/liblto_plugin.so.0.0.0
? adding file /usr/bin/objcopy=/home/cht/igalia/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/bin/objcopy
? adding file /etc/ld.so.conf=/tmp/icecc_ld_so_confSllt0p
? cp: -r not specified; omitting directory '/lib'
? cp: -r not specified; omitting directory '/lib64'
? creating bdd71538f0cc87b1653982f1c1b709e5.tar.gz
?????

There's some obvious pollution from my host environment, don't know if
it will cause issues yet. This tarball is theoretically under our
complete control, any errors in what `icecc' picks we can resolve
by creating it ourselves in the Makefiles.

Now, to hack this into target package builds,

?????
? diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
? index 8cfc963ccd..b91f12a52d 100644
? --- a/toolchain/toolchain-wrapper.c
? +++ b/toolchain/toolchain-wrapper.c
? @@ -60,6 +60,7 @@ static char *predef_args[] = {
?  #ifdef BR_CCACHE
?         ccache_path,
?  #endif
? +       "/usr/bin/icecc",
?         path,
?         "--sysroot", sysroot,
?  #ifdef BR_ABI
?????

After `export
ICECC_VERSION=/path/to/bdd71538f0cc87b1653982f1c1b709e5.tar.gz' and
running `make', this does "work" in the sense I get something built
without error (not tried running it yet). The problem is all builds
are done locally, just via the `icecc' daemon!

?????
? ICECC[1729] 2020-04-27 19:15:29: invoked as: /usr/bin/icecc /home/cht/igalia/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc.br_real --sysroot /home/cht/igalia/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot --version
? ICECC[1729] 2020-04-27 19:15:29: connected to /var/run/icecc/iceccd.socket
? ICECC[1729] 2020-04-27 19:15:29: custom command, running locally.
?????

To see such debugging, set the following variables for client-side
logging,

?????
? export ICECC_LOGFILE=/tmp/icecc.log
? export ICECC_DEBUG=10 # overkill
?????

This is a [previously discussed bug]. The issue is that icecc gets
confused by `arm-buildroot-linux-uclibcgnueabi-gcc.br_real' as the
name of a `gcc'. Upgrading to a master version of icecc has fixed this
by relaxing the check, but worth knowing that the version Debian
Buster ships has this bug.

I installed `icecc' from git
(`ff7f4bddfb9212cb401ab64a9d08227058287aa1') and this has been fixed
to not be so fussy. With that and this trivial patch to
`toolchain-wrapper', I can at least build
`qemu_arm_versatile_defconfig' across a cluster.

RFCs

  ? Host packages are still compiled locally, I would like this to
    extend to host builds as well. Could just prepend icecc in the
    $PATH on the host. Need to test, potential complication is
    switching icecc's toolchain mid-build. Might not be an issue, just
    not gone there yet.
  ? Generating the `ICECC_VERSION' tarball from the Makefiles. Ideally
    it would all be transparent to the user if, say,
    `BR2_ICECC=y'. It's inconvenient for the user to have to call
    `--build-native' and arrange for `ICECC_VERSION' to be in the
    `make' environment. You need to first build the cross-toolchain,
    setup the tarball, and then so long as your toolchain doesn't
    change, subsequent rebuilds are distributed. This all needs
    automation.
  ? Number of jobs to simultaneously run has be manually selected, I
    don't know of a method to find out how many remote CPUs you have
    available with Icecream automatically.

[1] https://github.com/icecc/icecream/blob/master/client/icecc-create-env.in#L438
[previously discussed bug] https://github.com/icecc/icecream/issues/164

Charlie Turner (1):
  [RFC] add support for icecc

 toolchain/toolchain-wrapper.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.20.1
