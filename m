From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Oct 2019 23:17:18 +0200
Subject: [Buildroot] [PATCH 0/6] Cargo virtual and Rust 1.38.0
In-Reply-To: <20191005160400.GA10008@ned>
References: <20190929171656.30187-1-eric.le.bihan.dev@free.fr>
 <e6d594bc-f2e1-fb71-a2c4-5e88a4a05d28@mind.be> <20191005160400.GA10008@ned>
Message-ID: <1b4bd4cb-b62e-2532-f40d-73bc3bf8f87f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/10/2019 18:06, Eric Le Bihan wrote:
> Hi!
> On 2019-09-29 21:22, Arnout Vandecappelle wrote:
>>
>>
>> On 29/09/2019 19:16, Eric Le Bihan wrote:
>>> Cargo source code is not provided anymore as a separate tarball but is now
>>> built along with the Rust compiler.
>>>
>>> This patch series converts cargo to a virtual package and declare cargo-bin
>>> and rust are providers. Versions for each package are also bumped to latest
>>> ones.
>>
>>  Why do we need the virtual package? I would think that cargo just becomes a
>> sub-option of rust. Or, given how cargo and rust really go hand in hand, we
>> could just remove the cargo package entirely and always build cargo as part of
>> rust. For host packages, we don't care about size (too much), the only possible
>> issue is build time. But I expect building rust with cargo isn't going to be
>> that much longer.
> 
> Rust needs a Rust compiler and Cargo to build. So there are some
> packages providing the pre-built binaries (rust-bin and cargo-bin). When
> Cargo was available as a standalone package, the user could choose to
> either:
> 
> a) select rust-bin and build cargo (using cargo-bin).
> b) select to build rust and cargo, using rust-bin and cargo-bin.

 OK, I didn't realize that a) was a possibility. I thought we always built
rust+cargo based on rust-bin+cargo-bin.

 So, if I understand correctly, we have this choice between rust-bin or rust to
be able to save some build time (in case the standard library from rust-bin can
be used).

 If it simplifies our life, I think it's worth considering to drop this choice
and instead *always* build rust for the target if it's needed for the target,
and *always* use rust-bin/cargo-bin if it only needed for the host. But that is
kind of orthogonal to this version bump.


> Now that Cargo is provided and built along with the Rust compiler,
> option a) is not possible anymore, unless cargo-bin is updated to be
> also installable and not only used as an intermediate tool. In that case
> we have two packages providing the same program (rust and cargo-bin),
> hence the idea of introducing the virtual package for Cargo.
> 
> But it sure may be overkill and having just a sub-option might do the
> trick. Would adding a sub-option to Rust which behaves as follows be
> suitable?
> 
> - if rust-bin is selected, then install Cargo from cargo-bin
> - if rust is selected, build Cargo along with the compiler using
>   rust-bin and cargo-bin and install it.

 It would make most sense to me to drop either cargo or rust as a
user-selectable option. Probably dropping cargo is the easiest. (Actually, I
think the rust-bin tarball might already include cargo anyway, so we could
remove host-cargo-bin and host-cargo entirely.) So, we would only have
host-rustc as a user-selectable option, with the choice between host-rust-bin or
host-rust. If we choose host-rust-bin, the host-rustc virtual package depends on
host-rust-bin (which installs the stdlib for the target) and host-cargo-bin. If
we choose host-rust, the host-rustc virtual package depends on host-rust (which
builds rust and cargo for the host and the stdlib for the target) and host-rust
depends on host-rust-bin and host-rust-cargo.

 That leaves us with two pieces of weirdness:
- host-rustc depends on host-cargo-bin depending on the choice;
- host-rust-bin installs stdlib depending on the choice.

 Neither of these is insurmountable, but the weirdness would be cleaned up if we
didn't have the choice.


 Note that independent of this, I think there are currently already a number of
issues with the rust integration.

- rust-bin will install the target stdlib even if rust is selected, so rust will
(probably?) overwrite it again.

- The rust compiler itself and the host stdlib will for sure be overwritten by
rust (but we do the same for gcc-initial, so OK).

- BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS now depends on glibc, while I
guess it should be possible to build the target stdlib for another libc.


 Regards,
 Arnout


>>> Eric Le Bihan (6):
>>>   package/cargo: convert to virtual package
>>>   package/cargo-bin: declare as cargo provider
>>>   package/rust: declare as cargo provider
>>
>>  You can't do this until the version has been bumped, because in the current
>> version (AFAIU) rust doesn't have the cargo sources yet.
>>
>>  In other words, it has to go in the same patch that bumps rust.
> 
> Duly noted.
> 
> Thanks for the review.
> 
> Regards,
> 
> --
> ELB
> 
