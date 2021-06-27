From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jun 2021 18:09:21 +0200
Subject: [Buildroot] [PATCH 2/2 v4] utils/test-pkg: add gitlab-ci support
In-Reply-To: <ee94227bb16df76d7b866f09d243339fd2a619b0.1624802988.git.yann.morin.1998@free.fr>
References: <cover.1624802988.git.yann.morin.1998@free.fr>
 <ee94227bb16df76d7b866f09d243339fd2a619b0.1624802988.git.yann.morin.1998@free.fr>
Message-ID: <20210627180921.0451f43b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Jun 2021 16:09:59 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>   - the script that generates the pipline,  uses that list to create one
>     job for each test.
> 
>     This is triggered when the last commit log of the series (HEAD),
>     contains the 'test-pkg config:' directive all alone on its own line,
>     followed by a configuration fragment snippet to be used as input to
>     test-pkg.

Hm, this is not really trivial to use. It definitely needs some
documentation somewhere.

> +    # Retrieve defconfig for test-pkg from the git commit message (if any)
> +    echo "$CI_COMMIT_DESCRIPTION" \
> +        | sed -n '/^test-pkg config:$/,/^$/p' \
> +        > defconfig.frag

So what happens with this defconfig.frag file? It is left there after
the script has executed?

> +
> +    if [ -s defconfig.frag ]; then
> +        sed -i 1d defconfig.frag
> +        if [ ! -s defconfig.frag ]; then
> +            printf "Empty configuration fragment.\n" >&2; exit 1
> +        fi
> +        # Use --all since we expect the user having already pre-tested the new package
> +        # with the default subset of toolchains.
> +        do_testpkg=( $( ./utils/test-pkg \
> +                            --all --list-only \
> +                            --config-snippet defconfig.frag \
> +                            --build-dir br-test-pkg \

Same question about the br-test-pkg directory, it stays there after the
script has executed?

Shouldn't both of these be using a temporary directory?

Note: I am not sure I have understood how the .config files generated
by test-pkg make their way to the Gitlab builds, so perhaps I'm missing
something.


> +        (-l|--list-only)
> +            list_only=1; shift 1
> +            trace() { printf "${@}" >&2; }

I find "list-only" to be misleading, because it is not much more than
listing: it is generating the .config for each test configuration. So
what about --no-build, or --gen-config-only, or something like that?

To me --list-only, would really only list, i.e it wouldn't generate
anything.

> +    if [ -n "${list_file}" ]; then
> +        # Running in list-only implies keeping the build directories.
> +        keep=1
> +    fi

I'm not sure I like this semantic. Perhaps we should simply rely on the
user passing -k ? Especially since this feature is most likely only
going to be used by the generate-gitlab-ci-yml machinery ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
