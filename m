From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Apr 2009 15:41:03 +0200
Subject: [Buildroot] OpenSSL build system knowledge somewhere ?
In-Reply-To: <87ab6i9irh.fsf@macbook.be.48ers.dk>
References: <49E16433.9010707@comcast.net> <87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf> <49E3FEAF.7040705@comcast.net>
	<20090414090907.2c297e77@surf> <20090414104134.6b4d0362@surf>
	<20090415110647.1bf85daa@surf> <87ab6i9irh.fsf@macbook.be.48ers.dk>
Message-ID: <20090415154103.53f867d1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Apr 2009 14:57:38 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> From a quick look it seems to just be a matter of adding
> CFLAG='$(TARGET_CFLAGS) <extra flags>' on the make command line, where
> <extra flags> are the flags openssl uses internally (something like
> -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLCFN -DHAVE_DLFCN_H -DTERMIO).

How do I know, in a proper way, what these <extra flags> are ? (I mean,
without hardcoding them in Buildroot's .mk file)

> The question is why is all of a sudden failed?

I have no idea, I've never myself compiled openssl with external
toolchain.

> I thought I had seen positive reports with external toolchains after
> r23458, where openssl was changed to Makefile.autotools.in format.
> Notice that we used to patch up the Makefile with sed to change the
> compiler flags.

I'd say that something like
http://sources.busybox.net/index.py/trunk/buildroot/package/openssl/openssl.mk?revision=22690&view=markup
(before the Makefile.autotools.in conversion) was probably working
since the Configure script was patched with the value of
$(TARGET_CFLAGS).

What's your suggestion to work around the issue ?

> I'm wondering if it wouldn't be simpler to use a wrapper script around
> gcc / g++ when using external toolchains, which would add -sysroot
> and -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include to the
> argument list instead of all of this.

-I$(STAGING_DIR)/include and -I$(STAGING_DIR)/usr/include are not
needed when --sysroot $(STAGING) is given.

Moreover, the --sysroot option is just part of $(TARGET_CFLAGS), which
might as well contain other flags (march, mtune, mcpu, Os, O2 or
whatever), so the .mk should be written so that the build process of
all packages really take into account $(TARGET_CFLAGS). And if they do,
then there's no point in adding a wrapper script specially for the
--sysroot case.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
