From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 23:39:21 +0200
Subject: [Buildroot] libfakeroot problem - solved
In-Reply-To: <188f3de7-0bdc-4bda-0499-6127018e05c0@ou.edu> (Steve Kenton's
 message of "Fri, 12 May 2017 23:40:20 +0000")
References: <f672b599-946e-6bdc-236a-7508df02dc30@ou.edu>
 <188f3de7-0bdc-4bda-0499-6127018e05c0@ou.edu>
Message-ID: <8760h1ajg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:

Hi,

 > OK, I found it. It was leakage from the build host. Testing something
 > for the embedded system I had run getcap to give /bin/tar some
 > capabilities and did not remove them afterwards. Somehow that
 > interacted badly with libfakeroot and the creation of
 > output/images/rootfs.tar at the end of the build. The reason I did not
 > see it on the 32-bit builds is that being intended for recovery and
 > reinstall they used initramfs linked into the kernel for the rootfs
 > instead of the  rootfs.tar file. When the libfakeroot issue
 > manifested, root did not own the root filesystem files in rootfs.tar
 > when it was expanded with "sudo tar xf  rootfs.tar ....." Which
 > resulted in a system which was bootable but would not run properly
 > because of the file ownership/permission problems.

Hmm, we've relatively recent had issues with filesystem capabilities /
acls and fakeroot, but I thought this was fixed (unless you did part of
your build with the old BR version):

https://git.buildroot.net/buildroot/commit/?id=2a222446b4614a38b4042df54b68b69b96939708

 > This was clearly a self inflicted problem, but the fact that tar is
 > not included in the output/host/* tools and thus the build system
 > /bin/tar was used certainly make it "interesting" to find.

Well, it is a bit of chicken and egg issue - Most package sources are
available in tarballs, so we need SOME utilities from the host (like gcc
and make), and we try to only add host packages when really needed
(E.G. uncommon SW or we need special versions, ..).

-- 
Bye, Peter Korsgaard
