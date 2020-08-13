From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:45:01 +0200
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200813234501.138cc5ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

I think this sort of series would greatly benefit from having a
detailed cover letter. I believe one of the reason why this series has
been stalled for so much time is because none of the Buildroot
maintainers are very familiar with the overall Go ecosystem. So in some
sense, you need to educate us: explain how it was working before, what
are the changes, what are the possible solutions, which one you have
chosen and why, etc.

That would _tremendously_ help to move forward with this series, which
we really need to get merged soon.

Thanks!

Thomas

On Thu, 13 Aug 2020 14:32:14 -0700
Christian Stewart <christian@paral.in> wrote:

> The Go compiler needs to know the "import path" to the root of package source
> repositories. Previously, this was done by creating a fake _gopath in the build
> directory and symlinking the package source into that path.
> 
> Go has deprecated the GOPATH mechanism in favor of a new approach - Modules -
> which specifies the root import path (and dependencies) in a "go.mod" file.
> 
> This commit moves Buildroot to use the new go.mod approach. Both host and target
> Go packages compile correctly with small tweaks adjusting the build target
> specifier.
> 
> Note: the Go module system will NOT download sources from the Internet due to
> GOPROXY=off and -mod=vendor. All Buildroot packages currently have "vendor"
> directories included with dependencies' source code.
> 
> The environment variables passed to Go during host and target package
> compilation have been fixed to correctly pass CC, CXX, CFLAGS, and so on.
> 
> Reference: https://github.com/golang/go/wiki/Modules
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> v2 -> v3:
> 
>  - cjs: cleaned up spelling and moved extract hook to configure step
>  - cjs: applied fixes from vincent fazio related to host packages
> 
> v3 -> v4:
> 
>  - cjs: clean up HOST and TARGET variables passed to Go
>  - cjs: fix all CXXflags, cgo env vars to be consistent/correct
>  - cjs: document / explain the difference from GOPATH
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/go/go.mk      | 55 +++++++++++++++++++++++++--------
>  package/pkg-golang.mk | 71 +++++++++++++++++++++----------------------
>  2 files changed, 76 insertions(+), 50 deletions(-)


Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
