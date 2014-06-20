From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Jun 2014 23:27:19 +0200
Subject: [Buildroot] [PATCH 1/2] icu: Delete inapropriate flag at link
In-Reply-To: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <53A4A737.9070304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/06/14 18:13, Maxime Hadjinlian wrote:
> From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> 
> Theses flags may cause libicudata to not be loaded on ARM EABIHF
> because it would be built for ARM EABI only.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> Cc: Thomas Petazzoni  <thomas.petazzoni@free-electrons.com>
> ---
>  .../icu/icu-004-link-icudata-as-data-only.patch    | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/icu/icu-004-link-icudata-as-data-only.patch
> 
> diff --git a/package/icu/icu-004-link-icudata-as-data-only.patch b/package/icu/icu-004-link-icudata-as-data-only.patch
> new file mode 100644
> index 0000000..b69cec1
> --- /dev/null
> +++ b/package/icu/icu-004-link-icudata-as-data-only.patch
> @@ -0,0 +1,32 @@
> +From d5d0c4bb7cc9aa4a132ec0bea13255aee50c1cf9 Mon Sep 17 00:00:00 2001
> +From: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> +Date: Fri, 6 Jun 2014 14:55:58 +0200
> +Subject: [PATCH] link icudata as data only

 I guess this should be "Don't link icudata as data only"

> +
> +This patch came straight from Debian.
> +It fix a trouble when libicudata would not respect some flags and would
> +for example end up being built for ARM EABI instead of ARM EABIHF

 I don't see how -nostdlib -nodefaultlibs could have that effect - especially in
buildroot, where we always force the abi. Do you have an example configuration
where this happens?

 That said, I also don't see a reason why you would want the -nostdlib
-nodefaultlibs because in the end it will be linked with those libraries anyway...

 Regards,
 Arnout


> +
> +Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@devialet.com>
> +---
> + source/config/mh-linux | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/source/config/mh-linux b/source/config/mh-linux
> +index 531a3b2..5a2a7c4 100644
> +--- a/source/config/mh-linux
> ++++ b/source/config/mh-linux
> +@@ -21,7 +21,9 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
> + LD_RPATH_PRE = -Wl,-rpath,
> +
> + ## These are the library specific LDFLAGS
> +-LDFLAGSICUDT=-nodefaultlibs -nostdlib
> ++#LDFLAGSICUDT=-nodefaultlibs -nostdlib
> ++# Debian change: linking icudata as data only causes too many problems.
> ++LDFLAGSICUDT=
> +
> + ## Compiler switch to embed a library name
> + # The initial tab in the next line is to prevent icu-config from reading it.
> +--
> +2.0.0.rc2
> +
> --
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
