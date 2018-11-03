From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 22:19:43 +0100
Subject: [Buildroot] [PATCH 1/1] libssh2: update second patch
In-Reply-To: <20181103152811.6532-1-fontaine.fabrice@gmail.com>
References: <20181103152811.6532-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103221943.716b20be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  3 Nov 2018 16:28:11 +0100, Fabrice Fontaine wrote:
> curl can be statically linked with mbedtls, in this case build will
> fail on:
> kex.c:(.text+0x1be0): undefined reference to `mbedtls_mpi_read_binary'
> 
> This is due to the fact that CURL_LIBRARIES does not contain mbedtls
> library:
> CURL_LIBRARIES:INTERNAL=curl;cares;ssh2;ssh2;z;ssl;crypto;z;z;crypto;z;z;ssl;z;z;crypto;z
> 
> even if libcurl.pc is correct:
> Libs.private: -lcares -lssh2 -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssh2 /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz
> 
> This full library path is added by the second patch on libssh2 so update
> it to replace $LIBMBDEDCRYPTO by $LTLIBMBEDCRYPTO as suggested by Thomas
> during review of https://patchwork.ozlabs.org/patch/989339
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/dc7810d5d5c62658837cdd2faae6fe3390f968a2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I have applied, but after tweaking the commit title. Indeed "update
second patch" is very fuzzy. It should instead describe what is the
goal of the commit, not how you achieve it. The fact that you need to
update the second patch to fix static linking scenarios involving
mbedtls is of secondary importance.

>  Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Your SoB...

> +[Replace $LIBMBEDCRYTO by $LTLIBMBEDCRYPTO to avoid adding a full
> +library path to libssh2.pc as it raises build failures on some packages
> +such as xerces]

... should have been *after* the commit you're adding to explain the
changes you've done.

I've fixed both issues and applied. Many thanks for looking again at
the issue following my initial review, and providing an updated version
of the patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
