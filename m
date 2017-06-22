From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Jun 2017 13:06:02 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add support for generating
	U-Boot boot scripts
In-Reply-To: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 21 Jun 2017 23:41:42 +0200")
References: <20170621214143.7184-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87h8z8i8o5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > More and more of our defconfigs need to generate a U-Boot boot
 > script. It's a simple call to mkimage, but we already have 12
 > instances of this logic in board/, and there are patch series waiting
 > in patchwork adding 3 more boards that need this.

 > So let's add an option in the U-Boot package to generate such a boot
 > script image easily.

 > Note that we assume a single script needs to be generated, and the
 > output file name is boot.scr. The only platform for which it seems to
 > not be the case are the Boundary Devices platforms: they generate two
 > boot scripts, 6x_bootscript and 6x_upgrade, but they are anyway
 > installed inside TARGET_DIR, not BINARIES_DIR.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Makes sense to me. Committed, thanks.

> ---
 > We could have chosen to create a helper script that can be used as a
 > post-build or post-image script, ala
 > support/scripts/genimage.sh. However, I find rather messy how we are
 > passing arguments to such scripts: we have a single
 > BR2_ROOTFS_POST_SCRIPT_ARGS, passed to all scripts. Proposals such as
 > https://patchwork.ozlabs.org/patch/777463/ with:

 >   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m64/genimage.cfg board/bananapi/bananapi-m64/boot.cmd"

 > where support/scripts/genimage.sh parses the first two arguments, and
 > the post-build script generating the U-Boot boot script parses the
 > last argument, look really really ugly to me.

 > Retrospectively, I believe the choice of adding such a helper script
 > for genimage was wrong. Having a proper option would be much
 > cleaner/nicer IMO.

Yes, agreed. My idea was also to add a kconfig option for it. This could
also have sub options like "support creating fat partitions" that would
pull in the needed host packages.

The reason we went with the script solution was afaik that some projects
might want to extra processing before or after creating the image, so it
wasn't clear if it should run before or after the post-image scripts.

You can argue though that for such "special" situations you should just
manually call genimage from the post-image script instead though.

-- 
Bye, Peter Korsgaard
