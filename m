From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Sep 2014 22:26:29 +0200
Subject: [Buildroot] [PATCH 09/25 v6] docs/manual: do not hardcode name
 of the generated document
In-Reply-To: <19a2025b-9e6b-458a-9f8a-9b15c42f01cf@email.android.com>
References: <cover.1411812968.git.yann.morin.1998@free.fr>
 <06692733754cdc2bf2b340c5e6b0201f5770740d.1411812968.git.yann.morin.1998@free.fr>
 <CAAXf6LVCKLRLj_CLgVkEpjtET=90rK5v+6sE493cOmFxLgY8ew@mail.gmail.com>
 <20140929200105.GB6211@free.fr>
 <19a2025b-9e6b-458a-9f8a-9b15c42f01cf@email.android.com>
Message-ID: <20140929202629.GC6211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-29 22:09 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >On 2014-09-29 21:33 +0200, Thomas De Schampheleire spake thusly:
> >> On Sat, Sep 27, 2014 at 12:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> >> > +$$(O)/docs/$(1)/$(1).$(5): $$($(call UPPERCASE,$(1))_SOURCES) \
> >> 
> >> I didn't mean to also change this uppercase call from $$ to $. The
> >> 'exception' is until now only made when calling the inner infra from
> >> the outer one. On this line, we are already in the inner infra so one
> >> would use $$.
> >
> >But that does not matter, does it?
> >
> >The expansion of $(call UPPERCASE) is done on a parameter, so we might
> >as well expand it right at call time, rather than at evaluation time,
> >no?
> 
> Technically you're right. However, in the discussion
>  on the dollars we realized that the matter is
>  sufficiently non-obvious that we better use clear cut
>  rules. That rule says that everything should be $$
>  except for parameters, pkgname/pkgdir and the
>  uppercase call from outer to inner. 
> 
> In this case, you understand the issue and judge that
>  a single $ suffices, but tomorrow someone else will
>  change the value and forget to reevaluate the dollars.

Agreed, that's fair. I will change.

> >> > +                          $(1)-check-dependencies \
> >> > +                          $(1)-check-dependencies-$(4) \
> >> > +                          $(1)-prepare-sources
> >> > +       $$(Q)$$(call MESSAGE,"Generating $(6) $(1)...")
> >> 
> >> What is the purpose of the quotes here, given your recent commit of
> >> qstrip in MESSAGE ?
> >
> >Because I looked at what was done in pkg-generic or some such, and
> >mimicked. At which point someone noticed on the ML (or IRC) about the
> >quoting issue, and I did not adapt my code.
> >
> >But it does not really matter: we can quote messages, now. Or not.
> 
> True. I don't understand though why we wouldn't
>  change all unnecessary quoting in the quest for symmetry and simplicity.

If at all, we should change to always quote messages.

The problem is two-fold:

  - no quoting: we can not have a comma in the message, otherwise make
    would split on it:  $(call MESSAGE,This, and that, should foo)

  - always quoting: the MESSAGE definition already does the quoting to
    ensure it does not break on a semi-colon (which you noticed):
    $(call MESSAGE,"; echo shellshock")

(He, shellshock is all the hype nowadays. Even superseeds heartbleed!)

If MESSAGE would not do the quoting, and rely on the caller to do it,
we'd be vulnerable to: $(call MESSAGE,; echo shellshock)

So: we want MESSAGE to always quote its arguments (and no, single quotes
do not cut it either, because a message might have single quotes too),
while still allowing callers to do the quoting. Or not.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
