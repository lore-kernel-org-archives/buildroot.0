From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 16:50:37 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <1355752131-31966-1-git-send-email-arnout@mind.be>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
Message-ID: <50CF3F4D.1030100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 14:48, Arnout Vandecappelle (Essensium/Mind) wrote:
> +IMX_LIB_INCLUDE = \
> +	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
> +	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
> +	-I$(LINUX_DIR)/include

  Actually, I wonder if this is the right thing to do... This is a 
userspace library that requires a platform-specific linux/xxx.h. For an 
external toolchain, these headers don't exist in
$(STAGING_DIR)/usr/include/linux

  Directly using $(LINUX_DIR)/include means that the headers are not 
patched for userspace. For those platform-specific headers that's 
probably not a problem, but it's not good for e.g. linux/types.h.

  An easy workaround is to use -idirafter instead of -I.  However, 
perhaps it's an even better idea to do 'make headers_install' as part of 
the normal linux build process, so that packages depending on those 
headers can use the patched version. But then again, is it a good idea to 
replace the toolchain's kernel headers with a new set of kernel headers?

  Any advice is welcome!

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
