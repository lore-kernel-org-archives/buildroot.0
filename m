From: Christian Stewart <christian@paral.in>
Date: Sun, 07 Apr 2019 19:04:00 -0700
Subject: [Buildroot] [RFC PATCH v1 1/6] package/go: implement go modules
 integration
In-Reply-To: <20190407221726.130ca0fe@windsurf>
References: <20190317012142.10545-1-christian@paral.in>
 <20190407221726.130ca0fe@windsurf>
Message-ID: <87mul1fe27.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> While browsing through the list of pending patches, I found the
> following patch series related to Go and package management:
>
>   http://patchwork.ozlabs.org/project/buildroot/list/?series=68102
>
> The first patch in the series,
> http://patchwork.ozlabs.org/patch/976322/, introduces:
>
> +	  Glide is a tool for managing the _vendor_ directory within a Go
> +	  package. This feature, first introduced in Go 1.5, allows each
> +	  package to have a _vendor_ directory containing dependent
> +	  packages for the project. These vendor packages can be
> +	  installed by a tool (e.g. glide), similar to go get or they
> +	  can be vendored and distributed with the package.
>
> and it does a fair amount of changes in pkg-golang.mk.
>
> How does this fit (or not) with the changes you're proposing ?

Glide and other tools were built before Go modules were built. I do not
recommend integrating them into Buildroot. They are on the way out.

Please see the Go module wiki:

Specifically:

  go mod init automatically translates the required information from
  dep, glide, govendor, godep and 5 other pre-existing dependency
  managers into a go.mod file that produces the equivalent build.

The Go developers left it up to the community to develop a source
package manager, which is why Glide, Dep (gopkg.toml), vendor.conf, and
other formats exist. These formats are intended to be completely
replaced by go.mod.

My suggestion is to instead solve the Go module stuff, and then bring in
Glide-based packages with the glide.lock file converted into the Go
module format via the above automatic process.

Best regards,
Christian
