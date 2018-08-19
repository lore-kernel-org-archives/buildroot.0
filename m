From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:15:57 +0200
Subject: [Buildroot] [PATCH/next 2/3] package/perl-crypt-openssl-random:
 bump version to 0.15
In-Reply-To: <20180819181558.15338-2-bernd.kuhls@t-online.de>
References: <20180819181558.15338-1-bernd.kuhls@t-online.de>
 <20180819181558.15338-2-bernd.kuhls@t-online.de>
Message-ID: <20180819231557.62acd467@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 20:15:57 +0200, Bernd Kuhls wrote:

> -PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.11
> +PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.15
>  PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
>  PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
> -PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl
> +PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = \
> +	perl-crypt-openssl-guess \
> +	openssl
>  PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPL-1.0+
>  PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
>  
> +# Try as hard as possible to remedy to the brain-damage their build-system
> +# suffers from: don't search for openssl, they pick the host-system one.
> +PERL_CRYPT_OPENSSL_RANDOM_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr

So, there's a new dependency on a module that helps guessing the path
to OpenSSL library/headers, but you nonetheless have to force where
they are located ? Seems strange :-)

Perhaps those Perl people should learn about pkg-config rather than:

    my @guesses = (
        '/home/linuxbrew/.linuxbrew/opt/openssl/bin/openssl' => '/home/linuxbrew/.linuxbrew/opt/openssl', # LinuxBrew openssl
        '/usr/local/opt/openssl/bin/openssl' => '/usr/local/opt/openssl', # OSX homebrew openssl
        '/usr/local/bin/openssl'         => '/usr/local', # OSX homebrew openssl
        '/opt/local/bin/openssl'         => '/opt/local', # Macports openssl
        '/usr/bin/openssl'               => '/usr',
        '/usr/sbin/openssl'              => '/usr',
        '/opt/ssl/bin/openssl'           => '/opt/ssl',
        '/opt/ssl/sbin/openssl'          => '/opt/ssl',
        '/usr/local/ssl/bin/openssl'     => '/usr/local/ssl',
        '/usr/local/openssl/bin/openssl' => '/usr/local/openssl',
        '/apps/openssl/std/bin/openssl'  => '/apps/openssl/std',
        '/usr/sfw/bin/openssl'           => '/usr/sfw', # Open Solaris
        'C:\OpenSSL\bin\openssl.exe'     => 'C:\OpenSSL',
        'C:\OpenSSL-Win32\bin\openssl.exe'        => 'C:\OpenSSL-Win32',
        $Config{prefix} . '\bin\openssl.exe'      => $Config{prefix},           # strawberry perl
        $Config{prefix} . '\..\c\bin\openssl.exe' => $Config{prefix} . '\..\c', # strawberry perl
        '/sslexe/openssl.exe'            => '/sslroot',  # VMS, openssl.org
        '/ssl$exe/openssl.exe'           => '/ssl$root', # VMS, HP install
    );

but oh well...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
