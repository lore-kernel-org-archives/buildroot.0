From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 19:10:07 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
 installation
In-Reply-To: <20151129185859.3fa69ae8@free-electrons.com>
References: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
 <20151129185859.3fa69ae8@free-electrons.com>
Message-ID: <20151129181007.GF3630@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-29 18:58 +0100, Thomas Petazzoni spake thusly:
> On Fri,  6 Nov 2015 20:15:30 +0100, Yann E. MORIN wrote:
> > Some packages misbehave, and install files in either of;
> >   - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
> >   - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).
> > 
> > One common reason for that is that pkgconf now prepends the sysroot path
> > to all the paths it returns. Other reasons vary, but are mostly due to
> > poorly writen generic-packages.
> > 
> > Add a check for those locations, as part of the command blocks for the
> > target and staging installs.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Peter Seiderer <ps.report@gmx.net>
> > Cc: Romain Naour <romain.naour@openwide.fr>
> 
> On my side, I am not supper happy with the additional complexity added
> to the generic package infrastructure (yet again 19 lines added to
> pkg-generic.mk, to verify for a very specific type of failure).
> 
> Could we instead use TARGET_FINALIZE_HOOKS for this check (yes it means
> you wouldn't know which package has installed the files, but it's
> generally trivial to find from the name/path of the installed files) ?

Well, I for one would prefer we fail right on the culprit package,
rather than port-pone the check until the end. This way, it is obvious
which package is the cuplrit.

Except we now have a file-> package mapping (thanks to your graph-size),
so we could re-use that in a target-inalise hook, indeed.

Well, except maybe not... Can target-finalise be called before we have
all the host packages (most notably the filesystem image generators)?

> Or alternatively, use the existing instrumentation hooks.

Arnout did not like that, hence why I put in the common install rule.

Of course, with my comment above, I agree we could postpone it up to
target-finalise (if the minor nit above is answered negatively).

> And then, regardless of the solution being used, put this stuff in a
> new .mk file (whose name shall be determined) which would ultimately
> contain the implementation of other sanity checks (for example the
> sanity check that all binaries are built for the correct target
> architecture).

OK. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
