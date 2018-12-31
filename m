From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:31:01 +0100
Subject: [Buildroot] [PATCH v7 3/8] core: implement per-package SDK and
 target
In-Reply-To: <20181230215212.GA24224@scaer>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
 <20181228104335.22379-4-thomas.petazzoni@bootlin.com>
 <20181230215212.GA24224@scaer>
Message-ID: <20181231153101.387c7d57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the review!

On Sun, 30 Dec 2018 22:52:12 +0100, Yann E. MORIN wrote:

> I don;t have much to propose asa review, except very-minor issues.

Which is good :-) Hopefully I can get some Reviewed-by soon, and merge
this series.

> > There are two main benefits:
> > 
> >  - Packages will no longer discover dependencies that they do not
> >    explicitly indicate in their <pkg>_DEPENDENCIES variable.  
> 
> Note that non-expressed dependencies may still be gathered, if they are
> transitive dependencies.

Yes, of course, but what can we do about this ? It's pretty logical and
obvious that transitive dependencies will be copied, no ?

> > +PER_PACKAGE_DIR := $(BASE_DIR)/per-package  
> 
> Why don't you simply export this variable, like HOST_DIR and TARGET_DIR?
> This would simplify calls to fix-rpath:

Because I generally don't like those global exports. It pollutes the
namespace with some random variable that is really internal to
Buildroot. There is no reason for the build system of all packages to
even see this variable. In fact, I am personally not a big fan of
exporting TARGET_DIR, STAGING_DIR, etc. since they become visible in
packages, and people tend to use them in their package build system,
which is very wrong.

Of course, if the overall consensus is that PER_PACKAGE_DIR should be
exported, I'll do so because I don't want to hold this series just for
this detail.


> > -$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
> > +$(BUILD_DIR) $(BASE_TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) \
> > +	$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST) $(PER_PACKAGE_DIR):  
> 
> Don't ident this continuation line, it is misleading: the target of
> the rule appear to be part of the commands.

ACK.

> [--SNIP--]
> > diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> > index c8939569e2..d903a82958 100755
> > --- a/support/scripts/check-host-rpath
> > +++ b/support/scripts/check-host-rpath  
> 
> As I was saying on IRC: when we are not using per-package directories,
> then I was a bit surprised to see that this script (and fix_rpath,
> below) still worked, when the support for PPD is not optional in it.
> 
> What confused me, was that PER_PACKAGE_DIR is always used, even when
> BR2_PER_PACKAGE_DIRECTORIES is unset.
> 
> But as you pointed to on IRC, PER_PACKAGE_DIR is also always defined to
> an non-empty string, that either points to a valid location when
> BR2_PER_PACKAGE_DIRECTORIES=y, or points to a non-existent location
> otherwise.

Yes, I'll add some comments about this.

> 
> > @@ -77,6 +93,7 @@ check_elf_has_rpath() {
> >              dir="$( sed -r -e 's:/+:/:g; s:/$::;' <<<"${dir}" )"
> >              [ "${dir}" = "${hostdir}/lib" ] && return 0
> >              [ "${dir}" = "\$ORIGIN/../lib" ] && return 0
> > +            [[ ${dir} =~ ${perpackagedir}/[^/]*/host/lib ]] && return 0  
>                                             ^^^^^^^
> That would also match the string '//' so maybe we want:
> 
>     ${perpackagedir}/([^/]+/)?host/lib

I'm not sure to understand the ? in ([^/]+/)?. We definitely want one
path component between $(PER_PACKAGE_DIR) and host/lib. So what about:

	${perpackagedir}/[^/]+/host/lib

> > +        if test "${rpath}" != "${changed_rpath}" ; then
> > +            ${PATCHELF} --set-rpath ${changed_rpath} "${file}"  
> 
> Can't you do that unconditioanlly? If it's changed, we need to set it;
> if it's not changed, that set it to the initial value anyway...

There is a reason to do it conditionally: patchelf is slow, you don't
want to run patchelf when you don't need to, and here it's trivial to
know whether it is useful or not to run it. For example, this condition
ensures that people not using per-package directory don't pay the cost
of running all those additional patchelf invocations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
