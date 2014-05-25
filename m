From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 25 May 2014 18:07:35 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-24
References: <20140525063007.921281015A1@stock.ovh.net>
 <20140525133708.GA3542@free.fr>
 <CAMo8Bf+XBo1S=2k_NO0De8WeesKszXU17AYy7sKLZ0hY+KJjQA@mail.gmail.com>
Message-ID: <73h95bxfq9.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max Filippov <jcmvbkbc@gmail.com> wrote in
news:CAMo8Bf+XBo1S=2k_NO0De8WeesKszXU17AYy7sKLZ0hY+KJjQA at mail.gmail.com: 

> The log still has -I/include in compilation commands, means that php
> still gets misconfigured. See
> http://lists.busybox.net/pipermail/buildroot/2014-April/094079.html
> for my previous analysis of it.

Hi,

your description looks reasonable.
While analyzing a similar build failure I saw a combination of 

BR2_PACKAGE_PHP_EXT_MYSQL=y
# BR2_PACKAGE_PHP_EXT_ZLIB is not set
BR2_PACKAGE_ZLIB=y

Mysql was build with zlib support while php was configured to not use zlib:

checking for ZLIB support... no
checking if the location of ZLIB install directory is defined... no
...
checking for MySQL support... yes
checking for specified location of the MySQL UNIX socket... no
checking for mysql_close in -lmysqlclient... no
checking for mysql_errno in -lmysqlclient... no
configure: error: Try adding --with-zlib-dir=<DIR>. Please check config.log 
for more information.

For my test case it seems BR2_PACKAGE_PHP_EXT_MYSQL should depend on BR2
_PACKAGE_PHP_EXT_ZLIB when BR2_PACKAGE_ZLIB is set to yes, because
https://github.com/php/php-src/blob/master/ext/mysql/config.m4
uses --with-zlib-dir to find zlib, which is missing in my test case.

I could, however, also not reproduce the build error, which could be related 
to packages installed on my compile host. It seems that the php package needs 
some attention.

Regards, Bernd
