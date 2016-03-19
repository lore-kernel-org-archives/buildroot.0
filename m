From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 16:03:46 +0100
Subject: [Buildroot] [PATCH 09/16 v5] core/apply-patches: store full
 path of applied patches
In-Reply-To: <4752967e7f254170efc08e77530029c90f663d85.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <4752967e7f254170efc08e77530029c90f663d85.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319160346.50b52b19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 11 Mar 2016 18:49:22 +0100, Yann E. MORIN wrote:

> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 201278d..20a1552 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -63,8 +63,12 @@ find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print0 | \
>      xargs -0 -r rm -f
>  
>  function apply_patch {
> -    path=$1
> -    patch=$2
> +    path="${1%%/}"
> +    patch="${2}"
> +    case "${path}" in
> +        /*) ;;
> +        *)  path="$(pwd)/${path}";;
> +    esac

This seems unrelated to the patch in question, and is not explained
anywhere.

However, I have some more global concern about this approach. I really
dislike the idea that we rely on a helper script filling up a file,
that we later read from a completely different place in the package
infrastructure. It really feels like "let's dump my data there and
fetch it from here".

So here are other proposals:

 * The package infra already knows which patches should be applied
   (bundled patches, global patch dir, etc.), so it is technically able
   to get the list of patches. Yes it's a bit annoying because the
   logic to derive the list of patches is already inside the
   apply-patches script. But maybe it's because too much smart stuff is
   done in the apply-patch script without the package infrastructure
   being aware.

 * Alternatively, add an option to apply-patch.sh that will not apply
   the patches, but show the list of patches that would be applied.
   Like "apply-patch -l" for example. Then, when doing the legal-info,
   you simply call "apply-patch -l" to retrieve the list of patches
   that you need to copy.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
