From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Nov 2014 23:50:10 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt: Script Module needs a toolchain
 with nptl
In-Reply-To: <1415962341-9642-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415962341-9642-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <54668722.5010304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/14 11:52, Vicente Olivert Riera wrote:
> Qt Script Module uses pthread_getattr_np() which is implemented in
> toolchains with nptl. Otherwise the compilation will fail showing this
> error message:
> 
> ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp: In
> function ?void* QTJSC::currentThreadStackBase()?:
> ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:692:42:
> error: ?pthread_getattr_np? was not declared in this scope
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2
> 
> Depend on BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of BR2_PTHREADS_OLD
> 
>  package/qt/Config.in |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index da159b4..f4cb6b6 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -402,11 +402,16 @@ config BR2_PACKAGE_QT_OPENSSL
>  config BR2_PACKAGE_QT_SCRIPT
>  	bool "Script Module"
>  	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # needs pthread_getattr_np()
>  	default y
>  	help
>  	  Build the Qt Script module.
>  	  if unsure, say y.
>  
> +comment "Script Module needs a toolchain with nptl"

 NPTL should be in capitals.

 Regards,
 Arnout

> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> +
>  config BR2_PACKAGE_QT_SCRIPTTOOLS
>  	bool "Script Tools Module"
>  	depends on BR2_PACKAGE_QT_SCRIPT
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
