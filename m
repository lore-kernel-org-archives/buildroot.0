From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue, 13 Oct 2015 09:38:59 +0200
Subject: [Buildroot] [PATCH 1/1 v3] package/unscd: new package
In-Reply-To: <20151012163456.GA3735@free.fr>
References: <1444399839-10680-1-git-send-email-rdkehn@yahoo.com>
 <20151010145055.GC3640@free.fr>
 <CAGduivzbZ7254DV3ya++mSQ1wj1QT93xViq7urj2WP2SS7z9Tw@mail.gmail.com>
 <20151012163456.GA3735@free.fr>
Message-ID: <CAGduivxeFKpvCKzme0tK0H7XxBVm7miTHBm17hv1FLONZH9mZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 12, 2015 at 6:34 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Maxime, All,
>
> On 2015-10-12 10:34 +0200, Maxime Hadjinlian spake thusly:
> > On Sat, Oct 10, 2015 at 4:50 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> > wrote:
> > > On 2015-10-09 09:10 -0500, Doug Kehn spake thusly:
> > > > A daemon which handles passwd, group and host lookups for running
> > > programs and
> > > > caches the results for the next query. You only need this package if
> you
> > > are
> > > > using slow Name Services like LDAP, NIS or NIS+.
> > > >
> > > > This particular NSCD is a complete rewrite of the GNU glibc nscd
> which
> > > is a
> > > > single threaded server process which offloads all NSS lookups to
> worker
> > > > children; cache hits are handled by the parent, and only cache misses
> > > start
> > > > worker children, making the parent immune to resource leaks, hangs,
> and
> > > crashes
> > > > in NSS libraries.
> > > >
> > > > It should mostly be a drop-in replacement for existing installs using
> > > nscd.

 [--SNIP--]

> > nscd is a part of glibc, and looking at the code of glibc 2.22, the
> startup
> > script and systemd init file are included in the source. So I have a few
> > questions:
> >
> > Why is this not a part of the glibc package as an option ?
>
> From what I understood, this unscd is a complete *rewrite* of glibc's
> nscd.
>
> Where unscd shines is that it can resolve queries in parallel as it
> spawns a thread for each query that it has not yet cached, whereas
> glibc's nscd is single-threaded, thus serialising uncached queries.
>
> Thus, unscd should be overall "faster" at resolving queries than glibc's
> nscd would be.
>
> So, no, unscd is not part of glibc. nscd is, and we could indeed add an
> option to install it, of course. But that does not prevent unscd to also
> be oferred as a replacement.
>
Indeed, I misread the name of the package (and with it the intent of the
patch), and so I agree with you, that was a bad idea.

> >
> > nscd.service and nscd.tmpfiles which will create the /run/nscd directory
> > with the correct ACL, which doesn't seem to be done by your init script
> but
> > it's done by the shipped init script
>
> So, if I udnerstand you correctly, the systemd units are fine, but the
> startup script is missign some pieces, right?
>
No, both are missing pieces, that's why I think we should use upstream
files since they should know what they are doing :).

>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151013/50d5391a/attachment.html>
