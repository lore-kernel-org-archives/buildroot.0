From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 May 2020 19:21:36 +0200
Subject: [Buildroot] [PATCH 1/4] package/ogre: remove libglu dependency
In-Reply-To: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
References: <20200503171227.1411086-1-bernd.kuhls@t-online.de>
Message-ID: <20200503172136.GA15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-05-03 19:12 +0200, Bernd Kuhls spake thusly:
> "The inclusion of GLU is historical. [...] I'd recommend using
>  -DGLEW_NO_GLU since GLU is rarely seen in modern codebases nowadays."
> https://github.com/nigels-com/glew/issues/192#issuecomment-411641657
> 
> Add -DGLEW_NO_GLU to get rid of the libglu dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> @@ -23,12 +22,16 @@ OGRE_DEPENDENCIES = host-pkgconf \
>  	xlib_libXrandr \
>  	zziplib
>  
> +OGRE_CXX_FLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU

Here, OGRE_CXX_FLAGS.

>  # Unbundle freetype and zziplib.
>  # Disable java and nvidia cg support.
>  OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
>  	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
>  	-DOGRE_BUILD_PLUGIN_CG=OFF \
> -	-DOGRE_INSTALL_DOCS=OFF
> +	-DOGRE_INSTALL_DOCS=OFF \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGLEW_NO_GLU" \
> +	-DCMAKE_CXX_FLAGS="$(OGRE_CXX_FLAGS)"

Ditto here: OGRE_CXX_FLAGS.

>  # Enable optional python component if python interpreter is present on the target.
>  ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
> @@ -41,7 +44,7 @@ endif
>  
>  # Uses __atomic_fetch_add_8
>  ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -OGRE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
> +OGRE_CXXFLAGS += -latomic

But here: OGRE_CXXFLAGS.

The last one looks like the better name, though, so please use that.

Regards,
Yann E. MORIN.

>  endif
>  
>  $(eval $(cmake-package))
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
