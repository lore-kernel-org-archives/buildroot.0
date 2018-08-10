From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 10 Aug 2018 20:13:24 +0200
Subject: [Buildroot] [PATCH 2/3] perl: add vendorprefix
In-Reply-To: <20180810144724.16347-1-chrismcc@gmail.com>
References: <20180810144724.16347-1-chrismcc@gmail.com>
Message-ID: <CAB0FRsuEUYa=8Fr2htcge8ULEVP-ZCpPE1tHJoThvqZ+4r+VvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-10 16:47 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> This adds vendorprefix to configure args
>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>


What is the rational of this patch ?

Currently, core modules (ie. built directly with the perl distribution) are
installed in /usr/lib/perl5/5.xx.y,
others modules (built by the perl-package infrastructure) are installed in
/usr/lib/perl5/site-perl/5.xx.y.
Why adding /usr/lib/perl5/vendor-perl/5.xx.y ?

Fran?ois

---
>  package/perl/perl.mk | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index b0eea3eff4..19a8f95f7b 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -48,6 +48,7 @@ PERL_CONF_OPTS = \
>         --target=$(GNU_TARGET_NAME) \
>         --target-tools-prefix=$(TARGET_CROSS) \
>         --prefix=/usr \
> +       --vendorprefix=/usr \
>         -Dld="$(TARGET_CC)" \
>         -Dccflags="$(TARGET_CFLAGS)" \
>         -Dldflags="$(TARGET_LDFLAGS) -lm" \
> @@ -92,6 +93,7 @@ endef
>  HOST_PERL_CONF_OPTS = \
>         -des \
>         -Dprefix="$(HOST_DIR)" \
> +       -Dvendorprefix="$(HOST_DIR)" \
>         -Dcc="$(HOSTCC)"
>
>  define HOST_PERL_CONFIGURE_CMDS
> @@ -111,6 +113,7 @@ $(eval $(generic-package))
>  $(eval $(host-generic-package))
>
>  define PERL_FINALIZE_TARGET
> +       mkdir -p $(TARGET_DIR)/usr/lib/perl5/
> vendor_perl/$(PERL_VERSION)/$(PERL_ARCHNAME)
>         rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
>         rm -rf $(TARGET_DIR)/usr/lib/perl5/$(
> PERL_VERSION)/$(PERL_ARCHNAME)/CORE
>         find $(TARGET_DIR)/usr/lib/perl5/ -name 'extralibs.ld' -print0 |
> xargs -0 rm -f
> --
> 2.14.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180810/8658f240/attachment.html>
