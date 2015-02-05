From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 5 Feb 2015 09:25:20 -0500
Subject: [Buildroot] [PATCH v6 16/16] ejabberd: new package.
In-Reply-To: <20150205085525.140473af@free-electrons.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-17-git-send-email-johan.oudinet@gmail.com>
 <20150203105629.0abbbe46@free-electrons.com>
 <CAJtjsKaX3Uf=V8yKDaSDCJMNPTW2Fv=eesGyxhU=vqq-cM0Oiw@mail.gmail.com>
 <20150203123253.13838ada@free-electrons.com>
 <CA+-urNRJAyoan6BqSNs8TePfkxLqEeKES8iruX9UMK5eJwHS9A@mail.gmail.com>
 <20150205085525.140473af@free-electrons.com>
Message-ID: <CA+-urNQHoD3ozLxeR-h+8K0fDuCQThQUjOiBHWJ0kb08UsgteA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 5, 2015 at 2:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Frank Hunleth,
>
> On Wed, 4 Feb 2015 16:17:25 -0500, Frank Hunleth wrote:
>
>> I'm not going to claim to be an Erlang expert, but I can add some
>> information. Applications that use lager need to enable Lager's parse
>> transform on the host Erlang compiler. The parse transform extracts
>> things like module, function, and line number information whenever
>> lager:warn, lager:info, etc. are called, so that it can be included in
>> the log messages. The parse transform actually has to be compiled for
>> the host. When you're not cross-compiling, it doesn't look as weird.
>
> Ok, thanks for the explanation.
>
>> Also, I should say that I've been quietly watching the various Erlang
>> patches on the mailing list. What I've seen looks pretty good. I do
>> use Erlang with Buildroot, but I use the Erlang Release tools to
>> generate the final images. This makes for smaller root filesystems
>> (Erlang's libraries are huge and largely irrelevant to most apps) and
>> is more compatible with how Erlang people do things. However, it's
>> definitely not how I think that things should be done in the Buildroot
>> project. I think that you guys are doing it right, so if I work a
>> project that just needs ejabberd or another Erlang app, then I'm going
>> to switch over to this framework. Thanks for doing this!
>
> Is there a way of doing the same as those Erlang Release tools, and
> make sure only the really used libraries are kept?

It might be possible. Almost all Erlang applications use a framework
called OTP. I actually think that you can ignore applications that
don't use OTP since they're almost exclusively toy apps. OTP requires
that each application and library have or generate a .app file that
lists all of its dependencies and some other info. This .app file also
contains information used at run-time, so it's guaranteed to be
installed. If you knew the top level Erlang applications that you
wanted, you could construct the dependency graph through all of the
libraries and either include or exclude them in the final image. The
Erlang release tools do this, but their goal is to copy everything
they need to a "release" directory. It's kind of like copying just the
stuff you need from staging to the target directory, but probably
enough different that the Erlang release tools can't be used as is. I
also suspect that there are enough subtle differences between how
Erlang projects set up their directory structures to make this a
non-trivial effort, but I haven't looked deeply into it.

Frank

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
