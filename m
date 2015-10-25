From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 22:50:17 +0100
Subject: [Buildroot] [PATCH v5 02/36] package/libevas-generic-loaders:
 move to package directory
In-Reply-To: <562D4C80.4030204@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-3-git-send-email-romain.naour@openwide.fr>
 <20151025125624.GD3665@free.fr> <562D2BA3.9020203@openwide.fr>
 <20151025210402.GI11692@free.fr> <562D4C80.4030204@openwide.fr>
Message-ID: <20151025215017.GM11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

romain, All,

On 2015-10-25 22:41 +0100, Romain Naour spake thusly:
> Le 25/10/2015 22:04, Yann E. MORIN a ?crit :
> > On 2015-10-25 20:21 +0100, Romain Naour spake thusly:
[--SNIP--]
> >> So, IIUC when a package A select a package B, we must propagate all reverse
> >> dependencies of the package B when the package A already depends on them
> >> implicitly (i.e when using a depends on BR2_PACKAGE_C).
> > 
> > I'm not sure I groked what you wrote, so here's a litle example. Say you
> > have a pacakge foo that needs bar and bar needs threads; here's how
> > you'd express it:
> > 
> >     config foo
> >         bool "foo"
> >         depends on threads # bar
> >         select bar
> > 
> >     config bar
> >         bool "bar"
> >         depends on threads
> 
> In my example based on libevas-generic-loaders, I had 3 packages:
> 
>      config foo
>          bool "foo"
>          depends on threads
> 
>      config bar
>          bool "bar"
>          depends on foo
>          [depends on threads # baz]
>          select baz
> 
>      config baz
>          bool "baz"
>          depends on threads
> 
> So foo and baz depends on threads, bar depends on foo.
> The question is do we need to add [depends on threads # baz] for bar in that case ?
> bar implicitly depends on threads thanks to foo dependency.
> 
> So, what I understand after your comment is that we must keep the reverse
> dependency on threads for the package bar because it select baz.

Yes, you need to keep it in that case, because, if foo looses its
dependency on threads, bar still needs it because it selects baz.

The other reason you would keep it is if bar itself would need threads.

> Ok, I'll look at it latter the week, I'll try to resend a new series before the
> next week-end.

Hehe! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
