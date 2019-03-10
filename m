From: Christian Stewart <christian@paral.in>
Date: Sun, 10 Mar 2019 01:23:36 -0800
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.12
In-Reply-To: <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
References: <20190226034554.24429-1-christian@paral.in>
 <20190226082449.040c7a2a@windsurf.home>
 <CA+h8R2qERZ1EjoyCiSCD32K8KM9m5OS_RdQ3iS59m9UmBUEwYw@mail.gmail.com>
 <CA+_SqVbzRuEgvansndPeSVqOeratEK5aGc+OGTc0e6j0FeJEkw@mail.gmail.com>
Message-ID: <87sgvvccbr.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>> On Mon, Feb 25, 2019 at 11:24 PM Thomas Petazzoni
>> <thomas.petazzoni@bootlin.com> wrote:
>> > I am puzzled by your statement "currently undefined". Is it undefined
>> > in the sense "it is not defined yet how Buildroot will handle this" or
>> > "it is not defined in Go yet how the module compilation will work in
>> > 1.13" ?
>
> It's less of a problem with module support for go now, because the
> dependencies are proxyed and verified before being delivered to the go
> download mechanism, so the reproducibility is somewhat guaranteed.
> The problem remains for breaking the buildroot internal download
> mechanism and for not a so probably clear licensing of downloaded
> modules (I have to investigate this).

I'm beginning to work on this now, would it be acceptable if Buildroot
adopted the following approach:

 - Remove GOPATH
 - Configure Go to download module files to buildroot/dl/go-modules
 - Set GOPROXY to allow network during download step only.
 - Require go.mod and go.sum hashes for all Go packages.
 - During extract step, run "go mod vendor" to extract code to build/
 - Use vendored building mode "-mod=vendor"

This should allow Go to download and verify modules correctly during the
download step, to the Buildroot dl/ tree, as well as disallowing network
fetching during the build phase, and extracting versioned module code to
the build directory.

Best,
Christian
