From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:59:21 +0100
Subject: [Buildroot] [PATCH 3/3] .gitlab-ci.yml: add trigger per job
In-Reply-To: <20181028235839.22472-4-ricardo.martincoski@gmail.com>
References: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
 <20181028235839.22472-4-ricardo.martincoski@gmail.com>
Message-ID: <20181209215921.3a29dc23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Oct 2018 20:58:39 -0300, Ricardo Martincoski wrote:

> diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> index d824f669b5..9efa775f88 100755
> --- a/support/scripts/generate-gitlab-ci-yml
> +++ b/support/scripts/generate-gitlab-ci-yml
> @@ -7,14 +7,31 @@ output="${2}"
>  
>  cp "${input}" "${output}"
>  
> +d_only_in=$(
> +    awk '/^\.defconfig:/{x=1;next}/^[^ ]/{x=0}x' "${input}" \
> +        | awk '/^    only/{x=1;next}/^    [^ ]/{x=0}x'
> +)
> +d_only=$( \
> +    printf ":\n    <<: *defconfig\n    only:\n%s\n        - /-" "$d_only_in"
> +)
> +
>  (
>      cd configs
>      LC_ALL=C ls -1 *_defconfig
>  ) \
> -    | sed 's/$/: *defconfig/' \
> +    | awk -v o="$d_only" '{i=$0; gsub(/\./,"\\.",i); print $0 o i "$/"}' \
>      >> "${output}"  
>  
> +r_only_in=$(
> +    awk '/^\.runtime_test:/{x=1;next}/^[^ ]/{x=0}x' "${input}" \
> +        | awk '/^    only/{x=1;next}/^    [^ ]/{x=0}x'
> +)
> +r_only=$(
> +    printf ":\n    <<: *runtime_test\n    only:\n%s\n        - /-" "$r_only_in"
> +)
> +
>  ./support/testing/run-tests -l 2>&1 \
> -    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' \
> +    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
>      | LC_ALL=C sort \
> +    | awk -v o="$r_only" '{i=$0; gsub(/\./,"\\.",i); print $0 o i "$/"}' \
>      >> "${output}"  

I'm very confused by all this awk sorcery, and looking at the output, I
wonder if something simpler like this wouldn't be better:

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 431911d370..110de0b207 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -10,8 +10,29 @@ cat "${input}"
     cd configs
     LC_ALL=C ls -1 *_defconfig
 ) \
-    | sed 's/$/: *defconfig/'
+    | while read defconfig; do
+       cat <<EOF
+${defconfig}:
+    <<: *defconfig
+    only:
+        - triggers
+        - tags
+        - /-defconfigs\$/
+        - /-${defconfig}\$/
+EOF
+       done
 
 ./support/testing/run-tests -l 2>&1 \
-    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: *runtime_test/' \
-    | LC_ALL=C sort
+    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1/' \
+    | LC_ALL=C sort \
+    | while read runtest; do
+       cat <<EOF
+${runtest}:
+    <<: *runtime_test
+    only:
+        - triggers
+        - tags
+        - /-runtime-tests\$/
+        - /-${runtest//./\\.}\$/
+EOF
+done

This produces an output that is exactly identical to the one done by
your awk magic, and I personally find this shell based implementation a
lot simpler and easier to read. What do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
