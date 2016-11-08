From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Nov 2016 18:36:18 +0100
Subject: [Buildroot] [PATCH 4/6] package/pseudo: expose the host binary
 in a variable
In-Reply-To: <d165cfb4-643c-e43f-e3a9-79ce7086917a@mind.be>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <36c6de6cdc72a8340da56bf9d44bdab064a9fd61.1478553802.git.yann.morin.1998@free.fr>
 <d165cfb4-643c-e43f-e3a9-79ce7086917a@mind.be>
Message-ID: <20161108173618.GD3554@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-08 00:01 +0100, Arnout Vandecappelle spake thusly:
> On 07-11-16 22:23, Yann E. MORIN wrote:
> > Running pseudo is more involved than running fakeroot. In the transition
> > from using fakeroot, we just did not account for the extra requirements.
> > 
> > First, we explicitly tell pseudo where it is, otherwise it tries to
> > guess. Its guess is correct, but it prints a warning, which is not nice.
> > 
> > Second, we tell it where to find the passwd and group files in case it
> > has to emulate access to them. We currently do not use that feature, but
> > better safe than sorry.
> > 
> > Third, pseudo spawns a background daemon, and talks to it (when fakeroot
> > would emulate the state all in the current process' state, pseudo uses
> > the daemon to coordinate the state across multiple processes). We are
> > not much interested in the daemon lingering around, so we just tell it
> > to termintate as soon as the last clients quits (this can take up to one
> > second).
> > 
> > Fourth and last, pseudo always stores its internal database when
> > exiting, and reloads it when spawned. The database is by default stored
> > in a sub-directory of the prefix it was installed in, but this is
> > impractical for us, in case the host-dir is outside the config dir
> > $(BASE_DIR). We want the database to be specific to the one config dir
> 
>  $(HOST_DIR), even if outside of $(BASE_DIR), must also be specific to one
> config dir. Remember that $(STAGING_DIR) resides under $(HOST_DIR). So this
> argument is not really valid. However, I do fully agree that
> $(HOST_DIR)/usr/var/pseudo is *not* the best place for it, and that your
> proposed location is better.

OK, I'll rephrase accordingly.

> > we are building. So, we store the database in a (hidden) sub-dir of the
> > build dir, thus ensuring it is never shared with another build.
> 
>  I would like to add the following:
> 
> We pass these options as environment variables in the pseudo invocation,
> nicely wrapped in the HOST_PSEUDO variable. An alternative would be to
> create a pseudo wrapper script, but that is less attractive for the
> following reasons.
> 
> - We don't expect users to need to call pseudo from post-build/image
>   scripts, because we already support BR2_ROOTFS_POST_FAKEROOT_SCRIPT.

Wrong for post-image, as I already explained.

> - Creating a script is a bit more complicated, e.g. with relocatable
>   host directory in mind.

So, a pseudo wrapper is iundeed better, because new post-image scrips
could directly use pseudo instead of fakeroot, and the fakeroot wrapper
could be a symlink to the pseudo wrapper now.

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> > Cc: Erico Nunes <nunes.erico@gmail.com>
> > Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> ... but I like my bikeshed to be coloured differently...

:-)

> > ---
> >  package/pseudo/pseudo.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
> > index 98c7de5..2a3e31f 100644
> > --- a/package/pseudo/pseudo.mk
> > +++ b/package/pseudo/pseudo.mk
> > @@ -23,6 +23,13 @@ HOST_PSEUDO_CONF_OPTS = \
> >  	--libdir=$(HOST_DIR)/usr/lib \
> >  	--with-sqlite=$(HOST_DIR)/usr
> >  
> > +HOST_PSEUDO = \
> 
>  We use $(MAKE), $(TAR), $(QT_QMAKE), $(QT5_QMAKE), $(BR2_CMAKE), $(LUA_RUN),
> $(PERL_RUN). Nowhere do we use $(HOST_FOO) to define a command. I admit that all
> of these are not completely consistent, but I think the _RUN pattern fits best
> for this situation, so how about PSEUDO_RUN?

And we have PKG_CONFIG_HOST_BINARY... ;-)

I don't much care about hte name, but the _RUN scheme is not really
appealing to me. Consistency is nice, though, but we can't really say
that _RUN is consistent, sionce we only have to uses now, and so many
different variants...

Let's see what the powers-that-be prefer! ;-)

> > +	PSEUDO_PREFIX=$(HOST_DIR)/usr \
> > +	PSEUDO_PASSWD=$(TARGET_DIR) \
> > +	PSEUDO_OPTS=-t0 \
> > +	PSEUDO_LOCALSTATEDIR=$(BUILD_DIR)/.pseudodb \
> 
>  I don't really like hidden files/directories in BUILD_DIR. I was thinking more
> along the lines of $(BASE_DIR)/target-pseudodb. But I'm OK with your proposal as
> well.

Well, I don;t really like to expose to the user our internals. The DB is
internal state of Buildroot. A dot-directory is nice for that...

> > +	$(HOST_DIR)/usr/bin/pseudo
> 
>  Perhaps it's better to provide the options on the command line, as far as
> possible. So
> 	PSEUDO_PASSWD=$(TARGET_DIR) \
> 	PSEUDO_LOCALSTATEDIR=$(BUILD_DIR)/.pseudodb \
> 	$(HOST_DIR)/usr/bin/pseudo -t0 -P $(HOST_DIR)/usr

And we need not provide them at all if we provide a wrapper...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
