From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 18:33:21 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <871ueo8y7k.fsf@dell.be.48ers.dk>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF3F4D.1030100@mind.be> <871ueo8y7k.fsf@dell.be.48ers.dk>
Message-ID: <50CF5761.7030902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 17:01, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle<arnout@mind.be>  writes:
>
>   Arnout>  On 17/12/12 14:48, Arnout Vandecappelle (Essensium/Mind) wrote:
>   >>  +IMX_LIB_INCLUDE = \
>   >>  +	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
>   >>  +	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
>   >>  +	-I$(LINUX_DIR)/include
>
>   Arnout>   Actually, I wonder if this is the right thing to do... This is a
>   Arnout>  userspace library that requires a platform-specific linux/xxx.h. For
>   Arnout>  an external toolchain, these headers don't exist in
>   Arnout>  $(STAGING_DIR)/usr/include/linux
>
>   Arnout>   Directly using $(LINUX_DIR)/include means that the headers are not
>   Arnout>  patched for userspace. For those platform-specific headers that's
>   Arnout>  probably not a problem, but it's not good for e.g. linux/types.h.
>
>   Arnout>   An easy workaround is to use -idirafter instead of -I.  However,
>   Arnout>  perhaps it's an even better idea to do 'make headers_install' as part
>   Arnout>  of the normal linux build process, so that packages depending on those
>   Arnout>  headers can use the patched version. But then again, is it a good idea
>   Arnout>  to replace the toolchain's kernel headers with a new set of kernel
>   Arnout>  headers?
>
> Another possibility is to bundle the needed kernel headers with the
> package, similar to how E.G. mtd-utils does it.

  Unfortunately, Freescale probably has a much lower standard about ABI 
compatibility than kernel.org. Also it's relatively likely that a 
buildroot user will use a different Freescale kernel than the one assumed 
by buildroot. So you may end up with userspace assuming different struct 
layouts than the kernel...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
