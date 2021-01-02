From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jan 2021 22:05:46 +0100
Subject: [Buildroot] [PATCH 2/2] package/php: needs pcre2
In-Reply-To: <20201228223627.51a0a518@windsurf.home>
References: <20201227183145.1965023-1-bernd.kuhls@t-online.de>
 <20201227183145.1965023-2-bernd.kuhls@t-online.de>
 <20201228223627.51a0a518@windsurf.home>
Message-ID: <20210102210546.GE2997@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2020-12-28 22:36 +0100, Thomas Petazzoni spake thusly:
> On Sun, 27 Dec 2020 19:31:45 +0100
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> 
> > -### Use external PCRE if it's available
> > -ifeq ($(BR2_PACKAGE_PCRE2),y)
> > -PHP_CONF_OPTS += --with-pcre-regex=$(STAGING_DIR)/usr
> > -PHP_DEPENDENCIES += pcre2
> > -
> > -ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
> > -PHP_CONF_OPTS += --with-pcre-jit=yes
> > -PHP_CONF_ENV += ac_cv_have_pcre2_jit=yes
> > -else
> > -PHP_CONF_OPTS += --with-pcre-jit=no
> > -PHP_CONF_ENV += ac_cv_have_pcre2_jit=no
> > -endif
> 
> Are you sure this is no longer needed ? According to
> https://github.com/php/php-src/commit/c1a22f3d4e69cb87f8deeed7d03d9434e6901537
> that you are pointing, the --with-pcre-jit option is not only for the
> bundled PCRE.

In fact, when cross-compiling, php will rely on a hard-coded list of
architectures for which it believes JIT is available:

https://github.com/php/php-src/blob/3e2e0b58484c5364aca026b7b3df769a63dc5389/ext/pcre/config0.m4#L24

Note that they got an incomplete list, as AArch64 does has JIT support,
but it is not in PHP's whitelist.

So we indeed still need to explicitly enable or disable JIT *and*
continue to pass the cache-variable to ocverride autodetection.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
