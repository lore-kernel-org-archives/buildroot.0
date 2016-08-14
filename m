From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 22:09:17 +0200
Subject: [Buildroot] [PATCH] package/sg3_utils: fix uclinux build
In-Reply-To: <1471196736-26143-1-git-send-email-yann.morin.1998@free.fr>
References: <1471196736-26143-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <5ec29da8-5016-0ed2-e288-64f6cff686fd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14-08-16 19:45, Yann E. MORIN wrote:
> sg3_utils grep for '^linux' as the host OS to decide if we are
> targetting Linux.
> 
> However, on noMMU targets, the host OS can be 'uclinux' instead of just
> plain 'linux', which make sg3_util confused and thus it forgets to
> include soem source fiels in the build, resulting in link failures.
> 
> Fix that by ammending the regexp that recognises Linux. WE now need to

 Hey hey, no need to shout :-)

> run autoreconf.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/79a/79a572f67bafa6a007256a5f22529c2daabd5733/
>     http://autobuild.buildroot.org/results/4f7/4f7ea4bb4c4c12ceb9cd08bfb6720386f5bdea0b/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sg3_utils/0001-support-uclinux-as-a-linux.patch | 16 ++++++++++++++++
>  package/sg3_utils/sg3_utils.mk                          |  3 +++
>  2 files changed, 19 insertions(+)
>  create mode 100644 package/sg3_utils/0001-support-uclinux-as-a-linux.patch
> 
> diff --git a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
> new file mode 100644
> index 0000000..99937e5
> --- /dev/null
> +++ b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
> @@ -0,0 +1,16 @@
> +Recognise uclinuc as a linux

 uclinuc -> uclinux

 Upstream status?

 Just spelling mistakes, so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN sg3_utils-1.42.orig/configure.ac sg3_utils-1.42/configure.ac
> +--- sg3_utils-1.42.orig/configure.ac	2015-10-21 01:10:59.000000000 +0200
> ++++ sg3_utils-1.42/configure.ac	2016-08-14 19:30:37.841766149 +0200
> +@@ -71,7 +71,7 @@
> + 
> + # Define platform-specific symbol.
> + AM_CONDITIONAL(OS_FREEBSD, [echo $host_os | grep 'freebsd' > /dev/null])
> +-AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep '^linux' > /dev/null])
> ++AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep -E '^(uc)?linux' > /dev/null])
> + AM_CONDITIONAL(OS_OSF, [echo $host_os | grep '^osf' > /dev/null])
> + AM_CONDITIONAL(OS_SOLARIS, [echo $host_os | grep '^solaris' > /dev/null])
> + AM_CONDITIONAL(OS_WIN32_MINGW, [echo $host_os | grep '^mingw' > /dev/null])
> diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
> index 36cb32e..e7af83a 100644
> --- a/package/sg3_utils/sg3_utils.mk
> +++ b/package/sg3_utils/sg3_utils.mk
> @@ -14,6 +14,9 @@ SG3_UTILS_LICENSE += GPLv2+
>  endif
>  SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
>  
> +# Patching configure.ac
> +SG3_UTILS_AUTORECONF = YES
> +
>  # install the libsgutils2 library
>  SG3_UTILS_INSTALL_STAGING = YES
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
