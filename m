From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 19:59:03 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump to 1.13.6
In-Reply-To: <20200110091749.6bdc279c@windsurf>
References: <20200110044551.1912203-1-christian@paral.in>
 <20200110091749.6bdc279c@windsurf>
Message-ID: <CA+h8R2q7wghq5vkpePxFZ48ZJ7D_Z7DEC1g-+yiBxJ9eA21+PA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Jan 10, 2020 at 12:17 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Since you're bumping Go, I was wondering what is the status of the "Go
> module" support, that you started a while ago ? This was not a simple
> topic, but I think this is something we can to get into Buildroot at
> some point.

It's less complex than you might think. Simply put: Go code is
organized into "packages." A package might be identified as
"github.com/urfave/cli" for example. Today, projects in Buildroot have
all code dependencies included with them under a "vendor" directory.
Buildroot creates a directory called "gopath" and symlinks the code
into the correct root import path within this "gopath" directory.

With Go modules, the compiler builds a virtual mapping of paths to
package identifiers, rather than relying on having the package
identifiers as paths on the filesystem.

In practice, this means that the patch is compatible with existing
code. The only difference is that we no longer need to create the
"gopath" directory.

The patch series is here: https://github.com/paralin/buildroot/tree/go-module

This particular version of the series uses the "extract" step to
download code dependencies to vendor/ if the vendor/ directory does
not exist. This should be moved into some sort of a extra part of the
download step. This way, vendor/ as downloaded by the Go tool when
running the "go mod vendor" command would be included in the source
archive.

I am going to submit a version of the series which assumes vendor/ is
always there (as is the case currently) and simply introduces the
change of removing the gopath symlink step. This will be a good
conservative first step.

Best regards,
Christian
