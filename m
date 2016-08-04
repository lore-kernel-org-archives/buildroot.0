From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Aug 2016 00:28:18 -0700
Subject: [Buildroot] [PATCH v2] openssl: fix m68k uclinux compile
In-Reply-To: <20160731184800.GA6199@waldemar-brodkorb.de>
References: <20160731184800.GA6199@waldemar-brodkorb.de>
Message-ID: <6E5D5C0C-97E0-4CDA-8183-77737E5F4BA2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 31, 2016, at 11:48 AM, Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> The GCC manual suggest when getting:
> relocation truncated to fit: R_68K_GOT16O foobar
> to use -mxgot.
> 
> Fixes:
> http://autobuild.buildroot.net/results/455fd0f274bfa4bbd786bcd6740ecf960e47c1bd/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> package/openssl/openssl.mk |    5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index e34868e..b926fe3 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -19,6 +19,11 @@ OPENSSL_PATCH = \
> 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d \
> 	https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2a-parallel-symlinking.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
> 
> +# relocation truncated to fit: R_68K_GOT16O
> +ifeq ($(BR2_m68k_cf),y)
> +OPENSSL_CFLAGS += -mxgot
> +endif

perhaps -fPIC could be used here instead ?

> +
> ifeq ($(BR2_USE_MMU),)
> OPENSSL_CFLAGS += -DHAVE_FORK=0
> endif
> --
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160804/b122d82f/attachment.asc>
