From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu, 22 Mar 2018 18:11:59 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <20180322175035.2410072a@windsurf>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
 <87efkhfimu.fsf@dell.be.48ers.dk>
 <20180322164144.GY14461@australia>
 <20180322175035.2410072a@windsurf>
Message-ID: <20180322171159.GZ14461@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 22, 2018 at 05:50:35PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 22 Mar 2018 17:41:44 +0100, Thomas De Schampheleire wrote:
> 
> > It really depends on what you use these files for.
> > 
> > The original use case for the target list was rootfs size analysis. In the
> > discussion I have seen comments like missing a few files is not that important
> > here, but I disagree: if the missing file is 2MB large, it is a big problem.
> > 
> > Another use in-tree is to check for check-uniq-files. While this is a
> > non-critical feature, it's a pity if it would not detect problems because the
> > lists are inaccurate.
> > 
> > But there are out-of-tree uses too.  The most obvious usage is simply to
> > understand which package was responsible for a given file, even separate from
> > size analysis.
> > 
> > But there are also derived use cases. For example we are using the target list
> > in order to extract some packages from the root filesystem. For example, instead
> > of on the root filesystem (initramfs or NOR flash), they should end up on the
> > NAND flash. A script gets as input the list of packages to extract this way, and
> > uses the list to get the right associated files.
> > 
> > I'm sure there are other use cases.
> > 
> > The current timestamp-based approach not guaranteeing an accurate list is
> > problematic for many such uses. And as you already mentioned, since we don't have
> > full control over the build steps done in any given package, we don't know which
> > timestamps they will use. There may be very good reasons to install certain
> > files with their original timestamp and not the one from the build.
> 
> These are all valid concerns, but what do you suggest ?
> 
> The current approach of hashing all files clearly doesn't scale, as a
> significant amount of build time is now spent on hashing files.
> 

I can only observe that previously, when we still only listed the target files,
the impact did not seem to be that bad, and the concerns about impact on build
time arose with the creation of staging and host lists.
(I hope I caught this correctly from the discussions, I did not yet do
measurements myself. I just saw several differences in the list files when
applying this patch on top of 2018.02).

So one possible alternative is to go back to a situation where only target files
are listed, or make the different lists optional. Users that want the lists and
are ready to accept build time impact, can enable it. Those that don't care
about the lists and just want a fast build, can disable it.
We'd loose the feature of check-uniq-files in case a list is not present, of
course.

Yet another alternative could be to have a different method depending on the
list. Although I personally think that all lists should be accurate, if they are
created.

Another approach: just do a find without md5 (possibly depending on some
option). If all you care about is an accurate list of who created a file but
don't care that much about others possibly overwriting one, then a simple find
is enough and normally quite fast.

Best regards,
Thomas
