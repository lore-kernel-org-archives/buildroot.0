From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Feb 2016 21:32:12 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
	output file
In-Reply-To: <20160225180158.673b34f5@free-electrons.com>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <20160225170758.1f444549@free-electrons.com>
 <CAAXf6LXz_WcAAsk+kts3cZ4=v1Pw1rB=nLf9yKr9FotCZRR8sg@mail.gmail.com>
 <874mcwwxyx.fsf@dell.be.48ers.dk>
 <20160225180158.673b34f5@free-electrons.com>
Message-ID: <20160225203212.GD5870@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2016-02-25 18:01 +0100, Thomas Petazzoni spake thusly:
> Dear Peter Korsgaard,
> 
> On Thu, 25 Feb 2016 17:34:14 +0100, Peter Korsgaard wrote:
> 
> >  > Also, for packages where the source is included with buildroot, like
> >  > makedevs, FOO_SITE is empty too.
> > 
> > .. but those also don't define _SOURCE / _VERSION, so wget isn't called
> > ;)
> 
> Yeah, but I was proposing to check for an empty FOO_SITE in the package
> infrastructure itself, so we're not at the point where wget gets called.

What about:

    diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
    index e22babb..64c6fdc 100644
    --- a/package/pkg-generic.mk
    +++ b/package/pkg-generic.mk
    @@ -436,7 +436,7 @@ endif
     $(2)_ALL_DOWNLOADS = \
        $$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
            $$(if $$(findstring ://,$$(p)),$$(p),\
    -$$($(2)_SIT            E)/$$(p)))
    +$$(if $$($(2)_SITE),$$($(2)_SITE)/$$(p))))
 
     ifndef $(2         )_SITE
      ifdef $(3)_SITE

> But to answer Thomas: for cases like makedevs, we can special case such
> packages (their _SOURCE is empty, or something like this).

Indeed, they are already covered by the existing exclusions.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
