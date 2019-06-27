From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 27 Jun 2019 23:59:46 +0200
Subject: [Buildroot] [PATCH] This upstream patch fixes chromium compile
 issues where standard includes are added that break compilation.
In-Reply-To: <1561561447-14333-1-git-send-email-nford@westpond.com>
References: <1561561447-14333-1-git-send-email-nford@westpond.com>
Message-ID: <1d1ac48e-9939-cada-ee37-abaa814b6c7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Nathan,

 Thanks for this patch.

 The subject of you commit message isn't very good. It should contain the
package name and it should be a bit shorter, e.g.

package/qt5webengine: add upstream chromium patch to fix include path

On 26/06/2019 17:04, Nathan Ford wrote:
> See the upstream commit for more detail:
>   https://chromium.googlesource.com/chromium/src.git/+/a8c8396fd20d98666d517c45b358c63736e345ef
> 
> Signed-off-by: Nathan Ford <nford@westpond.com>
> ---
>  .../5.12.2/0001-fix_compile_regression.patch         | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch
> 
> diff --git a/package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch b/package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch
> new file mode 100644
> index 0000000..974e8c0
> --- /dev/null
> +++ b/package/qt5/qt5webengine/5.12.2/0001-fix_compile_regression.patch
> @@ -0,0 +1,20 @@
> +--- a/src/3rdparty/chromium/build/config/linux/pkg_config.gni	2019-06-06 08:53:17.000000000 -0400
> ++++ b/src/3rdparty/chromium/build/config/linux/pkg_config.gni	2019-05-23 08:39:34.000000000 -0400

 The patch should be git formatted since upstream is git-formatted. If
definitely needs a complete description - you can just take the upstream one. It
should also have your Signed-off-by. This is a short way for you to
assert that you are entitled to contribute the patch under the upstream license.
 See  http://elinux.org/Developer_Certificate_Of_Origin for more details.


> +@@ -103,11 +103,15 @@
> +     pkgresult = exec_script(pkg_config_script, args, "value")
> +     cflags = pkgresult[1]
> + 
> +-    # We want the system include paths to use -isystem instead of -I to suppress
> +-    # warnings in those headers.
> +     foreach(include, pkgresult[0]) {
> ++      if (use_sysroot) {
> ++        # We want the system include paths to use -isystem instead of -I to
> ++        # suppress warnings in those headers.

 I don't understand how this patch can change anything... I would expect
use_sysroot to be true, since we do have a sysroot...

 That said, if this patch fixes things (and BTW it has been included upstream in
qt5webengine 5.13) we should probably just apply it.

 Regards,
 Arnout

> +       include_relativized = rebase_path(include, root_build_dir)
> +       cflags += [ "-isystem$include_relativized" ]
> ++      } else {
> ++        cflags += [ "-I$include" ]
> ++      }
> +     }
> + 
> +     if (!defined(invoker.ignore_libs) || !invoker.ignore_libs) {
> 
