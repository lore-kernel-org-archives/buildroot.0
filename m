From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 18:50:14 +0200
Subject: [Buildroot] [PATCH 1/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <20131014091609.06dcc63c@skate>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
 <f6240fcb39c5dcbfe7a74cc74da3089e3c982ae5.1381705600.git.yann.morin.1998@free.fr>
 <20131014091609.06dcc63c@skate>
Message-ID: <20131014165014.GA3491@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-10-14 09:16 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Mon, 14 Oct 2013 01:11:25 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > This hooks will let us instrument the build process in many ways:
> >   - log current step to see what broke
> >   - time each step to see what is worth optimising
> >   - sanity-check installed files (rpath, overwritten files...)
> >   - call user-provided script
> >   - ...
> > 
> > The steps are fine-grain, and all have a 'start' and a 'end' hooks.
> > Here is the list of available steps (19 total):
> >   - extract, post-extract
> >   - pre-patch, patch, post-patch
> >   - pre-configure, configure, post-configure
> >   - build, post-build
> >   - install-host, post-install-host
> >   - install-staging, post-install-staging, pkg-config-staging
> >   - install-image, post-install-image
> >   - install-target, post-install-target
> > 
> > The download, clean, uninstall steps are not instrumented on purpose.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> I am not sure to follow why we're introducing additional hooks here.
> Why don't we generalize the existing pre/post hooks mechanism to *all*
> steps (by all I mean the steps you are interested in instrumenting),
> and use that to hook the different things you introduce in patch 2, 3,
> 4 ?

I'm not sure I understand what you suggest, so I'll try to explain what
I understood (in a series-like order):

  - add missing pre/post hooks to all steps
  - have the pkg-infra internally register pre/post hooks for each
    package
  - add and register the time/user hooks

Is that what you meant?

> Also, do we really need to have hook points for the pre-hooks and
> post-hooks each time?

Yes, I wan't to be able to instrument them. Especially, I want to be
able to check that pre/post hook are not messing with target/ in crazy
way. I also want to be able to time them (heck, I've seen a hook takes
orders of magnitude longer than the corresponding action).

With your suggestion, I don't know how we can instrument the pre/post
hooks.

Note: However, I agree that we could reduce the number of steps by
squashing, for example, end-pre-configure with start-configure, or
end-configure with start-post-configure (and so on). But having both
start/end be separate barriers is cleaner and more systematic; it helps
reviewing a log of the build without constantly wondering what frontier
a specific step is.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
