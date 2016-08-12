From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Aug 2016 23:39:13 +0200
Subject: [Buildroot] [PATCH 1/8] package/netbsd-compat-headers: provide
 compatibility headers not in musl
In-Reply-To: <B44D3B81-3715-4ED7-9034-744BF2BB1E5A@gmail.com>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <1d561e7440fd9f14063d006fc3dca596c9c849c7.1471033837.git.yann.morin.1998@free.fr>
 <B44D3B81-3715-4ED7-9034-744BF2BB1E5A@gmail.com>
Message-ID: <20160812213913.GA5656@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Khem, All,

On 2016-08-12 14:30 -0700, Khem Raj spake thusly:
> 
> > On Aug 12, 2016, at 1:49 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > 
> > musl provides neither sys/queue.h nor sys/cdefs.h. Those two headers are
> > however quite widely used in a lot of packages (though they should at
> > least not use cdefs,h which is only full of mostly-legacy macros, and
> > which is mostly an internal header of glibc and was never really meant to
> > be exposed to, and used by packages).
> > 
> > But we don;t live in an ideal world, so a lot of packages break when
> > those two headers are missing.
> > 
> > We already took care of sys/queue.h with the netbsd-queue package. But
> > the need for cdefs.h is getting more and more pressing.
> > 
> > We rename the netbsd-queue package into musl-compat-headers, and we
> > make it install sys/queue.h (from NetBSD) and sys/cdefs.h (a minimalist
> > one we bundle in Buildroot). We can't use the cdefs.h from NetBSD
> > because it includes machine-dependent headers; instead we bundle a very
> > minimalistic one, that covers only what we need.
> 
> see here http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/bsd-headers/bsd-headers

Thanks for the pointer! :-)
But no licensing info in that file, so we can't use it... :-/

Also, we don't want to add a #warning, to avoid having to patch those
bad packages that find it smart to add -Werror by default.

> you might need some more.

Right now, all the packages in Buildroot that we were patching because
of cdefs.h only need those three macros: __BEGIN_DECLS(), __END_DECLS()
and __P().

There is no point in adding more than what we strictly require. As I
said in the cover letter, we can add the missing macros when we see the
issue.

TRhanks for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
