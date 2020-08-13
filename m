From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:52:20 -0700
Subject: [Buildroot] [PATCH v4 1/7] package/go: implement go modules
 integration
In-Reply-To: <20200813234501.138cc5ec@windsurf.home>
References: <20200813213220.260112-1-christian@paral.in>
 <20200813234501.138cc5ec@windsurf.home>
Message-ID: <CA+h8R2oznYQTfhveDz=p=caq8e_j1_jxZSCaq=xJsg_9fgPZ8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas,

On Thu, Aug 13, 2020 at 2:45 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> I think this sort of series would greatly benefit from having a
> detailed cover letter. I believe one of the reason why this series has
> been stalled for so much time is because none of the Buildroot
> maintainers are very familiar with the overall Go ecosystem. So in some
> sense, you need to educate us: explain how it was working before, what
> are the changes, what are the possible solutions, which one you have
> chosen and why, etc.

This makes sense, and I'm happy to explain.

I had hoped that the commit message in patch #1 would explain in a
succinct way.

It boils down to: Go has "packages" which have "import paths" such as
"my/package/is/here."

Previously Go would determine the path to a package by, approximately,
taking the absolute path to the package, and removing the $GOPATH
prefix.

For example: the path to "my/golang/package" would be
$GOPATH/src/my/golang/package

In Buildroot we extract the code into a build dir, not a GOPATH tree,
so we previously created a "fake gopath" to tell the Go compiler the
root import path to the code.

This change instead uses the go.mod file to determine the root import path.

Does this clear things up? Should I explain further in any part?

Best regards,
Christian

> On Thu, 13 Aug 2020 14:32:14 -0700
> Christian Stewart <christian@paral.in> wrote:
>
> > The Go compiler needs to know the "import path" to the root of package source
> > repositories. Previously, this was done by creating a fake _gopath in the build
> > directory and symlinking the package source into that path.
> >
> > Go has deprecated the GOPATH mechanism in favor of a new approach - Modules -
> > which specifies the root import path (and dependencies) in a "go.mod" file.
> >
> > This commit moves Buildroot to use the new go.mod approach. Both host and target
> > Go packages compile correctly with small tweaks adjusting the build target
> > specifier.
> >
> > Note: the Go module system will NOT download sources from the Internet due to
> > GOPROXY=off and -mod=vendor. All Buildroot packages currently have "vendor"
> > directories included with dependencies' source code.
> >
> > The environment variables passed to Go during host and target package
> > compilation have been fixed to correctly pass CC, CXX, CFLAGS, and so on.
> >
> > Reference: https://github.com/golang/go/wiki/Modules
