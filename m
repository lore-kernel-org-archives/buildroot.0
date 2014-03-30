From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Mar 2014 19:36:46 +0300
Subject: [Buildroot] [PATCH 2/2] Makefile.in: add
 -mtext-section-literals to xtensa ABI
In-Reply-To: <1396196521-30184-3-git-send-email-jcmvbkbc@gmail.com>
References: <1396196521-30184-1-git-send-email-jcmvbkbc@gmail.com>
 <1396196521-30184-3-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140330163646.GO4579@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Sun, Mar 30, 2014 at 08:22:01PM +0400, Max Filippov wrote:
> Collecting literals into separate section can be advantageous if that
> section is placed into DTCM at link time. This is applicable for code
> running on bare metal, but makes no sense under linux, where userspace
> is isolated from the physical memory details. OTOH placing literals into
> separate section breaks build of huge source files, because l32r
> instruction can only access literals in 256 KBytes range.
> 
> Add -mtext-section-literals into xtensa ABI to fix build issues of
> packages with huge sources.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index eea7043..31c72a0 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -73,7 +73,7 @@ endif
>  # code size and performance, the linker can usually optimize away the
>  # overhead when a call ends up within a certain range.

Please add the commit log explanation to the comment here.

>  ifeq ($(BR2_xtensa),y)
> -TARGET_ABI += -mlongcalls
> +TARGET_ABI += -mlongcalls -mtext-section-literals

With this in place a follow-up patch should remove local 
-mtext-section-literals that I sprinkled on various packages to fix xtensa 
build failures.

Thanks,
baruch

>  endif
>  
>  STAGING_SUBDIR = usr/$(GNU_TARGET_NAME)/sysroot

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
