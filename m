From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 22:56:38 +0100
Subject: [Buildroot] [PATCH 1/2] tcl: update package disabling
In-Reply-To: <1415051479-29611-1-git-send-email-ps.report@gmx.net>
References: <1415051479-29611-1-git-send-email-ps.report@gmx.net>
Message-ID: <5457FA16.2030404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 22:51, Peter Seiderer wrote:
> Update package disabling (removing pkgs subdirectories) after
> latest tcl version update:
> 
> $ ls tcl8.6.1/pkgs/
>  itcl4.0.0
>  sqlite3.8.0
>  tdbc1.0.0
>  tdbcmysql1.0.0
>  tdbcodbc1.0.0
>  tdbcpostgres1.0.0
>  tdbcsqlite3-1.0.0
>  thread2.7.0
> 
> $ ls tcl8.6.2/pkgs/
>  itcl4.0.1
>  sqlite3.8.6
>  tdbc1.0.1
>  tdbcmysql1.0.1
>  tdbcodbc1.0.1
>  tdbcpostgres1.0.1
>  tdbcsqlite3-1.0.1
>  thread2.7.1
> 
> Fixes:
>  http://autobuild.buildroot.net/results/07ae8e42acf62fef99de70c8099ec5a0ca89a817/
> 
> Could not reproduce the build failure, but disabling pkgs/sqlite3.8.6 should
> prevent all build failures in this directory...
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/tcl/tcl.mk | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
> index a242760..a48e48c 100644
> --- a/package/tcl/tcl.mk
> +++ b/package/tcl/tcl.mk
> @@ -32,21 +32,21 @@ HOST_TCL_CONF_OPTS = \
>  # I haven't found a good way to force pkgs to not build
>  # or configure without just removing the entire pkg directory.
>  define HOST_TCL_REMOVE_PACKAGES
> -	rm -fr $(@D)/pkgs/sqlite3.8.0 \
> -		$(@D)/pkgs/tdbc1.0.0 \
> -		$(@D)/pkgs/tdbcmysql1.0.0 \
> -		$(@D)/pkgs/tdbcodbc1.0.0 \
> -		$(@D)/pkgs/tdbcpostgres1.0.0 \
> -		$(@D)/pkgs/tdbcsqlite3-1.0.0
> +	rm -fr $(@D)/pkgs/sqlite3.8.6 \

 To avoid this in the future, perhaps it would be better to use wildcards, e.g.
$(@D)/pkgs/sqlite[0-9].[0-9]*


 Regards,
 Arnout

> +		$(@D)/pkgs/tdbc1.0.1 \
> +		$(@D)/pkgs/tdbcmysql1.0.1 \
> +		$(@D)/pkgs/tdbcodbc1.0.1 \
> +		$(@D)/pkgs/tdbcpostgres1.0.1 \
> +		$(@D)/pkgs/tdbcsqlite3-1.0.1
>  endef
>  HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
>  define TCL_REMOVE_PACKAGES
> -	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3.8.0) \
> -		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1.0.0) \
> -		$(@D)/pkgs/tdbcmysql1.0.0 \
> -		$(@D)/pkgs/tdbcodbc1.0.0 \
> -		$(@D)/pkgs/tdbcpostgres1.0.0 \
> -		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-1.0.0)
> +	rm -fr $(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/sqlite3.8.6) \
> +		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbc1.0.1) \
> +		$(@D)/pkgs/tdbcmysql1.0.1 \
> +		$(@D)/pkgs/tdbcodbc1.0.1 \
> +		$(@D)/pkgs/tdbcpostgres1.0.1 \
> +		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3-1.0.1)
>  endef
>  TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
