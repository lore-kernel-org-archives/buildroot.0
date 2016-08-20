From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2016 13:19:02 -0700
Subject: [Buildroot] [PATCH] pinentry: fix build issue with gcc 5.x
In-Reply-To: <1471701636-30275-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471701636-30275-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <EB15F48B-6DC4-4D66-882B-C2173F06427C@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 20, 2016, at 7:00 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> pinentry currently fails to build with gcc 5.x, because it uses some
> functionality from std::string that requires C++11 without passing the
> appropriate -std= value. We fix this by passing a proper -std= option
> when gcc >= 5.x. Note that this can be removed once pinentry is bumped
> to the newest version (currently 0.9.7) because they no longer use
> std::string in the Qt part.
> 
> Fixes:
> 
>  http://autobuild.buildroot.net/results/6ea64f692acaebc4d58f3371c632b5121500f17e/
>  (and many, many similar build failures)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> One-beer-granted-to: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> package/pinentry/pinentry.mk | 7 +++++++
> 1 file changed, 7 insertions(+)
> 
> diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
> index 09a7705..bcb910a 100644
> --- a/package/pinentry/pinentry.mk
> +++ b/package/pinentry/pinentry.mk
> @@ -14,6 +14,13 @@ PINENTRY_DEPENDENCIES = \
> 	host-pkgconf
> PINENTRY_CONF_OPTS += --without-libcap       # requires PAM
> 
> +# pinentry uses some std::string functionality that needs C++11
> +# support when gcc >= 5.x. This should be removed when bumping
> +# pinentry, since newer versions no longer use std::string.
> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
> +PINENTRY_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
> +endif

Should this package be restricted to gcc5 and newer only, I assume
it will break with gcc 4.x too and c++11 may not be there, gcc5 atleast
has the support its just not default

> +
> # build with X if available
> ifeq ($(BR2_PACKAGE_XORG7),y)
> PINENTRY_CONF_OPTS += --with-x
> --
> 2.7.4
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160820/112cca99/attachment.asc>
