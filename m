From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Oct 2017 16:44:04 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171017141133.4d57ee87@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan> <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
 <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
 <20171017141133.4d57ee87@windsurf.lan>
Message-ID: <9955dbb8-0447-5a3d-9e78-a0f6f42e7e6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-17 14:11, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 17 Oct 2017 14:01:41 +0200, Arnout Vandecappelle wrote:
> 
>>  So first of all I would like to see an explanation why --output-sync=recurse is
>> not sufficient.
> 
> I did some quick testing with -Orecurse, and it looks pretty good to
> me. The only downside that I've seen so far is that the entire log of a
> given make target is shown when the target is finished, which in the
> current organization of things means even the ">>> foo 1.0 building"
> message is shown once the build of "foo" is completed.
> 
> Therefore, you end up in a situation where a lot of things have been
> displayed, and then nothing happens (because foo is being built). So
> you're wondering "what the heck is going on in here". And once "foo"
> has finished building, everything is displayed, and you understand what
> was going on. Perhaps this can be solved by having the message
> displayed as part of a separate target. Or perhaps we don't need to
> solve this problem at all?

 I think we do need to do something about it, but it could be as simple as
letting MESSAGE print to /dev/tty instead of stdout.


> Another thing is that I'd ideally want this to be done automatically by
> Buildroot, which is something we can do as part of the
> "make-calls-itself" in the main Makefile. Except that at this point, we
> don't have the Buildroot configuration available, and I wanted to make
> this conditional on some BR2_PARALLEL_BUILD=y option. Or we make
> -Orecurse the default, but that is going to significantly change the
> visible behavior even for people not using top-level parallel build.

 Ah, you would make top-level parallel build a config option? Isn't it enough to
observe the -j in MAKEFLAGS?

 I'm not convinced we want to add this option automatically, however, because it
makes it more difficult for people who don't want it. Why not add it to
utils/brmake, for example, and point people there in the documentation of
top-level parallel build?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
