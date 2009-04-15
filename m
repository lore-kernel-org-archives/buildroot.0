From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2009 10:59:00 -0300
Subject: [Buildroot] OpenSSL build system knowledge somewhere ?
In-Reply-To: <87ab6i9irh.fsf@macbook.be.48ers.dk>
References: <49E16433.9010707@comcast.net>	<87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf>	<49E3FEAF.7040705@comcast.net>
	<20090414090907.2c297e77@surf>	<20090414104134.6b4d0362@surf>
	<20090415110647.1bf85daa@surf> <87ab6i9irh.fsf@macbook.be.48ers.dk>
Message-ID: <49E5E824.7070205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:

> From a quick look it seems to just be a matter of adding
> CFLAG='$(TARGET_CFLAGS) <extra flags>' on the make command line, where
> <extra flags> are the flags openssl uses internally (something like
> -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLCFN -DHAVE_DLFCN_H -DTERMIO).
> 
> The question is why is all of a sudden failed? I thought I had seen
> positive reports with external toolchains after r23458, where openssl
> was changed to Makefile.autotools.in format. Notice that we used to
> patch up the Makefile with sed to change the compiler flags.
> 
> I'm wondering if it wouldn't be simpler to use a wrapper script around
> gcc / g++ when using external toolchains, which would add -sysroot
> and -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include to the
> argument list instead of all of this.

Adding this in $(OPENSSL_TARGET_CONFIGURE) just before the end:
$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g"
$(OPENSSL_DIR)/Makefile
$(SED) "s:-O[0-9]:$(TARGET_CFLAGS):" $(OPENSSL_DIR)/Makefile
Gets rid of the "guesstimate" optimizations openssl does and we win on
size optimization while at it.

For ARM EABI old size:
1542542 libcrypto.so.0.9.8
296769 libssl.so.0.9.8

New size:
1435414 libcrypto.so.0.9.8
279543 libssl.so.0.9.8

Regards.
