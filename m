From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 29 Dec 2015 13:37:34 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1 v1] yp-tools: new package
In-Reply-To: <20151228225821.5112f7df@free-electrons.com>
References: <1450893584-2926-1-git-send-email-yba@tkos.co.il>
 <20151228225821.5112f7df@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1512291332270.647@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Dec 2015, Thomas Petazzoni wrote:

> Date: Mon, 28 Dec 2015 22:58:21 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1 v1] yp-tools: new package
> 
> Jonathan,
>
> The patch title is wrong: it's a v2, not a v1. Also, there was no
> changelog below the "---" sign to help understand what has changed.

Hi Thomas,
Do you mean a git-generated change log from the previous version of the 
patch to the current version of the patch?

> On Wed, 23 Dec 2015 19:59:44 +0200, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> Adds the yp-tools package that provides various NIS (yp) utilities.
>> Runtime tested on arch arm. Built on i586.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>
> I tried to build this configuration:
>
> BR2_arm=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.11-rc1-71-g90d1299.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_YP_TOOLS=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> and it fails to build with:
>
> yp_get_default_domain.c:23:24: fatal error: rpcsvc/nis.h: No such file
> or directory

What would be a good set of configs to test before submitting patches?

>> +YP_TOOLS_PRE_CONFIGURE_HOOKS += YP_TOOLS_LOCAL_MAPV4V6ADDR_H
>> +
>> +# mapv4v6addr.h isn't always available, depending on your build, but
>> +# nis-hosts.c only needs it for a single, inline function.  So drop a copy
>> +# here rather than playing games with the include path that would
>> +# potentially lead to cross-compilation issues.
>> +
>> +define YP_TOOLS_LOCAL_MAPV4V6ADDR_H
>> +	$(INSTALL) -D -m 0644 $(TOPDIR)/package/yp-tools/mapv4v6addr.h \
>> +		$(STAGING_DIR)/usr/include/resolv/mapv4v6addr.h
>> +endef
>
> Instead of doing this "complicated" installation of a header file, just
> patch nis-tools.c to not include <mapv4v6addr.h> and instead put a copy
> of the needed function at the top of this file.
>
> I would have changed it myself before applying, but since there is a
> build failure, it's up to you to fix it :-)

Ok.

> Also, you have:
>
> 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>
> but you don't depend on the gettext package, so you don't have the
> guarantee that it will be built before yp-tools.
>
> Could you look into those issues and send an updated version?
>
> Thanks a lot!
>
> Thomas
>

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
