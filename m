From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 30 Aug 2010 18:31:53 +0200
Subject: [Buildroot] Make 3.82 does behave differently than make
	3.81	for sure, but ...
In-Reply-To: <4C7BD1D6.5070100@jdines.net>
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
	<201008301701.22856.yann.morin.1998@anciens.enib.fr>
	<4C7BD1D6.5070100@jdines.net>
Message-ID: <20100830163153.GA12776@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> If you look at this thread from the LKML:
> 
> http://comments.gmane.org/gmane.linux.kernel/1022928
> 
> ... starting at the line "BTW seems like 2.6.27 no more combatible with
> GNU Make 3.82:" you will see that there is definitely something
> different between older makes and 3.82 (since I know 2.6.27 compiles
> with many different make versions).  My guess is there is a bug in make
> 3.82, but this is only conjecture, since I cannot be sure the make team
> didn't intend for the change (it may be a bugfix for a long standing bug)
> 
> In any case, users of make 3.82 can expect to grapple with this, thus
> the desire to fully understand what is really gong on here.
> 
> 
> Here is the proof that make 3.82 acts differently:
> 
> [jdines at hydra linux-2.6 (make-fix)] git checkout -b
> make-3.82-shoukld-fail v2.6.26
> Checking out files: 100% (21206/21206), done.
> Switched to a new branch 'make-3.82-shoukld-fail'
> [jdines at hydra linux-2.6 (make-3.82-shoukld-fail)] make clean && make
> Makefile:1550: *** mixed implicit and normal rules.  Stop.

make 3.81 accept the following:

foo foo%: bar
	command

With make 3.82 you need to split this up as:

foo: bar
	command

foo%: bar
	command

And we use the "foo foo%" construct in the top-level Makefile of the kernel.
The stable team have now backported a fix for this and it should apply
to 2.6.26 too - or at least simple to do manually.

In any recent kernels this is fixed long time ago (except for powerpc
where we fixed this only recently).

I hope this helps.

	Sam
