From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2020 10:57:59 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <7d2556b9-fd58-68f6-09d3-fbc9f6a041ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/08/2020 23:32, Christian Stewart wrote:
> -# We pass an empty GOBIN, otherwise "go install: cannot install
> -# cross-compiled binaries when GOBIN is set"
> -GO_COMMON_ENV = \
> -	PATH=$(BR_PATH) \
> -	GOBIN= \
> -	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
> -
> -GO_TARGET_ENV = \
> -	$(HOST_GO_TARGET_ENV) \
> -	$(GO_COMMON_ENV)
> -
> -GO_HOST_ENV = \
> -	CGO_CFLAGS="$(HOST_CFLAGS)" \
> -	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
> -	$(GO_COMMON_ENV)
> +# Used when compiling host packages.
> +GO_HOST_ENV = $(HOST_GO_HOST_ENV)

 Small but important comment: it's not good to use variables from a specific
package in the package infrastructure. It happens to work because those
variables are not used in any condition or immediately-expanded variable, but
it's fragile.

 Instead, it should be reversed (like it was originally): the variable should be
set in the infrastructure file and use in go.mk.

> +
> +# Used when compiling target packages.
> +GO_TARGET_ENV =	$(HOST_GO_TARGET_ENV)

 Same here of course.

 Regards,
 Arnout
