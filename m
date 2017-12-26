From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 25 Dec 2017 22:16:49 -0600
Subject: [Buildroot] [PATCH] libostree: make sure libavahi-client is
 built
In-Reply-To: <20171221231932.31913-1-marcus.folkesson@gmail.com>
References: <20171221231932.31913-1-marcus.folkesson@gmail.com>
Message-ID: <CANQCQpafX_AGPwTKB3Hq5G7c0f_Zz1NmjDOG8Rby73J4N9Mr+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,

On Thu, Dec 21, 2017 at 5:19 PM, Marcus Folkesson
<marcus.folkesson@gmail.com> wrote:
> Avahi support also needs libavahi-client, which is built by avahi if avahi-daemon
> and dbus is selected.
>
> Fixes:
> http://autobuild.buildroot.net/results/1edfb60add17945eabc557e1dbfb08a0ba466df9/
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  package/libostree/libostree.mk | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
> index 612c284870..f0aeb8d72a 100644
> --- a/package/libostree/libostree.mk
> +++ b/package/libostree/libostree.mk
> @@ -27,9 +27,13 @@ else
>  LIBOSTREE_CONF_OPTS += --without-openssl
>  endif
>
> -ifeq ($(BR2_PACKAGE_AVAHI),y)
> +# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
> +# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
> +# option yet, use the avahi-daemon and dbus config symbols to check for
> +# libavahi-client.
> +ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
>  LIBOSTREE_CONF_OPTS += --with-avahi
> -LIBOSTREE_DEPENDENCIES += avahi
> +LIBOSTREE_DEPENDENCIES += avahi dbus

I patched the failing build and it now builds.

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

I've kicked off a validation using utils/test-pkg with the following
config and both of your libostree patches applied.
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_PACKAGE_LIBOSTREE=y
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_LIBFUSE=y
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_LIBGPGME=y
BR2_PACKAGE_XZ=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_DBUS=y

If anything pops up, I'll respond here tomorrow.

Matt
