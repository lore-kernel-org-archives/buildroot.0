From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2016 17:19:02 +0100
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
In-Reply-To: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20160110161902.GF3460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2015-08-06 12:06 +0200, Julien Corjon spake thusly:
> Fixes: http://autobuild.buildroot.net/results/0ee0f879e8563954c64b3940cdec39d2e6de937a/

As Thomas said, this does not really fix that issue.

However, still following Thomas comment, I think this is a valid patch,
and it should be applied with a tweaked commit log;

    package/qt5base: add support for optional gstreamer

    qt5base can optionally support gstreamer-0.10 or gstreamer-1.0.
    Upstreamer still considers gstreamer-0.10 to be preferred over 1.0.

    Ensure that gstreamer, when enabled, is built before qt5base; tell
    qt5base to use the proper gstreamer variant, or none if gstreamer
    is not enabled.

    Signed-off-by: You

With that fixed, you can add my:

    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 753b069..f04545b 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -152,6 +152,16 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
>  
> +ifeq ($(BR2_PACKAGE_GSTREAMER),y)
> +QT5BASE_CONFIGURE_OPTS += -gstreamer 0.10
> +QT5BASE_DEPENDENCIES   += gstreamer
> +else ifeq ($(BR2_PACKAGE_GSTREAMER1),y)
> +QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
> +QT5BASE_DEPENDENCIES   += gstreamer1
> +else
> +QT5BASE_CONFIGURE_OPTS += -no-gstreamer
> +endif
> +
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
>  
>  # Build the list of libraries to be installed on the target
> -- 
> 2.1.0
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
