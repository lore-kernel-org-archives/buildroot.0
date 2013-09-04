From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Wed, 4 Sep 2013 09:55:50 +0200
Subject: [Buildroot] SVN process started at make
References: <15AE5A936F5E3A42A9144E66875A0A8934DB3B@server1-derijp.CLB-Benelux.lokaal>
 <87sixm558s.fsf@dell.be.48ers.dk> <52260E11.4090103@mind.be>
Message-ID: <15AE5A936F5E3A42A9144E66875A0A8934DB3E@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout,

Thanks for your reply. This does indeed seem to be the cause. If I make
this change to the top-level Makefile:

# Compute the full local version string so packages can use it as-is
# Need to export it, so it can be got from environment in children (eg.
mconf)
-export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell
$(TOPDIR)/support/scripts/setlocalversion)
+export BR2_VERSION_FULL:=$(BR2_VERSION)

things are back to normal.

Am I correct, that what this setlocalversion does, is add a revision
mark to the version string? Does it run that for each file to be
processed (since it can take that long)? For my build it reports
"2013.02-svn9-dirty". So it seems to check only a number of files and/or
folders, since the trunk is at revision 84 now, but some folders are
indeed at 9.

Anyway: for now I will use my changed Makefile. Please let me know if I
should try some other fix to be of help.

Regards,

Ruud

> -----Oorspronkelijk bericht-----
> Van: Arnout Vandecappelle [mailto:arnout at mind.be] 
> Verzonden: dinsdag 3 september 2013 18:28
> Aan: Peter Korsgaard
> CC: Ruud Commandeur; buildroot at uclibc.org
> Onderwerp: Re: [Buildroot] SVN process started at make
> 
> On 09/03/13 16:50, Peter Korsgaard wrote:
> >>>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:
> >
> >   Ruud> Hi Everyone,
> >   Ruud> Since today, all my 'make' commands in the 
> buildroot dir take a very
> >   Ruud> long time before they actually start doing 
> something. It appears to be
> >   Ruud> that on each make command, an svn process is 
> started, that takes 5-10%
> >   Ruud> CPU time for a couple of minutes. Once this process 
> stops, the 'normal'
> >   Ruud> make actions start.
> >
> >   Ruud> My sources have been under svn control for a long 
> time by using
> >   Ruud> SmartSVN, but since today I installed the 
> commandline tool of
> >   Ruud> subversion. This must have triggered this 
> behaviour, but can anyone
> >   Ruud> explain to me how I can prevent this? Is this 
> someting in the
> >   Ruud> Makefile(s)?
> >
> > Odd. Would it be because of ./support/scripts/setlocalversion?
> 
>   I think it is. I experienced that as well (not personally 
> since I use 
> git-svn when the customer stores his buildroot tree in svn, but my 
> colleagues complained about it).
> 
>   Maybe we should put something like
> 
> LOCALVERSION ?= $(shell $(TOPDIR)/support/scripts/setlocalversion)
> BR2_VERSION_FULL := $(BR2_VERSION)$(LOCALVERSION)
> 
> in the top-level Makefile.
> 
> 
>   Regards,
>   Arnout
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 
> RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 
