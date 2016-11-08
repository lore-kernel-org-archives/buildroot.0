From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Nov 2016 18:08:38 +0100
Subject: [Buildroot] [PATCH 5/6] package/pseudo: fix fakeroot wrapper to
 correctly use pseudo
In-Reply-To: <2b6c8c6a-3ded-7a72-324a-7e9d7b755a15@mind.be>
References: <cover.1478553802.git.yann.morin.1998@free.fr>
 <be88ddb9a18f43beaece4e29c5fe62ad91071ce3.1478553802.git.yann.morin.1998@free.fr>
 <2b6c8c6a-3ded-7a72-324a-7e9d7b755a15@mind.be>
Message-ID: <20161108170838.GA3554@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-08 00:10 +0100, Arnout Vandecappelle spake thusly:
> 
> 
> On 07-11-16 22:23, Yann E. MORIN wrote:
> > So far, we expected pseudo to behave like fakeroot would. This is not
> > correct: we need to export a few variables to make pseudo look like it
> > is behaving like fakeroot.
> > 
> > Provide a wrapper to impersonate fakeroot, instead of doing a symlink.
> 
>  Not nice, because it introduces absolute paths in host dir which is not good
> for relocation.

Agreed. But note that we already have pkg-config as a wrapper to
pkgconf, and that one is not relocatable yet, as far as I can see...

I can rework this to make it more relocatable, indeed. I at least wanted
this series out for the core fixes about pseudo, so affected parties
could test the overall idea of the fixes.

>  I'm thinking we shouldn't have introduced this symlink to begin with. I did
> suggest it on IRC, but I wasn't thinking. fakeroot could never be called by
> post-image scripts anyway, because the fakeroot database isn't saved, whatever
> you do under fakeroot is lost.

Wrong.

If Buildroot generates a tarball, then all that needed root access is in
the tarball. So a post-image script that runs under fakeroot (even
*another* fakeroot instance) can safely extract that tarball and get all
the root-requiring settings and reasemble another that in one or more
filesystem images, as those would be emulated by fakeroot (as long as
the script does not exit the fakeroot instance in-between, that is).

That is something I've been using on a daily basis for years now...

Now, we could argue that such post-image scripts should be changed to
use pseudo instead. We could advertise that by providing this fakeroot
wrapper:

    #!/bin/sh
    echo "No, no, use pseudo now..." >&2
    exit 1

However, what we don't want is the user to use his host-provided
fakeroot, because that one might not be fit (e.g. lacking support for
xattrs when pseudo had stored them in the tarball, for example).

So, I still think we should either provide a catcher fakeroot as above,
or we provide a real wrapper. I like the catcher, above.

Regards,
Yann E. MORIN.

>  Hence I'm more inclined to revert 7158403805f. If someone does need it, they
> can get patches from the mailing list :-)
> 
>  Regards,
>  Arnout
> 
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > Cc: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
> > Cc: Erico Nunes <nunes.erico@gmail.com>
> > Cc: Julien BOIBESSOT <julien.boibessot@free.fr>
> > ---
> >  package/pseudo/pseudo.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
> > index 2a3e31f..cc1bcdd 100644
> > --- a/package/pseudo/pseudo.mk
> > +++ b/package/pseudo/pseudo.mk
> > @@ -31,7 +31,8 @@ HOST_PSEUDO = \
> >  	$(HOST_DIR)/usr/bin/pseudo
> >  
> >  define HOST_PSEUDO_FAKEROOT_SYMLINK
> > -	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
> > +	printf '#!/bin/sh\n%s "$${@}"\n' '$(HOST_PSEUDO)' >$(HOST_DIR)/usr/bin/fakeroot
> > +	chmod 755 $(HOST_DIR)/usr/bin/fakeroot
> >  endef
> >  HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
> >  
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
