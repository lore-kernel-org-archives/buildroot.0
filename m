From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 08:06:42 +0200
Subject: [Buildroot] [PATCH 08/15] package: remove useless arguments
	from AUTOTARGETS
In-Reply-To: <20110917091136.4a05f81d@skate>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <87vcsrwu8u.fsf@macbook.be.48ers.dk> <20110917091136.4a05f81d@skate>
Message-ID: <201109220806.42914.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Saturday 17 September 2011 09:11:36, Thomas Petazzoni wrote:
> Good catch: those functions make the assumption that the directory is
> named after the name of the package. Actually, the name of the .mk is
> not important to these macros, it is the directory name that is
> important:
> 
> +define pkgmakefile
> +$(dir $(lastword $(MAKEFILE_LIST)))
> +endef
> 
> For package/fuse/libfuse.mk, the output of this macro is package/fuse/.
> In fact, I think we could rename this macro "pkgmakefiledir" or
> something like that.
> 
> +define pkgname
> +$(lastword $(subst /, ,$(call pkgmakefile)))
> +endef

 How about the following?

define pkgname
$(notdir $(lastword $(MAKEFILE_LIST)))
endif

 (I haven't tried this though.)

 It sounds more important to me that the makefile name corresponds to the 
package name than the directory name.  For one, this would make it possible to 
have two packages in the same directory. This is useful if they share a lot of 
Config.in but have very different makefiles.  U-boot and barebox might benefit 
from this, for one.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
