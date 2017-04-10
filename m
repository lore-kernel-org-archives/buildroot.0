From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 10 Apr 2017 21:02:45 +0200
Subject: [Buildroot] [Patch v4 3/3] rust: new package
In-Reply-To: <20170408100925.GC32154@itchy>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-4-eric.le.bihan.dev@free.fr>
 <1491549522.26127.8.camel@embedded.rocks> <20170408100925.GC32154@itchy>
Message-ID: <1491850965.4279.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, 2017-04-08 at 12:09 +0200, Eric Le Bihan wrote:
> Hi!
> 
> On 17-04-07 09:18:42, J?rg Krause wrote:
> > Hi Eric,
> > 
> > On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:
> > > This new package provides the compiler for the Rust programming
> > > language.
> > > 
> > > Currently, only the host variant is built.
> > > 
> > > The Rust compiler uses LLVM as its backend: a copy of LLVM source
> > > code
> > > is provided and CMake is used to build it. It is possible to use a
> > > pre-built external copy. When LLVM/clang will be available in
> > > Buildroot,
> > > it would be possible to benefit from this feature and thus decrease
> > > build time.
> > > 
> > > LLVM is configured to generate code for x86, ARM, PowerPC and MIPS
> > > architectures.
> > > 
> > > The Rust compiler uses Cargo as its build system and is written in
> > > Rust.
> > > Therefore this package depends on cargo-bootstrap and rust-bootstrap.
> > > 
> > > The internal build process is as follows:
> > > 
> > > ?1. rustc-stage0, provided by rust-bootstrap, is used to build
> > > ????rustc-stage1.
> > > ?2. rust-stage1 builds the final Rust compiler (rust-stage2)
> > > ????and the standard library for the host architecture.
> > > ?3. the standard library for the target architecture is built.
> > 
> > So, we are doing the following: fetch the predecessor rust version
> > 1.15.1 as binary to use it as stage0 compiler for building the latest
> > rust stable version 1.16.0. Why not just fetch the latest stable
> > version and install it into the host dir? The same goes with libstd and
> > cargo. I mean, we have to fetch some binaries anyway, so why do the
> > time-consuming build steps anyway? Shouldn't there be at least the
> > option just to fetch the latest stable version?
> > 
> 
> It is true that building the Rust compiler is time consuming. As stated
> in the comment, this can be decreased if LLVM was already available. But
> if LLVM itself is built from source and not fetched as binary from
> Internet, then the issue is still there.
> 
> Currently Buildroot only offers downloading binary versions of the C/C++
> cross-compilers. It does not take into account alternative C/C++
> cross-compilers like LLVM/Clang or compilers for new languages like
> Rust, D, or Haskell (though I do not know if Haskell is useful on
> embedded systems).

For now, we could use the host rustc package to fetch the latest stable
binary for the host architecture. Additionally, we could add the option
to build the Rust compiler within Buildroot. In my opinion, this option
only makes sense if the compiler can be configured meaningfully.

> So, would it help to have a "Programming Languages" section in
> menuconfig where you can select Rust (or any other language) and choose
> between a using a pre-built compiler or build it from source?

In my opinion it would make more sense to have a menu "Toolchains" with
the submenus "C/C++ Toolchain", "Rust Toolchain", ...

> And where shoud LLVM/clang be exposed?

I would put it into "C/C++ Toolchain" (if we had such a menu).

> Note: Building a cross-compiler for D can be done via a patch to GCC
> thanks to GDC [1], but IIRC cross-compiling libphobos, the standard
> library, is another matter.
> 
> [1] https://github.com/D-Programming-GDC/GDC/releases

J?rg
