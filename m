From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 10:15:34 +0200
Subject: [Buildroot] [PATCHv3] *config: improve handling of BR2_LEGACY
In-Reply-To: <5528601E.2080302@mind.be>
References: <1428525388-24739-1-git-send-email-yann.morin.1998@free.fr>
 <5528601E.2080302@mind.be>
Message-ID: <20150411081534.GA4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-11 01:43 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/15 22:36, Yann E. MORIN wrote:
> > From: Arnout Vandecappelle <arnout@mind.be>
> > 
> > In 8a46d4bf1f the randpackageconfig and allpackageyesconfig were
> > extended with disabling all the legacy options, otherwise the resulting
> > config couldn't be built. However, that didn't work for randconfig and
> > allyesconfig.
> > 
> > This commit reverts 8a46d4bf1f and replaces it with a different
> > approach: skipping of the legacy config options is passed explicitly
> > through the environment variable SKIP_LEGACY, which forces
> > BR2_SKIP_LEGACY to y.
> > 
> > We add a (silent) call to olddefconfig to set out the old legacy
> > options aside.
> 
>  Yes, that's another way to avoid the 'make oldconfig' problem.
> 
>  I actually found it useful to have the option user-visible, because then it's
> possible to get rid of all of them in one shot. But on the other hand, it's not
> so nice that it gets saved in the defconfig...

Yeah, I don't like it at all either...

However...

> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > [yann.morin.1998 at free.fr: do not rely on a user-visible option, works
> >  perfectly well with only blind options set from the environment]
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > ---
> > Changes v2 -> v3:
> >   - add the missing pieces (calling olddefconfig)
> > 
> > Changes v1 -> v2:
> >   - don't use a user-visible option  (Yann)
> > ---
> >  Config.in.legacy | 12 ++++++++++++
> >  Makefile         | 27 ++++++++++++++-------------
> >  2 files changed, 26 insertions(+), 13 deletions(-)
> > 
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 445cab7..38fca09 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -52,6 +52,16 @@
> >  #
> >  # [End of example]
> >  
> > +config BR2_SKIP_LEGACY_ENV
> > +	bool
> > +	option env="SKIP_LEGACY"
> 
>  This additional option is no longer needed if it's not user visible.

... I was planning on re-instating the user-vibility of this variable in
a follw-up patch, with a trick so that it does not remaint set in the
.config .

Well, it's been committed as your v4, but re-adding it should not be too
complex. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
