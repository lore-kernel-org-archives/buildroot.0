From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 00:52:00 +0200
Subject: [Buildroot] [PATCH v3] package/libnss: use correct CFLAGS and
 LDFLAGS
In-Reply-To: <20190729142610.21331-1-giulio.benetti@micronovasrl.com>
References: <20190729142610.21331-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190801005200.23317a95@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Mon, 29 Jul 2019 16:26:10 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Actually libnss is configure with BUILD_OPT=1 that doesn't take into
> account TARGET_CFLAGS nor TARGET_LDFLAGS resulting in pre-chosen
> optimizations and debugging symbols.
> 
> Can't pass TARGET_CFLAGS through CFLAGS or similar otherwise other
> internal libnss one will be overwritten(i.e. -fPIC), so prefer to append
> TARGET_CFLAGS at the end of Linux.mk as well as TARGET_LDFLAGS according
> to internal libnss Makefile system's names. And obviously remove
> BUILD_OPT=1 from BUILD_VARS. This reveals hidden bugs when building
> with -Os due to uninitialized variables so add patches to fix those
> bugs.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

In fact, after inspecting more closely those uninitialized warnings
from gcc, they are bogus. The variables are properly initialized, it's
just gcc that goes nuts. So the proper fix is not to change the libnss
code, and your patches are most likely going to be rejected upstream
(with good reason).

So instead, I've dropped all of the patches, and simply passed
NSS_ENABLE_WERROR=0 for both the target and host builds. This way
-Werror is not passed, and those warnings become just warnings.

Applied with this change. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
