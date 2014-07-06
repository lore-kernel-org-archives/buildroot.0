From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jul 2014 17:28:42 +0200
Subject: [Buildroot] [PATCH v2] infra: fix autotools .la fixing when no
 .la files are present
In-Reply-To: <CAAXf6LXuLCB6Jd5AdYExj3LR4dizR8UyCc94rekYGb2+JQstdQ@mail.gmail.com>
References: <bb03ffeaa528d3c99f51.1404659451@localhost>
 <CAAXf6LXuLCB6Jd5AdYExj3LR4dizR8UyCc94rekYGb2+JQstdQ@mail.gmail.com>
Message-ID: <20140706152842.GE3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-06 17:21 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Jul 6, 2014 at 5:10 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
> > Commit 6f638ea9c9c7bacc646430a74ad3dd2740eae676 ("infra: /usr support:
> > STAGING_DIR can be outside BASE_DIR") changed a for-construct around 'sed
> > -i' in a 'find | xargs sed -i'. However, if the find returns no results,
> > sed complains with:
> >     '/bin/sed: no input files'
> >
> > This commit adds the extra parameter -r / --no-run-if-empty to the xargs
> > call, effectively fixing this problem case.
> >
> > Reported-by: Rohit Kumar <rkthebest@gmail.com>
> > Fix-suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >
> > ---
> >  package/pkg-autotools.mk |  2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff -r c8ed6565ea09 -r bb03ffeaa528 package/pkg-autotools.mk
> > --- a/package/pkg-autotools.mk  Thu Jul 03 12:35:57 2014 +0300
> > +++ b/package/pkg-autotools.mk  Sun Jul 06 16:19:04 2014 +0200
> > @@ -281,7 +281,7 @@
> >  ifndef $(2)_INSTALL_STAGING_CMDS
> >  define $(2)_INSTALL_STAGING_CMDS
> >         $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
> > -       find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
> > +       find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
> >                 $$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
> >                         -e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
> >                         -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
> 
> Note that I chose for the xargs solution here.
> Do you prefer the xargs-like find solution instead?
>     find DIR PREDICATES -exec commands +

As I said on IRC, I'm fine with the xargs solution.

If people are more accustomed to using 'find |xargs' rather than using
'find -exec {} +', then no problem.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
