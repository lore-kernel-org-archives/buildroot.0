From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Nov 2018 23:40:51 +0100
Subject: [Buildroot] [PATCH v2] libcurl: Allow selection of TLS package
 libcurl will use
In-Reply-To: <89e08627-ea80-393e-53da-c8ab90df66f1@mind.be> (Arnout
 Vandecappelle's message of "Fri, 9 Nov 2018 22:56:52 +0100")
References: <20181108222517.20629-1-tpiepho@impinj.com>
 <89e08627-ea80-393e-53da-c8ab90df66f1@mind.be>
Message-ID: <878t217u30.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +choice
 >> +	prompt "SSL/TLS library to use"
 >> +
 >> +config BR2_PACKAGE_LIBCURL_OPENSSL
 >> +	bool "OpenSSL"
 >> +	depends on BR2_PACKAGE_OPENSSL

 >  I don't really like this depends. I would rather revert it into a select. So:

 > choice
 > 	prompt "SSL/TLS library to use"

 > config BR2_PACKAGE_LIBCURL_OPENSSL
 > 	bool "openssl"
 > 	select BR2_PACKAGE_OPENSSL

 > ...

 > config BR2_PACKAGE_LIBCURL_NONE
 > 	bool "disable TLS"

 > endchoice

 >  Note that that means that libcurl will by default select openssl, which was not
 > the case before. However, I think it makes complete sense to default to enabling
 > TLS support in libcurl. Peter, what do you think? This would obviously have to
 > be mentioned in the release notes because the behaviour of existing configs
 > would change.

Either that or add a:

 depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || \
          BR2_PACKAGE_LIBNSS || BR2_PACKAGE_MBEDTLS

To the choice option and drop the _LIBCURL_NONE variant. With that we
have the same behaviour as before, except that you _CAN_ select the TLS
provider in case multiple providers are available.

-- 
Bye, Peter Korsgaard
