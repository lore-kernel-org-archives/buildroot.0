From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2015 19:14:21 +0200
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: fix problem with detecting
 SSP under uclibc-ng
In-Reply-To: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
References: <1442500678-4457-1-git-send-email-brendanheading@gmail.com>
Message-ID: <20150917191421.53dd3542@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brendan,

On Thu, 17 Sep 2015 15:37:58 +0100, Brendan Heading wrote:

> GCC's configure stage assumes that if the glibc version, as denoted by
> __GLIBC__ and __GLIBC_MINOR__, is greater or equal to 2.4 then stack
> protection must be available in the C library. This results in the compiler
> not attempting to link SSP helpers during the final link.
> 
> The problem is seen with uclibc-ng 1.0.6 (and likely greater) where they
> updated the __GLIBC_MINOR__ value to 10. It will be seen in any libc
> that permits stack protection to be disabled while exporting a glibc
> version >= 2.4.

Cc'ing Waldemar here. It's an interesting consequence of bumping the
GLIBC_MINOR version exposed by uClibc, which happened recently to solve
an eventfd_read() problem in Boost on ARC, investigated by Alexey (also
in Cc).

> 
> This patch overrides GCC to expect/not expect SSP support in libc based on
> the toolchain's capability as understood by buildroot.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
> ---
> Patch V1 :
> This fix definitely solves the problem, however I doubt it's acceptable to
> export environment variables in this way.
> 
> I had initially tried adding it to HOST_GCC_COMMON_CONF_ENV, and I
> confirmed that this is passed into GCC's top level configure, however it
> does not seem to propagate to the gcc/configure script. Another way would
> be to patch GCC, however this would involve maintaining patches for all
> the supported GCC versions.
> 
> Improvement suggestions welcome!
> ---
>  package/gcc/gcc.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 501fcea..43835af 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -123,6 +123,14 @@ endif
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
>  
> +# Work around issue with detecting SSP support in the C library
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +export gcc_cv_libc_provides_ssp=yes
> +else
> +export gcc_cv_libc_provides_ssp=no
> +endif

Exporting that globally is really horrible. I think the appropriate fix
is probably to teach gcc about uClibc, like we're doing for musl already
(http://git.buildroot.net/buildroot/tree/package/gcc/4.9.3/900-musl-support.patch#n452).
So we could do a check here like:

 *uclibc*)
	test if __UCLIBC_HAS_SSP__ is defined or not. If yes -> we have
	SSP, if not -> we don't have SSP.

And contribute that to upstream gcc.

What do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
