From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 3 Feb 2016 09:17:48 -0300
Subject: [Buildroot] [PATCH 1/2] yad: fix libgtk2 related dependency
	error
In-Reply-To: <1454464356-12637-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1454464356-12637-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <56B1EFEC.4040801@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/16 22:52, Ricardo Martincoski wrote:

> --- a/package/yad/Config.in
> +++ b/package/yad/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_YAD
>   	bool "yad"
>   	depends on BR2_PACKAGE_XORG7
>   	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> +	select BR2_PACKAGE_LIBGTK3_X11 if BR2_PACKAGE_LIBGTK3
>   	help
>   	  YAD (yet another dialog) is a tool for create graphical dialogs
>   	  from shell scripts.

Hi.
This logic is severely broken, you can't force X11 if someone is using 
gtk3 with say broadway or wayland.
Not to mention BR2_PACKAGE_LIBGTK3_X11 depends on xorg being selected.

> -ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)

This isn't accurate either, you first say it needs x11 by selecting it, 
but you then basically say no?
Regards.
