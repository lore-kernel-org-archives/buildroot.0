From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 22:18:32 +0000
Subject: [Buildroot] Where does post-build script belong?
In-Reply-To: <jijhcf$a6d$1@dough.gmane.org>
References: <jhub5r$smv$1@dough.gmane.org> <4F4D4751.1030906@gmail.com>
 <jijhcf$a6d$1@dough.gmane.org>
Message-ID: <201202282218.32706.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 28 February 2012 21:36:15 Grant Edwards wrote:
> On 2012-02-28, Steve Calfee <stevecalfee@gmail.com> wrote:
> > On 02/28/2012 01:06 PM, Grant Edwards wrote:
> >> On 2012-02-28, Arnout Vandecappelle<arnout@mind.be>  wrote:
> >>> On Tuesday 21 February 2012 14:54:47 Grant Edwards wrote:
> >>> [snip]
> >>>> I don't want to replace the default skeleton.  I want to add some
> >>>> files to it, and possible modify a few.  The documentation describes
> >>>> two ways to do that:
> >>>>
> >>>>    1) package/customize
> >>>>
> >>>>    2) post-build script
> >>>>
> >>>> I'm told 1) is now depricated, so I'm switching to 2).
> >>>>
> >>>> Where under board/mycompany/myproduct do you put "extra" files that
> >>>> will be added to the standard skeleton?
> >>> I put it in board/mycompany/myproduct/skeleton.  Although
> >>> rootfs-additions would be a better name than skeleton.
> >> Ah, perhaps I've misunderstood what a custom skeleton was for the past
> >> several years.  I thought it was the basis for the filesystem.  Is the
> >> custom skeleton something that's _added_ on top of the default
> >> skeleton rather than used in place of it?
> >>
> > Perhaps, but it is your script. If you want to completely replace the 
> > existing skeleton you can, but I think it makes more sense to just 
> > overlay new stuff on top of the default skeleton.
> 
> I seem to be completely lost.  Is board/mycompany/myproduct/skeleton
> above a post-build script or a custom skelecton (something you set
> BR2_ROOTFS_SKELETON_CUSTOM_PATH to point to)?

 The BR2_ROOTFS_SKELETON_CUSTOM_PATH is a real skeleton: it is copied to
the target fs before anything else is done.  It's called a skeleton
because it's mostly empty directories (/proc, /sys, /mnt, /usr/bin, ...).
There are a few files in /etc/ and /root as well.

 If you copy board/mycompany/myproduct/skeleton to the target in the
post-build script, that will go over everything else, because the
post-build script runs at the end.  That's why I say it should be
called rootfs-additions: it's added to the rootfs, it isn't the skeleton
of the rootfs.

 The post-build script (BR2_ROOTFS_POST_BUILD_SCRIPT) is just a script;
you have to add the command to copy it yourself.  For one customer,
for instance, I have:

BR2_ROOTFS_POST_BUILD_SCRIPT=board/mycompany/myproduct/cp-skeleton.sh

where cp-skeleton.sh contains:

dir="$(dirname $0)"/skeleton

if [ -d "$dir" ]; then
        rsync --exclude .svn --exclude '*~' -a "$dir"/* "$1"
fi

(indeed, this customer is using subversion :-)


 Ideally there should be a BR2_ROOTFS_ADDITIONS config option that does
exactly that, but I haven't gotten around to implementing it yet.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
