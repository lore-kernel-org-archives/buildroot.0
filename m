From: Will Newton <will.newton@gmail.com>
Date: Tue, 7 Dec 2010 11:21:59 +0000
Subject: [Buildroot] [PATCH] oprofile: Don't install binutils in the
	target filesystem.
In-Reply-To: <AANLkTi=qoF_Xq8jNoieWCAQCGR-5VzQaYZV85EO3KfYz@mail.gmail.com>
References: <AANLkTi=qoF_Xq8jNoieWCAQCGR-5VzQaYZV85EO3KfYz@mail.gmail.com>
Message-ID: <AANLkTinDHGaCtW+uA5b=ndfoMFORb4QH0J811zSops7f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 30, 2010 at 4:29 PM, Will Newton <will.newton@gmail.com> wrote:
> oprofile needs libbfd, but does not require all the binutils tools
> installing in the target filesystem. This saves a lot of space
> on the target filesystem.
>
> Signed-off-by: Will Newton <will.newton@imgtec.com>

Is this ok for 2011.02?

> ---
> ?package/oprofile/oprofile.mk ? | ? ?2 +-
> ?toolchain/binutils/binutils.mk | ? ?2 ++
> ?2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
> index 3be50f2..7281c8f 100644
> --- a/package/oprofile/oprofile.mk
> +++ b/package/oprofile/oprofile.mk
> @@ -24,7 +24,7 @@ ifeq ($(OPROFILE_ARCH),)
> ?OPROFILE_ARCH := $(BR2_ARCH)
> ?endif
>
> -OPROFILE_DEPENDENCIES := popt binutils_target
> +OPROFILE_DEPENDENCIES := popt libbfd_target
>
> ?define OPROFILE_INSTALL_TARGET_CMDS
> ? ? ? ?$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
> diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
> index ef9f644..de8f865 100644
> --- a/toolchain/binutils/binutils.mk
> +++ b/toolchain/binutils/binutils.mk
> @@ -172,6 +172,8 @@ endif
>
> ?binutils_target: $(BINUTILS_TARGET_PREREQ) $(TARGET_DIR)/usr/bin/ld
>
> +libbfd_target: $(BINUTILS_DIR2)/binutils/objdump
> +
> ?binutils_target-clean:
> ? ? ? ?-$(MAKE) -C $(BINUTILS_DIR2) clean
> ? ? ? ?rm -f $(TARGET_DIR)/bin/$(REAL_GNU_TARGET_NAME)* \
> --
> 1.7.2.2
>
