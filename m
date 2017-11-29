From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 23:37:13 +0100
Subject: [Buildroot] [PATCH v2] binutils: Allow upstream 2.29 to be
 chosen for ARC
In-Reply-To: <20171110163726.2463-1-abrodkin@synopsys.com>
References: <20171110163726.2463-1-abrodkin@synopsys.com>
Message-ID: <20171129233713.784bb702@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Nov 2017 19:37:26 +0300, Alexey Brodkin wrote:
> As of today quite a lot of ARC stuff got merged in upsream
> such that we may finally use upstream realease for building
> and even running Linux kernel and rootfs built with vanilla
> binutils.
> 
> Essentially upstream release is still a bit behind our
> GitHub-based releases but let's try to use vanilla version
> and if we're lucky enough with just a small set of back-ported patches
> we'll be able to use vanilla release(s) for everything in Buildroot.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Thanks, I've applied to next, but I had to do a change to avoid a build
failure. See below.


> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index d2bf5b9..e802952 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -15,7 +15,7 @@ BINUTILS_VERSION = 2.28.1
>  endif
>  endif # BINUTILS_VERSION
>  
> -ifeq ($(BR2_arc),y)
> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)

The symbol BR2_BINUTILS_VERSION_ARC doesn't exist when you're using an
external toolchain. Still, the target variant of binutils can be built,
and in this case, on ARC, the Synopsys version is used. From
binutils.mk:

ifeq ($(BINUTILS_VERSION),)
ifeq ($(BR2_arc),y)
BINUTILS_VERSION = arc-2017.09-release
else
BINUTILS_VERSION = 2.28.1
endif
endif # BINUTILS_VERSION

So, instead of testing BR2_BINUTILS_VERSION_ARC, I've changed to:

ifeq ($(BINUTILS_VERSION),arc-2017.09-release)

BINUTILS_VERSION is either defined by BR2_BINUTILS_VERSION from
package/binutils/Config.in.host (when a cross-binutils is built for an
internal toolchain) *or* it is defined from binutils.mk when building a
target binutils in an external toolchain context.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
