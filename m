From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 16:44:52 +0100
Subject: [Buildroot] [PATCH 1/4] kvm-unit-test: x86-64 variant only
 available on x86-64 hosts
In-Reply-To: <20171102104520.29257-2-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-2-peter@korsgaard.com>
Message-ID: <687901ac-c7d7-81bb-944b-b2c860f90bae@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 11:45, Peter Korsgaard wrote:
> We use the host compiler for x86-64 builds, so ensure it is only available
> on x86-64 hosts.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/kvm-unit-tests/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index d0d9e2ef96..8b7908eee9 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
>  	# x86-64 we use the host gcc (see .mk file for details)
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
>  	depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64
> +	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64

 I don't think this is correct: it will also build correctly for x86_64 if the
host is i386, because it uses -m32 (which is the reason to use the host compiler
instead of the target compiler).

 Regards,
 Arnout

>  	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
>  	help
>  	  kvm-unit-tests is a project as old as KVM. As its name
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
