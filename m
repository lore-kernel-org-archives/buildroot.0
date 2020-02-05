From: Alex Corcoles <alex@corcoles.net>
Date: Wed, 5 Feb 2020 18:21:58 +0100
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <CAPAYC_wFywnPH6j8muHXvX1n+bLrWkZxBMrm+ywXQAyTbvsK8Q@mail.gmail.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
 <20200119213102.GA2894@ned>
 <CAPAYC_xA2zkmmADgr9G2mspcS=Ej16wOM75rT-aCKbK42hzk5g@mail.gmail.com>
 <CAPAYC_wFywnPH6j8muHXvX1n+bLrWkZxBMrm+ywXQAyTbvsK8Q@mail.gmail.com>
Message-ID: <CAPAYC_whFdF00V4M9qZEZOPz4VTMzJ1aOdruR-qjvUKkWw93uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some further investigation reveals that Rust made the mips* targets
mips32r2 by default, while the system I'm trying to compile to is only
mips32 (no r2). This seems to be the source of my issues:

https://github.com/rust-lang/rust/pull/48874

So if buildroot wants Rust to work on JZ4760B and similar popular CPUs, I
think it should define a new Rust target for mips32 without r2 instruction
set.

That goes a bit beyond my knowledge (esp. buildroot), so if someone wants
to help, I'd be happy to do whatever I can.

On Mon, Feb 3, 2020 at 6:08 PM Alex Corcoles <alex@corcoles.net> wrote:

> I've finally had more time to play with this. It seems that
> mipsel-unknown-linux-uclibc works! I've been able to run software built
> with it on a real hardware device, although it's very crashy (all
> arithmetic operations seem to crash with illegal instruction- probably I
> didn't configure my toolchain right or there's a Rust issue...).
>
> I would suggest removing the limitation on uclibc... perhaps with a big
> warning flag, though, as I haven't managed to build complex, stable
> software.
>
> I've written a bit about the process at:
>
>
> https://users.rust-lang.org/t/trying-to-compile-rust-sdl-stuff-for-a-rg300-console-buildroot-mipsel-uclibc/36722
> https://github.com/alexpdp7/retrofw2-rust
>
> Cheers,
>
> ?lex
>
> On Mon, Jan 20, 2020 at 5:31 PM Alex Corcoles <alex@corcoles.net> wrote:
>
>> Hi!
>>
>> The RUSTC_TARGET_NAME variable is defined in rustc.mk only if the symbol
>>> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is selected. This symbols is
>>> used to ensure all the conditions to build a rust package are met. One
>>> of them is that the toolchain is glibc-based. This is required, because
>>> the standard library provided by the pre-built host Rust toolchain is
>>> built against glibc.
>>>
>>> In your defconfig, the toolchain is uclibc-based and the host Rust
>>> toolchain is built from source.
>>>
>>> Hence BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is not defined and so
>>> is RUSTC_TARGET_NAME.
>>>
>>> So there is a bug: the restriction on having a glibc-based toolchain
>>> should apply either when using a pre-built rust toolchain or building
>>> one from source. I'll see how to fix it.
>>>
>>> The list of supported platforms [1] mentions GNU glibc and musl, but not
>>> uclibc. Does the build with your defconfig and patch successful?
>>>
>>> [1] https://forge.rust-lang.org/release/platform-support.html
>>>
>>
>> I think I built it successfully after introducing my hack, but as far as
>> I understand, it is not guaranteed to build in the future (and the opposite
>> is true, perhaps if it doesn't build today, it will tomorrow). In the link
>> you sent, mipsel-unknown-linux-uclibc is Tier 3 with std.
>>
>> If I have some time I will play around with it and see you some results.
>>
>> IMHO, perhaps you should hide non Tier-1 platforms behind an "enable this
>> option for non-Tier 1 Rust builds which are not guaranteed to work", or
>> something like that.
>>
>> Cheers,
>>
>> ?lex
>>
>> --
>>    ___
>>  {~._.~}
>>   ( Y )
>>  ()~*~()  mail: alex at corcoles dot net
>>  (_)-(_)  http://alex.corcoles.net/
>>
>>
>
> --
>    ___
>  {~._.~}
>   ( Y )
>  ()~*~()  mail: alex at corcoles dot net
>  (_)-(_)  http://alex.corcoles.net/
>
>

-- 
   ___
 {~._.~}
  ( Y )
 ()~*~()  mail: alex at corcoles dot net
 (_)-(_)  http://alex.corcoles.net/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200205/2c32b651/attachment.html>
