From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 8 Apr 2017 11:34:06 +0200
Subject: [Buildroot] [Patch v4 2/3] cargo-bootstrap: new package
In-Reply-To: <1491548799.26127.5.camel@embedded.rocks>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-3-eric.le.bihan.dev@free.fr>
 <1491548799.26127.5.camel@embedded.rocks>
Message-ID: <20170408093406.GB32154@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-04-07 09:06:39, J?rg Krause wrote:
> Hi Eric,
>
> On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:
> > This new package fetches a binary snapshot of Cargo, suitable for the
> > host, in order to bootstrap the Rust compiler and Cargo, the package
> > manager.
>
> Why not build it from source?

Cargo uses Cargo as its build system, so you need to have a working
version of Cargo on the host system to build a new version from the
source code.

To build the Rust compiler a binary snapshot is enough.

I'll send a patch to add a package for the real Cargo soon.

> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ---
> > ?DEVELOPERS???????????????????????????????????|??1 +
> > ?package/cargo-bootstrap/cargo-bootstrap.hash |??3 +++
> > ?package/cargo-bootstrap/cargo-bootstrap.mk???| 14 ++++++++++++++
> > ?3 files changed, 18 insertions(+)
> > ?create mode 100644 package/cargo-bootstrap/cargo-bootstrap.hash
> > ?create mode 100644 package/cargo-bootstrap/cargo-bootstrap.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 863d5aa..1fed408 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -442,6 +442,7 @@ F:	package/xxhash/
> > ?
> > ?N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
> > ?F:	package/adwaita-icon-theme/
> > +F:	package/cargo-bootstrap
> > ?F:	package/darkhttpd/
> > ?F:	package/eudev/
> > ?F:	package/execline/
> > diff --git a/package/cargo-bootstrap/cargo-bootstrap.hash
> > b/package/cargo-bootstrap/cargo-bootstrap.hash
> > new file mode 100644
> > index 0000000..b193c6f
> > --- /dev/null
> > +++ b/package/cargo-bootstrap/cargo-bootstrap.hash
> > @@ -0,0 +1,3 @@
> > +# Locally generated
> > +sha256
> > 0655713cacab054e8e5a33e742081eebec8531a8c77d28a4294e6496123e8ab1??car
> > go-nightly-x86_64-unknown-linux-gnu.tar.gz
> > +sha256
> > f20adfdcd6fb61c1252034e998998ec349c8a6b05c0320e47a539b0f6d1c76fa??car
> > go-nightly-i686-unknown-linux-gnu.tar.gz
> > diff --git a/package/cargo-bootstrap/cargo-bootstrap.mk
> > b/package/cargo-bootstrap/cargo-bootstrap.mk
> > new file mode 100644
> > index 0000000..8a11e6e
> > --- /dev/null
> > +++ b/package/cargo-bootstrap/cargo-bootstrap.mk
> > @@ -0,0 +1,14 @@
> > +####################################################################
> > ############
> > +#
> > +# cargo-bootstrap
> > +#
> > +####################################################################
> > ############
> > +
> > +CARGO_BOOTSTRAP_VERSION = 6e0c18cccc8b0c06fba8a8d76486f81a792fb420
> > +CARGO_BOOTSTRAP_SITE = https://s3.amazonaws.com/rust-lang-ci/cargo-b
> > uilds/$(CARGO_BOOTSTRAP_VERSION)
> > +CARGO_BOOTSTRAP_SOURCE = cargo-nightly-$(HOSTARCH)-unknown-linux-
> > gnu.tar.gz
> > +CARGO_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
> > +CARGO_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> > +CARGO_BOOTSTRAP_STRIP_COMPONENTS = 1
> > +
> > +$(eval $(host-generic-package))

--
ELB
