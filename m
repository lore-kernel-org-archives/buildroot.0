From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Jun 2017 23:49:25 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: adjust logic for
 musl dynamic linker symlink
In-Reply-To: <20170624211435.19786-1-thomas.petazzoni@free-electrons.com>
References: <20170624211435.19786-1-thomas.petazzoni@free-electrons.com>
Message-ID: <54333c1e-cebc-8d11-cdc5-d87b5fd8a268@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-06-17 23:14, Thomas Petazzoni wrote:
> This commit changes the strategy to know what symlink should be
> created for the musl dynamic linker. For now, we have in Buildroot the
> logic to decide what the symlink name should be. However, despite
> numerous fixes, there are still some cases that are missing, such as
> mips64el-n32, where the symlink is ld-musl-mipsn32el.so.1.
> 
> So, instead of trying to make Buildroot aware of all the possible
> names, simply get it from the external toolchain.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 With some nits.

> ---
> Changes since v1:
>  - As suggested by Yann E. Morin, build a sample program, and get its
>    program interpreter with readelf, in order to find the program
>    interpreter.
> 
> Note: I have tried to refactor this with the check_musl function in
> toolchain/helpers.mk, with the idea of introducing a function
> get_program_interpreter that would, given CC/READELF would return the
> program interpreter path. However, for the life of me, I couldn't get
> a make function invoking multiple shell commands to return a string.

 Huh?

get_program_interpreter = $(shell \
 	echo 'void main(void) {}' | $(TOOLCHAIN_EXTERNAL_CC) -x c -o
$(BUILD_DIR)/.br-toolchain-test.tmp - >/dev/null 2>&1; \
 	$(TOOLCHAIN_EXTERNAL_READELF) -l $(BUILD_DIR)/.br-toolchain-test.tmp 2>
/dev/null | sed -r -e '/.*Requesting program interpreter: (.+)\]$$/!d; s//\1/')

$(warning $(get_program_interpreter))

toolchain/helpers.mk:496: /lib/ld-musl-i386.so.1


> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8269345..938f73d 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -476,21 +476,10 @@ endef
>  # of the dynamic library loader. We just need to create a symbolic
>  # link to libc.so with the appropriate name.
>  ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
> -ifeq ($(BR2_i386),y)
> -MUSL_ARCH = i386
> -else ifeq ($(BR2_ARM_EABIHF),y)
> -MUSL_ARCH = armhf
> -else ifeq ($(BR2_mips):$(BR2_SOFT_FLOAT),y:y)
> -MUSL_ARCH = mips-sf
> -else ifeq ($(BR2_mipsel):$(BR2_SOFT_FLOAT),y:y)
> -MUSL_ARCH = mipsel-sf
> -else ifeq ($(BR2_sh),y)
> -MUSL_ARCH = sh
> -else
> -MUSL_ARCH = $(ARCH)
> -endif
>  define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
> -	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
> +	$(Q)echo 'void main(void) {}' | $(TOOLCHAIN_EXTERNAL_CC) -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - >/dev/null 2>&1; \
> +	PROGRAM_INTERPRETER=`$(TOOLCHAIN_EXTERNAL_READELF) -l $(BUILD_DIR)/.br-toolchain-test.tmp 2> /dev/null | sed -r -e '/.*Requesting program interpreter: (.+)\]$$/!d; s//\1/'` ; \

 Perhaps split this ridiculously long line after the | ? Perhaps also split the
two sed expressions with two -e.

 I personally prefer sed -n -e '/.../s//\1/p' but I don't care much.

 Regards,
 Arnout

> +	ln -sf libc.so $(TARGET_DIR)/$${PROGRAM_INTERPRETER}
>  endef
>  endif
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
