From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 16:00:55 +0100
Subject: [Buildroot] [V4 2/3] perl-mail-spamassassin: new package
In-Reply-To: <1449411276-27492-3-git-send-email-francois.perrad@gadz.org>
References: <1449411276-27492-1-git-send-email-francois.perrad@gadz.org>
 <1449411276-27492-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20151213160055.68f009ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

Thanks a lot for working on this. Definitely a lot better than the
previous solution from Bernd that required tons of host Perl packages
to be added. A few comments below.

On Sun,  6 Dec 2015 15:14:35 +0100, Francois Perrad wrote:

> diff --git a/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch b/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
> new file mode 100644
> index 0000000..8edab10
> --- /dev/null
> +++ b/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
> @@ -0,0 +1,64 @@
> +Remove host-perl-* dependencies
> +
> +The module  Mail-SpamAssassin tries to do the following things:
> +1) as usual CPAN module, install many .pm files in /usr/lib/perl5/site_perl/
> +and few scripts in /usr/bin.
> +No issue here.

So, if there's no issue, why do you mention this?

> +2) "compile" SpamAssassin rules, that requires to install/run SpamAssassin on the host side.
> +As we don't want install host-perl modules, this step is disabled.
> +Please, considere the installed script `sa-update` for installing the rules for the first time.

considere -> consider

Also, I think this should probably be mentioned in the Config.in help
text.

> +3) spamc, an executable which embeds libperl
> +The cross compilation is not handled, I obtain an host executable.

I -> not good to use such formulation. What about:

"The cross-compilation case is not supported, a host executable gets
built. For this reason, this step is disabled."

Also, since you're fixing several independent problems, what about
doing a single patch for each problem ?

Do you think you could write the patches in a way that makes them
potentially acceptable upstream ?

> diff --git a/package/perl-mail-spamassassin/Config.in b/package/perl-mail-spamassassin/Config.in
> new file mode 100644
> index 0000000..4d1b0e0
> --- /dev/null
> +++ b/package/perl-mail-spamassassin/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
> +	bool "perl-mail-spamassassin"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_PERL_DIGEST_SHA1
> +	select BR2_PACKAGE_PERL_HTML_PARSER
> +	select BR2_PACKAGE_PERL_MAIL_DKIM
> +	select BR2_PACKAGE_PERL_NET_DNS
> +	select BR2_PACKAGE_PERL_NETADDR_IP
> +	help
> +	  SpamAssassin is an extensible email filter which is used to identify spam
> +
> +	  http://spamassassin.apache.com/
> +
> +comment "perl-mail-spamassassin needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
> +if BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
> +
> +config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN_CONTACT_ADDRESS
> +	string "contact address"
> +	default "the administrator of that BR system"

Do we really need a compile time option for this? Can't this be
configured at run-time in some configuration file?

Shouldn't the default be an empty string rather than the "the
administrator of that BR system" ?

> +	help
> +	  What email address or URL should be used in the suspected-spam report
> +	  text for users who want more information on your filter installation?

Lines too long I believe, please wrap at 72 characters.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
