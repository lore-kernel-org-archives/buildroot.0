From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2020 09:02:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/php-*: fix autoconf variables
In-Reply-To: <87tv3ysxlj.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 10 Feb 2020 08:36:08 +0100")
References: <20200209224516.245288-1-fontaine.fabrice@gmail.com>
 <87tv3ysxlj.fsf@dell.be.48ers.dk>
Message-ID: <87pnemswda.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Build of php-* packages are broken since commit
 >> 3292f3de499717360cf18d7fecd79ac096216ca8 because
 >> $(HOST_DIR)/bin/auto{conf,header} have been replaced by
 >> $(HOST_DIR)/bin/auto{conf,header} -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"

 >> So revert this change (which should have been only refactoring) for
 >> those packages

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/0d5f4a792652e302b8c00c1e0f99966cc930fbac
 >> - http://autobuild.buildroot.org/results/91a559183db212803a90cb399a1cb505b14818d9

 > Thanks, I also just noticed that.

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/php-amqp/php-amqp.mk           | 4 ++--
 >> package/php-geoip/php-geoip.mk         | 4 ++--
 >> package/php-gnupg/php-gnupg.mk         | 4 ++--
 >> package/php-imagick/php-imagick.mk     | 4 ++--
 >> package/php-memcached/php-memcached.mk | 4 ++--
 >> package/php-ssh2/php-ssh2.mk           | 4 ++--
 >> package/php-yaml/php-yaml.mk           | 4 ++--
 >> package/php-zmq/php-zmq.mk             | 4 ++--
 >> 8 files changed, 16 insertions(+), 16 deletions(-)

 >> diff --git a/package/php-amqp/php-amqp.mk b/package/php-amqp/php-amqp.mk
 >> index 8f3ba1f9f4..c808ecdbd6 100644
 >> --- a/package/php-amqp/php-amqp.mk
 >> +++ b/package/php-amqp/php-amqp.mk
 >> @@ -16,8 +16,8 @@ PHP_AMQP_LICENSE_FILES = LICENSE
 
 >> define PHP_AMQP_PHPIZE
 >> (cd $(@D); \
 >> -		PHP_AUTOCONF=$(AUTOCONF) \
 >> -		PHP_AUTOHEADER=$(AUTOHEADER) \
 >> +		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
 >> +		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \

 > This means dropping the -I flags, is that correct? Alternatively, I
 > guess we could do PHP_AUTOCONF='$(AUTOCONF)'

That unfortunately doesn't work as phpize does a -x "$PHP_AUTOCONF"
check:

(cd /home/peko/source/buildroot/output-php/build/php-geoip-1.1.1; PHP_AUTOCONF='/home/peko/source/buildroot/output-php/host/bin/autoconf -I "/home/peko/source/EADER='/home/peko/source/buildroot/output-php/host/bin/autoheader -I "/home/peko/source/buildroot/output-php/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usrsroot/usr/bin/phpize)
Configuring for:
PHP Api Version:         20190902
Zend Module Api No:      20190902
Zend Extension Api No:   320190902
Cannot find autoconf. Please check your autoconf installation and the
$PHP_AUTOCONF environment variable. Then, rerun this script.

So I guess there is not much we can do (besides adding a bunch of
wrapper scripts to hide those arguments) and I've committed your patch,
thanks.

-- 
Bye, Peter Korsgaard
