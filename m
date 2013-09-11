From: Ivan Sergeev <vsergeev@kumunetworks.com>
Date: Wed, 11 Sep 2013 16:17:27 -0700
Subject: [Buildroot] [PATCH 1/1] util-linux: enable sfdisk in configs
In-Reply-To: <87mwnnxee5.fsf@dell.be.48ers.dk>
References: <1376591640-3698-1-git-send-email-vsergeev@kumunetworks.com>
 <87mwnnxee5.fsf@dell.be.48ers.dk>
Message-ID: <CAPyrzo1PR+PsfU_PJX_vgiewz4H=Q=Hk2J5hUeGuuGy8o1X2=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yeah, I'm not sure what happen. I must have missed the sfdisk binary in the
target in one of the earlier builds, added this patch thinking that
util-linux did some fancy matching in its configure for --enable-*, and
noticed the binary afterwords. Sorry about that.


On Sun, Sep 8, 2013 at 1:11 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Ivan" == Ivan Sergeev <vsergeev@kumunetworks.com> writes:
>
>  Ivan> Signed-off-by: Ivan Sergeev <vsergeev@kumunetworks.com>
>  Ivan> ---
>  Ivan>  package/util-linux/Config.in     | 5 +++++
>  Ivan>  package/util-linux/util-linux.mk | 1 +
>  Ivan>  2 files changed, 6 insertions(+)
>
>  Ivan> diff --git a/package/util-linux/Config.in
> b/package/util-linux/Config.in
>  Ivan> index e63814f..605e297 100644
>  Ivan> --- a/package/util-linux/Config.in
>  Ivan> +++ b/package/util-linux/Config.in
>  Ivan> @@ -135,6 +135,11 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
>  Ivan>          help
>  Ivan>            Scheduling utilities (chrt, ionice, taskset)
>
>  Ivan> +config BR2_PACKAGE_UTIL_LINUX_SFDISK
>  Ivan> +        bool "sfdisk"
>  Ivan> +        help
>  Ivan> +          Partition table manipulator for Linux
>  Ivan> +
>  Ivan>  config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
>  Ivan>          bool "switch_root"
>  Ivan>          help
>  Ivan> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/
> util-linux.mk
>  Ivan> index c6c8467..64112ba 100644
>  Ivan> --- a/package/util-linux/util-linux.mk
>  Ivan> +++ b/package/util-linux/util-linux.mk
>  Ivan> @@ -68,6 +68,7 @@ UTIL_LINUX_CONF_OPT += \
>  Ivan>          $(if
> $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
>  Ivan>          $(if
> $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset,--disable-reset) \
>  Ivan>          $(if
> $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),--enable-schedutils,--disable-schedutils)
> \
>  Ivan> +        $(if
> $(BR2_PACKAGE_UTIL_LINUX_SFDISK),--enable-sfdisk,--disable-sfdisk) \
>
> Ehh, I don't see any --enable-sfdisk / --disable-sfdisk configure
> options?
>
>  ./configure --help|grep -B2 sfdisk
>   --enable-static-programs=LIST
>                           link static the programs in LIST
> (comma-separated,
>                           supported for losetup, mount, umount, fdisk,
> sfdisk,
>
> Looking at fdisks/Makemodule.am I see sfdisk is always built (except for
> on SPARC):
>
> if !ARCH_SPARC
>
> sbin_PROGRAMS += sfdisk
> dist_man_MANS += fdisks/sfdisk.8
> sfdisk_SOURCES = \
>         fdisks/partname.c \
>         fdisks/sfdisk.c \
>         fdisks/common.h
> sfdisk_LDADD = $(LDADD) libcommon.la
>
> ..
>
> Before this patch we always built & installed sfdisk if
> BR2_PACKAGE_UTIL_LINUX_BINARIES was enabled, and this patch doesn't
> change anything.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/c2764b7e/attachment.html>
