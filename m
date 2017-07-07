From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 7 Jul 2017 09:08:22 -0500
Subject: [Buildroot] libasan.so missing
In-Reply-To: <87shic2xz3.fsf@dell.be.48ers.dk>
References: <05992a34-6e01-9d75-926f-ab5a2e0e10a1@grandegger.com>
 <877ezp780a.fsf@dell.be.48ers.dk>
 <3af3ceda-f9fb-ff4c-c203-2248fade16d2@grandegger.com>
 <87podh5gi7.fsf@dell.be.48ers.dk>
 <ed1251ca-9f4a-6f7c-3b51-7cc399299574@grandegger.com>
 <87shic2xz3.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpa-LaGyG9B-XfQm36o9rJwWL82Bna5qxqjRJeKXF6H7FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Jul 4, 2017 at 7:22 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
>
> Hi,
>
>  >> Correct. I've sent a patch fixing this for the internal and external
>  >> toolchain. Could you give it a try?
>  >>
>  >> https://patchwork.ozlabs.org/patch/783661/
>  >> https://patchwork.ozlabs.org/patch/783660/
>
>  > $ find . -name 'libasan*'
>  > ./target/lib/libasan.so
>  > ./target/lib/libasan_preinit.o
>  > ./target/lib/libasan.so.2
>  > ./target/lib/libasan.so.2.0.0
>
>  > It works. The libsanitizer adds some extra space and runtime overhead,
>  > I assume. Therefore, on Ubuntu, the libraries are not installed by
>  > default. They can be added by installing the "libasan0" package. For
>  > buildroot, would it make sense to make this option configurable as
>  > well?
>
>  > (libasan.*) Extra toolchain libraries to be copied to target
>
> Yes, I'll respin the series to add an option to install
> asan/lsan/tsan/usan.
>

I'm building the following Buildroot Custom toolchain config and
noticing a libsanitizer failure.  I haven't looked to far into why
yet.  This was working back on master ~06/13

../../../../libsanitizer/asan/asan_linux.cc: In function ?bool
__asan::AsanInterceptsSignal(int)?:
../../../../libsanitizer/asan/asan_linux.cc:222:20: error: ?SIGSEGV?
was not declared in this scope
   return signum == SIGSEGV && common_flags()->handle_segv;
                    ^
make[6]: *** [asan_linux.lo] Error 1
make[5]: *** [all-recursive] Error 1
make[4]: *** [all] Error 2
make[3]: *** [all-target-libsanitizer] Error 2
make[2]: *** [all] Error 2
make[1]: *** [/accts/mlweber1/target/build/host-gcc-final-5.4.0/.stamp_built]
Error 2
make: *** [_all] Error 2

Config to reproduce:
BR2_powerpc=y
BR2_powerpc_e500mc=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.12.37"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
BR2_GCC_VERSION_5_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y





-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
