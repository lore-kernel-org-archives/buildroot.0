From: Luca Ceresoli <lucaceresoli77@gmail.com>
Date: Tue, 7 Feb 2017 16:29:48 +0100
Subject: [Buildroot] [PATCH 2/4] support/test-pkg: store lines missing
 from resulting configuraiton
In-Reply-To: <bb9f2d38d80a6d8268a45aa6f6619b0ebfde7573.1486475561.git.yann.morin.1998@free.fr>
References: <cover.1486475561.git.yann.morin.1998@free.fr>
 <bb9f2d38d80a6d8268a45aa6f6619b0ebfde7573.1486475561.git.yann.morin.1998@free.fr>
Message-ID: <eb3069fc-5d3f-6de9-e96a-607367214483@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/02/2017 14:52, Yann E. MORIN wrote:
> When a build is skipped, store the lines from the config snippet, that
> are missing in the resulting configuration, in a fie in the build

fie -> file

> directory, for the user to inspect.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  support/scripts/test-pkg | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> index daebe62..67f73b3 100755
> --- a/support/scripts/test-pkg
> +++ b/support/scripts/test-pkg
> @@ -60,7 +60,8 @@ build_one() {
>      local toolchain="${2}"
>      local cfg="${3}"
>      local pkg="${4}"
> -    local line
> +    local line skip
> +    local -a missing_lines
>  
>      printf "%40s: " "${toolchain}"
>  
> @@ -90,12 +91,20 @@ build_one() {
>      # or not set) in the actual .config; if one of them is not, it means
>      # some dependency from the toolchain or arch is not available, in
>      # which case this config is untestable and we skip it.
> +    skip=false
>      while read line; do
>          if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
> -            printf ", SKIPPED\n"
> -            return
> +            missing_lines+=( "${line}" )
> +            skip=true
>          fi
>      done <"${cfg}"
> +    if ${skip}; then
> +        for line in "${missing_lines[@]}"; do
> +            printf "%s\n" "${line}"
> +        done >"${dir}/missing.config"
> +        printf ", SKIPPED\n"
> +        return
> +    fi

Nice feature, but the array-based implementation seems a more complex
than needed.

What about:

+    skip=false
     rm -f "${dir}/missing.config"
     while read line; do
         if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
-            printf ", SKIPPED\n"
-            return
+            echo "${line}" >>"${dir}/missing.config"
+            skip=true
         fi
     done <"${cfg}"
+    if ${skip}; then
+        printf ", SKIPPED\n"
+        return
+    fi

This is more concise, does not use arrays (so it's easier to understand
to shell newbies). It also has the effect of removing the missing.config
file@the next iteration, so you won't find it there when the config
step succeeded.

-- 
Luca
