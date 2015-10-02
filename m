From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Oct 2015 09:46:33 +0200
Subject: [Buildroot] [PATCH 9/9] core: finalise target in its own
	location
In-Reply-To: <20151001234400.0d18c041@free-electrons.com>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
 <a594ac3858ea713de72610ad49566be4e20c176f.1443650034.git.yann.morin.1998@free.fr>
 <20151001234400.0d18c041@free-electrons.com>
Message-ID: <20151002074632.GA3908@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-01 23:44 +0200, Thomas Petazzoni spake thusly:
> On Wed, 30 Sep 2015 23:54:52 +0200, Yann E. MORIN wrote:
> > Currently, after all packages have been installed into target/ , we run
> > a sanitising pass called 'target-finalize' on that directory, to:
> >   - apply overlays
> >   - remove unnecessary files (man, .h, .a ...)
> >   - strip files
> > as well as a few other miscellanous cleanups.
> > 
> > This means that target/ no longer contains only package-installed files,
> > and that target-finalize might not be idempotent (i.e. sucessive runs of
> > target-finalize may yield different results in target/ ). We're trying
> > pretty hard that all the internal target-finalize hooks are idempotent,
> > whether they are from the core (e.g. installing glibc locales) or
> > provided by packages (e.g. cleaning up perl files).
> > 
> > However, that might not be the case for packages from br2-external for
> > example, or under complex situations where a combination of packages
> > does not yield an idempotent sequence (quoting Wikipedia: "a combination
> > of idempotent methods or subroutines is not necessrily idempotent"; see:
> > https://en.wikipedia.org/wiki/Idempotence#Examples ).
[--SNIP--]
> 
> To be honest, my initial reaction is: why? What is the benefit? It's
> additional complexity (not so much in the code), but in the user
> visible output directories.

Well, I would say that the user-visible target/ directory, the one we
are currently exposing, is still user-visible, and the only one we want
to expose to users. The new build/target-finalise/ directory introduced
here is not meant to be user-visible. If having that directory in build/
is considered to be user-visible, then I agree this is not that good; we
should really have this directory hidden to the user. It is an internal
step which the user should not meddle with.

> Having idem-potent post-build scripts seems like a good goal to
> achieve. Your only arguments are:
> 
>  - "this might not be the case for br2-external", but it doesn't
>    explain why

A trivial example of a non-idempotent target-finalise hook could be:

    define FOO_CREATE_MY_USER
        echo "user:x:1234:5678::/home/user:/bin/sh" >>$(TARGET_DIR)/etc/passwd
    endef
    TARGET_FINALIZE_HOOKS += FOO_CREATE_MY_USER

Yes, this is badly written, but we can't expect this kind of situation
won't happen in real life, especially with br2-external stuff which we
by design can not review. It has hapenned; it will happen again.

>  - "under complex situations where a combination of packages does not
>    yield an idempotent sequence", which doesn't come with a real-life
>    example of such a situation.

Indeed, I have no first-hand example. However, I really said "under
complex situations" just because if such a situation exists, it is
complex by nature and will be difficult to debug.

> So with the current explanation/motivation, I'm inclined to say no to
> this change. I'd be happy to revise my opinion if there are some clearer
> benefits to balance the drawbacks of the additional complexity.

Sure, the changes introduced here are not trivial, by a fair margin...

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
