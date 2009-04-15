From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 14:57:38 +0200
Subject: [Buildroot] OpenSSL build system knowledge somewhere ?
In-Reply-To: <20090415110647.1bf85daa@surf> (Thomas Petazzoni's message of
	"Wed\, 15 Apr 2009 11\:06\:47 +0200")
References: <49E16433.9010707@comcast.net>
	<87fxgcbfcp.fsf@macbook.be.48ers.dk> <20090413220823.210225fe@surf>
	<49E3FEAF.7040705@comcast.net> <20090414090907.2c297e77@surf>
	<20090414104134.6b4d0362@surf> <20090415110647.1bf85daa@surf>
Message-ID: <87ab6i9irh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Tue, 14 Apr 2009 10:41:34 +0200,
 Thomas> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

 >> Here, using CC="$(TARGET_CC) $(TARGET_CFLAGS)" allows openssl to find
 >> zlib.h properly. However, it fails later with make thinking that the
 >> -Os and --sysroot options are for him (and not for gcc). The openssl
 >> build system looks strange, I don't have the time to look at time now.
 >> Maybe tomorrow.

 Thomas> I had a quick look, and the openssl build system is
 Thomas> definitely strange.  I don't see how one can pass custom
 Thomas> CFLAGS to this build system (and this is needed to pass
 Thomas> --sysroot $(STAGING_DIR)).

From a quick look it seems to just be a matter of adding
CFLAG='$(TARGET_CFLAGS) <extra flags>' on the make command line, where
<extra flags> are the flags openssl uses internally (something like
-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLCFN -DHAVE_DLFCN_H -DTERMIO).

The question is why is all of a sudden failed? I thought I had seen
positive reports with external toolchains after r23458, where openssl
was changed to Makefile.autotools.in format. Notice that we used to
patch up the Makefile with sed to change the compiler flags.

I'm wondering if it wouldn't be simpler to use a wrapper script around
gcc / g++ when using external toolchains, which would add -sysroot
and -I$(STAGING_DIR)/include -I$(STAGING_DIR)/usr/include to the
argument list instead of all of this.

-- 
Bye, Peter Korsgaard
