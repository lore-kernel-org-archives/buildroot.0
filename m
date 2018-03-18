From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 23:24:17 +0100
Subject: [Buildroot] [PATCH 4/5] tpm2-tools: new package
In-Reply-To: <20180315125602.26186-4-casantos@datacom.ind.br> (Carlos Santos's
 message of "Thu, 15 Mar 2018 09:56:01 -0300")
References: <20180315125602.26186-1-casantos@datacom.ind.br>
 <20180315125602.26186-4-casantos@datacom.ind.br>
Message-ID: <87lgepdnu6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > TPM (Trusted Platform Module) 2.0 CLI tools based on system API of
 > TPM2-TSS. These tools can be used to manage keys, perform
 > encryption/decryption/signing/etc crypto operations, and manage
 > non-volatile storage through a TPM2.0 HW implementation.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > ---
 >  package/Config.in                                  |  1 +
 >  .../tpm2-tools/0001-Fix-build-with-LibreSSL.patch  | 64 ++++++++++++++++++++++
 >  package/tpm2-tools/Config.in                       | 16 ++++++
 >  package/tpm2-tools/tpm2-tools.hash                 |  3 +
 >  package/tpm2-tools/tpm2-tools.mk                   | 13 +++++
 >  5 files changed, 97 insertions(+)
 >  create mode 100644 package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
 >  create mode 100644 package/tpm2-tools/Config.in
 >  create mode 100644 package/tpm2-tools/tpm2-tools.hash
 >  create mode 100644 package/tpm2-tools/tpm2-tools.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index af94c0ad91..58dfd6306d 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -2013,6 +2013,7 @@ menu "System tools"
 >  	source "package/tar/Config.in"
 >  	source "package/tpm-tools/Config.in"
 >  	source "package/tpm2-abrmd/Config.in"
 > +	source "package/tpm2-tools/Config.in"
 >  	source "package/unscd/Config.in"
 >  	source "package/util-linux/Config.in"
 >  	source "package/xen/Config.in"
 > diff --git a/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch b/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
 > new file mode 100644
 > index 0000000000..0fdd2dc4dd
 > --- /dev/null
 > +++ b/package/tpm2-tools/0001-Fix-build-with-LibreSSL.patch
 > @@ -0,0 +1,64 @@
 > +From 7f8d9359dcf9edbb13bb447f70234397afa4fb05 Mon Sep 17 00:00:00 2001
 > +From: Carlos Santos <casantos@datacom.ind.br>
 > +Date: Tue, 30 Jan 2018 11:21:14 -0200
 > +Subject: [PATCH] Fix build with LibreSSL
 > +
 > +OPENSSL_VERSION_NUMBER is used to test the version of OpenSSL but this
 > +test alone breaks the build with LibreSSL due to implicit declarations
 > +of functions 'RSA_set0_key' and 'HMAC_CTX_free'.
 > +
 > +Test if OpenSSL < 1.1.0 or LIBRESSL_VERSION_NUMBER is defined, instead.
 > +
 > +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 > +---
 > + lib/conversion.c | 2 +-
 > + lib/tpm_kdfa.c   | 6 +++---
 > + 2 files changed, 4 insertions(+), 4 deletions(-)

It would have been good to mention that this patch is now upstream:

https://github.com/tpm2-software/tpm2-tools/commit/0899f5b7acfb0ef1b71518f7b94cf84776018edd

I see that the upstream commit also patches a number of files under
tools/ - Why did you drop those here?

Committed, thanks.

-- 
Bye, Peter Korsgaard
