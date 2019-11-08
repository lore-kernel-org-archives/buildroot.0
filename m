From: jemy zhang <jemy.zhang@gmail.com>
Date: Sat, 9 Nov 2019 06:26:48 +0800
Subject: [Buildroot] [PATCH 1/1] fix corrupted download url of extra
 packages
In-Reply-To: <20191108172819.GG3419@scaer>
References: <20191105090448.99235-1-jemy.zhang@gmail.com>
 <20191105090448.99235-2-jemy.zhang@gmail.com>
 <20191108172819.GG3419@scaer>
Message-ID: <CAN21yuKSj+kXqEt7M0ANKXkVBQSWhKL_QLfgKSWQbD738aKP1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct, if the extra download url is relative to the main, only
SITE_METHOD prefix is needed. Thanks for your reviews.

Yann E. MORIN <yann.morin.1998@free.fr> ? 2019?11?9??? ??1:28???

> Jemy, All,
>
> On 2019-11-05 17:04 +0800, jemy.zhang at gmail.com spake thusly:
> > From: "Jemy Zhang" <jemy.zhang@gmail.com>
> >
> > If the download url of extra packages contains '+', the contents before
> > '+' will be parsed as SITE_METHOD, the original download url corrupted.
> >
> > check with android-tools package.
>
> Indeed this is broken. Thank you very much for noticing the issue.
>
> > Signed-off-by: Jemy Zhang <jemy.zhang@gmail.com>
> > ---
> >  package/pkg-generic.mk | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 893faba22a..bb0ca939a3 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -523,8 +523,9 @@ endif
> >  $(2)_ALL_DOWNLOADS = \
> >       $$(if
> $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
> >       $$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
> > -             $$(if $$(findstring ://,$$(p)),$$(p),\
> > -                     $$($(2)_SITE)/$$(p)))
> > +             $$(call getschemeplusuri,$$(call qstrip,\
> > +               $$(if $$(findstring ://,$$(p)),$$(p),\
> > +                       $$($(2)_SITE)/$$(p))),urlencode))
>
> I am not certain that we want to unconditionally enforce urlencode on
> all additional downloads...
>
> Instead, I think we should just replicate the site method for extra
> downloads that use the same site as the main download.
>
> I've sent a patch that does just that:
>     https://patchwork.ozlabs.org/patch/1192073/
>
> Can you see if that fixes it for you (it did for me, but if you have an
> alternate test-case, that'd be nice to have feedback on it too).
>
> Thanks again for the report! :-)
>
> Regards,
> Yann E. MORIN.
>
> >  ifndef $(2)_SITE
> >   ifdef $(3)_SITE
> > --
> > 2.22.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191109/5535bf9a/attachment-0001.html>
