From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 8 Dec 2014 13:07:50 +0100
Subject: [Buildroot] [PATCH] ruby: fix verconf.h related build failure
In-Reply-To: <20141208103444.00348ed5@free-electrons.com>
References: <1417821815-9924-1-git-send-email-ps.report@gmx.net>,
 <20141208103444.00348ed5@free-electrons.com>
Message-ID: <trinity-0801f0f9-034d-4627-a042-a4966202b587-1418040469555@3capp-gmx-bs54>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Gesendet: Montag, 08. Dezember 2014 um 10:34 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH] ruby: fix verconf.h related build failure
>
> Dear Peter Seiderer,
> 
> On Sat,  6 Dec 2014 00:23:35 +0100, Peter Seiderer wrote:
> > See [1] for failure analysis.
> > 
> > Fixes:
> >    http://autobuild.buildroot.net/results/c94fef5d2cfb00a336905ae3c110d7680f6d5416/
> >    http://autobuild.buildroot.net/results/4375cb1e325a336dbf59f22f975be9165ad0648a/
> > 
> > [1] http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/ruby/ruby.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> 
> Thanks for this patch. I had a look, and did some testing. It appears
> that the issue doesn't appear on a systematic fashion (like one time
> out of 5 to 10 builds), which typically leads one to think it's a
> parallel build problem.
> 
> But we're building Ruby with $(MAKE1), which means we're not doing
> parallel build, so the problem should appear every time, no? Do you
> have an explanation as to why the problem only appears from time to
> time?
> 

I think it maybe a timestamp race condition, see [1] for investigation with
source file links, but basically the problem is the creation of a
temporarily verconf.h file in the configuration step and a timestamp
dependency for rebuild (with different content) of verconf.h for the
build step:

loadpath.o -> verconf.h -> RBCONFIG/.rbconfig.time (build by tool/mkconfig.rb

which, according to he failing build.log, is not detected by the make command
(no log for verconf.h creation)...

Maybe its related to a fast build machine and/or timestamp resolution of the
filesystem and/or timestamp resolution of the make command?

But even some 'native' ruby user/developer seem to come across this problem with
some funny 'resolutions' for the problem, e.g changing quoting of variables
(see [2]/[3] and [4]).

But did not investigate further as I can not reproduce the problem locally
and could not figure out the original intent of a temp verconf.h version
and/or the timestamp dance for rebuilding another version...

But I am convinced that deleting the temp verconf.h will trigger a correct
rebuild of a valid version of verconf.h for the buildroot case....

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
[2] http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/66724
[3] https://github.com/ruby/ruby/commit/deba55eb1a950b72788aa4cab10ccc032c1d37a7
[4] https://github.com/ruby/ruby/commit/15cfc9553a1ff1e4a84c40360ed3285b27edaf60


> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> 
