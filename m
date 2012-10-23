From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 19:05:39 +0200
Subject: [Buildroot] [PATCH] wireshark: new package
In-Reply-To: <c866c7ffc05da225311abef42a80696310d22157.1350887157.git.baruch@tkos.co.il>
References: <c866c7ffc05da225311abef42a80696310d22157.1350887157.git.baruch@tkos.co.il>
Message-ID: <5086CE63.4040302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/12 08:27, Baruch Siach wrote:
> This is only the bare minimum needed to build the textual tshark utility.
> Support for more options, including the wireshark GUI, can be added later.
> ---
> I override the $prefix configure variable because otherwise the host
> /usr/include is added to the -I and -L paths. I'm not sure this is a good idea
> though, since it clutters the tshark RPATH with directories from the local
> build paths. If you have a better I'd be glad to hear.

  That usually means there's a broken Makefile.am and we fix it with a patch.
However, does installation still work with the prefix override?

[snip]
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> new file mode 100644
> index 0000000..c89fbf8
> --- /dev/null
> +++ b/package/wireshark/wireshark.mk
> @@ -0,0 +1,10 @@
> +WIRESHARK_VERSION = 1.8.3
> +WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
> +WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
> +WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
> +WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
> +WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
> +		     prefix=$(STAGING_DIR)/usr --with-sysroot=$(STAGING_DIR) \

  Why is the --with-sysroot needed?

> +		     --enable-static=no

  We normally build both dynamic and static libraries, and remove the static
library in the target.  Doesn't that work in wireshark?  Can you add a comment
to explain that?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
