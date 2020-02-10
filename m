From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2020 08:36:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/php-*: fix autoconf variables
In-Reply-To: <20200209224516.245288-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 9 Feb 2020 23:45:16 +0100")
References: <20200209224516.245288-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv3ysxlj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of php-* packages are broken since commit
 > 3292f3de499717360cf18d7fecd79ac096216ca8 because
 > $(HOST_DIR)/bin/auto{conf,header} have been replaced by
 > $(HOST_DIR)/bin/auto{conf,header} -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"

 > So revert this change (which should have been only refactoring) for
 > those packages

 > Fixes:
 >  - http://autobuild.buildroot.org/results/0d5f4a792652e302b8c00c1e0f99966cc930fbac
 >  - http://autobuild.buildroot.org/results/91a559183db212803a90cb399a1cb505b14818d9

Thanks, I also just noticed that.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/php-amqp/php-amqp.mk           | 4 ++--
 >  package/php-geoip/php-geoip.mk         | 4 ++--
 >  package/php-gnupg/php-gnupg.mk         | 4 ++--
 >  package/php-imagick/php-imagick.mk     | 4 ++--
 >  package/php-memcached/php-memcached.mk | 4 ++--
 >  package/php-ssh2/php-ssh2.mk           | 4 ++--
 >  package/php-yaml/php-yaml.mk           | 4 ++--
 >  package/php-zmq/php-zmq.mk             | 4 ++--
 >  8 files changed, 16 insertions(+), 16 deletions(-)

 > diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
 > index 8f3ba1f9f4..c808ecdbd6 100644
 > --- a/package/php-amqp/php-amqp.mk
 > +++ b/package/php-amqp/php-amqp.mk
 > @@ -16,8 +16,8 @@ PHP_AMQP_LICENSE_FILES = LICENSE
 
 >  define PHP_AMQP_PHPIZE
 >  	(cd $(@D); \
 > -		PHP_AUTOCONF=$(AUTOCONF) \
 > -		PHP_AUTOHEADER=$(AUTOHEADER) \
 > +		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
 > +		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \

This means dropping the -I flags, is that correct? Alternatively, I
guess we could do PHP_AUTOCONF='$(AUTOCONF)'

-- 
Bye, Peter Korsgaard
