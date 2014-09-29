From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 29 Sep 2014 11:31:25 +0200
Subject: [Buildroot] [PATCH 2 of 2] kmod: add patches to support build
	on Redhat 5
In-Reply-To: <87iok7wppd.fsf@dell.be.48ers.dk>
References: <patchbomb.1409649944@localhost>
 <f2b8b2b5efec1b2340c4.1409649946@localhost>
 <87iok7wppd.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVzr2B-gF1RQiELS_vM52Boopv4X5H17XkJ99aXCX2Z6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 28, 2014 at 8:43 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > # HG changeset patch
>  > # User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
>  > # Date 1407153133 -7200
>  > #      Mon Aug 04 13:52:13 2014 +0200
>  > # Node ID f2b8b2b5efec1b2340c423f14f12df11a95ceac7
>  > # Parent  2c7735c0247a4c83a3c2ea1d58e74be613465255
>  > kmod: add patches to support build on Redhat 5
>
>  > kmod uses certain features not available on older Redhat 5 machines.
>  > This commit imports two patches from OpenEmbedded to fix that.
>
>  > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
>  > ---
>  >  package/kmod/kmod-0001-fix-O_CLOEXEC.patch                    |  38 ++++++
>  >  package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch |  41 +++++++
>  >  2 files changed, 79 insertions(+), 0 deletions(-)
>
>
> The first patch looks ok, but:
>
>  > diff --git a/package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch b/package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch
>  > new file mode 100644
>  > --- /dev/null
>  > +++ b/package/kmod/kmod-0002-use-bswap-instead-of-htobe-betoh.patch
>  > @@ -0,0 +1,41 @@
>  > +From 0c4dbadc9db3cda1cfca64e44ea08c6e89919ea7 Mon Sep 17 00:00:00 2001
>  > +From: Ting Liu <b28495@freescale.com>
>  > +Date: Tue, 10 Sep 2013 13:44:18 +0800
>  > +Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
>  > +
>  > +We can't use htobe* and be*toh functions because they are not
>  > +available on older versions of glibc, For example, shipped on Centos 5.5.
>  > +
>  > +Change to directly calling bswap_* as defined in+byteswap.h.
>  > +
>  > +Upstream-Status: Inappropriate
>  > +
>  > +Signed-off-by: Ting Liu <b28495@freescale.com>
>  > +---
>  > + libkmod/libkmod-signature.c |    3 ++-
>  > + 1 files changed, 2 insertions(+), 1 deletions(-)
>  > +
>  > +diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
>  > +index 6b80caa..3544a36 100644
>  > +--- a/libkmod/libkmod-signature.c
>  > ++++ b/libkmod/libkmod-signature.c
>  > +@@ -19,6 +19,7 @@
>  > +  */
>  > +
>  > + #include <endian.h>
>  > ++#include <byteswap.h>
>  > + #include <stdint.h>
>  > + #include <stdlib.h>
>  > + #include <string.h>
>  > +@@ -121,7 +122,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
>  > +                    modsig->hash >= PKEY_HASH__LAST ||
>  > +                    modsig->id_type >= PKEY_ID_TYPE__LAST)
>  > +            return false;
>  > +-   sig_len = be32toh(get_unaligned(&modsig->sig_len));
>  > ++   sig_len = bswap_32(get_unaligned(&modsig->sig_len));
>
> Ehh, so what happens when we want to build kmod for a big endian target?
>

Hmm, indeed, that doesn't seem right.
I found another patch that looks better [1], sent to the linux-modules
mailing list in September 2013, received some comments and a v2 was
promised but never arrived (AFAICS). I will adopt the patch and fix
the comments, then resend to buildroot + linux-modules.

[1] http://www.spinics.net/lists/linux-modules/msg01127.html

Thanks,
Thomas
