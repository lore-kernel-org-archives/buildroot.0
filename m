From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 10 Oct 2012 02:54:55 +0400
Subject: [Buildroot] [PATCH] webkit: Fix build issue with gcc-4.6 and
	above
In-Reply-To: <1349385964-710-1-git-send-email-gvaxon@gmail.com>
References: <1349385964-710-1-git-send-email-gvaxon@gmail.com>
Message-ID: <5074AB3F.8050400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/05/2012 01:26 AM, Valentine Barshak wrote:
> This fixes the "Unknown parameter for tags/attrs" build error.
> Backported from commit 88e08c43d0200a4b06a298b7d2541965eebc0afe
>
> [PATCH] 2011-04-17  Thierry Reding
> <thierry.reding@avionic-design.de>
>
>    Reviewed by Adam Barth.
>
>    Fix build with GCC 4.6.
>
>    * dom/make_names.pl: Execute preprocessor without the -P option. The
>    preprocessor in GCC 4.6 eats empty lines, effectively breaking the
>    parsing performed by this script. Dropping the -P option when invoking
>    the preprocessor keeps the empty lines but as a side-effect also adds
>    additional linemarkers.
>
>    From the cpp manpage:
>
>      -P  Inhibit generation of linemarkers in the output from the
>          preprocessor. This might be useful when running the preprocessor
>          on something that is not C code, and will be sent to a program
>          which might be confused by the linemarkers.
>
>    The linemarkers are not problematic, however, because the script
>    properly handles them by ignoring all lines starting with a #.
>
> Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
> ---
>   package/webkit/webkit-fix-build-with-gcc-4-6.patch | 45 ++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 package/webkit/webkit-fix-build-with-gcc-4-6.patch
>
> diff --git a/package/webkit/webkit-fix-build-with-gcc-4-6.patch b/package/webkit/webkit-fix-build-with-gcc-4-6.patch
> new file mode 100644
> index 0000000..15f32d9
> --- /dev/null
> +++ b/package/webkit/webkit-fix-build-with-gcc-4-6.patch
> @@ -0,0 +1,45 @@
> +Backported from commit 88e08c43d0200a4b06a298b7d2541965eebc0afe:
> +Removed the ChangeLog part.
> +
> +From: "commit-queue at webkit.org"
> + <commit-queue@webkit.org@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
> +Date: Mon, 18 Apr 2011 06:53:23 +0000
> +Subject: [PATCH] 2011-04-17  Thierry Reding
> + <thierry.reding@avionic-design.de>
> +
> +        Reviewed by Adam Barth.
> +
> +        Fix build with GCC 4.6.
> +
> +        * dom/make_names.pl: Execute preprocessor without the -P option. The
> +        preprocessor in GCC 4.6 eats empty lines, effectively breaking the
> +        parsing performed by this script. Dropping the -P option when invoking
> +        the preprocessor keeps the empty lines but as a side-effect also adds
> +        additional linemarkers.
> +
> +        From the cpp manpage:
> +
> +          -P  Inhibit generation of linemarkers in the output from the
> +              preprocessor. This might be useful when running the preprocessor
> +              on something that is not C code, and will be sent to a program
> +              which might be confused by the linemarkers.
> +
> +        The linemarkers are not problematic, however, because the script
> +        properly handles them by ignoring all lines starting with a #.
> +
> +diff --git a/WebCore/dom/make_names.pl b/Source/WebCore/dom/make_names.pl
> +index 836137e..50386e0 100755
> +--- a/WebCore/dom/make_names.pl
> ++++ b/WebCore/dom/make_names.pl
> +@@ -54,7 +54,7 @@ if ($ENV{CC}) {
> + } else {
> +     $gccLocation = "/usr/bin/gcc";
> + }
> +-my $preprocessor = $gccLocation . " -E -P -x c++";
> ++my $preprocessor = $gccLocation . " -E -x c++";
> +
> + GetOptions(
> +     'tags=s' => \$tagsFile,
> +--
> +1.7.11.4
> +
>

Is this change OK?
I'm building on Fedora 17, using host gcc 4.7.2, and webkit doesn't 
build for me without this patch.

Thanks,
Val.
