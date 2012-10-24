From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Oct 2012 09:31:56 +0200
Subject: [Buildroot] [PATCH] wireshark: new package
In-Reply-To: <5086CE63.4040302@mind.be>
References: <c866c7ffc05da225311abef42a80696310d22157.1350887157.git.baruch@tkos.co.il>
 <5086CE63.4040302@mind.be>
Message-ID: <20121024073156.GA29646@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anout,

Thanks for reviewing.

On Tue, Oct 23, 2012 at 07:05:39PM +0200, Arnout Vandecappelle wrote:
> On 22/10/12 08:27, Baruch Siach wrote:
> >This is only the bare minimum needed to build the textual tshark utility.
> >Support for more options, including the wireshark GUI, can be added later.
> >---
> >I override the $prefix configure variable because otherwise the host
> >/usr/include is added to the -I and -L paths. I'm not sure this is a good idea
> >though, since it clutters the tshark RPATH with directories from the local
> >build paths. If you have a better I'd be glad to hear.
> 
>  That usually means there's a broken Makefile.am and we fix it with a patch.
> However, does installation still work with the prefix override?

Yes. However I see $prefix added to the tshark binary RPATH, which is not 
nice. I'll try patching configure.in.

> [snip]
> >diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> >new file mode 100644
> >index 0000000..c89fbf8
> >--- /dev/null
> >+++ b/package/wireshark/wireshark.mk
> >@@ -0,0 +1,10 @@
> >+WIRESHARK_VERSION = 1.8.3
> >+WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
> >+WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
> >+WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
> >+WIRESHARK_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
> >+WIRESHARK_CONF_OPT = --disable-wireshark --without-krb5 --disable-usr-local \
> >+		     prefix=$(STAGING_DIR)/usr --with-sysroot=$(STAGING_DIR) \
> 
>  Why is the --with-sysroot needed?

Removing --with-sysroot doesn't negatively affect build or run of tshark. I 
get the following line during configure, however:

checking for sysroot... no

Is it significant?

> >+		     --enable-static=no
> 
>  We normally build both dynamic and static libraries, and remove the static
> library in the target.  Doesn't that work in wireshark?  Can you add a comment
> to explain that?

Without --enable-static=no build fails with:

ld: tshark: hidden symbol `__GI_atan' isn't defined

My toolchain is external:

powerpc-linux-gnu-gcc (Sourcery G++ Lite 2011.03-38) 4.5.2

Any ideas?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
