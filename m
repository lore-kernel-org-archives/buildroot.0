From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Aug 2014 22:44:43 +0200
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CA+-urNTH1Piz5T+SBkfGzuPHMS_4T=CUwcV8XP3p8vWZfCdDRw@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20140806202322.GE1587@free.fr>
 <CAJtjsKZan0d6fSg3HuT4gm4+09Cqej3NbFbFZNU+mh5YNPFEdQ@mail.gmail.com>
 <20140811103315.GB4364@free.fr> <20140811105005.GC4364@free.fr>
 <CA+-urNTH1Piz5T+SBkfGzuPHMS_4T=CUwcV8XP3p8vWZfCdDRw@mail.gmail.com>
Message-ID: <20140813204443.GH3939@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Frank, All,

On 2014-08-13 14:48 -0400, Frank Hunleth spake thusly:
> On Mon, Aug 11, 2014 at 6:50 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Johan, All,
> >
> > On 2014-08-11 12:33 +0200, Yann E. MORIN spake thusly:
> >> On 2014-08-11 11:36 +0200, Johan Oudinet spake thusly:
> >> > On Wed, Aug 6, 2014 at 10:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > [--SNIP--]
> >> > > And it fails at build time, with a lengthy error message, that I do not
> >> > > completely grasp:
> >> > >
> >> > >     /home/ymorin/dev/buildroot/O/host/usr/lib/erlang/bin/escript rebar
> >> > > get-deps && :> deps/.got
> >> > >     ==> rel (get-deps)
> >> > >     Uncaught error in rebar_core: {'EXIT',
> >> > >                                    {badarg,
> >> >
> >> > Very strange. It looks like the rebar script didn't accept the
> >> > get-deps argument.
> >> > Could you try with the same defconfig as mine to see if the problem
> >> > comes from there.
> > [--SNIP--]
> >> I'll check in a 32-bit chroot to see if the error is the same.
> >
> > OK, here's what it has to say when run in a 32-bit sueeze chroot:
> >
> >     ---8<---
> >     /home/ymorin/dev/buildroot/O/host/usr/lib/erlang/bin/escript rebar get-deps && :> deps/.got
> >     Uncaught error in rebar_core: {'EXIT',
> >                                    {undef,
> >                                     [{crypto,start,[],[]},
> >                                      {rebar,run_aux,2,
> >                                       [{file,"src/rebar.erl"},{line,143}]},
> >                                      {rebar,main,1,
> >                                       [{file,"src/rebar.erl"},{line,58}]},
> >                                      {escript,run,2,
> >                                       [{file,"escript.erl"},{line,752}]},
> >                                      {escript,start,1,
> >                                       [{file,"escript.erl"},{line,276}]},
> >                                      {init,start_it,1,[]},
> >                                      {init,start_em,1,[]}]}}
> >     make[2]: *** [deps/.got] Error 1
> >     ---8<---
> 
> I think that you can get this error if host erlang is compiled without
> openssl. Maybe you don't have the openssl headers installed on your
> system and Johan does?

Alas, no better luck.

I did de-install my libssl-dev package, so I only get the runtime from
openssl, and not the development files.

Then, I did three tests, all starting afresh from a clean tree, with the
ejabberd patch applied on top of master (e3bb4ac: fbv: fix typo in
pkg-config variable):

  - with just the patch;
  - then with a modified erlang.mk to compile our host erlang without ssl;
  - then with a modified erlang.mk to compile our host erlang with ssl.

All three build failed in the exact same way.

To disable ssl, I did:
    HOST_ERLANG_CONF_OPT += --without-ssl

To enable ssl, I did:
    HOST_ERLANG_CONF_OPT += --with-ssl
    HOST_ERLANG_DEPENDENCIES += host-openssl

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
