From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 May 2018 23:51:19 +0200
Subject: [Buildroot] [PATCH 1/7] libidn2: new package
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <03d92121-8a91-a2a8-5fc3-e20b130e19f4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 01-05-18 22:40, Fabrice Fontaine wrote:
> Libidn2 is an implementation of the IDNA2008 + TR46
> specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
> TR 46).
> 
> http://www.gnu.org/software/libidn/

 So, basically libidn2 replaces libidn. Do we really want to support both? Yes,
obviously the API changed, but that happens all the time when bumping packages.
So, the question is what gives the best user experience...

 The problem with adding libidn2 is that a user who currently has libidn and
libcurl enabled, after updating Buildroot, will suddenly loose IDN support with
no warning...

 On the other hand, if a user has selected libidn and is using it in some
package outside of Buildroot, then that package will fail to build entirely,
with no (easy) way to recovery. But how likely is it that libidn is used in an
external package?

 But first, of course, if we want to just bump libidn then we have to make sure
that all packages support libidn2. That means the following packages have to be
checked: dnsmasq, ghostscript, libgsasl, mutt, omxplayer, prosody.

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[snip]

> diff --git a/package/libidn2/Config.in b/package/libidn2/Config.in
> new file mode 100644
> index 0000000000..38b1378990
> --- /dev/null
> +++ b/package/libidn2/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_LIBIDN2
> +	bool "libidn2"

 Can it be parallel-installed with libidn or does it need a depends on
!BR2_PACKAGE_LIBIDN?

> +	help
> +	  Libidn2 is an implementation of the IDNA2008 + TR46
> +	  specifications (RFC 5890, RFC 5891, RFC 5892, RFC 5893,
> +	  TR 46).
> +
> +	  http://www.gnu.org/software/libidn/
[snip]
> +LIBIDN2_VERSION = 2.0.4
> +LIBIDN2_SITE = $(BR2_GNU_MIRROR)/libidn
> +LIBIDN2_LICENSE = GPL-2.0+, LGPL-3.0+
> +LIBIDN2_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3 COPYING.unicode
> +LIBIDN2_DEPENDENCIES = \
> +	host-pkgconf \
> +	$(TARGET_NLS_DEPENDENCIES) \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +LIBIDN2_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_PACKAGE_LIBUNISTRING),y)
> +LIBIDN2_DEPENDENCIES += libunistring

 No --enable/disable option for this?

 Also, don't the java and C# bindings exist any more?

> +endif
> +
> +define LIBIDN2_REMOVE_BINARY
> +	rm -f $(TARGET_DIR)/usr/bin/idn2
> +endef

 Small nit: we prefer to have the define of the hook inside the condition as well.

 Regards,
 Arnout

> +
> +ifneq ($(BR2_PACKAGE_LIBIDN2_BINARY),y)
> +LIBIDN2_POST_INSTALL_TARGET_HOOKS += LIBIDN2_REMOVE_BINARY
> +endif
> +
> +$(eval $(autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
