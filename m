From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Feb 2017 16:49:28 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses
 dependencies
In-Reply-To: <20170218154333.24496-1-romain.naour@gmail.com>
References: <20170218154333.24496-1-romain.naour@gmail.com>
Message-ID: <20170218164928.59e0f1c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 16:43:33 +0100, Romain Naour wrote:
> ncurses panel and forms libraries are needed to build sngrep, otherwise
> the configure script report the following errors:
> 
> Without panel library:
> checking ncurses.h usability... yes
> checking ncurses.h presence... yes
> checking for ncurses.h... yes
> checking for initscr in -lncurses... yes
> checking for new_panel in -lpanel... no
> configure: error:  You need to have ncurses panel library installed to compile sngrep.
> 
> Without form library:
> checking ncurses.h usability... yes
> checking ncurses.h presence... yes
> checking for ncurses.h... yes
> checking for initscr in -lncurses... yes
> checking for new_panel in -lpanel... yes
> checking for new_form in -lform... no
> configure: error:  You need to have ncurses forms library installed to compile sngrep.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ee5/ee58cd4252e4da95e9bd025ced9ad3ba0fb7cb08
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Adam Duskett <aduskett@codeblue.com>

I still believe there is a bigger issue. I can build sngrep here
without those additional ncurses options and it builds fine.

In fact, our ncurses package is completely broken. It always installs
*all* the libraries to staging, and all what
BR2_PACKAGE_NCURSES_TARGET_PANEL or BR2_PACKAGE_NCURSES_TARGET_FORM is
doing is installing the libraries to the target. So you end up in a
situation where some libraries are available in staging, and therefore
detected by the build process of other packages, but will in fact not
be present on the target.

However, I still don't understand how it can fail on the autobuilders.
Have you been able to reproduce the issues locally?

Even though yes this patch probably fixes the issue, there's an
underlying issue which I would like to also understand and fix.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
