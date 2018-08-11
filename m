From: Cam Hutchison <camh@xdna.net>
Date: Sun, 12 Aug 2018 08:23:36 +1000
Subject: [Buildroot] pkg-golang: host package not supported
In-Reply-To: <20180810140056.5cf7d9ed@windsurf>
References: <CADHdJwDuaeDU_G0ePRPRrWw+3Vo4W0mSx45OuEDnqrgnsKgZQA@mail.gmail.com>
 <20180810140056.5cf7d9ed@windsurf>
Message-ID: <CABa6e=q8EfZv0C+E6B_AxwNDw65+u6-VfWDh0ck6eBHv+_nTug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10 August 2018 at 22:00, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello Mirza,
>
> On Fri, 10 Aug 2018 13:34:06 +0200, Mirza Krak wrote:
>
>> - Any hints on to add host-golang-package support?
>
> The first question is whether the existing host-go package installs a
> Go compiler that can do native compilation in addition to
> cross-compilation.

Yes, the existing host-go package will do native compilation. It is
just a matter of calling the compiler without the extra environment
variables set in HOST_GO_TARGET_ENV, specifically GOARCH, GOTOOLDIR,
CC and CXX. I'm not sure about GOROOT - the docs talk about that var
when un-archiving a binary installation of the toolchain anywhere but
/usr/local. I suspect a built-from-source toolchain will have the
correct GOROOT compiled in.

I have successfully compiled kubernetes under buildroot. It has a
pre-build generate-files step that builds a generator program for the
host and runs it. All I needed to do was put $(BR_PATH) at the head of
the path and ran the kubernetes generated_files step.

[I also posted the patch https://patchwork.ozlabs.org/patch/949972/ to
selectively set CGO_ENABLED, which I also needed to build kubernetes].
