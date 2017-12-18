From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 18 Dec 2017 11:25:11 +0100 (CET)
Subject: [Buildroot] [PATCH v8 0/9] Add support for the Rust programming
 language
In-Reply-To: <20171218075439.7d3c37c8@windsurf>
Message-ID: <706201859.95242518.1513592711039.JavaMail.root@zimbra32-e6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

> On Sun, 17 Dec 2017 18:57:59 +0100, Eric Le Bihan wrote:
> 
> > Eric Le Bihan (9):
> >   rustc: new virtual package
> >   rust-bin: new package
> >   cargo-bin: new package
> >   rust: new package
> 
> This patch didn't make it to the list, because it is too large (2.48
> MB). Do we have another option than carrying this use patch in
> Buildroot ?

The patch which adds the package to build Rust from source provides a 
patch to fix a problem involving files ending with *.orig.

As the Rust compiler is built using Cargo, the tarball contains vendored
versions of the crates (e.g. src/vendor/backtrace-sys). Each crate 
contains a file named Cargo.toml.orig. An associated file named
.cargo-checksum.json will contain a checksum for Cargo.toml.orig (and
the other source files).

But support/scripts/apply-patches.sh will delete the Cargo.toml.orig 
files. This will cause the build to fail, as Cargo will not be able to 
find the file and verify the checksum.

So the patch included in the rust package removes all Cargo.toml.orig 
entries from the affected .cargo-checksum.json. As these files list all
the source files, this results in a huge patch.

Besides, as these are non-indented JSON files, some are one-lined and 
thus the 998 characters limit enforced by git-send-email is exceeded.

So, if there a way to stop support/scripts/apply-patches.sh from pruning
Cargo.toml.orig files, so this patch can be dropped?

Regards,

--
ELB
