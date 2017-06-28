From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 28 Jun 2017 12:20:35 +0300
Subject: [Buildroot] [Patch v6 0/7] Add support for the Rust programming
 language
In-Reply-To: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
References: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170628122035.GB4971@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric (and everybody else :D),

I think it's great that there is work being done to bring Rust support to
Buildroot, because the languge has been gaining a lot of traction, and people
are now writing very interesting programs in it (I am a fan of RipGrep myself!
If you don't know it, take a look at: https://github.com/BurntSushi/ripgrep)

Recently I submitted v2 of a patch to add a LLVM package, and it would be
interesting to coordinate to make your Rust patchset use it, instead of the
Rust packaging providing its own copy of LLVM. You can see the patch in
Patchwork:

  https://patchwork.ozlabs.org/patch/777949/

I am addin some comments inline below, please keep reading...

On Sun, 25 Jun 2017 22:56:07 +0200, Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
> This series adds support for the Rust programming language by adding the
> following packages:
>
>  - rustc: a virtual package for the Rust compiler.
>  - rust-bin: provides a pre-built version of rustc.
>  - rust: builds rustc from source.
>
> Both providers are able to cross-compile code for ARM, MIPS, PowerPC and
> x86_64 architectures. Only the host variants are provided.

This means that the ?llvm? package should also provide a host variant of the
package. I did a quick try adding ?$(eval $(host-cmake-package))? plus a few
minor changs locally and LLVM built just fine.

Regarding the architecture backends to enable, I imagine we would want host
variant to have enabled *both* the host-native backend, and the target
backend. Example: When building for ARM in x86_64, we would enable the ?ARM?
and ?X86? LLVM backends for ?host-llvm?, and only ?ARM? for ?llvm? (the target
package). Would this be correct? Do you foresee any situation in which other
backends should be enabled for either the host or target variants? Should we
allow selecting from menuconfig which backends are compiled for the target
?llvm? package?

Last but not least: Right now my patch for adding LLVM only builds the main
libraries and binaries. Is this enough for Rust?

Rgeards,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170628/48dcd059/attachment.asc>
