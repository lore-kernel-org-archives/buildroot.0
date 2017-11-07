From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 22:05:11 +0100
Subject: [Buildroot] [RFCv1 1/4] pkgconf: use relative path to
 STAGING_DIR instead of absolute path
In-Reply-To: <20171103160627.6468-2-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-2-thomas.petazzoni@free-electrons.com>
Message-ID: <c4576062-3b90-5541-6b87-32218c2984de@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 17:06, Thomas Petazzoni wrote:
> The pkg-config wrapper script is currently generated with absolute
> paths to $(STAGING_DIR). However, this will not work properly with
> per-package SDK, and each package will be built with a different
> STAGING_DIR value.
> 
> In order to fix this, we adjust how the pkg-config wrapper script is
> generated, so that it uses a relative path to itself: the sysroot (i.e
> STAGING_DIR) is always located in $(path of
> pkg-config)/../$(STAGING_SUBDIR).
> 
> This change is independent from the per-package SDK work, and could be
> applied independently from it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 It's OK as it is

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 However...

> ---
>  package/pkgconf/pkgconf.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
> index cc190d26da..d11ce485f7 100644
> --- a/package/pkgconf/pkgconf.mk
> +++ b/package/pkgconf/pkgconf.mk
> @@ -19,8 +19,8 @@ endef
>  define HOST_PKGCONF_INSTALL_WRAPPER
>  	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
>  		$(HOST_DIR)/bin/pkg-config
> -	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
> -		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
> +	$(SED) 's, at PKG_CONFIG_LIBDIR@,$$(dirname $$0)/../$(STAGING_SUBDIR)/usr/lib/pkgconfig:$$(dirname $$0)/../$(STAGING_SUBDIR)/usr/share/pkgconfig,' \
> +		-e 's, at STAGING_DIR@,$$(dirname $$0)/../$(STAGING_SUBDIR),' \

 Instead of all this complexity, why not do it directly in pkg-config.in, and
just substitute @STAGING_SUBDIR@ ? Note that the file will have 4 instances of
$(dirname $0) so an intermediary variable is called for.

 If you do that, you can maybe also do some line splitting there, and add the
missing exec.

 Regards,
 Arnout

>  		$(HOST_DIR)/bin/pkg-config
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
