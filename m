From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Mar 2018 19:53:06 +0100
Subject: [Buildroot] Build time increase in 2018.02
In-Reply-To: <1520879262.10662.24.camel@impinj.com> (Trent Piepho's message of
 "Mon, 12 Mar 2018 18:27:42 +0000")
References: <1520644453.25567.398.camel@impinj.com>
 <87k1ukcgjk.fsf@dell.be.48ers.dk>
 <1520879262.10662.24.camel@impinj.com>
Message-ID: <87woyh3z3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > On Sat, 2018-03-10 at 12:32 +0100, Peter Korsgaard wrote:
 >> > > > > >  > We've seen a big increase in build time with the latest buildroot.  On
 >> > a vpshere instance, times have gone up from 45 minutes to 180+ minutes.
 >> 
 >> Wow! What version did you use before upgrading to 2018.02 (the 45min)?

 > 2017.11.1.  I see one change that went in between that and 2018.02 is,
 > "core/pkg-generic: store file->package list for staging and host too"

Ok, then lets ensure the author on that patch (Yann) is aware of this
discussion.

 > If I breakdown step_pkg_size by tree:
 > step_pkg_size-stage      143.50
 > step_pkg_size-target     267.14
 > step_pkg_size-host       419.21

 > The other targets, extract, build, etc. are <1 second.  So adding
 > package size stats for staging and host is responsible for tripling the
 > time this step takes.

 > Looking at how the file accounting is done, it will md5sum the tree
 > with complexity O(n^2) on the size of the tree.  So it is not
 > surprising that it is very slow.  It also explains why re-installing a
 > host package after the build is done slow, since it must md5sum the
 > entire host tree twice.  At least when building it takes about half as
 > long since the earlier packages to install have a smaller tree to sum.

This indeed looks quite bad performance wise. Yann, any input?

 >> Argh, that's pretty horrible :/ I have noticed some overhead from the
 >> various instrumentation steps, but nothing as significant as this.
 >> 
 >> Out of interest, what kind of storage are you building this on? SSD or
 >> spinning disk?

 > A good NVMe SSD using PCI-Express.

Ok, nice ;)


 >> > On the vsphere instance, the time is much much worse.  I'm still
 >> > waiting for numbers.  It takes hours.  I think the lousy vm filesystem
 >> > performance magnifies the problem.
 >> 
 >> Yes, I/O performance is absolutely critical for stuff like Buildroot.

 > Here's the time for running on a VM.  
 > targetinstall             29.65
 > stageinstall              31.57
 > check_bin_arch            34.11
 > post_image                38.63
 > check_host_rpath          41.23
 > hostinstall               55.40
 > extract                   72.99
 > other                     73.77
 > build                    465.93
 > configure                689.38
 > step_pkg_size            2872.76

 > 47 minutes to check the package sizes.

 > While I don't use a VM myself, the people who run the infrastructure
 > for the CI and nightly builds think they are great.  It's the way
 > things are now.  Everyone's IT dept uses vsphere or AWS or some other
 > tech to allow them to create instances that are decoupled from the
 > physical hardware present (or in the cloud).

Yes :/

-- 
Bye, Peter Korsgaard
