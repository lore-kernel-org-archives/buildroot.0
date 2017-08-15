From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:15:38 +0200
Subject: [Buildroot] [PATCH] libspatialindex: fix build on Microblaze
In-Reply-To: <20170814214059.18498-1-thomas.petazzoni@free-electrons.com>
References: <20170814214059.18498-1-thomas.petazzoni@free-electrons.com>
Message-ID: <549d784c-cd7a-87a7-2ef6-0d9ac35b7f21@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 23:40, Thomas Petazzoni wrote:
> This commit fixes the build of libspatialindex on the Microblaze
> architecture by working around a gcc bug, by passing -O0 as the
> optimization level.
> 
> A patch to configure.ac is needed to not have -O2 be forced by the
> libspatialindex build system, and therefore AUTORECONF=YES is now
> needed.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/bbba2a2c97dbec21340c7fd07162a316a411cba4/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Applied to master with one small change, thanks.

[snip]

>  LIBSPATIALINDEX_INSTALL_STAGING = YES
>  LIBSPATIALINDEX_LICENSE = MIT
>  LIBSPATIALINDEX_LICENSE_FILES = COPYING
> +# We're patching configure.ac

 I've updated the comment with the name of the patch, like we currently often do.

 I've also added an empty line above and below to make things stand out more.

 Regards,
 Arnout

> +LIBSPATIALINDEX_AUTORECONF = YES
> +LIBSPATIALINDEX_CXXFLAGS = $(TARGET_CXXFLAGS)
> +LIBSPATIALINDEX_CONF_ENV = CXXFLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"
> +
> +# Workaround gcc ICE
> +# (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485)
> +ifeq ($(BR2_microblaze),y)
> +LIBSPATIALINDEX_CXXFLAGS += -O0
> +endif
>  
>  $(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
