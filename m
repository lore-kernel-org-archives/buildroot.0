From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 10:16:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-08-16
In-Reply-To: <20140817063010.1E5C3100D11@stock.ovh.net>
References: <20140817063010.1E5C3100D11@stock.ovh.net>
Message-ID: <20140817101620.00dae1a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Quick analysis of the build failures of the day.

On Sun, 17 Aug 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:

>    powerpc |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/a4f546e10142ae9848db192d5c8a7fedd6667de4/

The usual vfork() issue with static linking. Gustavo is working on
that, but it's not very simple apparently.

>        arm |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/adf4375e388999b5c26e71efb1a083c4e0de21da/
>        arm |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/582a2328a708ea52040c8b671106d09101d90820/
>    powerpc |                  gnupg2-2.0.25 | NOK | http://autobuild.buildroot.net/results/8348ff77700987fbeb5bd6e5a677479b00ef4004/

error: unknown type name 'intmax_t'. Apparently only happens with
uClibc toolchains. Anyone interested?

>    powerpc |               gutenprint-5.2.9 | NOK | http://autobuild.buildroot.net/results/a4c0fcdbe425b30b54ba090f16955b177ee5888c/

gutenprint has been failing regularly for quite some time. Has anyone
looked into those issues?

>       bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/98b707ffdeeb1cda94b7c1019ef29cf5fd7db8bf/

Fixed by
http://git.buildroot.net/buildroot/commit/?id=06a603b8d55a5aea51a31c2d3f6f76d0b8218fc6
+
http://git.buildroot.net/buildroot/commit/?id=34e3857d9855197bb52a4056ad1f2a95a67d08f8.

>        arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/

Probably not too difficult to investigate:

/usr/bin/install: cannot create regular file `/scratch/peko/target/etc/upsmon.conf.sample': File exists

>        arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/7d355804a9ef1d9061b527625cec26e57b2d2fff/

-L/usr/lib -L/usr/lib present in the link command line. Fran?ois, what
is the status on this one? If it's the one due to host Perl being too
old on gcc10, then what about sending a patch to mark perl-gd has
broken (for the 2014.08 release), and then work on building host-perl
for the next release to fix the issue?

>    powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/4e3fd2e72e5d3935620ecc48ef9f7787fa54e66d/
>    powerpc |           perl-net-ssleay-1.65 | NOK | http://autobuild.buildroot.net/results/28e9c1ae6f7674f6b663ed69c5db2b8ae474a9e1/

Fixed by http://git.buildroot.net/buildroot/commit/?id=3cb705aa845c96e19f8b32e9994d5d319ce22930.

>    powerpc |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/069de94f087f8532afe9ecf6f21cc7743f09b97a/

uClibc bug: setresgid(), setresuid(), setreuid() are defined in both
libpthread and libc. Similar to the vfork() issue.

>        arc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/6c76b327d4fe34fe8501904f1fc98ac5b5f80703/

checking whether to build with POPT library... no
configure: error: mandatory POPT library not found
make: *** [/home/test/autobuild/instance-2/output/build/rpm-5.2.0/.stamp_configured] Error 1

in a configuration with:

BR2_PREFER_STATIC_LIB=y

>       bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/024b22f3c3a2b59e5d59dae917c62d1ebbfffa94/

Weird:

bfin-linux-uclibc-g++: /home/test/autobuild/instance-1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so: No such file or directory

>        arm |                  webkit-1.11.5 | TIM | http://autobuild.buildroot.net/results/8bfba67d71031e3f2c6b3a01eb79f2eaa90a5380/

Ignore.

>        arm |               wireshark-1.10.9 | NOK | http://autobuild.buildroot.net/results/f7083c0e8d978e28e9b2c69c091f4705dd578ab4/

Ignore, memory allocation issue on the build server.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
