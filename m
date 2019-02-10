From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Feb 2019 20:57:25 +0100
Subject: [Buildroot] [PATCH] core/pkg-infra: tweak only .la files that
 need it
In-Reply-To: <CAAXf6LXCZ0DNu5p4MSzbaSsxiWrznVvZDqVWBEMzY8oepK1Z9Q@mail.gmail.com>
References: <20190210084840.309-1-yann.morin.1998@free.fr>
 <CAAXf6LXCZ0DNu5p4MSzbaSsxiWrznVvZDqVWBEMzY8oepK1Z9Q@mail.gmail.com>
Message-ID: <20190210195725.GM3079@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-02-10 20:23 +0100, Thomas De Schampheleire spake thusly:
> El dom., 10 feb. 2019 a las 9:48, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> >
> > Currently, when we tweak the .la files, we do so unconditionally on all
> > .la files, even those we already fixed in a previous run.
> >
> > This has the nasty side effect that each .la file will be reported as
> > being touched by all packages that are installed after the package that
> > actually installed said .la file.
> >
> > Since we can't easily know what fiels were isntalled by a package (that
> 
> files
> installed
> 
> > is an instrumetnation hook, and comes after the mangling), we use a
> 
> instrumentation
> 
> > trick (like is done in libtool?): we do mangle all files, each in into a
> 
> /in/d
> 
> > temporary location; if the result is identical to the input, we remove
> > the temporary, while if the resiult differes from the output, we move
> 
> result differs

OK, so it looks like my new glasses are not up to the task of fixing
my eyesight, since I could not spot any of those mistakes when
proof-reading myself...

Or maybe it is not my eyes that are deffective, in fact?

> > the temporary to the input.
> >
> > Reported-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> > Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  package/pkg-generic.mk | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 6168b40e89..afd0d41e2a 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -294,7 +294,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
> >                                 $(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
> >         fi
> >         @$(call MESSAGE,"Fixing libtool files")
> > -       $(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
> > +       $(Q)for la in $(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \

Meh... The real culp[rit for the borked patch is that $(find ...) is not
the same as $$(find ...) here... So the loop is never, ever entered, and
the issue below...

> > +               cp -a "$${la}" "$${la}.fixed" && \
> >                 $(SED) "s:$(BASE_DIR):@BASE_DIR@:g" \
> >                         -e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
> >                         $(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
> > @@ -303,7 +304,14 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
> >                         $(if $(TOOLCHAIN_EXTERNAL_INSTALL_DIR),\
> >                                 -e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:$(TOOLCHAIN_EXTERNAL_INSTALL_DIR):g") \
> >                         -e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
> > -                       -e "s:@BASE_DIR@:$(BASE_DIR):g"
> > +                       -e "s:@BASE_DIR@:$(BASE_DIR):g"; \
> 
> The semicolon shouldn't be here, right? I.e. the "$${la}.fixed" below
> is the argument to the sed command, no?

... is not noticed.

Regards,
Yann E. MORIN.

> > +                       "$${la}.fixed" && \
> > +               if cmp "$${la}" "$${la}.fixed"; then \
> > +                       rm -f "$${la}.fixed"; \
> > +               else \
> > +                       mv "$${la}.fixed" "$${la}"; \
> > +               fi || exit 1; \
> > +       done
> >         @$(call step_end,install-staging)
> >         $(Q)touch $@
> >
> 
> I did not test it but it looks a valid approach.
> 
> Best regards,
> Thomas

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
