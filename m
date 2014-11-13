From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 21:18:57 +0100
Subject: [Buildroot] [PATCH 1/2] qt: Disable Script Module for old Linux
 threads
In-Reply-To: <1415897355-62758-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415897355-62758-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141113211857.17e1a15c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 13 Nov 2014 16:49:14 +0000, Vicente Olivert Riera wrote:
> Qt Script Module uses pthread_getattr_np() which is not implemented in
> the old Linux threads. This causes the following compilation failure:
> 
> ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp: In
> function ?void* QTJSC::currentThreadStackBase()?:
> ../3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp:692:42:
> error: ?pthread_getattr_np? was not declared in this scope
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/qt/Config.in |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index da159b4..8161f59 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -402,11 +402,16 @@ config BR2_PACKAGE_QT_OPENSSL
>  config BR2_PACKAGE_QT_SCRIPT
>  	bool "Script Module"
>  	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
> +	depends on !BR2_PTHREADS_OLD # needs pthread_getattr_np()

This does not work for external toolchains, so please use
BR2_TOOLCHAIN_HAS_THREADS_NPTL instead.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
