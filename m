From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Jul 2021 22:33:14 +0200
Subject: [Buildroot] [git commit] package/pkg-python: invalidate
 precompiled _sysconfigdata*.pyc
In-Reply-To: <CADvTj4qzJhPU0GSEFer1ek2ZGx=5YHAC6uJOSbVVeTe1=6h5ag@mail.gmail.com>
References: <20210706204015.4499995463@busybox.osuosl.org>
 <CADvTj4qzJhPU0GSEFer1ek2ZGx=5YHAC6uJOSbVVeTe1=6h5ag@mail.gmail.com>
Message-ID: <20210708203314.GD410642@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, James, All,

On 2021-07-08 04:16 -0600, James Hilliard spake thusly:
> This seems to break host-python3-setuptools, see:
> http://autobuild.buildroot.net/results/860a188bd270c59b1fee2f56f31e73689f0e4979/build-end.log
> 
> Reverting this change fixes that error.
> 
> On Tue, Jul 6, 2021 at 3:13 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > [yann.morin.1998 at free.frs: reword the commit log]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[--SNIP--]
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 59a48e5a87..1e4fd5ba33 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -97,6 +97,8 @@ define PKG_PYTHON_FIXUP_SYSCONFIGDATA
> >         find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
> >                 -name "_sysconfigdata*.py" | xargs --no-run-if-empty \
> >                 $(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g"
> > +       find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
> > +               -name "_sysconfigdata*.pyc" -delete

So at first, that this commit introduces a regression was a bit
puzzling. Indeed, the same find command exists just three lines above,
so certainly they should have failed too.

And indeed, they do fail: the find error is visible twice in the build
error reported above.

However, the error code is silently ignored, because find is on the LHS
of a pipe.

So, this had been somewhat borked for a long time, but we jsut did not
notice, up until now that we do the exact same find, but not in a pipe.

And I see that in the previous iteration, that new find was a LHS of a
pipe too, piped into xargs, so that you did not have the issue in the
first iteration...

So, I think the simplest solution is that I revert this patch for now,
and that you take it back in your series and fix it with the proposal
laid out in the following patch (8/18), probably by reorganising the
series slightly...

Regards,
Yann E. MORIN.

> >  endef
> >  endif
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
