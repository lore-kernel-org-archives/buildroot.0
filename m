From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 16 Dec 2019 18:34:53 +0100
Subject: [Buildroot] [PATCH 1/1] system: update lib64/32 symlink
 creation for mips64n32 and gcc >= 5.1.0
In-Reply-To: <20191216162628.63672ab7@windsurf.home>
References: <20191216152223.20718-1-patrickdepinguin@gmail.com>
 <20191216162628.63672ab7@windsurf.home>
Message-ID: <CAAXf6LV6pD5u8cx2ycebBn+KOhM6XuSMpnb8kiioZuonvB_URA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 16, 2019, 16:26 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Mon, 16 Dec 2019 16:22:23 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > In gcc 5.1.0, a change was introduced which causes internal search paths
> > inside the sysroot to be relative to 'lib64' rather than 'lib'. See [1]
> [2]
> > and [3]. As Buildroot only creates a lib32->lib symlink for mips64n32,
> > these internal paths could not be found, leading to compilation errors.
> >
> > For example for dtc:
> >
> >      LD convert-dtsv0
> >
>  /opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/bin/ld:
> cannot find crt1.o: No such file or directory
> >
>  /opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/bin/ld:
> cannot find crti.o: No such file or directory
> >     collect2: error: ld returned 1 exit status
> >     make[1]: *** [Makefile:236: convert-dtsv0] Error 1
> >     make[1]: *** Waiting for unfinished jobs....
> >     make[1]: Leaving directory '/opt/buildroot/output/build/dtc-1.4.7'
> >     make: *** [package/pkg-generic.mk:241:
> /opt/buildroot/output/build/dtc-1.4.7/.stamp_built] Error 2
> >
> > In this case, crt1.o was searched for in following locations:
> >
> >     16073
> access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/n32/octeon3/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/lib/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/7.3.0/../../../../mips64-octeon-linux-gnu/lib/../lib32-fp/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/../lib32-fp/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/mips64-octeon-linux-gnu/7.3.0/n32/octeon3/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/../lib32-fp/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
>
> So it is in fact search in ../lib32-fp/ relatively to lib64/
>
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
> >     16073
> access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/crt1.o",
> R_OK) = -1 ENOENT (No such file or directory)
>
> And then in lib64/ itself.
>
> Which means the lib32 symbolic link is in fact useless ?
>

In this case this was Octeon3 which has hardfloat and uses lib32-fp instead
of lib32. But the problem should be analogous for Octeon2 (no hardfloat,
with libdir lib32).

Also, we need to remain compatible with old and new compilers, so I'm a bit
afraid to change more than the above...

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191216/4fe126f5/attachment.html>
