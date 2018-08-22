From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Aug 2018 13:04:15 +0300
Subject: [Buildroot] [PATCH] package/brltty: fix cross-compilation
In-Reply-To: <20180822082832.7497-1-yann.morin.1998@free.fr>
References: <20180822082832.7497-1-yann.morin.1998@free.fr>
Message-ID: <20180822100415.dl7h3xvaahwtngut@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Aug 22, 2018 at 10:28:32AM +0200, Yann E. MORIN wrote:
> brltty has a very inventive buildsystem, where it internall runs
> ./configure for the build machine In doing so, it generates a list
> of make variables to define what the build machine supports, like
> it does for the target.
> 
> However, the build variables are generated with a convoluted sed
> script that scans the target list, and appends _FOR_BUILD to each
> target variables. Then, both lists are included from the Makefile,
> on the assumption that the build variables will not clash with the
> target variables.
> 
> Where it gets interesting, is that that sed script considers the
> variables names to match '[A-Za-z][A-Za-z0-9_]*'
> 
> And there we see why ATSPI2_PACKAGE does not match: it contains a
> digit.
> 
> So, some build variables will inevitably override target ones.
> 
> Fix that by simply expanding the matching regexp to allow digits
> in variable names.

Thanks for fixing that.

Do you have any idea why it only fails on specific (older?) hosts? Does it 
depend on the sed version?

baruch

> Fixes:
>     http://autobuild.buildroot.org/results/a37/a37782b3cfc1a96cc129db8fade20a36a7b2d470/
>     http://autobuild.buildroot.org/results/97e/97edc6a47d2140968e84b409cdc960604e5896f2/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Mario Lang <mlang@blind.guru>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0004-buildsys-fix-cross-compilation.patch      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/brltty/0004-buildsys-fix-cross-compilation.patch
> 
> diff --git a/package/brltty/0004-buildsys-fix-cross-compilation.patch b/package/brltty/0004-buildsys-fix-cross-compilation.patch
> new file mode 100644
> index 0000000000..9a10d46414
> --- /dev/null
> +++ b/package/brltty/0004-buildsys-fix-cross-compilation.patch
> @@ -0,0 +1,41 @@
> +From 088666535a045dae71bd2fcc6b3a1553023106ce Mon Sep 17 00:00:00 2001
> +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +Date: Wed, 22 Aug 2018 10:10:19 +0200
> +Subject: [PATCH] buildsys: fix cross-compilation
> +
> +Some identifiers for includes and libs paths may contain digit, e.g.
> +X11_PACKAGE or ATSPI2_PACKAGE or GLIB2_PACKAGE...
> +
> +Also detect those identifiers when doing cros-compilation, so that the
> +_FOR_BUILD variants are really created and do not clash with the target
> +variants.
> +
> +Fixes:
> +    http://autobuild.buildroot.org/results/a37/a37782b3cfc1a96cc129db8fade20a36a7b2d470/build-end.log
> +    http://autobuild.buildroot.org/results/97e/97edc6a47d2140968e84b409cdc960604e5896f2/build-end.log
> +    [...]
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +---
> +Upstram status: submitted
> +https://github.com/brltty/brltty/pull/142
> +---
> + mk4build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mk4build b/mk4build
> +index db90c86a9..551283825 100755
> +--- a/mk4build
> ++++ b/mk4build
> +@@ -112,7 +112,7 @@ fi
> + 
> + sedScript="${outputName}.${sedExtension}"
> + sed -n -e '
> +-s/^ *\([A-Za-z][A-Za-z_]*\) *=.*$/\1/
> ++s/^ *\([A-Za-z][A-Za-z0-9_]*\) *=.*$/\1/
> + t found
> + d
> + :found

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
