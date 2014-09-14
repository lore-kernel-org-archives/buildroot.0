From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 16:42:27 +0200
Subject: [Buildroot] [PATCH 12 of 20] packages: rename
 FOO_AUTORECONF_OPT into FOO_AUTORECONF_OPTS
In-Reply-To: <7671d1a5bdb5e0042b1e.1406668359@localhost>
References: <patchbomb.1406668347@localhost>
 <7671d1a5bdb5e0042b1e.1406668359@localhost>
Message-ID: <20140914144227.GJ3917@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-29 23:12 +0200, Thomas De Schampheleire spake thusly:
> To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
> make the same change for FOO_AUTORECONF_OPT.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I noticed some inconsistencies, unrelated to your patch. See
below...

[--SNIP--]
> diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk
> --- a/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk	Tue Jul 29 22:09:17 2014 +0200
> +++ b/package/gstreamer/gst-plugin-x170/gst-plugin-x170.mk	Tue Jul 29 22:04:21 2014 +0200
> @@ -12,7 +12,7 @@
>  
>  # There is no generated configure script in the tarball.
>  GST_PLUGIN_X170_AUTORECONF = YES
> -GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/
> +GST_PLUGIN_X170_AUTORECONF_OPTS = -Im4/

Here, we use a relative include path...

>  GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
>  
>  $(eval $(autotools-package))
> diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk	Tue Jul 29 22:09:17 2014 +0200
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk	Tue Jul 29 22:04:21 2014 +0200
> @@ -13,7 +13,7 @@
>  GST1_PLUGINS_BAD_LICENSE = LGPLv2+ LGPLv2.1+
>  
>  GST1_PLUGINS_BAD_AUTORECONF = YES
> -GST1_PLUGINS_BAD_AUTORECONF_OPT = -I $(@D)/common/m4
> +GST1_PLUGINS_BAD_AUTORECONF_OPTS = -I $(@D)/common/m4

... but here...

>  GST1_PLUGINS_BAD_GETTEXTIZE = YES
>  
>  GST1_PLUGINS_BAD_CONF_OPT = \
[--SNIP--]
> diff -r f0daa0c9e40d -r 7671d1a5bdb5 package/webkit/webkit.mk
> --- a/package/webkit/webkit.mk	Tue Jul 29 22:09:17 2014 +0200
> +++ b/package/webkit/webkit.mk	Tue Jul 29 22:04:21 2014 +0200
> @@ -17,7 +17,7 @@
>  
>  # webkit-disable-tests.patch changes configure.ac therefore autoreconf required
>  WEBKIT_AUTORECONF = YES
> -WEBKIT_AUTORECONF_OPT = -I $(@D)/Source/autotools
> +WEBKIT_AUTORECONF_OPTS = -I $(@D)/Source/autotools

... and here, we use an absolute path.

Can we make this consistent, i.e. always use a relative (or absolute)
path for all packages?

What should be the rule?

Anyway, if we want to do something about it, this should be in a
separate patch.

Regards,
Yann E. MORIN.

>  # parallel make install deadlocks with make 3.81
>  WEBKIT_INSTALL_STAGING_OPTS = -j1 DESTDIR=$(STAGING_DIR) install

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
