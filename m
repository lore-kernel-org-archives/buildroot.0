From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Oct 2014 23:19:54 +0200
Subject: [Buildroot] [PATCH] vlc: fix build when Qt4 development files
 are installed on the host
In-Reply-To: <1412802667-22749-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412802667-22749-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141008211954.GH4718@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-08 23:11 +0200, Thomas Petazzoni spake thusly:
> When Qt4 development files are installed on the host, VLC uses
> /usr/bin/moc, /usr/bin/uic and /usr/bin/rcc when Qt support is
> enabled. However, those host installed versions are not necessarily
> compatible with the Qt version used in Buildroot, causes some build
> failures.
> 
> This commit therefore passes explicit ac_cv_path_MOC, ac_cv_path_RCC
> and ac_cv_path_UIC variables to make sure the Qt host tools built by
> Buildroot are used.
> 
> Note that the VLC configure.ac script uses 'pkg-config
> --variable=exec_prefix QtCore' to find the location of such tools, but
> this invocation returns /usr. One solution would have been to extend
> the pkgconf-01-fix-variable.patch we have against pkgconf to also
> cover exec_prefix, but this has more uncertain consequences than just
> fixing VLC.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/061/06174eaeb7f2b8a591395e607912ad72623b79e3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/vlc/vlc.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 0b275f2..13c72ce 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -251,6 +251,10 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
>  VLC_CONF_OPTS += --enable-qt
> +VLC_CONF_ENV += \
> +       ac_cv_path_MOC=$(HOST_DIR)/usr/bin/moc \
> +       ac_cv_path_RCC=$(HOST_DIR)/usr/bin/rcc \
> +       ac_cv_path_UIC=$(HOST_DIR)/usr/bin/uic
>  VLC_DEPENDENCIES += qt
>  else
>  VLC_CONF_OPTS += --disable-qt
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
