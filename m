From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Sep 2015 09:13:56 +0200
Subject: [Buildroot] blackfin and micropython
In-Reply-To: <CAFOYHZCPCAEdq_wjxY+P=U+5cmthuEy_TkTzu6HNsLLcXHhBVg@mail.gmail.com>
References: <CAFOYHZCPCAEdq_wjxY+P=U+5cmthuEy_TkTzu6HNsLLcXHhBVg@mail.gmail.com>
Message-ID: <20150921091356.17452d5c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris,

On Mon, 21 Sep 2015 16:25:54 +1200, Chris Packham wrote:

> I'm just looking at the micropython build failures and the blackfin
> ones have have me a bit stumped.
> 
> The ones currently showing up[1] are format specifier errors. The code
> in question[2] doesn't look particularly bad and other
> architectures/compilers aren't complaining I guess it is getting
> confused with the math around const byte * and unsigned int. I can
> work around that issue by adding -Wno-error=format to CFLAGS for
> BR2_bfin. But that leads to the next issue.
> 
>   modffi.c:87: error: expected specifier-qualifier-list before ?ffi_closure?
>   modffi.c: In function ?mod_ffi_callback?:
>   modffi.c:248: error: ?mp_obj_fficallback_t? has no member named ?clo?
> 
> I think these are because nothing defines FFI_CLOSURES. ffitarget.h
> for bfin seems a lot sparser than for other architectures so I'm
> thinking that's the problem.
> 
> I notice python, python3 and guile are not available for bfin. Not
> that they explicitly exclude it but probably because of on of the
> other dependencies they all have.

Python is not available because it depends on BR2_USE_MMU as it uses
fork().

Guile is not available, because it depends on libatomic, which is not
available on Blackfin.

None of these seem to apply to Micropython. However, it would be fine
for me if you did:

	# libffi doesn't provide the closure implementation on Blackfin
	depends on !BR2_bfin

And that's it. The number of Blackfin developers using the mainline
Buildroot seems very limited, so I don't think it's worth the effort
fixing all packages, especially when the fix is non-trivial.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
