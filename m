From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 15 Sep 2020 16:05:37 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/meson: use specific BR
 variables for cross-compilation.conf
In-Reply-To: <20200915100546.806157-2-nolange79@gmail.com>
References: <20200915100546.806157-1-nolange79@gmail.com>
 <20200915100546.806157-2-nolange79@gmail.com>
Message-ID: <e03b2581-ce33-25a5-2c35-5145d4f0dd1a@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/09/2020 12:05, Norbert Lange wrote:
> dont depend on specific names of compiler tools, but use existing
> Buildroot variables.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/meson/cross-compilation.conf.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> index e9344e2b2f..67c5da8156 100644
> --- a/package/meson/cross-compilation.conf.in
> +++ b/package/meson/cross-compilation.conf.in
> @@ -4,11 +4,11 @@
>  # - Buildroot's 'target' is Meson's 'host'
>  
>  [binaries]
> -c = '@TARGET_CROSS at gcc'
> -cpp = '@TARGET_CROSS at g++'
> -ar = '@TARGET_CROSS at ar'
> -strip = '@TARGET_CROSS at strip'
> -pkgconfig = '@HOST_DIR@/bin/pkgconf'
> +c = '@TARGET_CC@'
> +cpp = '@TARGET_CXX@'
> +ar = '@TARGET_AR@'
> +strip = '@TARGET_STRIP@'
> +pkgconfig = '@PKG_CONFIG_HOST_BINARY@'
>  g-ir-compiler = '@STAGING_DIR@/usr/bin/g-ir-compiler'
>  g-ir-scanner = '@STAGING_DIR@/usr/bin/g-ir-scanner'

This changes host/bin/pkgconf to host/bin/pkg-config, but that shouldn't
be a problem, given meson only uses this pkgconfig to find target
packages and not host packages (for that meson would look it up in a
native-file instead of a cross-file).

Also @PKG_CONFIG_HOST_BINARY@ won't be replaced if patch 3 isn't
applied, so this isn't bisectable. Maybe it must be merged with patch 3 ?
