From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 10:21:49 +0200
Subject: [Buildroot] [PATCH 9/9] core: finalise target in its own
 location
In-Reply-To: <20151002074632.GA3908@free.fr>
References: <cover.1443650034.git.yann.morin.1998@free.fr>
 <a594ac3858ea713de72610ad49566be4e20c176f.1443650034.git.yann.morin.1998@free.fr>
 <20151001234400.0d18c041@free-electrons.com>
 <20151002074632.GA3908@free.fr>
Message-ID: <20151002102149.418fb8e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 2 Oct 2015 09:46:33 +0200, Yann E. MORIN wrote:

> > To be honest, my initial reaction is: why? What is the benefit? It's
> > additional complexity (not so much in the code), but in the user
> > visible output directories.
> 
> Well, I would say that the user-visible target/ directory, the one we
> are currently exposing, is still user-visible, and the only one we want
> to expose to users. The new build/target-finalise/ directory introduced
> here is not meant to be user-visible. If having that directory in build/
> is considered to be user-visible, then I agree this is not that good; we
> should really have this directory hidden to the user. It is an internal
> step which the user should not meddle with.

Well I personally dislike precisely the fact that what the user sees in
output/target/ is not really what goes into the root filesystem image.
It will remain cluttered with header files, static libraries, locales
and zillions of other crappy things. Users will wonder what's going on,
etc. If there's one thing that users should not see, it is precisely
that.

> A trivial example of a non-idempotent target-finalise hook could be:
> 
>     define FOO_CREATE_MY_USER
>         echo "user:x:1234:5678::/home/user:/bin/sh" >>$(TARGET_DIR)/etc/passwd
>     endef
>     TARGET_FINALIZE_HOOKS += FOO_CREATE_MY_USER

This is trivially fixed with:

 1/ Using the proper mechanism for that: the users table.

 2/ If it's not about creating a user but something else, then a simple
    grep addition will make it work.

> Yes, this is badly written, but we can't expect this kind of situation
> won't happen in real life, especially with br2-external stuff which we
> by design can not review. It has hapenned; it will happen again.

Right, but such mistakes are seen quite quickly I believe. The user
will soon enough realize that his post-build script or
TARGET_FINALIZE_HOOKS is executed each time "make" is called, and that
they have to be idempotent.

> >  - "under complex situations where a combination of packages does not
> >    yield an idempotent sequence", which doesn't come with a real-life
> >    example of such a situation.
> 
> Indeed, I have no first-hand example. However, I really said "under
> complex situations" just because if such a situation exists, it is
> complex by nature and will be difficult to debug.

Sorry for turning down the patch, but I am not a big fan of taking new
features just because an unknown, supposedly complex situation by
nature, may hypothetically exists.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
