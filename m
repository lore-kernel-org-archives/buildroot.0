From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Date: Wed, 26 Nov 2008 15:41:21 -0800
Subject: [Buildroot] Including target makefiles before package makefiles
Message-ID: <492DDEA1.5070301@redfish-solutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry if this is obvious or has been discussed much at length...  I'm 
relatively new to the development discussion.

I've recently become one of the defacto maintainers of the AstLinux 
distro on sourceforge, and was trying to make version bumps of various 
packages a little simpler.  A lot of the makefiles being used were 
inherited from a fairly old version of buildroot, but I couldn't say 
which or what its direct provenance was (it might have been borrowed 
from openwrt, I'm not sure).

In any case, I noticed that there was:

include toolchain/*/*.mk
include package/*/*.mk
include target/*/*.mk

which stopped me from doing something like:

linux.mk:

LINUX_VERSION:=2.6.25.19
...
target/Makefile.in:

LINUX_VERSION_MAJOR:=$(word 1,$(subst .,$(space),$(LINUX_VERSION)))
LINUX_VERSION_MINOR:=$(word 2,$(subst .,$(space),$(LINUX_VERSION)))
LINUX_VERSION_TRIPLE:=$(subst, $(space),.,$(wordlist 1,3,$(subst 
.,$(space),$(LINUX_VERSION))))

package/iproute2/iproute2.mk:

IPROUTE2_VER:=$(LINUX_VERSION_TRIPLE)

because IPROUTE2_VER would get parsed before LINUX_VERSION_TRIPLE.

Which got me thinking:  the tools don't care about anything else.  
Therefore toolchain should always come first.  The package shouldn't 
influence the OS version, but the OS version often influences the 
package version (for compatibility reasons).  Therefore, the packages 
should be read after the target info.  So, the proper version of 
includes should be:

include toolchain/*/*.mk
include target/*/*.mk
include target/Makefile.in
include package/*/*.mk

Have I misunderstood anything?  Someone want to set me straight?

Thanks,

-Philip
