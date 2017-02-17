From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Feb 2017 23:19:40 +0100
Subject: [Buildroot] [PATCH] package/opengl: ensure consistency between
 the various providers
In-Reply-To: <c29bd185-70aa-7641-1ff0-285ef2d2565b@mind.be>
References: <1487106796-15403-1-git-send-email-yann.morin.1998@free.fr>
 <681a6c09-1976-193c-a738-ff948ff86567@mind.be>
 <20170216175648.GD4986@free.fr>
 <c29bd185-70aa-7641-1ff0-285ef2d2565b@mind.be>
Message-ID: <20170217221940.GF3470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-02-17 08:56 +0100, Arnout Vandecappelle spake thusly:
> On 16-02-17 18:56, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2017-02-16 18:46 +0100, Arnout Vandecappelle spake thusly:
> >> On 14-02-17 22:13, Yann E. MORIN wrote:
> [snip]
> >>> Since we can not protect against this situation in the Config.in files
> >>> (especially because providers may be out-of-tree), we can only check for
> >>> the validity after the fact.
> >>
> >>  Perhaps it would be possible to create a new opengl virtual package, and that
> >> the libgl* providers provide opengl instead of the specific libgl. So libgl etc.
> >> would no longer be virtual packages by themselves, but just suboptions of
> >> opengl. The libgl* consumers would depend on BR2_PACKAGE_HAS_LIBGL but add
> >> opengl to their dependencies instead of libgl.
> > 
> > I don't like it, because it means that it is no longer possible to have
> > out-of-tree providers (e.g. in a br2-external tree).
> > 
> > (If I understood correctly what you are proposing.)
> 
>  Probably not :-)

Damn... ;-)

> My proposal would break current out-of-tree providers (and
> consumers), but new providers would still be possible.
> 
>  The idea is that libgl, libgles and libegl would no longer be virtual packages.
> Instead, opengl would be a virtual package, with three suboptions
> BR2_PACKAGE_HAS_LIBGL, BR2_PACKAGE_HAS_LIBGLES and BR2_PACKAGE_HAS_LIBEGL, each
> of which would select BR2_PACKAGE_HAS_OPENGL. A provider would select one of the
> suboptions (which implicitly selects HAS_OPENGL), and would set only
> BR2_PACKAGE_PROVIDES_OPENGL to itself. A consumer would depend on one of the
> suboptions in the Config.in file, and add opengl to its DEPENDENCIES in the .mk
> file. BR2_PACKAGE_HAS_OPENGL itself would not be used except by the
> virtual-package infra.
> 
>  Basically, it boils down to reusing the existing infra for detecting
> conflicting providers of virtual packages.

Ah, I see. Yes, this is clever. Yes, I would think this would be
acceptable.

But clearly this would not be not for 2017.02.

[--SNIP--]
> >>  Shouldn't all this be protected by BR_BUILDING?
> > 
> > I was wondering if we should have it, so that we could re-enter the
> > menuconfig in case of error, but it seems that it was not needed.
> > 
> > And we do not want to allow 'make source' either, sonce the
> > configuration is invalid.
> > 
> > What are you trying to protect against (here) with BR_BUILDING?
> 
>  I didn't thing really hard about it, that's why it was a question :-) It's just
> that most of this kind of stuff is protected by BR_BUILDING. But indeed, the
> check in virtual-package isn't, and that's what we try to emulate here, so it's OK.

I will double-check.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
