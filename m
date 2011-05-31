From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 31 May 2011 22:01:13 +0200
Subject: [Buildroot] [pull request] Pull request for
	branch	for-2011.08/bootloaders
In-Reply-To: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4DE54909.80900@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni wrote:
> Hello,
>
> We have a package infrastructure that allows to share a lot of common
> behaviour between packages, and allows to add new features easily to
> all existing packages (Git/Mercurial download support, or usage of an
> external source tree, etc.).
>
> Unfortunately, some of the packages that would most benefit from those
> new infrastructure features are the bootloader and kernel, since it's
> typically the software components that have to be modified/tuned
> during the course of an embedded Linux project.
>
> Therefore, this series converts all bootloaders makefiles and the
> kernel makefile to the package infrastructure, and adds the
> possibility of fetching the kernel and u-boot through Git (it can be
> added to other bootloaders with just a few lines of changes, mostly at
> the Config.in level).
[snip]

> Most of the changes have already been tested sucessfully by Luca Ceresoli.

I confirm the new patchset is working, and the newly-introduced git knob in
menuconfig does as well.

On the other hand, I noticed an annoying problem.

Both Linux and U-Boot embed a version string computed from git describe or
similar, which includes the most recent git tag name and possibly the
abbreviated SHA1. This info is very useful to keep software traceability.

If buildroot is built from a git tree (as opposed to a tar.gz release) 
and the
build is done in-tree, the version computation for U-Boot and Linux does not
work anymore.

U-Boot prints at startup:
 > U-Boot 2011.03-00106-gbfd25f9-dirty (May 31 2011 - 15:30:36)
which looks ok, except bfd25f9 is the current commit in the buildroot git
repository, not in the U-Boot one.
This looks obvious (after having noticed it...), because U-Boot gets built
inside output/build/u-boot-$(VERSION)/, which is not a git repo. So git 
describe
does actually describe the buildroot repo instead.

Linux just does not attach any -g<SHA1> to its version number, which is 
equally
wrong since I configured buildroot to checkout a commit that is not a tag.
In fact if Linux is built inside its own git repo as I used to do so far, it
prints a version number that includes the abbreviated SHA1.

The root of this problem is in the way git download with in buildroot, and
actually it would affect any package downloaded via git which uses git info
to compute their version numbers.

Is there anyone else out there using the version string (computed from 
tag and
SHA1) for software traceability?

If this is considered a problem, the only solution that comes to my mind 
is that
we should clone a git repo in output/build/<package>, not extract a tarball.
This is definitely not very nice.

Luca
