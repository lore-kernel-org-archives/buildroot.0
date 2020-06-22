From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Jun 2020 06:44:40 -0500
Subject: [Buildroot] [RFC v9 01/10] cpe-info: new make target
In-Reply-To: <20200621084540.GZ2351@scaer>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200621084540.GZ2351@scaer>
Message-ID: <CANQCQpY_PiScvzaCuebc2Fg5fE5_J3h6HxFikEmHGdQu+-oeUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Jun 21, 2020 at 3:46 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> On 2020-06-16 12:03 -0500, Matt Weber spake thusly:
> > Similar to make legal-info, produce a csv delimited file containing
> > all selected packages CPE identification.
> >
> > By default, support the pkg infra defining a set of CPE_ID_* defaults
> > using the package name for the vendor and name as most CPE IDs seem
> > to align with that assumption. Plus initially, use the pkg version as
> > the CPE ID's version field.
>
> So, as I understand it, the CPE info for host packages will also be
> stored in the generated file, but it will be a partial list.
>
> For example, if a host package has a Config.in option (e.g. aespipe,
> with BR2_PACKAGE_HOST_AESPIPE=y), then it will be listed in PACKAGES,
> and so will be present in the CPE manifest.
>
> But on the other hand, a host package that has no Config.in option but
> is oart of the dependency chain of a package (e.g. host-pkgconf) will
> not be listed in PACKAGES, and thus will not appear in the manifest.
>
> This is a bit awkward I think.
>
> As far as I understand it, the CPE info is (mostly|only) usefull to
> then query the CVE list applicable to that CPE.
>
> As such, this is (mostly|only) relevant to the target packages, I would
> think, no? Thus, host pakcages should be filtered out.

Correct only target packages are really useful but I could see a host
package list also being something that long term would be a good
datapoint.  There are cases where those host packages could inflict
behavior on the target that could need a CVE tagged against them.
(Note, I saw the conclusion you had in "cpe-info: only report target
pkgs" . )

>
> If we are however interested by the CPE info for host packages, probably
> that should go to a separate manifest, like for the legal-info, no?
>

Agree.

> Also, see an issue, below...
>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> [--SNIP--]
> > @@ -864,6 +865,19 @@ legal-info: legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p)-all
> >               mv .legal-info.sha256 legal-info.sha256)
> >       @echo "Legal info produced in $(LEGAL_INFO_DIR)"
> >
> > +.PHONY: cpe-info-clean
> > +cpe-info-clean:
> > +     @rm -f $(CPE_MANIFEST_CSV)
>
> This must also be removed on 'make clean'.

Sure

>
> > +.PHONY: cpe-info-prepare
> > +cpe-info-prepare:
> > +     @$(call MESSAGE,"Gathering CPE info")
> > +     @$(call cpe-manifest,CPE ID,CVE PATCHED,PACKAGE,VERSION,SOURCE SITE)
> > +
> > +.PHONY: cpe-info
> > +cpe-info: cpe-info-clean cpe-info-prepare $(foreach p,$(PACKAGES),$(p)-cpe-info)
>
> I think this depednecy is incorrect. Indeed, you reallt want that
> cpe-info-clean be run before cpe-info-prepare, so I think you'll need
> these dependencies:
>
>     cpe-info-prepare: cpe-info-clean
>     cpe-info: cpe-info-prepare
>     cpe-info: $(foreach p,$(filter-out host-%,$(PACKAGES)),$(p)-cpe-info)
>
> (Yes, I see you modeled your dependencies on the legal-info ones, but I
> think they are broken.)
>

:-)  ah ok.

Thanks for the review!

Best regards,
Matt
