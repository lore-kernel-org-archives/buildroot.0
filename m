From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 04 Jan 2015 15:23:36 +0100
Subject: [Buildroot] [PATCH 07/10] package/libxmlrpc: handle
 static/shared only install
In-Reply-To: <20150102131856.28594262@free-electrons.com>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>	<1419717508-11627-8-git-send-email-romain.naour@openwide.fr>
 <20150102131856.28594262@free-electrons.com>
Message-ID: <54A94CE8.6000203@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/01/2015 13:18, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Sat, 27 Dec 2014 22:58:25 +0100, Romain Naour wrote:
> 
>> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
>> index c3788d6..5796ae6 100644
>> --- a/package/libxmlrpc/libxmlrpc.mk
>> +++ b/package/libxmlrpc/libxmlrpc.mk
>> @@ -35,4 +35,15 @@ LIBXMLRPC_MAKE_ENV = \
>>  	CFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
>>  	LDFLAGS_FOR_BUILD="$(HOST_LDFLAGS)"
>>  
>> +
>> +ifeq ($(BR2_SHARED_LIBS),y)
>> +LIBXMLRPC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) \
>> +	install-shared-libraries install-headers install-bin
>> +endif
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +LIBXMLRPC_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) \
>> +	install-static-libraries install-headers install-bin
>> +endif
> 
> This does not work: in a BR2_SHARED_LIBS configuration, libraries are
> no longer installed in the staging directory:

Yes, indeed... sorry :-/

Let's use install target and trash this patch.

> 
> $ cat defconfig 
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.11.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_LIBXMLRPC=y
> # BR2_TARGET_ROOTFS_TAR is not set
> $ make
> [...]
> $ LANG=C ls output/staging/usr/lib/libxmlrpc*
> ls: cannot access output/staging/usr/lib/libxmlrpc*: No such file or directory
> 
> I'll mark the patch as Rejected in patchwork.
> 

Thanks for testing.
(hopefully this patch hasn't been commited)

Best regards,
Romain
