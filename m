From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Jul 2011 10:39:18 +0300
Subject: [Buildroot] [PATCH 1/2] hostapd: fix build
In-Reply-To: <20110704085628.29549092@skate>
References: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
 <20110704085628.29549092@skate>
Message-ID: <20110704073918.GA25201@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jul 04, 2011 at 08:56:28AM +0200, Thomas Petazzoni wrote:
> Le Mon,  4 Jul 2011 09:00:29 +0300,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> > The --sysroot option is required in CFLAGS and LDFLAGS to avoid
> > compile time and link time failures.
> 
> This should no longer be needed, as Buildroot 2011.05 has added a
> wrapper for external toolchains which avoids the need to pass an
> explicit --sysroot option.

Actually, I've reverted part of this change to solve other problem. In 
package/Makefile.in I set 
TARGET_CROSS=$(BR2_TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-.  
I'm using the CodeSourcery toolchain for a e500v2 target. Without this change 
I get the following error (from ethtool config.log):

configure:3723: /home/baruch/git/buildroot/output/host/usr/bin/powerpc-linux-gnu-cpp  conftest.c
conftest.c:1:0: error: E500 and FPRs not supported
configure:3723: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "ethtool"
| #define PACKAGE_TARNAME "ethtool"
| #define PACKAGE_VERSION "2.6.38"
| #define PACKAGE_STRING "ethtool 2.6.38"
| #define PACKAGE_BUGREPORT "Ben Hutchings <bhutchings@solarflare.com>"
| #define PACKAGE_URL ""
| #define PACKAGE "ethtool"
| #define VERSION "2.6.38"
| /* end confdefs.h.  */
| #ifdef __STDC__
| # include <limits.h>
| #else
| # include <assert.h>
| #endif
|            Syntax error

To solve this I need to pass -te500v2 to cpp. Is there a clean way to do so?

I should also note that I add -te500v2 to TARGET_LDFLAGS and 
TOOLCHAIN_EXTERNAL_CFLAGS in package/Makefile.in and 
toolchain/toolchain-external/ext-tool.mk, respectively. I can reproduce the 
errors I get when omitting these changes if it helps.

baruch

> Can you point to a specific Buildroot configuration that exhibits the
> problem ?

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
