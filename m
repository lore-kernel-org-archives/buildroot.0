From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:59:20 +0100
Subject: [Buildroot] [PATCH 1/1] linux: support uncompressed kernel
In-Reply-To: <20210324114522.285121-1-egorenar@linux.ibm.com> (Alexander
 Egorenkov's message of "Wed, 24 Mar 2021 12:45:22 +0100")
References: <20210324114522.285121-1-egorenar@linux.ibm.com>
Message-ID: <87zgyph67r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Egorenkov <egorenar@linux.ibm.com> writes:

 > Enables to build an uncompressed Linux kernel.
 > Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
 > ---
 >  linux/Config.in | 3 +++
 >  linux/linux.mk  | 1 +
 >  2 files changed, 4 insertions(+)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 3370162faa..c09f70c4ac 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -329,6 +329,9 @@ config BR2_LINUX_KERNEL_XZ
 >  config BR2_LINUX_KERNEL_ZSTD
 >  	bool "zstd compression"
 
 > +config BR2_LINUX_KERNEL_UNCOMPRESSED
 > +	bool "uncompressed"

It looks like this is a s390-specific option:

commit 89b5202e81df9f0f0f0a11cf8c78bc8bfdc52a21
Author: Vasily Gorbik <gor@linux.ibm.com>
Date:   Wed Jun 13 00:00:25 2018 +0200

    s390/decompressor: support uncompressed kernel


So it should depend on BR2_s390x.

 > +
 >  endchoice
 
 >  config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index 5e4b319cf1..1457228eb9 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -111,6 +111,7 @@ LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZMA) += CONFIG_KERNEL_LZMA
 >  LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_LZO) += CONFIG_KERNEL_LZO
 >  LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_XZ) += CONFIG_KERNEL_XZ
 >  LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_ZSTD) += CONFIG_KERNEL_ZSTD
 > +LINUX_COMPRESSION_OPT_$(BR2_LINUX_KERNEL_UNCOMPRESSED) += CONFIG_KERNEL_UNCOMPRESSED
 
 >  ifeq ($(BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL),y)
 >  LINUX_DEPENDENCIES += host-openssl
 > -- 
 > 2.26.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
