From: Vincent Fazio <vfazio@xes-inc.com>
Date: Thu, 6 Feb 2020 11:50:35 -0600
Subject: [Buildroot] "PATCH": hack to be able to build Rust targetting
 MIPS
In-Reply-To: <CAPAYC_yo=DkwQzeF-t9jqH6p2ywBF2+=+5agrKA-vhWULAB71A@mail.gmail.com>
References: <CAPAYC_xPtDO=j3fWeOEbC41X3PXJZ+7AD=WRm8A1DGQrtbadFQ@mail.gmail.com>
 <CAPAYC_y98TxMoBtG=P9hDe26=1rHfaoMyoH5NJyLHbRxcxpMAQ@mail.gmail.com>
 <20200119213102.GA2894@ned>
 <CAPAYC_xA2zkmmADgr9G2mspcS=Ej16wOM75rT-aCKbK42hzk5g@mail.gmail.com>
 <CAPAYC_wFywnPH6j8muHXvX1n+bLrWkZxBMrm+ywXQAyTbvsK8Q@mail.gmail.com>
 <CAPAYC_whFdF00V4M9qZEZOPz4VTMzJ1aOdruR-qjvUKkWw93uQ@mail.gmail.com>
 <CAPAYC_yo=DkwQzeF-t9jqH6p2ywBF2+=+5agrKA-vhWULAB71A@mail.gmail.com>
Message-ID: <d69167a6-8c09-8318-e646-5b2ae4a84991@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex,

On 2/6/20 11:18 AM, Alex Corcoles wrote:
> Hi guys,
>
> Just managed to get everything working. I've documented the whole 
> process at:
>
> https://github.com/alexpdp7/retrofw2-rust
>
> The problems are:
>
> 1) Rust updated their mips targets to mips32r2, while the kind of 
> devices I'm using are plain non-r1 mips32. I created a patch for 
> buildroot that patches Rust (on top of a patch I found that bumps it 
> to Rust 1.40.0) to use the proper instruction set. I've opened a bug 
> to see if they change the target or add a new one at:
>
> https://github.com/rust-lang/rust/issues/68865
>
I'm not familiar with Rust, but there should be a cleaner way to set the 
target cpu than hacking the default. Preferably the target MIPS cpu 
selected within Buildroot would inform the target cpu?

A quick search seems to suggest this may be possible 
(https://gitissue.com/issues/5a1e9e776805170abd3c8a38):

[build]
target = "mipsel-unknown-linux-gnu"

[target.mipsel-unknown-linux-gnu]
rustflags = [
 ? "-C", "link-arg=-EL",
 ? "-C", "target-cpu=mips32",
 ? "-C", "target-feature=+mips32,-mips32r2,-fpxx,-nooddspreg",
]


> 2) buildroot doesn't support building Rust for uclibc, I hardcoded 
> that. It would be nice to write a proper solution to this, but I'm not 
> familiar enough with buildroot. Does anyone know where I could request 
> that?
>
> 3) I had some issues with sdl-mixer, which I fixed by pulling 
> RetroFW's sdl-mixer. This is even more terrible, but I have even less 
> idea about how to fix it.
>
> Cheers,
>
> ?lex
>
> -- 
> ?___
> ?{~._.~}
> ? ( Y )
> ?()~*~() mail: alex at corcoles dot net
> ?(_)-(_) http://alex.corcoles.net/
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
