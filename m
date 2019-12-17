From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Dec 2019 15:44:22 +0100
Subject: [Buildroot] [PATCH 1/1] system: update lib64/32 symlink
 creation for mips64n32 and gcc >= 5.1.0
In-Reply-To: <20191216210001.377aaf7a@windsurf.home>
References: <20191216152223.20718-1-patrickdepinguin@gmail.com>
 <20191216162628.63672ab7@windsurf.home>
 <CAAXf6LV6pD5u8cx2ycebBn+KOhM6XuSMpnb8kiioZuonvB_URA@mail.gmail.com>
 <20191216210001.377aaf7a@windsurf.home>
Message-ID: <CAAXf6LUx=f3ud08c83DZCS5NKcqVpRWYpNr+P+D61BnVyYJ5Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

El lun., 16 dic. 2019 a las 21:00, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello,
>
> On Mon, 16 Dec 2019 18:34:53 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > > >     16073
> > > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o",
> > > R_OK) = -1 ENOENT (No such file or directory)
> > > >     16073
> > > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/lib64/crt1.o",
> > > R_OK) = -1 ENOENT (No such file or directory)
> > > >     16073
> > > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/mips64-octeon-linux-gnu/7.3.0/crt1.o",
> > > R_OK) = -1 ENOENT (No such file or directory)
> > > >     16073
> > > access("/opt/buildroot/output/host/mips64-buildroot-linux-gnu/sysroot/usr/lib64/crt1.o",
> > > R_OK) = -1 ENOENT (No such file or directory)
> > >
> > > And then in lib64/ itself.
> > >
> > > Which means the lib32 symbolic link is in fact useless ?
> > >
> >
> > In this case this was Octeon3 which has hardfloat and uses lib32-fp instead
> > of lib32. But the problem should be analogous for Octeon2 (no hardfloat,
> > with libdir lib32).
>
> Right, but it means that this lib32/ symlink doesn't work for all
> toolchains, some toolchains would need a lib32-fp/ symlink... but by
> luck they also look under lib64/, even if the user-space is 32-bit.

For the mentioned Octeon toolchain, here are the values of the paths
as detected by the toolchain logic:

- octeon2 (soft-float)
SYSROOT_DIR=/home/tdescham/repo/isam/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
ARCH_SYSROOT_DIR=/home/tdescham/repo/isam/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
ARCH_SUBDIR=;
ARCH_LIB_DIR=lib32/octeon2;
SUPPORT_LIB_DIR=/home/tdescham/repo/isam/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/lib32/octeon2/

- octeon3 (hard-float)
SYSROOT_DIR=/home/tdescham/repo/isam/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
ARCH_SYSROOT_DIR=/home/tdescham/repo/isam/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/;
ARCH_SUBDIR=;
ARCH_LIB_DIR=lib32-fp;
SUPPORT_LIB_DIR=/home/tdescham/repo/isam/buildroot/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/lib32-fp/

The function create_lib_symlinks in
toolchain/toolchain-external/pkg-toolchain-external.mk will use
ARCH_LIB_DIR and create an additional link $(ARCH_LIB_DIR)->lib.
In this case, the situation is thus:

lrwxrwxrwx 1 tdescham tdescham    3 Dec 17 15:37 lib32 -> lib/
lrwxrwxrwx 1 tdescham tdescham    3 Dec 17 15:37 lib32-fp -> lib/
lrwxrwxrwx 1 tdescham tdescham    3 Dec 17 15:37 lib64 -> lib/

Where the 'lib32' one is probably not needed, and the 'lib64' one is
added by this patch.

>
> I'm not suggesting we need to change anything to the patch itself, only
> perhaps to the comments and/or commit log, just to clarify the issue.

I can try to extend it..

Best regards,
Thomas
