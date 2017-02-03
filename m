From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri, 3 Feb 2017 11:49:21 +1100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-01-18
In-Reply-To: <f1548a5f-834c-f0ff-d12e-2e711aba91d3@mind.be>
References: <20170119072929.AFCF620C11@mail.free-electrons.com>
 <20170120003818.GA5114@tungsten.ozlabs.ibm.com>
 <20170120131817.382b2ac9@free-electrons.com>
 <e3ea8933-3a86-a374-37b8-67f5aefb9675@mind.be>
 <20170202230606.GA12132@tungsten.ozlabs.ibm.com>
 <f1548a5f-834c-f0ff-d12e-2e711aba91d3@mind.be>
Message-ID: <20170203004921.GB12132@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 03, 2017 at 12:27:11AM +0100, Arnout Vandecappelle wrote:
> 
> 
> On 03-02-17 00:06, Sam Bobroff wrote:
> > On Thu, Feb 02, 2017 at 10:19:08PM +0100, Arnout Vandecappelle wrote:
> >>
> >>
> >> On 20-01-17 03:18, Thomas Petazzoni wrote:
> >>> Hello,
> >>>
> >>> On Fri, 20 Jan 2017 11:38:18 +1100, Sam Bobroff wrote:
> >>>
> >>>>> This is the list of Buildroot build failures that occured on
> >>>>> 2017-01-18, and for which you are a registered architecture developer
> >>>>> or package developer. Please help us improving the quality of
> >>>>> Buildroot by investigating those build failures and sending patches to
> >>>>> fix them. Thanks!
> >>>>>
> >>>>> Build failures related to your architectures:  
> >>>>
> >>>> [snip]
> >>>>
> >>>>>    powerpc64 |                  openocd-0.9.0 | http://autobuild.buildroot.net/results/0640114028b1e633cefc682e8d6a8283a3a39019  
> >>>>
> >>>> Hi Thomas,
> >>>>
> >>>> I've had a look at the openocd failure, above, and while it's simple and
> >>>> I have a patch for it, there might be something odd going on so I
> >>>> thought I should ask you about it first.
> >>>>
> >>>> The failure is in the install stage, caused by the documentation being
> >>>> regenerated from the .texi input, which fails. It's easy to fix by
> >>>> tweaking the Makefile (actualy Makefile.in) as has been done on many
> >>>> other packages... however, what I'm curious about is why the error is
> >>>> showing up in the autobuilder in the first place.
> >>>>
> >>>> The file modification times in the package's archive seem to be correct:
> >>>> $ ls openocd-0.9.0.orig/doc/openocd.{info,texi}
> >>>> -rw-r--r-- 1 xxxx xxxx   3,542 2015-05-18 07:13:55.000000000 +1000
> >>>> openocd-0.9.0.orig/doc/openocd.info
> >>>> -rw-r--r-- 1 xxxx xxxx 354,589 2015-05-18 07:04:07.000000000 +1000
> >>>> openocd-0.9.0.orig/doc/openocd.texi
> >>>>
> >>>> (And I can't replicate the autobuilder failure unless I touch the .texi
> >>>> file.)
> >>
> >>  Weird that you can't reproduce. At the end of the build step I see:
> >>
> >> Making all in doc
> >> Updating ./version.texi
> >>
> >> and of course version.texi is a dependency of openocd.info.
> > 
> > Right, that's exactly what I'm talking about. It's clear to me that the
> > build will fail if it tries to rebuild the documentation, and I've got a
> > patch that can suppress it. *BUT* why is that rule being triggered on
> > the autobuilders? It's not triggered when I try to replicate it, and
> > that looks correct too, because:
> > 
> > $ tar tvf ~/dl/openocd-0.9.0.tar.bz2 |grep "doc/openocd"
> > -rw-r--r-- 1000/1000    300191 2015-05-18 07:13 openocd-0.9.0/doc/openocd.info-1
> > -rw-r--r-- 1000/1000    139898 2015-05-18 07:13 openocd-0.9.0/doc/openocd.info-2
> > -rw-r--r-- 1000/1000      3542 2015-05-18 07:13 openocd-0.9.0/doc/openocd.info
> > -rw-r--r-- 1000/1000    354589 2015-05-18 07:04 openocd-0.9.0/doc/openocd.texi
> > -rw-r--r-- 1000/1000      3237 2014-03-30 03:55 openocd-0.9.0/doc/openocd.1
> > 
> > ... which clearly shows that the .info files are older than the .texi
> > file and no rebuild is necessary! (And as I would expect, I see these
> > timestamps unaltered in my build directory.) Could we hack some debug
> > into the autobuilder to show the file times before running the install
> > step?  (pre-install hook perhaps?)
> 
>  The rule *is* triggered for me. Not in the build step, but in the install step.
> Because at the end of the build step, version.texi is generated, and
> openocd.info depends on version.texi (line 416 of Makefile.in).
>
>  So what is surprising is that it is not regenerated for you.

Hmmm!

(The rule is triggered during the install step for me too.)

Yes, openocd.info depends on version.texi but on my system that doesn't
trigger a rebuild...

The core of it seems to be the rule in the doc/Makefile at
line 421, for handling $(srcdir)/stamp-vti (which is a dependency of
version.texi, which as you say, can trigger the re-generation of
openocd.info and the build failure).

On my system, this (seems to be) what happens when that rule runs:
* mdate-sh is used to generate a new version.texi
* that new version is compared to the existing one, they are the same
* version.texi is not copied
* no failure

You noted that that version.texi IS being re-generated when the build
fails so presumably mdate-sh is producing output that differs from
version.texi, causing the copy to happen and the build to fail. Or
something else is happening.

Since the build is failing for you, could you have a look at the build
directory after a failed build and post the content of doc/version.texi
as well as the modification time of doc/openocd.texi? Perhaps the file
is being touched somehow, or perhaps mdate-sh is generating subtly
different output for the same modification time (different end of line
or something?) and causing the compare to fail.

Thanks for the help!
Sam.

>  Regards,
>  Arnout
> 
> > 
> >>  Regards,
> >>  Arnout
> >>
> >>>>
> >>>> Is something you've seen before?  Could something on the autobuilder be
> >>>> touching a file or otherwise confusing the timestamp?
> >>>>
> >>>> What I don't understand is how this particular file causes a
> >>>> re-generation yet other files don't (e.g. Makefile.am would cause
> >>>> regeneration of Makefile.in but that doesn't happen).
> >>>>
> >>>> Any ideas? Just send the patch?
> >>>
> >>> I don't really have a good idea. I'm adding the Buildroot mailing list
> >>> in Cc in case other folks have more ideas.
> >>>
> >>> Thomas
> >>>
> >>
> >> -- 
> >> Arnout Vandecappelle                          arnout at mind be
> >> Senior Embedded Software Architect            +32-16-286500
> >> Essensium/Mind                                http://www.mind.be
> >> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> >> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> >> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
