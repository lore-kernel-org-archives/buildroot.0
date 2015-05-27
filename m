From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 May 2015 23:18:11 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <20150521220438.624c6697@free-electrons.com>
References: <20150521212150.3f39f1c1@free-electrons.com>	<20150521214726.19fc73fa@free-electrons.com>
 <20150521220438.624c6697@free-electrons.com>
Message-ID: <55663493.1040500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/21/15 22:04, Thomas Petazzoni wrote:
> Johan,
> 
> On Thu, 21 May 2015 21:47:26 +0200, Thomas Petazzoni wrote:
> 
>> Maybe I should set up a cronjob that checks every minute if we are in
>> this situation, and send me an e-mail, so that maybe I can catch the
>> situation while it's happening, and see a bit more what's going on. I
>> don't really have better ideas :/
> 
> Turns out that right after sending this e-mail, I checked, and one of
> the build was stuck exactly in this situation. The process tree is like
> this:
> 
> 23332 pts/5    S+     0:01  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
> 23969 pts/5    S      0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVE
> 23970 pts/5    T      0:19  |       |       \_ make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVEL=4
                 ^
 This means that the 'make' instance either got a SIGSTOP or ptrace(). Is there
some administrative process running on that machine that is doing something
funky with it? Or is it the autobuild-run script that is sending some signal?


> 10928 pts/5    Z      0:00  |       |           \_ [bash] <defunct>
> 
> So basically, the Buildroot "make" invocation only has one child
> process: a bash process that is defunct. This instance is really stuck
> in the ./bootstrap call:

 No it's not, bootstrap is finished already, but the stopped make hasn't reaped
it yet. Actually, even the make has finished already...

> 
> make[1]: Entering directory '/ssd1/thomas/autobuild/instance-2/output/build/host-erlang-rebar-2.5.1'
> ./bootstrap
> [nothing else]

...but somehow the output of that finished make has not yet ended up in the log
file...

 Mysterious...


> 
> I tried running the exact make command that builds host-erlang-rebar in
> a terminal, inside the build directory of this build, and it worked
> perfectly fine. So even more puzzled.

 Have you tried running it within the timeout? Maybe that one is doing SIGSTOP
or ptrace() for some reason...

 Regards,
 Arnout

> 
> I see however that 'bootstrap' tries to play with the hg and git VCS to
> get a commit reference. Maybe this is failing for some reason?
> 
> Any other idea?
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
