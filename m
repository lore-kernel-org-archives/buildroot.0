From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 16:03:20 +0100
Subject: [Buildroot] [git commit] qt5base: unconditionally install
 Qt5printSupport if widgets are enabled
In-Reply-To: <20141113144933.8E075B4453@busybox.osuosl.org>
References: <20141113144933.8E075B4453@busybox.osuosl.org>
Message-ID: <20141113160320.4391cb1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 13 Nov 2014 15:48:57 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=e07c705e699b876dcc77be06d734b83e1bd31084
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The qt5 build system currently unconditionally builds and installs into
> staging Qt5PrintSupport if widgets are enabled, so ensure it also gets
> installed into target to make sure we don't end up with dynamic linker
> errors at runtime:
> 
> test: error while loading shared libraries: libQt5PrintSupport.so.5: cannot
> open shared object file: No such file or directory
> 
> From src.pro:
> 
> !contains(QT_CONFIG, no-gui) {
>         ..
>         !wince*:!winrt {
>             SUBDIRS += src_printsupport
>             src_plugins.depends += src_printsupport
>         }
> 
> }
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/qt5/qt5base/Config.in |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
> index f4eedec..e5679be 100644
> --- a/package/qt5/qt5base/Config.in
> +++ b/package/qt5/qt5base/Config.in
> @@ -209,10 +209,8 @@ config BR2_PACKAGE_QT5BASE_DEFAULT_QPA
>  	  different platform at runtime with the -platform option.
>  
>  config BR2_PACKAGE_QT5BASE_PRINTSUPPORT
> -	bool "print support module"
> -	select BR2_PACKAGE_QT5BASE_WIDGETS
> -	help
> -	  This option enables the Qt5PrintSupport
> +	depends on BR2_PACKAGE_QT5BASE_WIDGETS
> +	def_bool y

So why have a Config.in option for this in the first place?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
