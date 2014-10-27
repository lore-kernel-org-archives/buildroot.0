From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 27 Oct 2014 15:42:48 +0100
Subject: [Buildroot] [PATCH v3] ejabberd: new package
In-Reply-To: <CAJtjsKYZQabHeU5OwSm5sjfA3dpTg33uhkOX7M1Drv6scAkOTA@mail.gmail.com>
References: <1405686837-1418-1-git-send-email-johan.oudinet@gmail.com>
 <20141011162152.GA4254@free.fr>
 <CAJtjsKZC=Fi4ND7HX+YEEyGrNivu+6RduYnQ08FmVWU+NAiYqA@mail.gmail.com>
 <5441A0DF.20309@mind.be> <20141018100040.GA3858@free.fr>
 <CAJtjsKYZQabHeU5OwSm5sjfA3dpTg33uhkOX7M1Drv6scAkOTA@mail.gmail.com>
Message-ID: <CAJtjsKbaAKyGODDjpcCQRnzP__weqk1Jt8fTWnWVVMt7KPJM_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 18, 2014 at 12:31 PM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> Yann, Arnout, All,
> Le 18 oct. 2014 12:00, "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
>> On 2014-10-18 01:06 +0200, Arnout Vandecappelle spake thusly:
>> > On 16/10/14 14:38, Johan Oudinet wrote:
>> > > ** Fix ejabberd build system
>> > > ** ===================
>> > > The only solution i see is to create a buildroot package for every
>> > > ejabberd dependency, listed in rebar.config.script :
>> > > esip, goldrush, lager, p1_cache_tab, p1_iconv, p1_stringprep, p1_stun,
>> > > p1_tls, p1_utils, p1_xml, p1_yaml, p1_zlib, xmlrpc
>> > > Then, modify ejabberd package to not use rebar at all, or at least to
>> > > not call rebar get-deps. Thus, if I remove deps from the `all'
>> > > makefile rule and deps/.build from the `src' rule dependency, it might
>> > > work.
>> > >
>> > > Do you have a better idea?
>> >
>> >  Perhaps it's an option to run rebar in download-only mode in the
>> > download step?
>>
>> The problem is that rebar is an executable bundled in the ejabberd
>> archive, so, we can't run it before we extract ejabberd... :-(
>>
>> Unless we can switch to using an external rebar. Johan?
>
> Well, we could package the rebar project and use it instead of the binary
> included in ejabberd but I don't think it's a good idea.
> Actually, I've looked at how Debian has packaged ejabberd and they did patch
> it to get rid of the get-deps rule and packages every dependency separately.
> I'm going to have a look how perl is integrated in buildroot.
> Thanks.

I (with the help of a colleague) manage to package every ejabberd
dependency separately. We also had to package rebar because some
erlang packages rely on it but do not provide it. Therefore, if an
erlang package includes a rebar script, we use it. Otherwise, we add a
dependency on host-erlang-rebar and we use this one instead.
To simplify the task (12 erlang packages), we created a pkg-rebar.mk
file that provides {host-}rebar-package, similar to pkg-autotools.mk.
In doing so, we had to factorize the hooks in pkg-autotools.mk.

I guess the minor modifications of pkg-autotools.mk should be pushed
in a separate patch.
Then, should I push the rest of my commits as a big new revision of
this patch, or should I push each erlang package as a separate patch ?

-- 
Johan
