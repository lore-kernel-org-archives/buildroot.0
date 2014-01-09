From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jan 2014 07:35:46 +0800
Subject: [Buildroot] [PATCH 1/4] gdb: use consistent version on host and
 target for microblaze and arc
In-Reply-To: <1389198785-11923-2-git-send-email-spenser@gillilanding.com>
References: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
 <1389198785-11923-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20140110073546.327732c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed,  8 Jan 2014 10:33:02 -0600, Spenser Gilliland wrote:
> Currently, the version of gdb used on the host and the target are different for
> microblaze and arc.  This is fixed by using a different method to specify the
> version.
> 
> This fixes autobuild failure
> 
> http://autobuild.buildroot.net/results/554/5547456a42cdd21892bba665a15d96cdbb5b1b26//build-end.log
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>

Missing empty line before the Signed-off-by line. Also, some comment
below.

> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index de0e0be..f446384 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -59,7 +59,5 @@ config BR2_GDB_VERSION
>  	default "7.3.1"    if BR2_GDB_VERSION_7_3
>  	default "7.4.1"    if BR2_GDB_VERSION_7_4
>  	default "7.5.1"    if BR2_GDB_VERSION_7_5
> -	default "f25a1952afd054205f9471e449c1f7ca5b271b7c" if BR2_arc
> -	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
>  
>  endif
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index d06b61b..94d8302 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -16,6 +16,10 @@ ifeq ($(BR2_bfin),y)
>  GDB_VERSION = 6.6a
>  else ifeq ($(BR2_avr32),y)
>  GDB_VERSION = 6.7.1-avr32-2.1.5
> +else ifeq ($(BR2_microblaze),y)
> +GDB_VERSION = 0d0b89a88104785cee93d27074e15118bf14fac1
> +else ifeq ($(BR2_arc),y)
> +GDB_VERSION = f25a1952afd054205f9471e449c1f7ca5b271b7c
>  else
>  GDB_VERSION = 7.5.1
>  endif

I am not entirely happy with this change, because it handles
Microblaze/ARC in a different way than AVR32, while they are really the
same case.

And also because the code you're touching in gdb.mk has the following
comment on top of it:

# When no version is defined, it means that cross-gdb for the host has
# not been enabled, and we will only build gdbserver or gdb for the
# target. In this case, use the latest available version
# automatically.

However, this comment is no longer true: with your patch, for certain
architectures (Microblaze/ARC), we are *never* setting BR2_GDB_VERSION,
and therefore this piece of gdb.mk code is also used when cross-gdb is
enabled.

Therefore maybe we should:

 1/ Remove the version string for AVR32 in the definition of
    BR2_GDB_VERSION, like you did for Microblaze and ARC

 2/ Update the comment above the code you're changing in gdb.mk to
    explain what's going on.

 3/ Add a comment on top of BR2_GDB_VERSION that explains why we don't
    define a version string for some of the gdb versions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
