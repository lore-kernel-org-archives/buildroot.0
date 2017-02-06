From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 6 Feb 2017 21:40:58 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 06/02/2017 19:02, Yann E. MORIN wrote:
> This script helps in testing that a pacakge builds fine on a wide range
> of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> [yann.morin.1998 at free.fr:
>  - completely rewrite the script from Thomas, with help from Luca
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>

I like very much this script and it already works very well. I have
several remarks below, but only one or two are really relevant. But I'd
definitely prefer to see it on master ASAP (i.e. before 2017.02-rc1) and
improve it later.

> diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
> new file mode 100755
> index 0000000..40b373e
> --- /dev/null
> +++ b/support/scripts/test-pkg
> @@ -0,0 +1,158 @@
[...]
> +    # Extract the toolchains names

I think the correct wording is "toolchain names".

> +    toolchains=( $( curl -s "${TOOLCHAINS_BASE_URL}/toolchain-configs.csv" \
> +                    |sed -r -e 's/,.*//; s:.*/(.*)\.config:\1:; /internal/d;'
> +                  )
> +               )

Detecting internal toolchains from the filename alone seems a bit
fragile. The check would be more robust if we at least fetched the
toolchain config and grepped for "BR2_TOOLCHAIN_EXTERNAL=y" there. Of
course it would make the script more complex, and I'm OK if this is done
in a later step.

> +build_one() {
> +    local dir="${1}"
> +    local tc="${2}"
> +    local cfg="${3}"
> +    local pkg="${4}"
> +    local line
> +
> +    printf "%40s: " "${tc}"
> +
> +    dir="${dir}/${tc}"

Minor nit: why not simply doing in the preamble:

    local tc="${2}"
    local dir="${1}/${tc}"

> +    printf ", olddefconfig"
> +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> +        printf ": FAILED\n"
> +        return
> +    fi
> +    while read line; do
> +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then

I suggest removing the redirects and using 'grep -q' here.

> +    printf ", source"
> +    if ! make O=${dir} source >> ${dir}/logfile 2>&1; then
> +        printf ": FAILED\n"
> +        return
> +    fi

Splitting the source step from the build step is nice since it clearly
separated download-related issues (wrong URL, network down...) from
build errors.

But as discussed IRL it also means we download the ACTUAL_SOURCE files,
which means hundreds of megabytes with external toolchains. Possible
solutions:

 * remove the "make source" step and let "make ${pkg}" download only the
   sources that are really needed for building
 * remove the "make source" step as above, but only if ${pkg} is empty
 * add a "source-only-filed-needed-for-build" :) target and use that

> +help() {
> +    cat <<_EOF_
> +${my_name}: test that a package builds with various toolchains and archs
> +
> +${my_name} will test-build a package (as specified in a .config snippet)
> +against various toolchains on different architectures.
> +
> +The list of toolchains is retrieved from Buidlroot autobuilders.

Buidlroot -> Buildroot

Also why not appending "available at ${TOOLCHAINS_BASE_URL}"?

> +In case failures are noticed, you have the opportunity to fix the issue
> +and relaunch the test.
> +
> +Options
> +
> +    -h, --help
> +        Print this help.
> +
> +    -c CFG, --config-snippet CFG
> +        Use the CFG file as the source for the config snippet. This file
> +        should contain all the config options required to build a package.
> +
> +    -d DIR, --build-dir DIR
> +        Do the builds in directory DIR, one sub-dir per toolchain.
> +
> +    -p PKG, --package PKG
> +        Test-build the package PKG.

Add: 'if not specified, runs "make" without a target'

-- 
Luca
