From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Jan 2017 22:21:31 +0100
Subject: [Buildroot] [PATCH 5/9] check-package: check *.patch files
In-Reply-To: <20161231032110.11573-6-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
 <20161231032110.11573-6-ricardo.martincoski@gmail.com>
Message-ID: <CAAXf6LUx4hv+PNKyfpOaqcptyKkfpEjKVEtipE4gSJLQYojLRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 31, 2016 at 4:21 AM, Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
> Warn when the name of the patch file does not start with number (apply
> order), see [1].
> Warn when the patch was generated using git format-patch without -N, see
> [2].
> Warn when the patch file has no SoB, see [3].
>
> [1] http://nightly.buildroot.org/#_providing_patches
> [2] http://patchwork.ozlabs.org/patch/704753/
> [3] http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches
>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>
> Notes:
>     $ time support/scripts/check-package $(find package -type f) >/dev/null 2>/dev/null
>
>     real        0m1.153s
>     user        0m1.096s
>     sys 0m0.056s
>
>     CHECK_APPLY_ORDER:
>      support/scripts/check-package --include-only check_apply_order \
>      $(find package -name '*.patch') 2>/dev/null | wc -l
>       4
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_apply_order -vv package/*/*)
>       package/package1/wrong-name.patch:0: use name <number>-<description>.patch (http://nightly.buildroot.org/#_providing_patches)
>       159 lines processed
>       1 warnings generated
>
>     CHECK_NUMBERED_SUBJECT:
>      support/scripts/check-package --include-only check_numbered_subject \
>      $(find package -name '*.patch') 2>/dev/null | wc -l
>       149
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_numbered_subject -vv package/*/*)
>       package/package1/0001-do-something.patch:4: generate your patches with 'git format-patch -N'
>       Subject: [PATCH 25/39] do something
>       159 lines processed
>       1 warnings generated
>
>     CHECK_SOB:
>      support/scripts/check-package --include-only check_sob \
>      $(find package -name '*.patch') 2>/dev/null | wc -l
>       143
>      (cd support/scripts/check-package-example && \
>      ../check-package --include-only check_sob -vv package/*/*)
>       package/package1/0001-do-something.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
>       package/package1/wrong-name.patch:0: missing Signed-off-by in the header (http://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
>       159 lines processed
>       2 warnings generated
>
>  support/scripts/checkpackagelib_patch.py | 43 ++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/support/scripts/checkpackagelib_patch.py b/support/scripts/checkpackagelib_patch.py
> index 0fb3685a7..f10dc31c4 100644
> --- a/support/scripts/checkpackagelib_patch.py
> +++ b/support/scripts/checkpackagelib_patch.py
> @@ -3,5 +3,48 @@
>  # functions don't need to check for things already checked by running
>  # "make package-dirclean package-patch".
>
> +import re
> +
>  # Notice: ignore 'imported but unused' from pyflakes for check functions.
>  from checkpackagelib import check_newline_at_eof
> +
> +
> +APPLY_ORDER = re.compile("/\d{1,4}-[^/]*$")
> +
> +
> +def check_apply_order(
> +        fname, args, lineno=0, text=None, start=False, end=False):
> +    if start and not APPLY_ORDER.search(fname):
> +        return ["{}:0: use name <number>-<description>.patch "
> +                "({}#_providing_patches)".format(fname, args.manual_url)]
> +
> +
> +NUMBERED_PATCH = re.compile("Subject:\s*\[PATCH\s*\d+/\d+\]")

Is this really a requirement? This numbering in the patch header is
unrelated to the number used in the filename. One can expect many
'PATCH 1/1' in the same package directory. I would leave out this
test.

/Thomas
