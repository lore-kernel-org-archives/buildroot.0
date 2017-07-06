From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 17:37:30 +0200
Subject: [Buildroot] [PATCH 1/1] Add BR2_TOOLCHAIN_HAS_FTS config option
In-Reply-To: <20170706152346.30242-1-aduskett@codeblue.com>
References: <20170706152346.30242-1-aduskett@codeblue.com>
Message-ID: <20170706173730.4f4a440a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 11:23:45 -0400, Adam Duskett wrote:
> Currently there are a few packages in buildroot that are set to not
> be selectable unless the user wishes to use glibc specifically because
> the package uses fts.h.
> 
> uClibc actually does have a fts implimentation, and it's selectable in
> uclib-menuconfig.  However; this has two issues with it:
> 
> 1) Most users wouldn't know that there is even a uClibc-menuconfig
> 2) Even if the user does select fts support in uClibc-menuconfig, the
>    packages that would now compile and work would still not be selectable
>    because they explicitly require BR2_TOOLCHAIN_USES_GLIBC.
> 
> This patch does the following:
> 
> - Create a BR2_TOOLCHAIN_HAS_FTS configuration option in uclibc/Config.in
>   and automatically set the kconfig during the configure stage.
> - when glibc is selected, BR2_TOOLCHAIN_HAS_FTS is now selected.
> 
> This will allow for packages that require glibc only because of fts.h to now
> depend on BR2_TOOLCHAIN_HAS_FTS instead of BR2_TOOLCHAIN_USES_GLIBC.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

What is the size impact of enabling FTS by default in uClibc-ng ?

Adding such an option is more complicated. Here you're doing it for the
internal toolchain backend. But then the external toolchain backend
would need the same option, and check whether the toolchain really has
FTS support, etc. It's not that simple to add new options for uClibc,
so we try to avoid doing that.

What about instead migrating the SELinux stuff away from the BSD-style
fts() interface to the POSIX compliant nftw() interface ?

It would IMO make a lot more sense.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
