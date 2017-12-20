From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 20 Dec 2017 08:52:21 -0500
Subject: [Buildroot] [PATCH v2 1/1] erlang: remove non-SMP build option
In-Reply-To: <20171220132812.GB21413@scaer>
References: <1513709144-12840-1-git-send-email-fhunleth@troodon-software.com>
 <20171220112604.6a560700@windsurf.lan> <20171220132812.GB21413@scaer>
Message-ID: <CA+-urNSW6Gx5bpWKXW4V4UNZ=0b8rCDsWJPEH5zd1=bpS=SgPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Dec 20, 2017 at 8:28 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, Frank, All,
>
> On 2017-12-20 11:26 +0100, Thomas Petazzoni spake thusly:
>> On Tue, 19 Dec 2017 13:45:44 -0500, Frank Hunleth wrote:
>> > The non-SMP scheduler was deprecated with the Erlang/OTP 20.0 release and
>> > slated for removal with the next major Erlang release. Since the non-SMP
>> > scheduler isn't even built anymore, this option no longer has the
>> > intended effect of saving space or compile time. The SMP scheduler
>> > supports both SMP and non-SMP processors, so removing the option will
>> > not break any platforms.
>> >
>> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>> > ---
>> > Changes v1 -> v2:
>> >   - Added text to Config.in.legacy to explain the removal of the option
>> >     (suggested by Yann - I added to Config.in.legacy after thinking about
>> >      it, since anyone who previously selected this option may be surprised
>> >      to see the SMP scheduler in their process list.)
>> >
>> >  Config.in.legacy         | 10 ++++++++++
>> >  package/erlang/Config.in | 10 ----------
>> >  package/erlang/erlang.mk |  4 ----
>> >  3 files changed, 10 insertions(+), 14 deletions(-)
>> >
>> > diff --git a/Config.in.legacy b/Config.in.legacy
>> > index decbace..1607df6 100644
>> > --- a/Config.in.legacy
>> > +++ b/Config.in.legacy
>> > @@ -153,6 +153,16 @@ config BR2_PACKAGE_GNUPG2_GPGV2
>> >       The gpgv2 executable is now named gpgv. The config option
>> >       has been renamed accordingly.
>> >
>> > +config BR2_PACKAGE_ERLANG_SMP
>> > +   bool "erlang smp option removed"
>> > +   select BR2_LEGACY
>> > +   help
>> > +     This option used to disable Erlang's SMP scheduler to save
>> > +     space. Since Erlang 20.0 deprecated the non-SMP scheduler and
>> > +     no longer builds it, it is no longer relevant. See the Erlang
>> > +     20.0 release notes for more information. Note that the SMP
>> > +     scheduler runs on both SMP and non-SMP CPUs.
>>
>> As Yann explained, we do not want a Config.in.legacy option. Indeed,
>> the new behavior is identical to having the option enabled, so there is
>> no point in having a Config.in.legacy entry.
>
> Yes, indeed.
>
> Frank, what I meant was  that, usually we have to add a legacy entry to
> tell users what is happenning. However, in this particular case, it is
> not needed because a build with this option enabled previously will now
> yield the same result as  build now with this option removed.

That's not true. Before if you enabled the option, you'd get the
uniprocessor scheduler. With the change, you get the SMP scheduler.

In the .mk file, if you were to enable BR2_PACKAGE_ERLANG_SMP, that
would pass "--disable-smp-support" to the configure script. That
forces the uniprocessor scheduler. With this patch, you only can get
the SMP scheduler. I'm not sure how many people would do this, but
operationally, you'd see a process called "beam.smp" running on your
system now. The uniprocessor scheduler made a process called "beam".
That seems like a different result to me?

Looking over the Erlang release notes, the situation may even be worse
now since they've added a --enable-plain-scheduler option to build the
uniprocessor scheduler, so the current option BR2_PACKAGE_ERLANG_SMP
option may not even work. I don't know, but the uniprocessor scheduler
is not worth spending time on any more since it's going to be removed
soon.

>
> But this it is usualy to add a legacy entry, for the reviewr's sake, it
> is important that the commit log explains why a legacy entry is not
> needed.

I'm fine either way. I'm stuck in the thinking that this change isn't
identical to the previous behavior, so I'm not sure how to explain it
in the commit message. If someone indulges me with text, I'll gladly
send a v3 or feel free to merge one of my other versions.

Frank

>
> Sorry if I was not explicit enough about this...
>
> Regards,
> Yann E. MORIN.
>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
