From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 14 Feb 2017 16:22:09 +0100
Subject: [Buildroot] [PATCH] bctoolbox: fix typos and logic error
In-Reply-To: <20170214090132.GA5012@waldemar-brodkorb.de>
References: <20170214090132.GA5012@waldemar-brodkorb.de>
Message-ID: <1487085729.1684.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Tue, 2017-02-14 at 10:01 +0100, Waldemar Brodkorb wrote:
> To get the directory path from the library name you need to
> use a single filename. Fix typo in variable name.
> 
> This fixes the ortp autobuild errors which uses the broken pkgconfig
> file
> from bctoolbox.
> 
> Fixes:
> ? http://autobuild.buildroot.net/results/37d5625df4be11ccdc063871e9f6
> e13d5f59fb52
> ? http://autobuild.buildroot.net/results/1999c841fae41f860f00747a3623
> 27cb2857e687
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> ?package/bctoolbox/0001-fix-typo.patch | 18 ++++++++++++++++++
> ?1 file changed, 18 insertions(+)
> ?create mode 100644 package/bctoolbox/0001-fix-typo.patch
> 
> diff --git a/package/bctoolbox/0001-fix-typo.patch
> b/package/bctoolbox/0001-fix-typo.patch
> new file mode 100644
> index 0000000..b94daee
> --- /dev/null
> +++ b/package/bctoolbox/0001-fix-typo.patch
> @@ -0,0 +1,18 @@
> +Fix a typo in the variable name. Only check path for a single
> library name.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>?
> +
> +diff -Nur bctoolbox-0.4.0.orig/CMakeLists.txt bctoolbox-
> 0.4.0/CMakeLists.txt
> +--- bctoolbox-0.4.0.orig/CMakeLists.txt	2016-10-06
> 17:30:41.000000000 +0200
> ++++ bctoolbox-0.4.0/CMakeLists.txt	2017-02-13
> 23:30:38.641288032 +0100
> +@@ -103,8 +103,8 @@
> + endif()
> +?
> + if(MBEDTLS_FOUND)
> +-	get_filename_component(mbedtls_library_path
> "${MBEDTLS_LIBRARIES}" PATH)
> +-	set(LIBS_PRIVATE "${LIBS_PRIVATE}
> -L${mbedlts_library_path}")
> ++	get_filename_component(mbedtls_library_path
> "${MBEDTLS_LIBRARY}" PATH)
> ++	set(LIBS_PRIVATE "${LIBS_PRIVATE}
> -L${mbedtls_library_path}")
> + endif()
> + if(POLARSSL_FOUND)
> +?	get_filename_component(polarssl_library_path
> "${POLARSSL_LIBRARIES}" PATH)

With this fix applied the bctoolbox pkg-config 'Libs.private:' value is
set to:

"""
Libs.private:??-L/mnt/data/git/buildroot/output/host/usr/arm-buildroot-
linux-uclibcgnueabi/sysroot/usr/lib32
"""

No mbedtls libraries are included here.

And the flag 'BCTOOLBOX_LIBS' in ortp is set to:

"""
-L/mnt/data/git/buildroot/output/host/usr/arm-buildroot-linux-
uclibcgnueabi/sysroot/usr/lib -lbctoolbox
-L/mnt/data/git/buildroot/output/host/usr/ar"\
"m-buildroot-linux-uclibcgnueabi/sysroot/usr/lib32
"""

From my understanding, all the three mbedtls libraries libmbedcrypto,
libmbedx509, and libmbedtls should be added to the linker flags and
therefore to 'Libs.private' in the pkg-config file, right?

J?rg
