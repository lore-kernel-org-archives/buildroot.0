From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Mar 2019 11:28:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <87sgvvccbr.fsf@paral.in>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
 <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
 <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
 <87sgvvccbr.fsf@paral.in>
Message-ID: <20190310102831.GC25009@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2019-03-10 01:23 -0800, Christian Stewart spake thusly:
> Angelo Compagnucci <angelo@amarulasolutions.com> writes:
> >> On Mon, Feb 25, 2019 at 11:24 PM Thomas Petazzoni
> >> <thomas.petazzoni@bootlin.com> wrote:
> >> > I am puzzled by your statement "currently undefined". Is it undefined
> >> > in the sense "it is not defined yet how Buildroot will handle this" or
> >> > "it is not defined in Go yet how the module compilation will work in
> >> > 1.13" ?
> >
> > It's less of a problem with module support for go now, because the
> > dependencies are proxyed and verified before being delivered to the go
> > download mechanism, so the reproducibility is somewhat guaranteed.
> > The problem remains for breaking the buildroot internal download
> > mechanism and for not a so probably clear licensing of downloaded
> > modules (I have to investigate this).
> 
> I'm beginning to work on this now, would it be acceptable if Buildroot
> adopted the following approach:
> 
>  - Remove GOPATH
>  - Configure Go to download module files to buildroot/dl/go-modules

How would you get the modules list and their URIs, when we are just
downloading? The package sources are not yet extracted.

>  - Set GOPROXY to allow network during download step only.
>  - Require go.mod and go.sum hashes for all Go packages.

Not sure what go.mod and go.sum are, but if you're suggesting that we
have hashes in foo.hash for all modules in package foo, that would be
nice, yes!

>  - During extract step, run "go mod vendor" to extract code to build/

... getting the modules from $(BR2_DL_DIR) instead of downloading them
that is?

>  - Use vendored building mode "-mod=vendor"
> 
> This should allow Go to download and verify modules correctly during the
> download step, to the Buildroot dl/ tree, as well as disallowing network
> fetching during the build phase, and extracting versioned module code to
> the build directory.

If that were possible, I would like that, yes. That'd be good!

However, I'd suggest that this extra module vendoring dance only occur
if the package has set a specific variable, like we do for git
submodules:

    FOO_GO_MODULES = YES

(I almost wrote GOO_MODULES ;-) )

That way, if a package does not explicitly request them, it would fail
at build time since they would not be available and would not be already
downloaded.

Of course, if we expect the majority of go packages to have modules,
that variable would be moot...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
