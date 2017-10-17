From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 14:11:33 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan>
 <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
Message-ID: <20171017141133.4d57ee87@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 14:01:41 +0200, Arnout Vandecappelle wrote:

>  So first of all I would like to see an explanation why --output-sync=recurse is
> not sufficient.

I did some quick testing with -Orecurse, and it looks pretty good to
me. The only downside that I've seen so far is that the entire log of a
given make target is shown when the target is finished, which in the
current organization of things means even the ">>> foo 1.0 building"
message is shown once the build of "foo" is completed.

Therefore, you end up in a situation where a lot of things have been
displayed, and then nothing happens (because foo is being built). So
you're wondering "what the heck is going on in here". And once "foo"
has finished building, everything is displayed, and you understand what
was going on. Perhaps this can be solved by having the message
displayed as part of a separate target. Or perhaps we don't need to
solve this problem at all?

Another thing is that I'd ideally want this to be done automatically by
Buildroot, which is something we can do as part of the
"make-calls-itself" in the main Makefile. Except that at this point, we
don't have the Buildroot configuration available, and I wanted to make
this conditional on some BR2_PARALLEL_BUILD=y option. Or we make
-Orecurse the default, but that is going to significantly change the
visible behavior even for people not using top-level parallel build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
