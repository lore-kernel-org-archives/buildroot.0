From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 23 Mar 2020 11:04:34 -0700
Subject: [Buildroot] [PATCH v2 1/2] package/vala: install wrapper to
 vapigen
In-Reply-To: <20200323175813.3903868-1-aduskett@gmail.com>
References: <20200323175813.3903868-1-aduskett@gmail.com>
Message-ID: <CAFSsvmrbax_i7Z0w8AsLBVFTj8zNBhVK9Op6VHZx1hUm81Q-Kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

On Mon, Mar 23, 2020 at 10:58 AM <aduskett@gmail.com> wrote:
>
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
> ---
> Changes v1 -> v2:
>   - Add this patch to the series.
>
>  package/vala/vala.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/vala/vala.mk b/package/vala/vala.mk
> index b8a69f8c5e..d000393d71 100644
> --- a/package/vala/vala.mk
> +++ b/package/vala/vala.mk
> @@ -17,13 +17,15 @@ HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
>  HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
>  HOST_VALA_CONF_OPTS += --disable-valadoc
>
> -# We wrap vala & valac to point to the proper gir and vapi data dirs
> +# We wrap vala, valac and vapigen to point to the proper gir and vapi data dirs
>  # Otherwise we'll get host directory data which isn't enough
>  define HOST_VALA_INSTALL_WRAPPER
>         $(INSTALL) -D -m 0755 package/vala/vala-wrapper \
>                 $(HOST_DIR)/bin/vala
>         $(INSTALL) -D -m 0755 package/vala/vala-wrapper \
>                 $(HOST_DIR)/bin/valac
> +       $(INSTALL) -D -m 0755 package/vala/vala-wrapper \
> +               $(HOST_DIR)/bin/vapigen
>         $(SED) 's, at VALA_VERSION@,$(VALA_VERSION_MAJOR),' \
>                 $(HOST_DIR)/bin/vala \
>                 $(HOST_DIR)/bin/valac
I added vapigen to this line but didn't save the .mk file before
committing. If you want me to resend
a new patch with $(HOST_DIR)/bin/vapigen please let me know!

Adam
> --
> 2.25.1
>
