From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 21 Aug 2014 22:06:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/pkg-autotools: don't use
 config.site when cross-compiling
In-Reply-To: <1408402240-3126-1-git-send-email-romain.naour@openwide.fr>
References: <1408402240-3126-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAXf6LUe-9r7NhjqGNuRrM7SufuixOx8Z8LSnVcKhcrdy+-HSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Tue, Aug 19, 2014 at 12:50 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> On fedora 20 64bits host, the file /usr/share/config.site contains
> a fix for installing libraries into /lib/lib64 on 64bits systems
> that redefine libdir in the generated Makefile
>
> For safety, disable loading this file when running the configure
> script for the target and the host.
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/pkg-autotools.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index bcc648d..cdc31bf 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -126,6 +126,7 @@ define $(2)_CONFIGURE_CMDS
>         $$(TARGET_CONFIGURE_OPTS) \
>         $$(TARGET_CONFIGURE_ARGS) \
>         $$($$(PKG)_CONF_ENV) \
> +       CONFIG_SITE="no" \
>         ./configure \
>                 --target=$$(GNU_TARGET_NAME) \
>                 --host=$$(GNU_TARGET_NAME) \
> @@ -159,6 +160,7 @@ define $(2)_CONFIGURE_CMDS
>                 CFLAGS="$$(HOST_CFLAGS)" \
>                 LDFLAGS="$$(HOST_LDFLAGS)" \
>                  $$($$(PKG)_CONF_ENV) \
> +               CONFIG_SITE="no" \
>                 ./configure \
>                 --prefix="$$(HOST_DIR)/usr" \
>                 --sysconfdir="$$(HOST_DIR)/etc" \

The autoconf documentation does not specify 'no' as a magic value,
which means that the accidental presence of a file called 'no' would
pick up the file.
Wouldn't it be safer/cleaner to use CONFIG_SITE=/dev/null?
Note that I have not tested if this actually works, just a thought.

Best regards,
Thomas
