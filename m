From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 7 Sep 2017 21:33:58 +0200
Subject: [Buildroot] [Patch v7 04/10] rust-bootstrap: new package
In-Reply-To: <170ae612-1cc1-434c-bafb-6cfab9e65d8b@mind.be>
References: <20170723081206.7774-1-eric.le.bihan.dev@free.fr>
 <20170723081206.7774-5-eric.le.bihan.dev@free.fr>
 <170ae612-1cc1-434c-bafb-6cfab9e65d8b@mind.be>
Message-ID: <20170907193358.GC6001@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 17-08-11 01:13:38, Arnout Vandecappelle wrote:
>
>
> On 23-07-17 10:12, Eric Le Bihan wrote:
> > This new package fetches a binary snapshot of the Rust compiler,
> > suitable to bootstrap the host variant of the Rust compiler.
> >
> > To bootstrap rustc version N, rustc N-1 is used.
>
>  Is it really needed/useful to use N-1 to bootstrap with? From the user's
> perspective, that's just another useless download, right?

AFAIK, rust N should be able to compile N, so it seems logical to get
rid of rust-bootstrap and use rustc-bin (with rust-std-bin) instead.
I'll make some tests, though.

So, should host-rustc-bin provide $(BR2_PACKAGE_HOST_RUSTC_BIN_AS_BOOTSTRAP),
which should disable traditional installation if set?

>  In fact, this way rust-bootstrap can be eliminated entirely: host-rust-bin can
> be used instead. It does complicate things a little bit, because in that case we
> should NOT depend on (target) rust-std-bin. So that means that host-rust-bin
> shouldn't depend on rust-std-bin, so that dependency should be added in some
> different way...

It is true that, in that case, we only need the standard library for
host from host-rust-std-bin. If it installs target and host versions of
the library, we have a useless download.

--
ELB
