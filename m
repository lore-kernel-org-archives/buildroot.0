From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Aug 2020 09:08:00 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200831062335.1105977-1-christian@paral.in>
References: <20200831062335.1105977-1-christian@paral.in>
Message-ID: <20200831070800.GN14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2020-08-30 23:23 -0700, Christian Stewart spake thusly:
> NOTE: This patch is a RFC and is not intended for merging in its current state.
> It is a naiive implementation of the "go mod vendor" download step as a
> post-extract hook, for early testing and demonstration of the desired effect. I
> don't yet know what a final implementation might look like.

Thanks, that's a good starting point.

My proposal was that we introduce per-package managers download
backends, which would typically do something like the following
(pseudo-code):

    #!/usr/bin/env bash
    # This file is support/fownload/go

    # Parse options:
    actual_site_method="$(get_option '--actual-site-method')"

    # Call actual download helper:
    "${0%/*}/${actual_site_method}" "${@}" -o "${temp_tarball}"

    # Populate the vendor:
    tar xf "${temp_tarball}" -C "${temp_directory}"
    cd "${temp_directory}/${package_name_version}"
    go mod vendor
    cd ..
    tar czf "${final_tarball}" "${package_name_version}"

(of course, the details would be a bit more complex, and would require
that we pass the actual site method vi the download infra, but the idea
is there)

What's your opinion on this?

See also the following mails from Thomas, which contain copies of some
of the IRC discussions we had on the topic (about rust and cargo, but
that's the same topic):

    http://lists.busybox.net/pipermail/buildroot/2020-August/289895.html
    http://lists.busybox.net/pipermail/buildroot/2020-August/289894.html

> Add a new hook to POST_EXTRACT_HOOKS for Go packages which will create the
> "vendor" directory structure under $(@D)/vendor with Go package deps by running
> the "go mod vendor" command.
> 
> This will download dependency sources and use $GOPATH/pkg as a caching
> directory for lookups and downloads.

But that does the download at extract time, and we would like that we
still be able to do:

    $ make source
    # Unplug network
    $ make

Also, the hook is registered in the infra (we can't do otherwise), so it
means it would run after any hook registered by the package, while those
hooks may expect the package to be fully available (.e. fully vendored).

> Go specifies commit hashes OR version tags in go.mod, and lists source code
> checksums in go.sum. The Go module system has a robust security model for
> preventing MITM attacks or changed Git tags on dependencies through this
> checksumming and explicitly-specified versioning approach.

This is good, because supposedly that will allow us to generate
reproducible archives, and have hashes for them (in foo.hash)

Regards,
Yann E. MORIN.

> Reference: https://blog.golang.org/using-go-modules
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/pkg-golang.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 2d80e99619..88eb89a68e 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -98,6 +98,16 @@ endef
>  
>  $(2)_POST_EXTRACT_HOOKS += $(2)_APPLY_EXTRACT_GOMOD
>  
> +# WIP - download dependencies with the Go tool if vendor does not exist.
> +define $(2)_DOWNLOAD_GOMOD
> +	if [ ! -d $$(@D)/vendor ]; then \
> +		cd $$(@D); \
> +		go mod vendor; \
> +	fi
> +endef
> +
> +$(2)_POST_EXTRACT_HOOKS += $(2)_DOWNLOAD_GOMOD
> +
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
>  ifndef $(2)_BUILD_CMDS
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
