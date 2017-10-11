From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Oct 2017 00:09:42 +0200
Subject: [Buildroot] [RFC 3/3] stacks: add a bunch of stacks
In-Reply-To: <1507668210-5427-4-git-send-email-angelo.compagnucci@gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
 <1507668210-5427-4-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <bd3b7577-abda-2187-8094-e71e0c519e36@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 22:43, Angelo Compagnucci wrote:
> This patch adds a bunch of stacks to thinkering with.

 tinkering

> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  stacks/lamp_stack           | 10 ++++++++++
>  stacks/mesa3d-etnaviv_stack |  7 +++++++
>  stacks/qt5-demos_stack      |  7 +++++++
>  stacks/qt5-fb_stack         | 11 +++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 stacks/lamp_stack
>  create mode 100644 stacks/mesa3d-etnaviv_stack
>  create mode 100644 stacks/qt5-demos_stack
>  create mode 100644 stacks/qt5-fb_stack
> 
> diff --git a/stacks/lamp_stack b/stacks/lamp_stack
> new file mode 100644
> index 0000000..bc9b0f1
> --- /dev/null
> +++ b/stacks/lamp_stack
> @@ -0,0 +1,10 @@
> +# Linux Apache Mysql Php (LAMP stack)
> +
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y

 Ah, yes, these things... When you start combining defconfigs and stacks, it is
possible that there are conflicting options. So it would be nice to be able to
check that all the options we merge in are really retained. In fact, we already
do that, in test-pkg. So perhaps the best approach is to factor that into a new
script, e.g. utils/stack-config, and tell the user to run that script to combine
the stacks. Then call that script from test-pkg instead of repeating the same code.

 There's another limitation of this thing: if we want to combine it with an
external toolchain, this will no longer make sure that the external toolchain
has C++ enabled. We would basically want to include
BR2_INSTALL_LIBSTDCPP=y
in the stack config, so that the stack-config script will error out if the
external toolchain doesn't have C++. But then, I'm not sure how to keep the
BR2_TOOLCHAIN_BUILDROOT_CXX=y in the stack config because it will always be
thrown away for an external toolchain. Any ideas?


> +BR2_PACKAGE_PHP=y
> +BR2_PACKAGE_PHP_EXT_DBA=y
> +BR2_PACKAGE_PHP_EXT_PDO=y
> +BR2_PACKAGE_PHP_EXT_PDO_MYSQL=y

BR2_PACKAGE_PHP_SAPI_APACHE seems obvious... CGI is the default put probably not
really want you want if you have apache.

 And without BR2_PACKAGE_PHP_EXT_SESSION and BR2_PACKAGE_PHP_EXT_JSON you also
probably won't get very far.

> +BR2_PACKAGE_MYSQL=y
> +BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
> +BR2_PACKAGE_APACHE=y
> diff --git a/stacks/mesa3d-etnaviv_stack b/stacks/mesa3d-etnaviv_stack
> new file mode 100644
> index 0000000..959967c
> --- /dev/null
> +++ b/stacks/mesa3d-etnaviv_stack
> @@ -0,0 +1,7 @@
> +# Mesa3D for boards based on Etnaviv driver

 It's better readable if you leave an empty line, like you did for the LAMP stack.

> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_PACKAGE_MESA3D=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> +BR2_PACKAGE_MESA3D_OPENGL_ES=y
> diff --git a/stacks/qt5-demos_stack b/stacks/qt5-demos_stack
> new file mode 100644
> index 0000000..b00ef34
> --- /dev/null
> +++ b/stacks/qt5-demos_stack
> @@ -0,0 +1,7 @@
> +# QT5 demo packages
> +BR2_PACKAGE_GLMARK2=y
> +BR2_PACKAGE_MESA3D_DEMOS=y
> +BR2_PACKAGE_KMSCUBE=y
> +BR2_PACKAGE_QT5CINEX=y
> +BR2_PACKAGE_QT5CINEX_HD=y

 Ha, that's another thing. This one needs qt5-fb_stack, so it would be nice if
it could #include it somehow.

 Regards,
 Arnout

> +BR2_PACKAGE_LIBV4L=y
> diff --git a/stacks/qt5-fb_stack b/stacks/qt5-fb_stack
> new file mode 100644
> index 0000000..fcadde8
> --- /dev/null
> +++ b/stacks/qt5-fb_stack
> @@ -0,0 +1,11 @@
> +# QT5 stack based on the Linux famebuffer
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_PACKAGE_QT5=y
> +BR2_PACKAGE_QT5BASE_GUI=y
> +BR2_PACKAGE_QT5BASE_OPENGL=y
> +BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
> +BR2_PACKAGE_QT5BASE_LINUXFB=y
> +BR2_PACKAGE_QT5BASE_FONTCONFIG=y
> +BR2_PACKAGE_QT5BASE_GIF=y
> +BR2_PACKAGE_QT5BASE_JPEG=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
