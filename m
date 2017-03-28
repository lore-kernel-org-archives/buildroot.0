From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Mar 2017 13:11:13 +0200
Subject: [Buildroot] [git commit] fs/ext2: Remove support for
	auto-calculation of rootfs size
In-Reply-To: <20170325134226.A8E8C8211A@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 25 Mar 2017 14:41:05 +0100")
References: <20170325134226.A8E8C8211A@busybox.osuosl.org>
Message-ID: <87vaqt4pwu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Auto-calculation of the rootfs size cannot be done in a reliable way
 > as it depends on the host filesystem and is broken on non ext4 host
 > (see bugs [1] [2]). So let the user specify the size he wants for his
 > rootfs.

 > [1] https://bugs.busybox.net/show_bug.cgi?id=8831
 > [2] https://bugs.busybox.net/show_bug.cgi?id=9496

 > Signed-off-by: S.bastien Szymanski <sebastien.szymanski@armadeus.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > [Thomas: as suggested by Arnout, use 60 MB as the default size instead
 > of 64 MB.]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  Config.in.legacy        | 14 ++++++++++++++
 >  fs/ext2/Config.in       | 13 +++----------
 >  fs/ext2/ext2.mk         |  1 -
 >  package/mke2img/mke2img | 20 +-------------------
 >  4 files changed, 18 insertions(+), 30 deletions(-)

 > +++ b/fs/ext2/Config.in
 > @@ -44,22 +44,15 @@ config BR2_TARGET_ROOTFS_EXT2_REV
 >  config BR2_TARGET_ROOTFS_EXT2_LABEL
 >  	string "filesystem label"
 
 > +# 61440 = 60MB, i.e usually small enough to fit on a 64MB media
 >  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
 > -	int "exact size in blocks (leave at 0 for auto calculation)"
 > -	default 0
 > +	int "exact size in blocks"
 > +	default 61440

It would be good with some help text explaining what a block is / what
the size of a block is.

I believe genext2fs uses a block size of 1024 and we (currently) don't
override it.

-- 
Bye, Peter Korsgaard
