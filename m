From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu, 22 Mar 2018 17:41:44 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <87efkhfimu.fsf@dell.be.48ers.dk>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
 <87efkhfimu.fsf@dell.be.48ers.dk>
Message-ID: <20180322164144.GY14461@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sun, Mar 18, 2018 at 05:33:45PM +0100, Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  >> - It doesn't work for packages using rsync to install,
>  >> E.G. skeleton-init-common as rsync also sets the mtime to match the
>  >> source files
> 
>  > We could maybe tell rsycn not to do that, then?
> 
> Yes, possibly.
> 
>  >> - It breaks for <pkg>-reinstall
> 
>  > Well, we can't guarantee anything except with a clean build from scratch
>  > anyway.
> 
> True. We could potentionally do a touch on the stamp file before running
> find, but it is somewhat icky.
> 
>  >> I don't think either of those are really big issues compared to the huge
>  >> slowdown, but it is worth noticing.
> 
>  > Well, the -reinstall was already not working correctly, because the list
>  > pf files before/after would be alsmost the same, and the md5-diff would
>  > miss all the laready-installed files for the package.
> 
>  > The rsync issue is new, but we can "fix" it in a later patch, then, for
>  > those packages like the skeletons, by using the --no-times option for
>  > example.
> 
> Yes. I guess we cannot use --no-times unconditionally in SYSTEM_RSYNC,
> as the mtime shouldn't be touched for source files so OVERRIDE_SRCDIR
> doesn't rebuild too much.
> 
>  > However, if a third-party package internally uses rsync as its install
>  > method, we're screwed. But who would be insane enough to do that? ;-]
> 
> And even so, the breakage is not so bad.

It really depends on what you use these files for.

The original use case for the target list was rootfs size analysis. In the
discussion I have seen comments like missing a few files is not that important
here, but I disagree: if the missing file is 2MB large, it is a big problem.

Another use in-tree is to check for check-uniq-files. While this is a
non-critical feature, it's a pity if it would not detect problems because the
lists are inaccurate.

But there are out-of-tree uses too.  The most obvious usage is simply to
understand which package was responsible for a given file, even separate from
size analysis.

But there are also derived use cases. For example we are using the target list
in order to extract some packages from the root filesystem. For example, instead
of on the root filesystem (initramfs or NOR flash), they should end up on the
NAND flash. A script gets as input the list of packages to extract this way, and
uses the list to get the right associated files.

I'm sure there are other use cases.

The current timestamp-based approach not guaranteeing an accurate list is
problematic for many such uses. And as you already mentioned, since we don't have
full control over the build steps done in any given package, we don't know which
timestamps they will use. There may be very good reasons to install certain
files with their original timestamp and not the one from the build.

Best regards,
Thomas
