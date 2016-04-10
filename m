From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Apr 2016 17:57:45 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <20160408224541.79e1ba4d@itchy>
References: <20160408224541.79e1ba4d@itchy>
Message-ID: <570A77F9.50506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/08/16 22:45, Eric Le Bihan wrote:
> Hi all!
>
> I've posted a series of articles about using the Rust programming
> language in a Buildroot environment [1].
>
> Rust [2] is a modern, compiled, programming language, oriented towards
> safety, memory control and concurrency. Its performances are comparable
> to C++.
>
> Rust's features make it a good candidate for writing programs for
> embedded systems.
>
> This series will hopefully lead to some patches for properly supporting
> Rust in Buildroot.
>
> As explained in one article [3], the Rust compiler is based on LLVM
> [4]. When configuring the build, the targeted architecture is given by
> its GNU triplet (e.g. "arm-buildroot-linux-gnueabihf"). By default, the
> compiler is built with support for x86, ARM and MIPS support
> (unfortunately, there is no option to narrow the selection). Then the
> Rust standard library is cross-compiled for the configured architecture.
>
> Support for the target is achieved by providing two files:
>
> - the target configuration file: a Makefile fragment where, among
>    others, the name of of the cross-compiler is given.
> - the target specification file: a JSON file describing the
>    architecture (CPU type, OS, etc).
>
> So, in the future patch series that will properly add support for Rust
> in Buildroot:
>
> 1. Would it be acceptable to provide a script to generate these files
> from the Buildroot configuration file?

  Obviously yes, we already do that kind of thing for some packages (e.g. cmake).

>
> 2. Would Python be a suitable language for this script? It is better
> suited for playing with complex structures and JSON than pure shell.

  We try to avoid requiring python for a normal build, and use it only for 
specific scripts at the moment (like graph-depends). So I think the answer is no 
here. Anyway, as far as I can see from [3], you don't really need a full json 
generator, it should be enough to do some sed magic on a template file.

  When you submit patches, it's probably a good idea to start with a minimal 
patch that e.g. gives rust a hard dependency on little-endian ARM v6, and add 
more features in subsequent patches. I expect it will be something difficult to 
review.

  Regards,
  Arnout

>
> Comments welcomed.
>
> [1] http://www.elebihan.com/categories/rust.html
> [2] https://rust-lang.org/
> [3] http://www.elebihan.com/posts/using-rust-with-buildroot-full-build.html
> [4] https://llvm.org/
>
> Best regards,
> --
> ELB
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
