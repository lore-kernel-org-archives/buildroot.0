From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 17:13:39 +0200
Subject: [Buildroot] [PATCH v3 2/7] package/vala: install wrapper to
 vapigen
In-Reply-To: <20200327183000.1005676-2-aduskett@gmail.com>
References: <20200327183000.1005676-1-aduskett@gmail.com>
 <20200327183000.1005676-2-aduskett@gmail.com>
Message-ID: <20200329151339.GG22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-03-27 11:29 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> when compiling gobject-introspection .gir files, some packages use vapigen to
> generate a vala-api compatible .gir file. These packages tend to call vapigen
> directly instead of vala or valac.
> 
> Without the wrapper, building the .gir files fail. In the case of for example,
> gupnp-dlna throws the following error:
> "error: Package `Gst-1.0' not found in specified Vala API directories or
> GObject-Introspection GIR directories."
> 
> Installing the vala wrapper to vapigen fixes the above issue.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Applied to master with very minor tweaks in the commit log. Thanks!

I  haven't applied the rest of the series for now; I've left it pending
while I think about it...

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3:
>   - Add $(HOST_DIR)/bin/vapigen to the sed line.
> 
>  package/vala/vala.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/vala/vala.mk b/package/vala/vala.mk
> index b8a69f8c5e..95365faf18 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -17,16 +17,19 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
>  HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
>  HOST_VALA_CONF_OPTS += --disable-valadoc
>  
> -# We wrap vala & valac to point to the proper gir and vapi data dirs
> +# We wrap vala, valac and vapigen to point to the proper gir and vapi data dirs
>  # Otherwise we'll get host directory data which isn't enough
>  define HOST_VALA_INSTALL_WRAPPER
>  	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
>  		$(HOST_DIR)/bin/vala
>  	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
>  		$(HOST_DIR)/bin/valac
> +	$(INSTALL) -D -m 0755 package/vala/vala-wrapper \
> +		$(HOST_DIR)/bin/vapigen
>  	$(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
>  		$(HOST_DIR)/bin/vala \
> -		$(HOST_DIR)/bin/valac
> +		$(HOST_DIR)/bin/valac \
> +		$(HOST_DIR)/bin/vapigen
>  endef
>  HOST_VALA_POST_INSTALL_HOOKS += HOST_VALA_INSTALL_WRAPPER
>  
> -- 
> 2.25.1
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
