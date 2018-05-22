From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 May 2018 23:06:37 +0200
Subject: [Buildroot] [PATCH 1/1] libcurl: fix build with ssh2 and static
 mbedtls
In-Reply-To: <20180521114108.20916-1-fontaine.fabrice@gmail.com>
References: <20180521114108.20916-1-fontaine.fabrice@gmail.com>
Message-ID: <20180522230637.49906e43@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 May 2018 13:41:08 +0200, Fabrice Fontaine wrote:
> The ssh2 pkg-config file could contain the following lines when build
> with a static version of mbedtls:
>    Libs: -L${libdir} -lssh2 /xxx/libmbedcrypto.a
>    Libs.private: /xxx/libmbedcrypto.a

I find it weird to have the same library in both Libs and Libs.private.

Either it's a direct dependency of ssh2 and it should be in Libs. Or
it's an indirect dependency of ssh2 and should only be used when static
linking, in which case it should be only in Libs.private.

Section thing that looks weird is: why a full path to libmbedcrypto.a
and not a -l flag ?

> This static mbedtls library must be used to correctly detect ssh2
> support and this library must be copied in libcurl.pc otherwise
> compilation of any application (such as upmpdcli) with libcurl will fail
> when trying to found mbedtls functions included in libssh2.
> So, replace pkg-config --libs-only-l by pkg-config --libs.

That being said, the libcurl change looks good to me. Did you submit it
upstream ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
