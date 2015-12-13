From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 22:53:32 +0100
Subject: [Buildroot] [V5] perl-mail-spamassassin: new package
In-Reply-To: <1450027692-16039-2-git-send-email-francois.perrad@gadz.org>
References: <1450027692-16039-1-git-send-email-francois.perrad@gadz.org>
 <1450027692-16039-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20151213225332.07db9aba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

Thanks for this new version. However, I don't understand why you take
into account part of my comments, and simply ignore some other
comments, without giving the reasons as a reply to the review. I am
perfectly fine with being wrong in my review, but I'd like to know why.

On Sun, 13 Dec 2015 18:28:12 +0100, Francois Perrad wrote:

> diff --git a/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch b/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
> new file mode 100644
> index 0000000..c38aba1
> --- /dev/null
> +++ b/package/perl-mail-spamassassin/0001-without-host-perl-dependencies.patch
> @@ -0,0 +1,64 @@
> +Remove host-perl-* dependencies
> +
> +The module  Mail-SpamAssassin tries to do the following things:
> +1) as usual CPAN module, install many .pm files in /usr/lib/perl5/site_perl/
> +and few scripts in /usr/bin.

So you're saying here that this doesn't cause any problem, right ?

> +2) "compile" SpamAssassin rules, that requires to install/run SpamAssassin on the host side.
> +As we don't want install host-perl modules, this step is disabled.
> +Please, consider the installed script `sa-update` for installing the rules for the first time.
> +3) spamc, an executable which embeds libperl
> +The cross-compilation case is not supported, a host executable gets built.
> +For this reason, this step is disabled.
> +(note: the option BUILD_SPAMC=yes/no is handled only on Windows)

So two issues to handle -> should be done by two different patches, no?

> +
> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +
> +--- a/Makefile.PL
> ++++ b/Makefile.PL
> +@@ -133,10 +133,8 @@
> +       'spamassassin.raw' => 'spamassassin',
> +       'sa-learn.raw'     => 'sa-learn',
> +       'sa-update.raw'    => 'sa-update',
> +-      'sa-compile.raw'   => 'sa-compile',

What is this useful for? sa-compile is not mentioned in the description.

> +       'sa-awl.raw'       => 'sa-awl',
> +       'sa-check_spamd.raw' => 'sa-check_spamd',
> +-      'spamc/spamc.c'    => 'spamc/spamc$(EXE_EXT)',

I guess this prevents spamc from being compiled, so that's solving
issue (3).

> +       'spamd/spamd.raw'  => 'spamd/spamd',
> +     },
> + 
> +@@ -304,16 +302,6 @@
> + 
> + ';
> + 
> +-# check optional module versions
> +-use lib 'lib';
> +-use Mail::SpamAssassin::Util::DependencyInfo;
> +-if (Mail::SpamAssassin::Util::DependencyInfo::long_diagnostics() != 0) {
> +-  # missing required module?  die!
> +-  # bug 5908: http://cpantest.grango.org/wiki/CPANAuthorNotes says
> +-  # we should exit with a status of 0, but without creating Makefile
> +-  exit 0;
> +-}

This is solving which issue ?

> +-
> + foreach my $file (@FILES_THAT_MUST_EXIST) {
> +   open (TOUCH, ">>$file") or die "cannot touch '$file'";
> +   close TOUCH;
> +@@ -1013,7 +1001,7 @@
> + 
> + FIXBANG		= -Msharpbang \
> +                   -Mconditional \
> +-		  -DPERL_BIN="$(PERL_BIN)" \
> ++		  -DPERL_BIN="/usr/bin/perl" \

This shebang issue is not described above.

> + 		  -DPERL_WARN="$(PERL_WARN)" \
> + 		  -DPERL_TAINT="$(PERL_TAINT)"
> + 
> +@@ -1023,7 +1011,7 @@
> + sa-learn: sa-learn.raw
> + 	$(PREPROCESS) $(FIXBYTES) $(FIXVARS) $(FIXBANG) -m$(PERM_RWX) -i$? -o$@
> + 
> +-sa-update: sa-update.raw build_rules
> ++sa-update: sa-update.raw
> + 	$(PREPROCESS) $(FIXBYTES) $(FIXVARS) $(FIXBANG) -m$(PERM_RWX) -isa-update.raw -osa-update

I guess this is solving issue (2) above.

> diff --git a/package/perl-mail-spamassassin/Config.in b/package/perl-mail-spamassassin/Config.in
> new file mode 100644
> index 0000000..deb8b7a
> --- /dev/null
> +++ b/package/perl-mail-spamassassin/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN
> +	bool "perl-mail-spamassassin"
> +	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_PERL_DIGEST_SHA1
> +	select BR2_PACKAGE_PERL_HTML_PARSER
> +	select BR2_PACKAGE_PERL_MAIL_DKIM
> +	select BR2_PACKAGE_PERL_NET_DNS
> +	select BR2_PACKAGE_PERL_NETADDR_IP
> +	help
> +	  SpamAssassin is an extensible email filter which is used to
> +	  identify spam
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

You still haven't taken into account my suggestion of using a more
meaningful default value.

> +	help
> +	  What email address or URL should be used in the suspected-spam
> +	  report text for users who want more information on your filter
> +	  installation?

A Config.in help text should typically not be worded as a question.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
