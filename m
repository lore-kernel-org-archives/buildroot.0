From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2010 12:06:03 +0100
Subject: [Buildroot] [PATCH 3/9] Add support for multilib external
 toolchains
In-Reply-To: <20081016203230.15826.93873.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203230.15826.93873.stgit@localhost.localdomain>
Message-ID: <20100112120603.6682e454@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Grant,

I've recently tried to work again on integrating CodeSourcery
toolchains into Buildroot, but I'm facing issues related to multilib.
I've summed up these issues in the following post:

 http://lists.busybox.net/pipermail/buildroot/2010-January/031421.html

If you have any idea on how to solve the issues, don't hesitate to tell
me.

Thanks!

Thomas

On Thu, 16 Oct 2008 14:32:30 -0600
Grant Likely <grant.likely@secretlab.ca> wrote:

> From: Grant Likely <grant.likely@secretlab.ca>
> 
> Fix buildroot to work with external toolchains using multilib.
> Multilib toolchains have several sets of libraries which they can
> choose between depending on the optimization flags.  For example, a
> single toolchain could have libraries compiled for both hard and soft
> floating point. However, buildroot needs copy the correct version of
> the libraries to match the flags used to compile the applications.
> 
> This patch adds the CPU optimization flags to the execution of GCC
> when determining the location of the libraries to copy.  Passing the
> optimization flags makes the library linking and copying consistent.
> 
> Tested using CodeSourcery PowerPC toolchain on a Xilinx Virtex5 ppc440
> platform.
> ---
> 
>  toolchain/external-toolchain/ext-tool.mk |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> 
> diff --git a/toolchain/external-toolchain/ext-tool.mk
> b/toolchain/external-toolchain/ext-tool.mk index bbf430c..ba10dc7
> 100644 --- a/toolchain/external-toolchain/ext-tool.mk
> +++ b/toolchain/external-toolchain/ext-tool.mk
> @@ -10,7 +10,8 @@ copy_toolchain_lib_root = \
>  	DST="$(strip $2)"; \
>  	STRIP="$(strip $3)"; \
>   \
> -	LIB_DIR=`$(TARGET_CC) -print-file-name=$${LIB} | sed -e
> "s,/$${LIB}\$$,,"`; \
> +	LIB_DIR=`$(TARGET_CC) $(subst ",,$(BR2_TARGET_OPTIMIZATION))
> -print-file-name=$${LIB} | sed -e "s,/$${LIB}\$$,,"`; \
> +	MULTILIB=`$(TARGET_CC) $(subst
> ",,$(BR2_TARGET_OPTIMIZATION)) -print-multi-directory`; \ \
>  	if test -z "$${LIB_DIR}"; then \
>  		echo "copy_toolchain_lib_root: lib=$${LIB} not
> found"; \ @@ -21,7 +22,7 @@ copy_toolchain_lib_root = \
>  	for FILE in `find $${LIB_DIR} -maxdepth 1 -type l -name
> "$${LIB}*"`; do \ LIB=`basename $${FILE}`; \
>  		while test \! -z "$${LIB}"; do \
> -			echo "copy_toolchain_lib_root lib=$${LIB}
> dst=$${DST}"; \
> +			echo "copy_toolchain_lib_root
> multilib=$${MULTILIB} lib=$${LIB} dst=$${DST}"; \ rm -fr
> $(TARGET_DIR)$${DST}/$${LIB}; \ mkdir -p $(TARGET_DIR)$${DST}; \
>  			if test -h $${LIB_DIR}/$${LIB}; then \
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
