From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Wed, 4 Feb 2015 16:17:25 -0500
Subject: [Buildroot] [PATCH v6 16/16] ejabberd: new package.
In-Reply-To: <20150203123253.13838ada@free-electrons.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-17-git-send-email-johan.oudinet@gmail.com>
 <20150203105629.0abbbe46@free-electrons.com>
 <CAJtjsKaX3Uf=V8yKDaSDCJMNPTW2Fv=eesGyxhU=vqq-cM0Oiw@mail.gmail.com>
 <20150203123253.13838ada@free-electrons.com>
Message-ID: <CA+-urNRJAyoan6BqSNs8TePfkxLqEeKES8iruX9UMK5eJwHS9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan and Thomas,

On Tue, Feb 3, 2015 at 6:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Johan Oudinet,
>
> On Tue, 3 Feb 2015 11:35:38 +0100, Johan Oudinet wrote:
>
>> > I'm interested in hearing a bit more about the host-erlang-lager
>> > dependency. Why would ejabberd need a logging framework built for the
>> > host? This seems weird.
>>
>> I also think it's weird but otherwise ejabberd compilation failed at
>> src/gen_mod.erl, which includes include/logger.hrl.
>> At line 23 of this file there is such statement:
>> -compile([{parse_transform, lager_transform}]).
>> And lager_transform is provided by erlang-lager.
>>
>> I'm not an erlang guru but from lager documentation, it says this line
>> must be added to "the module you wish to compile with logging
>> enabled".
>> So, I guess it needs host-erlang-lager to add such capability to the
>> erlang compiler.
>> If an erlang expert reads this, it probably can provide a better explanation.

I'm not going to claim to be an Erlang expert, but I can add some
information. Applications that use lager need to enable Lager's parse
transform on the host Erlang compiler. The parse transform extracts
things like module, function, and line number information whenever
lager:warn, lager:info, etc. are called, so that it can be included in
the log messages. The parse transform actually has to be compiled for
the host. When you're not cross-compiling, it doesn't look as weird.

Also, I should say that I've been quietly watching the various Erlang
patches on the mailing list. What I've seen looks pretty good. I do
use Erlang with Buildroot, but I use the Erlang Release tools to
generate the final images. This makes for smaller root filesystems
(Erlang's libraries are huge and largely irrelevant to most apps) and
is more compatible with how Erlang people do things. However, it's
definitely not how I think that things should be done in the Buildroot
project. I think that you guys are doing it right, so if I work a
project that just needs ejabberd or another Erlang app, then I'm going
to switch over to this framework. Thanks for doing this!

Frank

>
> Ok, thanks for the details. I clearly don't have any Erlang knowledge,
> so I will not try to dive into this to understand what's going on.
> Those dependencies are anyway fairly light, so it doesn't matter that
> much.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
