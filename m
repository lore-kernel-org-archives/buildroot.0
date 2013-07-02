From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 02 Jul 2013 07:59:45 +0200
Subject: [Buildroot] [PATCH] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
References: <1372675884-963-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <51D26C51.8070108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/13 12:51, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
>
> gcc hardcodes the uClibc interpreter for MIPS64/n32 as follows:
> (gcc-4.7.3, gcc/config/mips/linux64.h):
> define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
>
> However, buildroot always creates the $(TARGET_DIR)/lib and
> $(TARGET_DIR)/usr/lib directories, therefore for consinstency
> reasons, we create a lib32->lib symlink to fix the interpreter
> problems for MIPS64/n32.

  I would say we do it for all 32-bit platforms. If people feel they 
can't afford the overhead of two additional inodes in their rootfs, they 
can still remove the link in a post-build script.

>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>   Makefile | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index c514e4f..0059d0c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -436,6 +436,12 @@ $(BUILD_DIR)/.root:
>   		--exclude .hg --exclude=CVS --exclude '*~' \
>   		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>   	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
> +ifeq ($(BR2_MIPS_NABI32),y)
> +	pushd $(TARGET_DIR) > /dev/null 2>&1; \
> +		ln -sfn lib lib32; \
> +		ln -sfn lib usr/lib32; \

  No need for the pushd/popd; just:

	ln -sfn lib $(TARGET_DIR)/lib32
	ln -sfn lib $(TARGET_DIR)/usr/lib32


  Regards,
  Arnout

> +		popd > /dev/null 2>&1
> +endif
>   	touch $@
>
>   $(TARGET_DIR): $(BUILD_DIR)/.root
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
