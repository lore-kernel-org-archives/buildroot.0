From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:20:20 +0200
Subject: [Buildroot] [PATCH 08/12] xfsprogs: depends on MMU
In-Reply-To: <1410537011-29662-9-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:07 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-9-git-send-email-jezz@sysmic.org>
Message-ID: <87egvgbkob.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > Fixes http://sysmic.org/~jezz/results/17f32103:
 > xfs_fsr.o: In function `fsrallfs':
 > /home/jezz/br-continuous/cfgs/45-bf609-bfin-uclibc-nommu-ext/build/xfsprogs-3.1.11/fsr/xfs_fsr.c:617: undefined reference to `_fork'
 > collect2: ld returned 1 exit status

 > madvise.o: In function `madvise_f':
 > /home/jezz/br-continuous/cfgs/45-bf609-bfin-uclibc-nommu-ext/build/xfsprogs-3.1.11/io/madvise.c:111: undefined reference to `_madvise'
 > mincore.o: In function `mincore_f':
 > /home/jezz/br-continuous/cfgs/45-bf609-bfin-uclibc-nommu-ext/build/xfsprogs-3.1.11/io/mincore.c:77: undefined reference to `_mincore'
 > collect2: ld returned 1 exit status

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---
 >  package/xfsprogs/Config.in | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
 > index 3a31dd2..bb7634c 100644
 > --- a/package/xfsprogs/Config.in
 > +++ b/package/xfsprogs/Config.in
 > @@ -2,11 +2,12 @@
 >  comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCLIBC_HAS_OBSOLETE_BSD_SIGNAL enabled"
 >  	depends on BR2_PACKAGE_XFSPROGS
 
 > -comment "xfsprogs needs a toolchain w/ largefile, wchar"
 > -	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 > +comment "xfsprogs needs a toolchain w/ largefile, wchar, MMU"
 > +	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_USE_MMU)

The user typically cannot do anything about the MMU dependency, so we
don't add it to the comment line (but do make the comment depend on MMU
so it's only shown for people who can use it).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
