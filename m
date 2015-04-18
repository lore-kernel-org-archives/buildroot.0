From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Fri, 17 Apr 2015 22:31:41 -0500
Subject: [Buildroot] Circular rootfs.ubifs <- target-finalize dependency
	dropped
Message-ID: <20150418033141.GA8487@dkarchlinux64.gateway.pace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

After updating Buildroot (commit
da9eff07fda36a1f4703a6232051da86c2d91d1f), I observed that my ubifs/ubi
root filesystems were approximately 200MB larger.  I noticed the
following build output:

    :
    :
>>> host-makedevs buildroot-2015.05-git Installing to host directory
/usr/bin/install -D -m 755 /home/dkehn/buildroot/src-master/output//build/host-makedevs-buildroot-2015.05-git/makedevs /home/dkehn/buildroot/src-master/output//host/usr/bin/makedevs
make[1]: Circular /home/dkehn/buildroot/src-master/output//images/rootfs.ubifs <- target-finalize dependency dropped.
>>>   Generating root filesystem image rootfs.ubifs
rm -f /home/dkehn/buildroot/src-master/output//build/_fakeroot.fs
rm -f
/home/dkehn/buildroot/src-master/output//target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
rm -f
/home/dkehn/buildroot/src-master/output//build/_users_table.txt
    :
    :
>>>   Finalizing target directory
rm -rf
/home/dkehn/buildroot/src-master/output//target/usr/lib/luarocks
rm -rf
/home/dkehn/buildroot/src-master/output//target/usr/lib/perl5/5.20.2/pod
rm -rf
/home/dkehn/buildroot/src-master/output//target/usr/lib/perl5/5.20.2/arm-linux/CORE
    :
    :

Due to a circular dependency, it appears that rootfs.ubifs is generated
before the target directory is finalized.  I think this might explain
the increased size. 

I've never noticed the 'Circular ... dependency dropped.' output before
my latest pull.  Doing a little digging, I found the following:

((8a58e02...)|BISECTING)$ git bisect good
4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37 is the first bad commit
commit 4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Sun Apr 12 18:37:49 2015 +0200

    fs: add rootfs dependencies to PACKAGES
    
    The logic for creating most of the filesystem images requires a
    certain number of host packages to be built. However, those packages
    are not currently listed in the global PACKAGES variables, and they
    are not dependencies of any other package listed in the PACKAGES
    variable.
    
    While it does not have any practical implications, it makes sense to
    have those packages listed in the global PACKAGES variable, which this
    commit implements.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

:040000 040000 0978dbf88bf9a07979d214d67a5e4ab63b6ddcdb c3b0a29f1819316a959b5dda2bf3d615d686ae6e M

My ubifs/ubi root filesystems returned to their, approximate, expected
sizes after reverting commit 4570dbc.

Has anyone else observed this behavior?

Do I have something mis-configured?

Thanks and Regards,
...doug
