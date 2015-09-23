From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 23 Sep 2015 20:33:32 +1200
Subject: [Buildroot] [PATCH] micropython: fix build for MIPS64 n32
In-Reply-To: <1442991402-36922-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1442991402-36922-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <CAFOYHZAbzDUqxfW46bFEjRLD-B5T7SqD+4oW55FYW0Szrxdm5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Sep 23, 2015 at 6:56 PM, Vicente Olivert Riera
<Vincent.Riera@imgtec.com> wrote:
> This patch applies an upstream patch to fix a compile error like this
> one:
>
> modffi.c: In function 'ffifunc_call':
> modffi.c:358:25: error: cast from pointer to integer of different size
> [-Werror=pointer-to-int-cast]
>              values[i] = (ffi_arg)a;
>
> This error can be highlighted when building micropython from MIPS64 n32
> because ffi_arg is 64-bit wide and the pointers on MIPS64 n32 are 32-bit
> wide, so it's trying to case an integer to a pointer (or vice versa) of
> a different size. We should cast first the pointer (or the integer) to a
> pointer sized integer (intptr_t) to fix that problem.
>
> This patch was merged upstream as a result of this pull request:
>
>   https://github.com/micropython/micropython/pull/1471
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/e22/e2253de3f96e9a53e75b4cecaf56c1df2950803f/
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/micropython/micropython.mk |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index f2ad5bf..b021988 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -10,6 +10,7 @@ MICROPYTHON_LICENSE = MIT
>  MICROPYTHON_LICENSE_FILES = LICENSE
>  MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
>  MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch
> +MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/587914169cc6ff7f0513bd14c42dcbb275bf77bd.patch

Does this need to be MICROPYTHON_PATCH += ? or is there something that
makes the assignment work.

>
>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
> --
> 1.7.1
>
