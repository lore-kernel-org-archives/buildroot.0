From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:02:56 +0200
Subject: [Buildroot] [PATCH v2 6/6] package/perl-mail-spamassassin: new
 package
In-Reply-To: <1430041039-13905-6-git-send-email-bernd.kuhls@t-online.de>
References: <1430041039-13905-1-git-send-email-bernd.kuhls@t-online.de>
 <1430041039-13905-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150426120256.63387117@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 26 Apr 2015 11:37:19 +0200, Bernd Kuhls wrote:
> This package contains a dependency check which only checks for installed
> modules in host-perl, not the target variant. Therefore some host package
> of perl modules are needed as dependency.

What about fixing Spamassassin instead?

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> ---
> v2: - select perl-encode-detect only when c++ is available

And this seems broken. Read on below.

> diff --git a/package/perl-mail-spamassassin/Config.in b/package/perl-mail-spamassassin/Config.in
> new file mode 100644
> index 0000000..799a6a7
> --- /dev/null
> +++ b/package/perl-mail-spamassassin/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
> +	bool "perl-mail-spamassassin"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_PERL_DB_FILE
> +	select BR2_PACKAGE_PERL_DIGEST_SHA1
> +	select BR2_PACKAGE_PERL_ENCODE_DETECT if BR2_INSTALL_LIBSTDCPP

So if C++ is not available, we are not selecting
BR2_PACKAGE_PERL_ENCODE_DETECT.

> +PERL_MAIL_SPAMASSASSIN_DEPENDENCIES = \
> +	perl \
> +	perl-db_file \
> +	perl-digest-sha1 \
> +	perl-encode-detect \

But we depend on it anyway.

So really, there are only a few solutions:

 *) perl-encode-detect is a mandatory dependency of spamassassin. In
    this case, spamassassin must have a depends on C++.

 *) perl-encode-detect is an optional dependency of spamassassin. In
    this case, do nothing in Config.in, and use ifeq
    ($(BR2_PACKAGE_PERL_ENCODE_DETECT),y) in the .mk file to add it in
    PERL_MAIL_SPAMASSASSIN_DEPENDENCIES.

 *) or if you really want to enable it automatically when C++ is
    available, keep your select in the Config.in, but use ifeq
    ($(BR2_PACKAGE_PERL_ENCODE_DETECT),y) in the .mk file to add it in
    PERL_MAIL_SPAMASSASSIN_DEPENDENCIES.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
