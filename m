From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 10 Aug 2015 15:10:07 +0200
Subject: [Buildroot] Issue with host-erlang-rebar causing timeouts
In-Reply-To: <55663493.1040500@mind.be>
References: <20150521212150.3f39f1c1@free-electrons.com>
 <20150521214726.19fc73fa@free-electrons.com>
 <20150521220438.624c6697@free-electrons.com> <55663493.1040500@mind.be>
Message-ID: <CAJtjsKYL9zBk0jt_OT9KbJeV4_4_BOSTqziGocg9ZDbrX+mnsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

I'm just back from vacations and I see there is still this timeout
issue about host-erlang-rebar during the last autobuilds.
Looking at the thread on this topic, it looks like there are some
questions from Arnout that remain unanswered.

On Wed, May 27, 2015 at 11:18 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 05/21/15 22:04, Thomas Petazzoni wrote:
>> On Thu, 21 May 2015 21:47:26 +0200, Thomas Petazzoni wrote:
>>
>> Turns out that right after sending this e-mail, I checked, and one of
>> the build was stuck exactly in this situation. The process tree is like
>> this:
>>
>> 23332 pts/5    S+     0:01  |       \_ python ../buildroot-test/scripts/autobuild-run -c autobuild-run.conf
>> 23969 pts/5    S      0:00  |       |   \_ timeout 28800 make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVE
>> 23970 pts/5    T      0:19  |       |       \_ make O=/ssd1/thomas/autobuild/instance-2/output -C instance-2/buildroot BR2_DL_DIR=/ssd1/thomas/autobuild/instance-2/dl BR2_JLEVEL=4
>                  ^
>  This means that the 'make' instance either got a SIGSTOP or ptrace(). Is there
> some administrative process running on that machine that is doing something
> funky with it? Or is it the autobuild-run script that is sending some signal?
>
>
>> 10928 pts/5    Z      0:00  |       |           \_ [bash] <defunct>
>>
>> So basically, the Buildroot "make" invocation only has one child
>> process: a bash process that is defunct. This instance is really stuck
>> in the ./bootstrap call:
>
>  No it's not, bootstrap is finished already, but the stopped make hasn't reaped
> it yet. Actually, even the make has finished already...

I agree with Arnout. From ps output, the bash process is a zombie,
which means it has terminated and its parent hasn't reaped it yet.
Since its parent is in a stopped status (either by a job control
signal or because it is being traced), we should look at the reason
why make is in such status.
Could it be a problem with the timeout command?

>
>>
>> make[1]: Entering directory '/ssd1/thomas/autobuild/instance-2/output/build/host-erlang-rebar-2.5.1'
>> ./bootstrap
>> [nothing else]
>
> ...but somehow the output of that finished make has not yet ended up in the log
> file...
>
>  Mysterious...
>
>
>>
>> I tried running the exact make command that builds host-erlang-rebar in
>> a terminal, inside the build directory of this build, and it worked
>> perfectly fine. So even more puzzled.
>
>  Have you tried running it within the timeout? Maybe that one is doing SIGSTOP
> or ptrace() for some reason...
>

I think it's worth trying to manually run the command within the
timeout as suggested by Arnout.
If there is still no output, you could try to run ./bootstrap with the
debug flag. Finally, I would strace the entire build process to see
where it is stuck, but this might requires a lot of disk space.

That's indeed a weird problem and I'm sorry I don't have a better
solution to offer.

Regards,
-- 
Johan
