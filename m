From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 21:52:11 +0100
Subject: [Buildroot] [PATCH] subversion: fix dependencies/selects
In-Reply-To: <1414420448-5573-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414420448-5573-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545001FB.3010406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/10/14 15:34, Gustavo Zacarias wrote:
> Add all of the missing selects and dependencies, they may be inherent
> to other dependencies but are used by subversion itself.
>
> Except for sqlite which fixes:
> http://autobuild.buildroot.net/results/40c/40ce377893789883503deaa57912b87d2e0192e8/
>
> Also add hash file.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/subversion/Config.in       | 8 +++++++-
>  package/subversion/subversion.hash | 2 ++
>  package/subversion/subversion.mk   | 3 +--
>  3 files changed, 10 insertions(+), 3 deletions(-)
>  create mode 100644 package/subversion/subversion.hash
>
> diff --git a/package/subversion/Config.in b/package/subversion/Config.in
> index cc2549f..34d1987 100644
> --- a/package/subversion/Config.in
> +++ b/package/subversion/Config.in
> @@ -1,12 +1,18 @@
>  config BR2_PACKAGE_SUBVERSION
>      bool "subversion"
> -    select BR2_PACKAGE_APR_UTIL
>      # apr really needs shared library support
>      depends on !BR2_PREFER_STATIC_LIB
>      depends on BR2_USE_MMU # apr
> +    select BR2_PACKAGE_APR_UTIL
> +    select BR2_PACKAGE_EXPAT
>      select BR2_PACKAGE_NEON
>      select BR2_PACKAGE_NEON_XML
> +    select BR2_PACKAGE_SQLITE
> +    select BR2_PACKAGE_ZLIB
>      help
>        Subversion is an open source version control system
>  
>        http://subversion.apache.org/
> +
> +comment "subversion needs a toolchain w/ dynamic library"
> +    depends on BR2_PREFER_STATIC_LIB

 This should also
    depends on BR2_USE_MMU
(since that's assumed to be an arch limitation).


 Regards,
 Arnout

> diff --git a/package/subversion/subversion.hash
> b/package/subversion/subversion.hash
> new file mode 100644
> index 0000000..08e5cb8
> --- /dev/null
> +++ b/package/subversion/subversion.hash
> @@ -0,0 +1,2 @@
> +# From http://archive.apache.org/dist/subversion/subversion-1.7.18.tar.gz.sha1
> +sha1    96873512eeb196e5ba6435fbffb24ba284bfcf84    subversion-1.7.18.tar.gz
> diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
> index af5244b..f74c8e5 100644
> --- a/package/subversion/subversion.mk
> +++ b/package/subversion/subversion.mk
> @@ -8,8 +8,7 @@ SUBVERSION_VERSION = 1.7.18
>  SUBVERSION_SITE = http://archive.apache.org/dist/subversion
>  SUBVERSION_LICENSE = Apache-2.0
>  SUBVERSION_LICENSE_FILES = LICENSE
> -
> -SUBVERSION_DEPENDENCIES = apr apr-util expat neon zlib
> +SUBVERSION_DEPENDENCIES = apr apr-util expat neon sqlite zlib
>  SUBVERSION_CONF_OPTS = \
>      --with-expat=$(STAGING_DIR)/usr/include:$(STAGING_DIR)/usr/lib: \
>      --with-apr=$(STAGING_DIR)/usr \
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
