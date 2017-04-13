From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 13 Apr 2017 16:49:18 +0000
Subject: [Buildroot] [Patch v4 3/3] rust: new package
In-Reply-To: <1492063504.4490.1.camel@embedded.rocks>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-4-eric.le.bihan.dev@free.fr>
 <1491549522.26127.8.camel@embedded.rocks> <20170408100925.GC32154@itchy>
 <1491850965.4279.1.camel@embedded.rocks>
 <174ded3e-cc52-0456-3cd2-7750c531e442@mind.be>
 <1492063504.4490.1.camel@embedded.rocks>
Message-ID: <b2b48a0cb1c4d27ecbdd9d510e0bdb87@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2017-04-13 06:05, J?rg Krause a ?crit?:
> Hi,
> 
> On Mon, 2017-04-10 at 23:43 +0200, Arnout Vandecappelle wrote:
>> 
>> On 10-04-17 21:02, J?rg Krause wrote:
[snip]
>> > For now, we could use the host rustc package to fetch the latest stable
>> > binary for the host architecture. Additionally, we could add the option
>> > to build the Rust compiler within Buildroot. In my opinion, this option
>> > only makes sense if the compiler can be configured meaningfully.
>> 
>>  I agree.
> 
> Cool.
> 
> @Eric: Do you mind to do that? By default fetch the latest stable
> release, and alternatively offer an option to build a "Custom Rust
> package". I think it would also be helpful to have at least one Rust
> package to add as a proof of concept.

Currently this patch series provides:

- rust-bootstrap, which fetches the binary version N-1 of rust.
- cargo-bootstrap, which fetches a nightly binary version of cargo.
- rust, which uses the two previous packages to build version N of rust.

I also have another patch series which adds a new package for cargo, 
which
uses cargo-bootstrap and rust to build Cargo from source.

IMHO, modifying the current version of the rust package to download the
latest version and providing an option to build from source would make
the Makefile of the package more complicated.

Would it not be better to use host virtual packages? Something like:

- rust-rustc: host virtual package, with two providers:
   * rustc-bin: fetches binary version N of rustc and libstd (host and
     target).
   * rustc: builds version N of rustc and libstd (host and target).
     Depends on rust-bootstrap (version N-1) and cargo-bootstrap.
- rust-cargo: host virtual package with two providers:
   * cargo-bin: fetches binary version N of Cargo.
   * cargo: builds version N of Cargo using rust and cargo-bootstrap.

And instead of littering the package directory with rust-* and cargo-*,
how about putting all these packages in a parent directory named
package/rust?

The file package/Config.in.host should also be modified to include
package/rust/Config.in.host, which would present the options to select
the providers for rust-rustc and rust-cargo.
