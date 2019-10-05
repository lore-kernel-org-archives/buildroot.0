From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 5 Oct 2019 18:06:31 +0200
Subject: [Buildroot] [PATCH 0/6] Cargo virtual and Rust 1.38.0
In-Reply-To: <e6d594bc-f2e1-fb71-a2c4-5e88a4a05d28@mind.be>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
 <e6d594bc-f2e1-fb71-a2c4-5e88a4a05d28@mind.be>
Message-ID: <20191005160400.GA10008@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 2019-09-29 21:22, Arnout Vandecappelle wrote:
>
>
> On 29/09/2019 19:16, Eric Le Bihan wrote:
> > Cargo source code is not provided anymore as a separate tarball but is now
> > built along with the Rust compiler.
> >
> > This patch series converts cargo to a virtual package and declare cargo-bin
> > and rust are providers. Versions for each package are also bumped to latest
> > ones.
>
>  Why do we need the virtual package? I would think that cargo just becomes a
> sub-option of rust. Or, given how cargo and rust really go hand in hand, we
> could just remove the cargo package entirely and always build cargo as part of
> rust. For host packages, we don't care about size (too much), the only possible
> issue is build time. But I expect building rust with cargo isn't going to be
> that much longer.

Rust needs a Rust compiler and Cargo to build. So there are some
packages providing the pre-built binaries (rust-bin and cargo-bin). When
Cargo was available as a standalone package, the user could choose to
either:

a) select rust-bin and build cargo (using cargo-bin).
b) select to build rust and cargo, using rust-bin and cargo-bin.

Now that Cargo is provided and built along with the Rust compiler,
option a) is not possible anymore, unless cargo-bin is updated to be
also installable and not only used as an intermediate tool. In that case
we have two packages providing the same program (rust and cargo-bin),
hence the idea of introducing the virtual package for Cargo.

But it sure may be overkill and having just a sub-option might do the
trick. Would adding a sub-option to Rust which behaves as follows be
suitable?

- if rust-bin is selected, then install Cargo from cargo-bin
- if rust is selected, build Cargo along with the compiler using
  rust-bin and cargo-bin and install it.

> > Eric Le Bihan (6):
> >   package/cargo: convert to virtual package
> >   package/cargo-bin: declare as cargo provider
> >   package/rust: declare as cargo provider
>
>  You can't do this until the version has been bumped, because in the current
> version (AFAIU) rust doesn't have the cargo sources yet.
>
>  In other words, it has to go in the same patch that bumps rust.

Duly noted.

Thanks for the review.

Regards,

--
ELB
