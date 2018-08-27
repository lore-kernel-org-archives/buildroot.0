From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 27 Aug 2018 03:07:32 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-08-26
In-Reply-To: <20180827060019.5834E20789@mail.bootlin.com>
References: <20180827060019.5834E20789@mail.bootlin.com>
Message-ID: <CALURroSFJESgnrW-ErTQo-A7QhiupELvgsBveWTSOhddXT9UQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 26, 2018 at 11:00 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> Build statistics for 2018-08-26
> ===============================
>
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  23 |   2 |   0 |  25 |
>    2018.05.x |  19 |   2 |   0 |  21 |
>       master | 260 |  18 |   1 | 279 |
>         next |  44 |  33 |   0 |  77 |
>
>
<snip>



>
> microblazeel |                      php-7.2.9 | NOK |
> http://autobuild.buildroot.net/results/3288b742cee650ee47a41c5b4d6aaef1fe67bff1
> | ORPH
>          arm |                      php-7.2.9 | NOK |
> http://autobuild.buildroot.net/results/c092d22d948cf8f37b14ea6c3b5fedec6c316f55
> | ORPH
>          arm |                      php-7.2.9 | NOK |
> http://autobuild.buildroot.net/results/b4435f32612cecd1f1ecaca46528035f5175b825
> | ORPH
>          arc |                      php-7.2.9 | NOK |
> http://autobuild.buildroot.net/results/129abda4c74f961c22632f1afcf1efb26e5aefde
> | ORPH
>          arm |                      php-7.2.9 | NOK |
> http://autobuild.buildroot.net/results/6fb651c3ddd31e3b9b5638884937a0b3ef959a97
> | ORPH
>
>
php compile breaks with:

ext/mysqlnd/mysqlnd_auth.o: In function `php_mysqlnd_scramble_sha2':
mysqlnd_auth.c:(.text+0x1054): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x1064): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x1070): undefined reference to `PHP_SHA256Final'
mysqlnd_auth.c:(.text+0x1078): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x1088): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x1094): undefined reference to `PHP_SHA256Final'
mysqlnd_auth.c:(.text+0x109c): undefined reference to `PHP_SHA256Init'
mysqlnd_auth.c:(.text+0x10ac): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x10bc): undefined reference to `PHP_SHA256Update'
mysqlnd_auth.c:(.text+0x10c8): undefined reference to `PHP_SHA256Final'


It looks like the php mysqli extension needs the hash extension to work.
This seems to be a php Make dependany bug.  Something like:

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 6b3d86925d..60ef1aee7c 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -113,6 +113,7 @@ endif

 config BR2_PACKAGE_PHP_EXT_MYSQLI
        bool "Mysqli"
+       select BR2_PACKAGE_PHP_EXT_HASH
        help
          MySQL Improved extension support

fixes it on buildroot in the short term


<snip>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180827/1a45c874/attachment.html>
