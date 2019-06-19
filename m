From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:33:32 +0200
Subject: [Buildroot] [PATCH 03/27] package/libnss: use correct CFLAGS
 and LDFLAGS
In-Reply-To: <20190614210346.121013-4-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-4-giulio.benetti@micronovasrl.com>
Message-ID: <20190619143332.008d2660@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jun 2019 23:03:22 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> +# Need to pass down TARGET_CFLAGS and TARGET_LDFLAGS
> +define LIBNSS_FIXUP_LINUX_MK
> +	echo 'OS_CFLAGS += ${TARGET_CFLAGS}' >> $(@D)/nss/coreconf/Linux.mk
> +	echo 'LDFLAGS += ${TARGET_LDFLAGS}' >> $(@D)/nss/coreconf/Linux.mk

You should use $(...) and not ${...} to reference make variables.

But beyond that, this commit unfortunately breaks the build:

pqg.c: In function ?PQG_VerifyParams?:
pqg.c:1806:27: error: ?type? may be used uninitialized in this function [-Werror=maybe-uninitialized]
     if ((vfy->h.len == 1) && (type != FIPS186_1_TYPE)) {
                           ^
In file included from pqg.c:21:0:
secmpi.h:8:8: error: ?hashtype? may be used uninitialized in this function [-Werror=maybe-uninitialized]
     if (SECSuccess != (rv = func)) \
        ^
pqg.c:1624:19: note: ?hashtype? was declared here
     HASH_HashType hashtype;
                   ^
cc1: all warnings being treated as errors

And the reason why is because in a BR2_OPTIMIZE_S=y build (the
default), we pass -Os. This -Os is now correctly passed to libnss, but
this is what causes the build failure. Indeed, at -Os, gcc gets those
build failures, but not at -O2.

Could you have a look into this ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
