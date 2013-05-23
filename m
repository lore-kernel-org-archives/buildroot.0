From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 20:12:49 +0200
Subject: [Buildroot] Design issue with the out-of-tree support
In-Reply-To: <20130523131251.2ffc509f@skate>
References: <20130523131251.2ffc509f@skate>
Message-ID: <20130523181249.GD3250@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-05-23 13:12 +0200, Thomas Petazzoni spake thusly:
> I've restarted the work on supporting the per-package out-of-tree
> support, and I stumbled across a problem about which I'd like to seek
> the community opinion.

Thank you for this thorough explanations!

> However, running autoreconf is something that should be done in the
> source tree. It's part of the "patching" process of the package, more
> than its configuration step.

Agreed.

> I see several possibilities:
> 
>  * In all packages, split in two variables the dependencies needed at
>    autoreconf time from the dependencies needed at configure time. But
>    this seems horrible and difficult to maintain and understand for
>    users.

Nope.

>  * Make $(1)-patch depend on all dependencies. This will break RTAI, so
>    we can exclude 'linux' for the list of $(1)-patch dependencies. So
>    something like:
> 
>    $(1)-patch: $(filter-out linux,$$($(2)_DEPENDENCIES))
> 		...
> 
>    $(1)-configure: $(filter linux,$$($(2)_DEPENDENCIES))
> 		...

What when we have another package like that? And a third?
That's not really nice IMHO.

>  * Make autoreconf a step on its own, instead of being either a
>    pre-patch hook or a post-patch hook. This may also allow to do
>    something like a 'make <pkg>-reautoreconf' target, like we have
>    'make <pkg>-reconfigure' and 'make <pkg>-rebuild'. Then, this
>    autoreconf step would be the one that has:
> 
>    $(1)-autoreconf: $$($(2)_DEPENDENCIES)

I believe that's the sane approach.

>    which would work ok, since the RTAI/Linux integration depends on
>    rtai-patch, which wouldn't pull the dependencies of the rtai package.
> 
>    However, I am not yet sure how to insert this step into the package
>    logic, since this step is specific to autotools package, and
>    therefore would normally not belong to the pkg-generic.mk
>    infrastructure.

Maybe have the autotools infra override the dependency chain, by
tweaking $(2)_TARGET_CONFIGURE or something like that?

>  * Find a different solution for RTAI, so that we can pull the
>    dependencies before the "patch" step.

I'd say we should keep it that way, and wait for another one or two
packages (if they even exist) with similar requirements, before we try
to get a generic solution for that RTAI issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
