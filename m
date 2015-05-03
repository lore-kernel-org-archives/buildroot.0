From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 May 2015 14:43:13 +0200
Subject: [Buildroot] [PATCH v2 1/1] libfreeimage: new package
In-Reply-To: <1428916598-16537-1-git-send-email-remi.rerolle@gmail.com>
References: <1428916598-16537-1-git-send-email-remi.rerolle@gmail.com>
Message-ID: <20150503144313.0ee370ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear R?mi R?rolle,

On Mon, 13 Apr 2015 11:16:38 +0200, R?mi R?rolle wrote:
> FreeImage is an Open Source library project for developers who would like to
> support popular graphics image formats like PNG, BMP, JPEG, TIFF and others as
> needed by today's multimedia applications.
> 
> See: http://freeimage.sourceforge.net
> 
> Signed-off-by: R?mi R?rolle <remi.rerolle@gmail.com>

Could you help us with some rather several build issues on
libfreeimage? I fixed a number of them, but on Blackfin there are some
really weird things being uncovered.

I fixed
http://autobuild.buildroot.org/results/fe7/fe72243a84a91b68ef3138847294674b36f16c58/build-end.log
with http://patchwork.ozlabs.org/patch/467381/.

I fixed
http://autobuild.buildroot.org/results/054/054d8496f1555274c8525c8c7381aaada27f9e70/build-end.log
which seems to be a compiler issue by simply disabling libfreeimage on
the ARC architecture, see http://patchwork.ozlabs.org/patch/467380/.
Don't try to fix that one, it's really a compiler problem.

However, the Blackfin case is much more interesting. As explained in
http://patchwork.ozlabs.org/patch/467380/, I tried to fix the build
issue visible at
http://autobuild.buildroot.org/results/f3b/f3bd6be448cffed3caae7850233168e6d0f6a5bd/build-end.log.
I fixed the first build issue, then another one, and finally had
another build issue that clearly indicates that the libfreeimage source
code seems to be a piece of crap, using 40 bits constants in 32 bits
variables. Can you have a look at this? For now we're going to disable
the package on Blackfin, but I believe it's also buggy on other
architectures.

Here is a simple Buildroot configuration file to reproduce the problem:

BR2_bfin=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBFREEIMAGE=y
# BR2_TARGET_ROOTFS_TAR is not set

Thanks for your help,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
