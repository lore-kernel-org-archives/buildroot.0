From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Dec 2015 00:09:51 +0100
Subject: [Buildroot] [V3 2/2] perl-mail-spamassassin: new package
References: <1449257217-8021-1-git-send-email-francois.perrad@gadz.org>
 <1449257217-8021-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <ve7cjcx654.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

thank you very much for your patch, several months ago I tried to create 
a working Spamassassin package and failed, your patch works fine! I now 
have a working Spamassassin 3.4.1 daemon running on my buildroot 
machine :)

Please add perl-db-file as optional package, because

https://api.metacpan.org/source/KMCGRAIL/Mail-SpamAssassin-3.4.1/UPGRADE
"Note for Users Upgrading from SpamAssassin 2.5x
-----------------------------------------------

- Due to major reliability shortcomings in the database support libraries
  other than DB_File, we now require that the DB_File module be installed
  to use SpamAssassin's Bayes rules.

  SpamAssassin will still work without DB_File installed, but the Bayes
  support will be disabled."

using Spamassassin without a Bayes database makes not much sense:

ifeq ($(BR2_PACKAGE_PERL_DB_FILE),y)
PERL_MAIL_SPAMASSASSIN_DEPENDENCIES += perl-db-file
endif

An additional patch is needed to get a working perl-db-file module:
http://patchwork.ozlabs.org/patch/553054/

Furthermore the default paths produced by your package make not much 
sense:

$ grep "'make' time" output/target/usr/bin/spamassassin 
my $PREFIX          = '';             # substituted at 'make' time
my $DEF_RULES_DIR   = '/share/spamassassin';      # substituted at 'make' 
time
my $LOCAL_RULES_DIR = '/mail/spamassassin';    # substituted at 'make' 
time
my $LOCAL_STATE_DIR = '';    # substituted at 'make' time

I recommend this patch

-PERL_MAIL_SPAMASSASSIN_CONF_OPTS += CONTACT_ADDRESS="$(call qstrip,
$(BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN_CONTACT_ADDRESS))"
+PERL_MAIL_SPAMASSASSIN_CONF_OPTS += \
+       CONTACT_ADDRESS="$(call qstrip,
$(BR2_PACKAGE_PERL_MAIL_SPAMASSASSIN_CONTACT_ADDRESS))" \
+       VENDORPREFIX=/usr \
+       INSTALLVENDORCONF=/etc/mail/spamassassin

to have paths like these:

$ grep "'make' time" output/target/usr/bin/spamassassin 
my $PREFIX          = '/usr';             # substituted at 'make' time
my $DEF_RULES_DIR   = '/usr/share/spamassassin';      # substituted at 
'make' time
my $LOCAL_RULES_DIR = '/etc/mail/spamassassin';    # substituted at 
'make' time
my $LOCAL_STATE_DIR = '/var/lib/spamassassin';    # substituted at 'make' 
time

Regards, Bernd
