From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Sep 2018 00:05:39 +0200
Subject: [Buildroot] [PATCH 1/1] moarvm: fix build on powerpc64 /
 powerpc64le
In-Reply-To: <20180904213211.17204-1-fontaine.fabrice@gmail.com>
References: <20180904213211.17204-1-fontaine.fabrice@gmail.com>
Message-ID: <9f9b999d-d71f-f44c-8cd1-28e961c809dd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/09/2018 23:32, Fabrice Fontaine wrote:
> Build fails with:
>  In file included from dyncall_callback.c:35:0:
> dyncall_callback_ppc64.c: In function 'dcbNewCallback':
> dyncall_callback_ppc64.c:42:13: warning: implicit declaration of function 'dcAllocWX' [-Wimplicit-function-declaration]
>    int err = dcAllocWX(sizeof(DCCallback), (void**) &pcb);
>              ^~~~~~~~~
> dyncall_callback_ppc64.c: In function 'dcbFreeCallback':
> dyncall_callback_ppc64.c:53:3: warning: implicit declaration of function 'dcFreeWX' [-Wimplicit-function-declaration]
>    dcFreeWX(pcb, sizeof(DCCallback));
>    ^~~~~~~~
> dyncall_callback_ppc64.S: Assembler messages:
> dyncall_callback_ppc64.S:180: Error: operand out of range (3 is not between 0 and 1)
> 
> So select BR2_PACKAGE_LIBFFI for BR2_powerpc64 and BR2_powerpc64le as it
> is already done for MIPS

 Upstream dyncall [1] has completely changed the ppc64 assembly file. But moarvm
hasn't updated its dyncall import in more than 3 years. So I agree switching to
libffi for ppc64.

 In fact, we might want to switch to libffi unconditionally, instead of relying
on a bundled library that isn't updated...

 For now, however:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[1] http://hg.dyncall.org/pub/dyncall/dyncall

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/97b53a74d9847c07f26178daeb1daff3b6c24813
>  - http://autobuild.buildroot.org/results/c35ac4bbc5fb04aabf5a719eddeedf55f7f1f4eb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/moarvm/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
> index 3ff4f827e0..c966b25738 100644
> --- a/package/moarvm/Config.in
> +++ b/package/moarvm/Config.in
> @@ -12,7 +12,8 @@ config BR2_PACKAGE_MOARVM
>  	select BR2_PACKAGE_LIBATOMIC_OPS
>  	# dyncall does not work on MIPS; libffi needs to be used.
>  	# See: https://github.com/MoarVM/MoarVM/issues/222
> -	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	# dyncall does not work also on powerpc64 and powerpc64le
> +	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc64 | BR2_powerpc64le
>  	help
>  	  Short for "Metamodel On A Runtime", MoarVM is a virtual
>  	  machine built especially for Rakudo Perl 6 and the NQP
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
