From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Feb 2017 15:02:17 +0100
Subject: [Buildroot] [PATCH 1/2] libevent: disable sample programs to
	workaround static linking issue
In-Reply-To: <20170209102952.6351-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 9 Feb 2017 11:29:51 +0100")
References: <20170209102952.6351-1-peter@korsgaard.com>
Message-ID: <87wpczmphy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/1e7/1e7027b1b87d88b4517b1b19d3a2ae54c24f2c10/
 > http://autobuild.buildroot.net/results/ff7/ff7e010b41e7448d15d20396e9e9bd7319dd493b/
 > http://autobuild.buildroot.net/results/269/269a3a76f61c65423ba703a85e94cc003fb75e4c/

 > Libevent/libtool gets confused by the library order when statically linking
 > the sample programs and passes -lz before -lcrypto even though libcrypto
 > uses zlib.

 > /bin/bash ./libtool --tag=CC --mode=link ..  -o sample/https-client \
 > 	sample/https-client.o sample/hostcheck.o \
 > 	sample/openssl_hostname_validation.o libevent.la \
 > 	libevent_openssl.la -lssl -lcrypto -lz -lz -lcrypto

 > libtool: link: ..  -o sample/https-client sample/https-client.o \
 > 	sample/hostcheck.o sample/openssl_hostname_validation.o \
 > 	./.libs/libevent.a ./.libs/libevent_openssl.a \
 > 	-lssl -lz -lcrypto

 > ../libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
 > c_zlib.c:(.text+0x30): undefined reference to `inflate'

 > This is most likely fixable, but as the sample programs aren't installed /
 > used, simply skip building them to save time and work around this issue.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
