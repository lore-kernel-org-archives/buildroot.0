From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Jan 2012 07:49:16 +0100
Subject: [Buildroot] [PATCH] Remove -fPIC on x86_64
In-Reply-To: <1322816170-27327-1-git-send-email-arnout@mind.be>
References: <1322816170-27327-1-git-send-email-arnout@mind.be>
Message-ID: <201201060749.16666.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 ping?

 I agree with Thomas that this requires some testing, but the best way to 
get that testing is to commit the patch :-)


 Regards,
 Arnout

On Friday 02 December 2011 09:56:09 Arnout Vandecappelle (Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> The -fPIC breaks the purgatory of kexec (= the code that passes command-line
> arguments to the kernel): kexec doesn't know how to handle the GOT and PLT
> relocation entries.
> 
> There is also no reason at all to pass -fPIC.  Shared libraries that require
> it will add it to their local Makefiles, and normal executables have no
> business with -fPIC (plus it adds overhead...).
> 
> The -fPIC was added by Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> in commit 8027784c.  That commit adds sysroot parameters to CFLAGS.
> There is no explanation why -fPIC is also added for x86_64.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/Makefile.in |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index c3af5d3..de077bb 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -62,12 +62,6 @@ endif
>  
>  TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>  
> -ifneq ($(BR2_PREFER_STATIC_LIB),y)
> -ifeq ($(BR2_x86_64),y)
> -TARGET_CFLAGS+=-fPIC -DPIC
> -endif # PIC for dynamic objects on x86_64
> -endif
> -
>  ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
>  TARGET_CFLAGS+=-fno-pic -mno-abicalls
>  endif
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
