From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 16:54:01 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-04
In-Reply-To: <CANQCQpZJPwwSoFVJ2DCU8tDn7OQPrPr02RABi1UgWwZmH=S8QA@mail.gmail.com>
References: <20170505062802.8C0262097E@mail.free-electrons.com>
 <20170505132423.3602e294@free-electrons.com>
 <CANQCQpYL-sL2xGKw==LAgEOSnoD_ULAaCtj=cb-KAFyM0ZJt4A@mail.gmail.com>
 <20170506145221.3db37159@free-electrons.com>
 <CANQCQpZJPwwSoFVJ2DCU8tDn7OQPrPr02RABi1UgWwZmH=S8QA@mail.gmail.com>
Message-ID: <20170506165401.6405e548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 6 May 2017 09:14:04 -0500, Matthew Weber wrote:

> I had been running 4 instances on a virtual machine and had symlinked
> the dl folders together to one.   This was mostly for space reasons
> and I've since restored it to what you'd expect.

You can't symlink the download folder: for each instance, we run some
logic before a build that removes 5 random tarballs from the download
folder, in order to:

 1. Keep the download folder size to a reasonable amount
    (statistically, unused tarballs will be removed at some point)

 2. Regularly re-test the download of packages, in order to detect when
    packages are no longer available upstream.

However, if you share the downloader folder between instances, this all
breaks down: a tarball can be removed after it has been downloaded,
but before it gets extracted (time window is small so almost never
happens) or a tarball can be removed between the time it gets
downloaded/extracted and the moment it gets used for "legal-info" (much
longer time window, which is why we're seeing these issues).

> Here's the whole story....  I have modified the scripts to use a
> Primary Site from an internal FTP because of proxy stability affecting
> builds.  Secondly, the script is modified to look at a result for a
> failing package and see if the build_end.log has a failure related to
> our proxy or if it's a actual failure (for the case of a new package
> not yet being on our internal FTP).  The last modification is to use
> our mirror of buildroot which is 6hrs behind upstream.  This again is
> proxy related and we had some failures because of timeouts to pulling
> upstream.   I will take a look at my patchset and see if there maybe
> should be some enhancements I push upstream.

Lots of issues :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
