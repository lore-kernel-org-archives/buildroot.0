From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Jun 2019 23:06:22 +0200
Subject: [Buildroot] [PATCH 2/4] package: remove 'v' prefix from
 tarball-fetched packages
In-Reply-To: <20190612064209.23619-3-victor.huesca@bootlin.com>
References: <20190612064209.23619-1-victor.huesca@bootlin.com>
 <20190612064209.23619-3-victor.huesca@bootlin.com>
Message-ID: <3afd50b3-5cf1-d240-a7b9-f2f352411f70@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Adam, a Go-related question for you below.]

On 12/06/2019 08:42, Victor Huesca wrote:
> On Github, a large number of projects name their tag vXYZ (i.e v3.0,
> v0.1, etc.). In some packages we do:
> 
>  <pkg>_VERSION = v0.3
>  <pkg>_SITE = https://github.com/foo/bar/archive
> 
> And in some other packages we do:
> 
>  <pkg>_VERSION = 0.3
>  <pkg>_SITE = https://github.com/foo/bar/archive
>  <pkg>_SOURCE = v$(FOOBAR_VERSION).tar.gz

 This is actually a bad example. If the _SITE looks like that, it is wrong,
because an /archive URL is an automatically generated one and should use the
github helper. Uploaded tarballs have a URL like luvi: releases/download.

 So I think there should be a separate patch that converts those packages to use
the github helper.

(As a side note: the github helper is not that useful these days; it used to be
important because github was changing their URLs all the time, but now they're
stable since many years so it's not so useful anymore. Still, at least it makes
sure that people fetch a properly named tarball rather than a tarball which is
named 'vsomething' without reference to the package.)


> I.e in one case we consider the version to be v0.3, in the other case
> we consider 0.3 to be the version.
> 
> The problem with v0.3 is that when used in conjunction with
> release-monitoring.org, it doesn't work very well, because
> release-monitoring.org has the concept of "version prefix" and using
> that they drop the "v" prefix for the version.
> 
> Therefore, a number of packages in Buildroot have a version that
> doesn't match with release-monitoring.org because Buildroot has 'v0.3'
> and release-monitoring.org has '0.3'.
> 
> Since really the version number of 0.3, is makes sense to update our
> packages to drop this 'v'.
> 
> This commit only addresses the case of tarball packages where
> the prefix is simply 'v'. Other cases will be handled by separate
> commits.

 Please make a note here about the impact this has on DL_DIR and
sources.buildroot.org (i.e. that you get duplicated tarballs). That should have
been in that first patch already as well, but I already pushed it :-(.

> 
> Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
> ---
>  package/dt/dt.mk                                            | 4 ++--
>  package/flannel/flannel.mk                                  | 6 +++---
>  package/fwts/fwts.mk                                        | 3 ++-
>  .../gst1-plugins-bayer2rgb-neon.mk                          | 4 ++--
>  package/kompexsqlite/kompexsqlite.mk                        | 4 ++--
>  package/luvi/luvi.mk                                        | 4 ++--
>  package/openpowerlink/openpowerlink.mk                      | 4 ++--
>  package/perl-class-std-fast/perl-class-std-fast.mk          | 4 ++--
>  package/perl-net-snmp/perl-net-snmp.mk                      | 4 ++--
>  package/portaudio/portaudio.mk                              | 4 ++--
>  package/pru-software-support/pru-software-support.hash      | 2 +-
>  package/pru-software-support/pru-software-support.mk        | 4 ++--
>  package/spidev_test/spidev_test.mk                          | 6 +++---
>  package/sslh/sslh.mk                                        | 3 ++-
>  14 files changed, 29 insertions(+), 27 deletions(-)
> 
> diff --git a/package/dt/dt.mk b/package/dt/dt.mk
> index 8ec7788883..1963a7ecc5 100644
> --- a/package/dt/dt.mk
> +++ b/package/dt/dt.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -DT_VERSION = v18.32
> +DT_VERSION = 18.32
>  DT_SITE = http://pkgs.fedoraproject.org/repo/pkgs/dt/$(DT_SOURCE)/3054aeaaba047a1dbe90c2132a382ee2
> -DT_SOURCE = dt-source-$(DT_VERSION).tar.gz
> +DT_SOURCE = dt-source-v$(DT_VERSION).tar.gz
>  DT_STRIP_COMPONENTS = 2
>  DT_LICENSE = ISC-like
>  DT_LICENSE_FILES = LICENSE
> diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> index d00d2df92c..e944012358 100644
> --- a/package/flannel/flannel.mk
> +++ b/package/flannel/flannel.mk
> @@ -4,14 +4,14 @@
>  #
>  ################################################################################
>  
> -FLANNEL_VERSION = v0.5.5
> +FLANNEL_VERSION = 0.5.5
>  FLANNEL_SITE = https://github.com/coreos/flannel/archive
> -FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
> +FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
>  
>  FLANNEL_LICENSE = Apache-2.0
>  FLANNEL_LICENSE_FILES = LICENSE
>  
> -FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
> +FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=v$(FLANNEL_VERSION)

 I don't think this is really needed. Adam, do you think the v belongs in there
or not? BTW, if the v is removed, it should be noted in the commit log.

[snip]
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index f30ff6b5e3..cb266b87bb 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
> -PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
> +PRU_SOFTWARE_SUPPORT_VERSION = 5.1.0
> +PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)

 It might be just me, but this doesn't look correct... Definitely should be
explained in the commit message (and therefore, a separate patch).

>  PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
>  PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
>  PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
[snip]

 Otherwise looks good to me. It would be nice to generally split it up into
patches that only contain changes that are really the same pattern. So e.g. the
spidev-test patch is a little different, so it should be a separate patch.

 Also, I wonder it it's a good idea to make this change for all packages. It
might be better to limit to packages that actually exist on
release-monitoring.org. Otherwise, it might happen that when it appears on
release-monitoring, some package *does* have a prefix, and that would be silly...

 Obviously, one way to make sure all of them are on release-monitoring is to add
the ones which are missing :-)


 Regards,
 Arnout
