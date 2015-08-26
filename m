From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Aug 2015 20:47:47 +0200
Subject: [Buildroot] [PATCH] package/wf111: remove package
In-Reply-To: <20150826193251.02c382a3@free-electrons.com>
References: <1440202387-7291-1-git-send-email-yann.morin.1998@free.fr>
 <20150823163653.3989f210@free-electrons.com>
 <20150823153737.GD3729@free.fr>
 <20150823205857.1625a64f@free-electrons.com>
 <55DB7994.8080509@mind.be> <87vbc3xgcq.fsf@dell.be.48ers.dk>
 <20150826170933.4501e3e8@free-electrons.com>
 <87bnduxe0t.fsf@dell.be.48ers.dk>
 <20150826193251.02c382a3@free-electrons.com>
Message-ID: <20150826184747.GA1934@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-26 19:32 +0200, Thomas Petazzoni spake thusly:
> On Wed, 26 Aug 2015 17:31:14 +0200, Peter Korsgaard wrote:
> 
> > Yeah, I should probably have been more clear. _I_ didn't notice the issue
> > back when it was submitted (and you committed the patch). If I had,
> > perhaps I would have commented on it.

Ditto, I just missed that back then.

> The thing is that I'm not sure what we can do about it, or other
> packages for which the source/binary is not available in a way that
> allows automated downloading (either because creating an account is
> needed, or because the program/library is not free). Besides wf111,
> another example I gave are the different Qt5 components that are only
> available to paying Qt customers.

Well, I think my position is well defined: we should not have such
package in the official Buildroot tree.

Since they are not available, there is absolutely nothing we can do with
them:
  - no maintenance (infra changes, clean-ups...)
  - no autobuild testing
  - no user support (ML or IRC)

> On the one hand, having the package in the main Buildroot tree makes
> things easy for people having access to those components: it's
> supported by default in Buildroot.

I believe that would be a false claim. It would not be "supported",
since only the (limited set of) people with access to the source could
help, and there's not guarantee they would stick forever (on the ML or
on IRC) or that they would even commit to provide support.

> On the other hand however, since we, maintainers and core developers of
> Buildroot, may not have access to those components, it might be
> problematic for long term testing and maintenance.

That's my main concern with such packages.

> I'm not really sure how to solve this situation. Should we reject all
> such packages and ask people to keep them in their private trees (which
> limits a lot the sharing of such packages: the whole point of Buildroot
> as an open-source project is to share as many package recipes as
> possible).

As you said: "as possible". In this case, I believe this is not
possible.

> Or should we integrate them, maybe marking them in a special
> way that indicates that we can't test/maintain them?

Well, wf111 is in; it was an accident, let's not remove it until it
proves actuallt harmfull to us in some way or another (I'll be marking
the patch as rejected in Pathwork, but I'll be prompt to resend should
we have an issue with that package).

IMHO, we should reject any other attempt at getting such a package in
the future.

I don't mind we package non-free, even non-open-source (aka proprietary)
packages, as long as their download can be automated and not require any
manual intervention from the user.

Yes, it's a pity we can't get the Qt non-free packages. But especially
with Qt, they are such a critical piece of a project that I would not
want we tell users hat we have such support in Buildroot. That would
just be blatantly lying.

OTOH, *one* way to which I *may* agree is to add something like

In Build options ---> Advanced --->

    config UNSUPORTED_NON_PUBLIC_PACKAGES
        bool "Show unsupported non-public packages"
        help
          Some packages do not have publicly accessible source
          code, either require registration, manual download...

          Buildroot has recipes for building those packages, but
          given that their sources ar enot freely available, there
          is not guarantee they do work as expected, not even build
          at all.

          Use at your own risk. Do not report problems to the
          Buildroot developpers. Sending patches to fix them might
          be accepted.

At the end of package/Config.in:

    if UNSUPORTED_NON_PUBLIC_PACKAGES

    menu "Unsupportedd non-public packages"

    comment "****************************"
    comment "big fat comment explaining  "
    comment "something like the help text"
    comment "on multi lines              "
    comment "USE AT YOUR OWN RISK!       "
    comment "****************************"

    source "package/wf111/Config.in"

    endmenu

    endif # UNSUPORTED_NON_PUBLIC_PACKAGES

And even then, I would be very picky on those packages...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
