From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Sat, 08 Aug 2015 16:53:04 +0200
Subject: [Buildroot] [PATCH] package/dawgdic: needs gcc >= 4.7
In-Reply-To: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
References: <1439026543-25909-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <55C617D0.3050800@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/08/2015 11:35, Romain Naour wrote:
> std::strtoll is only supported since C++11.
>
> Fixes:
> http://autobuild.buildroot.net/results/cae/cae3cda9be779ea8359f94d13bbbca97e68495ca/
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>   package/dawgdic/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/dawgdic/Config.in b/package/dawgdic/Config.in
> index ce0b466..8ef9902 100644
> --- a/package/dawgdic/Config.in
> +++ b/package/dawgdic/Config.in
> @@ -1,6 +1,8 @@
>   config BR2_PACKAGE_DAWGDIC
>   	bool "dawgdic"
>   	depends on BR2_INSTALL_LIBSTDCPP
> +	# std=c11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
The string conversion functions also exist in 4.6[1].

However, there is another problem: If an external toolchain is built 
using GCC and uclibc without any additional patches, then you will not 
have them, because of a too-broad feature check in libstdc++ that checks 
if the C library has complete support for C99[2].

This problem is still unresolved even with the latest GCC. buildroot 
patches GCC to fix this, but if an external toolchain does not ...

[1]:
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=libstdc%2B%2B-v3/include/c_std/cstdlib;h=c3fe8aa4507d51375474c2914fb3e812b3a136e0;hb=632cb4d5f22f598d1395fbae90a10fb679e06054

[2]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393
