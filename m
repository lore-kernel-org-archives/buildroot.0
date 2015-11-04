From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Nov 2015 18:19:29 +0100
Subject: [Buildroot] [PATCH 2/2 v2] core/pkg-generic: check proper
 package installation
In-Reply-To: <563935C5.30002@mind.be>
References: <cover.1446577223.git.yann.morin.1998@free.fr>
 <fe19a41362f17e9435b0da14097ce9fecda38780.1446577223.git.yann.morin.1998@free.fr>
 <563935C5.30002@mind.be>
Message-ID: <20151104171929.GA4072@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-03 23:31 +0100, Arnout Vandecappelle spake thusly:
> On 03-11-15 20:06, Yann E. MORIN wrote:
> > Some packages misbehave, and install files in either $(STAGING_DIR)/$(O)
> > or in $(TARGET_DIR)/$(O)
> > 
> > One common reason for that is that pkgconf now prepends the sysroot path
> > to all the paths it returns. Other reasons vary, but are mostly due to
> > poorly writen generic-packages.
> > 
> > And a new step hooks to check that no file gets installed in either
> > location, called after the install-target and install-staging steps.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Peter Seiderer <ps.report@gmx.net>
> > Cc: Romain Naour <romain.naour@openwide.fr>
> > 
> > ---
> > Note that, in the current state of Buildroot, this *will* cause a lot of
> > build failures until all those packages are fixed. Among the known to
> > break are quite a few Xorg packages, plus many packages that need to
> > call moc (from Qt4 for sure, possibly from Qt5 too).
> 
>  Well, the latter will not cause _new_ build failures, because there the problem
> is that the moc path returned by pkgconfig is incorrect, while it is installed
> in the right place.

Right. That would not be new failures. We would not even catch it with
this patch, since moc *is* installed in the correct place. We would just
notice when a moc-using package tries to use (like the failure noticed
by Peter S.).

>  There are a few things in here that I don't like, but I don't want to block the
> urgency.
> 
> > ---
> >  package/pkg-generic.mk | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 3db616c..59b0938 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -87,6 +87,21 @@ define step_pkg_size
> >  endef
> >  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
> >  
> > +define step_check_build_dir_one
> > +	if [ -d $(2) ]; then \
> > +		printf "%s: installs files in %s\n" $(1) $(2) >&2; \
> > +		exit 1; \
> > +	fi
> 
>  I think this could also be
> 
> 	$(if $(wildcard $(2)),$(error $(1) installs files in $(2)))
> 
> but not sure if that is better readable.

Well, I'm always a bit uneasy at using a Makefile construct in a place
where commands are expected (i.e. part of a rule).

So I'd prefer we stick to using shell code here. And as you said, it is
not muh mor ereadable.

> > +endef
> > +
> > +define step_check_build_dir
> > +	$(if $(filter install-staging,$(2)),\
> > +		$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(STAGING_DIR)/$(O))))
> 
>  Is this correct? Shouldn't that be $(HOST_DIR) instead of $(O)? If a custom
> BR2_HOST_DIR is configured, then the wrong pkgconfig stuff will put stuff into
> $(STAGING_DIR)/$(HOST_DIR), no?

Hmmm... It looks like you are right. I'll do a few tests here, with
various values for HOST_DIR (in $(O) and elsewhere) and wee what we get
as a result.

Still, we may also want to catch packages that use PREFIX=$(TARGET_DIR)
and DESTDIR=$(TARGET_DIR) which would ultimately lead to
$(TARGET_DIR)/$(TARGET_DIR)  (and since $(TARGET_DIR) is a sub-dir of
$(O), we'd catch that as well.

So I think we should check both XXX/$(O) and XXX/$(HOST_DIR) in both the
staging and target installs.

> > +	$(if $(filter install-target,$(2)),\
> > +		$(if $(filter end,$(1)),$(call step_check_build_dir_one,$(3),$(TARGET_DIR)/$(O))))
> 
>  Actually, I wonder if it shouldn't be HOST_DIR here as well.

Ditto.

>  Perhaps, to be sure, both should be checked.

Yes.

> > +endef
> > +GLOBAL_INSTRUMENTATION_HOOKS += step_check_build_dir
> 
>  I don't see much point to add this as instrumentation hooks, it could be done
> directly in the .stamp rule.
> 
> 
> Note that this patch will make it impossible to have $(O) equal to some path
> that happens to exist on the target, e.g. O=/tmp/build if /tmp/build happens to
> exist in the custom skeleton or rootfs overlay. (Same story with HOST_DIR of O
> is replaced by HOST_DIR above). Granted, it's not very likely.

Hmm.. That's indeed a bit annoying...

So, if we have HOST_DIR=/tmp then the tests above are broken indeed...
OK, I'll investigate more...

Thanks! :-)

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > +
> >  # User-supplied script
> >  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
> >  define step_user
> > 
> 
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
