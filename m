From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 8 Oct 2014 21:39:38 +0200
Subject: [Buildroot] [PATCH v3] package/trinity: New package
In-Reply-To: <1412781125-11737-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1412781125-11737-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAHXCMM+an7ijdVvZGnxTndxauwdhivNjjmC6-7mdD4TYFPL0xQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincente,

On Wed, Oct 8, 2014 at 5:12 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> Adding the Trinity Linux System call fuzz tester.
>
> Fails to compile for uClibc because it tries to include 'execinfo.h'
> which is only available if uClibc has been built with
> UCLIBC_HAS_BACKTRACE=y (which it isn't by default). We disable this
> package for uClibc by now until upstream fixes this problem.
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/Config.in          |    1 +
>  package/trinity/Config.in  |   14 ++++++++++++++
>  package/trinity/trinity.mk |   31 +++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+), 0 deletions(-)
>  create mode 100644 package/trinity/Config.in
>  create mode 100644 package/trinity/trinity.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index ea89c96..3b570ee 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -89,6 +89,7 @@ endif
>         source "package/sysprof/Config.in"
>         source "package/tinymembench/Config.in"
>         source "package/trace-cmd/Config.in"
> +       source "package/trinity/Config.in"
>         source "package/valgrind/Config.in"
>         source "package/whetstone/Config.in"
>  endmenu
> diff --git a/package/trinity/Config.in b/package/trinity/Config.in
> new file mode 100644
> index 0000000..ea2c458
> --- /dev/null
> +++ b/package/trinity/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_TRINITY
> +       bool "trinity"
> +       # Fails to compile for uClibc because it tries to include 'execinfo.h'
> +       # which is only available if uClibc has been built with
> +       # UCLIBC_HAS_BACKTRACE=y (which it isn't by default). We disable this
> +       # package for uClibc by now until upstream fixes this problem.
> +       depends on !BR2_TOOLCHAIN_USES_UCLIBC
> +       help
> +         A Linux System call fuzz tester
> +
> +         http://codemonkey.org.uk/projects/trinity/
> +
> +comment "trinity is not supported for uClibc"
> +       depends on BR2_TOOLCHAIN_USES_UCLIBC

It looks like you can now bump the version to [1] and get rid of this
uclibc stuff ;-)

[1] https://github.com/kernelslacker/trinity/commit/1cc389fb22ca4a7447011a7a14bb526d44197255

Regards,

-- 
Samuel
