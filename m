From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 21 Apr 2016 08:15:35 +0200
Subject: [Buildroot] [PATCH] yajl: fix build with uClibc
In-Reply-To: <1461145087-63679-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1461145087-63679-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1461219335.6388.20.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Mi, 2016-04-20 at 10:38 +0100, Vicente Olivert Riera wrote:
> The failure looks like this:
> 
> ../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
> ../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
> 
> We already have a patch (0001) which should fix this problem,
> however,
> as stated here [1], it doesn't work when cross compiling.
> 
> To fix the problem we add -lm to CFLAGS when building with uClibc.
> 
> Fixes:
> 
> ? http://autobuild.buildroot.net/results/308/30892ffb298acc2334f8c694
> 038c420120fe43b9/
> 
> 1: https://github.com/lloyd/yajl/issues/58#issuecomment-15683796
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> ?package/yajl/yajl.mk | 4 ++++
> ?1 file changed, 4 insertions(+)
> 
> diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
> index 7770e86..145bf2c 100644
> --- a/package/yajl/yajl.mk
> +++ b/package/yajl/yajl.mk
> @@ -11,4 +11,8 @@ YAJL_LICENSE = ISC
> ?YAJL_LICENSE_FILES = COPYING
> ?YAJL_PATCH = https://github.com/vriera/yajl/commit/6d09f11b8fd358cab
> 0e31b965327e64a599f9ce9.patch
> ?
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +YAJL_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -lm"
> +endif
> +
> ?$(eval $(cmake-package))

For the record, Bernd Kuhls proposed a patch [1] to fix this issue,
too.

The patch [2] in commit?3cfd8bf15cd8b80215bb70db28e065ff0b80437b fixed
an issue, where the executables build in yajl, like 'parse_config', are
linked against the static yajl library, even in a shared context.

Unfortunatly, the submitter (me) of this patch did not test with the
uClibc based toolchain, but only for musl.

We have already the patch "0001-cmake-uClibc-Fix-missing-libm-for-
tests.patch" for yajl which fixes the missing libm for uClibc for the
executable 'gen-extra-close', which should be removed by your patch.

I'm not sure if it's worth, but I would prefer to fix the CMake build
files of yajl by checking if libm is needed for isnan and it to the
list of LIBS and let all executables link against LIBS. Thomas
Petazzoni did this for an autotools package [3]. For CMake it would be
something like this:

    # check if isnan needs libm
    try_compile(ISNAN_NEEDS_LIBM, ...)
    if (ISNAN_NEEDS_LIBM)
    ? set(LIBS ${LIBS} m)
    endif ()

    [..]

    TARGET_LINK_LIBRARIES(${testProg} yajl ${LIBS})

Furthermore, the .pc file should be fixed.

[1]?http://patchwork.ozlabs.org/patch/612226/
[2]?http://patchwork.ozlabs.org/patch/608412/
[3]?http://lists.busybox.net/pipermail/buildroot/2015-May/127381.html

Best regards
J?rg Krause
