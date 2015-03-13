From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Mar 2015 23:10:13 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix use of extensions
In-Reply-To: <20150313214751.2df5307c@free-electrons.com>
References: <cover.1426272973.git.yann.morin.1998@free.fr>
 <7a6b64928c074474e7577f762550fe60916ed052.1426272973.git.yann.morin.1998@free.fr>
 <20150313214751.2df5307c@free-electrons.com>
Message-ID: <20150313221013.GA4391@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-13 21:47 +0100, Thomas Petazzoni spake thusly:
> On Fri, 13 Mar 2015 19:57:29 +0100, Yann E. MORIN wrote:
> > Currently, using externsaions is flawed and does not work in a very
> extensions
[--SNIP--]
> > to running the linux configuratin UI?
> configuration

Damn, I even re-read myself before sending. Seems it was not enough...
:-/

> > This is because dependencies are only acted on at configure time, which
> > is a step further after the kconfig stage. This probably was not an
> > issue before we switched to the kconfig infra for the kernel, but that
> > use-case was completely missed at the time (blame me!).
> 
> Hum, I am not sure to see why the switch to the kconfig-package
> infrastructure would have modified this behavior. So I'd like to
> understand how it used to work, if it ever worked (but I believe it
> did, no?).

Fair enough, I'll double-check that it did / did not work back then.

> > Fix that:
> > 
> >   - first, the dependency on extensions is moved to a dependency of the
> >     patch step;
> 
> This is a bit problematic because then the dependency is unknown to the
> package infrastructure. Which means that things like 'make
> graph-depends' will no longer display this dependency.

Right. Note however that this was already the case for the RTAI
externsion, because it was declaring:

    LINUX_DEPENDENCIES += rtai-patch

so that was already missed (or at least mis-interpreted) by graph-depends
anyway.

> To solve this, we would have to add a <pkg>_PATCH_DEPENDENCIES variable
> in pkg-generic, or something like that.
> 
> But again, I'd like to understand why we didn't need that until now.

As said above, I'll double-check on that.

> >   - then, to avoid circular dependencies (e.g. linux->rtai->linux), do
> >     not add extensions to LINUX_DEPENDENCIES, instead, add them to a
> >     special variable, from which we derive both the list of dependencies
> >     and the list of post-patch hooks.
> > 
> > This makes it slightly easier to write linux extensions: no need to
> > delve in the .stamp_patched internals for each extension, just a
> > function to (conditionally) define and a variable to assign.
> 
> I'm not sure to understand how the linux extensions had to delve into
> the .stamp_patched internals. They were just registering a
> POST_PATCH hook, no?

No, they _did not_ have to so far.

What I meant is that the switch to a dependency of the patch step
required that they would now all have had to write something like:

    $(LINUX_DIR)/.stamp_patched: | EXT-patch

(where EXT is the name of the extension.)

To avoid such an arcane code that would have to be replicated (and
potentially tracked down in case we change something in dependency
handling), I found it would be better to have it all handled in a single
location.

Anyway, I'll look at your suggestion of introducing FOO_PATCH_DEPENDENCIES.
However, linux is the sole package that requires such handling, and I
wonder if it is worth introducing for just a single package (note that
I rehash your own argument, hehe! ;-) )

> > (Note: this should go into a section of the manual...)
> 
> Yes, indeed, once we settle on a solution :)

Eh, yes! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
