From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 23:56:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to
 enable some features
In-Reply-To: <20200721092631.40977-1-erwan.gautron@bertin.fr>
References: <20200721092631.40977-1-erwan.gautron@bertin.fr>
Message-ID: <20200829215657.GL14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erwan, All,

On 2020-07-21 11:26 +0200, Erwan Gautron spake thusly:
> From: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
> Openssl implements lot of algorithms that are not required in
> some emdedded devices and cyphers known as weak.
> Secure embedded systems shall disable unused algorithms (and weak algo)
> in order to be certified.
> This patch allows to select weak algorithms and mecanims to enable
> such as md5
> To ensure backward compatibility, all items are selected by default

While I certainly understand and appreciate the rationale, I think this
is going a bit too far and is too granular.

I would suggest that we just add a few categories, like:

    config BR2_PACKAGE_LIBOPENSSL_LEGACY_CIPHERS
        bool "enable legacy cipher suites"
        help
          Build support for the following legacy, weak cipher suites:
            rc2
            rc4
            rc5
            [etc... fill in as appropriate]

    config BR2_PACKAGE_LIBOPENSSL_LEGACY_HASHES
        bool "enable legacy hash algorithms"
        help
          Build support for legacy, weak hash alorithms:
            md2
            md4
            md5
            [etc... fill in as appropriate]

    config BR2_PACKAGE_LIBOPENSSL_LEGACY_PROTOCOLS
        bool "enable legacy protocols"
        help
          Build support for legacy protocols;
            SSL 1.0
            SSL 2.0
            SSL 3.0
            TLS 1.0
            [etc... fill in as appropriate]

And we would consider legacy any cipher suite, hash algorithm, or
protocol that is deprecated by NIST (e.g. because they are forbidden in
FIPS 140-2, or the soon-to-be-in-force FIPS 140-3).

Finally, I would not add any option to disable "current" cipher suites,
hash algorithms, or protocols; I would always have them built. This will
help build devices that are future-proof, when the servers they talk to
are upgraded to using new protocols and thus new cipher suites: devices
in the fields will not need to be updated just for that.

Also, see below for a few generic comments...

> Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
> ---
>  package/libopenssl/Config.in     | 147 +++++++++++++++++++++++++++++++
>  package/libopenssl/libopenssl.mk |  24 +++++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> index 8909e36b9e..c034408a96 100644
> --- a/package/libopenssl/Config.in
> +++ b/package/libopenssl/Config.in
> @@ -44,4 +44,151 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
>  	help
>  	  Install additional encryption engine libraries.
>  
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
> +	bool "enable CHACHA "
> +	default y
> +	help
> +	  Enable CHACHA cipher.

There is not point in providing a help text that just repeats the prompt
of the option. Surely, the user expects to enable 'foo' when they select
the 'foo' option, so a help text that just says so is useless.  And in
this case, there is no need for such a helpt text indeed.

But with the proposal I made above, that comment is now moot (but you'll
know for your next patches! ;-) ).

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
> +	bool "enable RC5"
> +	default y
> +	help
> +	  Enable RC5 cipher.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
> +	bool "enable RC2"
> +	default y
> +	help
> +	  Enable RC2 cipher.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4
> +	bool "enable RC4"
> +	default y
> +	help
> +	  Enable RC4 cipher.

Also for the future: keep alphabetical ordering, so that items in a same
category are ordered and easy to find.

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2
> +	bool "enable MD2"
> +	default y
> +	help
> +	  Enable MD2 cipher.

The MD2/4/5 are not ciphers, but hashes. Well, they are hash algorithms.
Well, they are message-digest algorithms. Well, I am not a security
pedant, but they are certainly not ciphers.

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
> +	bool "enable SSL"
> +	default y
> +	help
> +	  Enable SSL mode.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2
> +	bool "enable SSL2"
> +	default y
> +	help
> +	  Enable SSL2 mode.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
> +	bool "enable SSL3"
> +	default y
> +	help
> +	  Enable SSL3 mode.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL
> +	bool "enable WEAK_SSL"
> +	default y
> +	help
> +	  Enable WEAK_SSL mode.

WEAK_SSL is about weak ciphers; it's not a protocol, just the list of
ciphers allowed.

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK
> +	bool "enable mode PSK"
> +	default y
> +	help
> +	  Enable PSK mode.
> +
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST
> +	bool "enable mode CAST"
> +	default y
> +	help
> +	  Enable CAST mode.
> +
> +config BR2_PACKAGE_LIBOPENSSL_UNSECURE
> +	bool "enable unit test, debug, backtrace"
> +	default y
> +	help
> +	  Enable unit-test crypto-mdebug-backtrace
> +	  crypto-mdebug autoerrinit mode.
> +
> +config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
> +	bool "enable dynamic engine"
> +	default y
> +	help
> +	  Enable dynamic engine.
> +
> +

Two empty consecutive lines is one too many.

Running 'make check-package' would hint at this.

> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
> +	bool "enable compression"
> +	default y
> +	help
> +	  Enable compression.
> +
> +

Ditto empty lines.

Would you care to respin your series in the direction I suggest above,
please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
