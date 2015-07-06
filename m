From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jul 2015 09:51:18 +0200
Subject: [Buildroot] [PATCH 1/1] ntp: drop uselss patch fixup which
	sometimes breaks rebuild
In-Reply-To: <20150705220854.GU3647@free.fr> (Yann E. MORIN's message of "Mon, 
 6 Jul 2015 00:08:54 +0200")
References: <1436129545-3540-1-git-send-email-danomimanchego123@gmail.com>
 <20150705220854.GU3647@free.fr>
Message-ID: <87oajpsozt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> package/ntp/ntp.mk | 1 -
 >> 1 file changed, 1 deletion(-)
 >> 
 >> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
 >> index 5f05508..93cefa1 100644
 >> --- a/package/ntp/ntp.mk
 >> +++ b/package/ntp/ntp.mk
 >> @@ -42,7 +42,6 @@ endif
 >> 
 >> define NTP_PATCH_FIXUPS
 >> $(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c

 > As far as I could see, that one line does not do anything either.

Well, it protects the code in ntpd/refclock_pcf.c (which is for an
obscure reference clock kit for the parallel port) which uses the
tm_gmtoff member of struct tm - And that one is only available on uClibc
if it is built with __UCLIBC_HAS_TM_EXTENSIONS__, so I guess it's a very
old build fix for uClibc.

Looking at the git history confirms that, as it comes from:

commit 7129da009cc72575a84a30c4587bd99f745c49d4
Author: Eric Andersen <andersen@codepoet.org>
Date:   Sat Jan 18 21:27:22 2003 +0000

    Merge a bunch of stuff over from the tuxscreen buildroot, with
    many updates to make things be more consistant.
     -Erik

With that said, our uClibc configs DO enable
__UCLIBC_HAS_TM_EXTENSIONS__, so we can indeed drop it. I'll do so now.

-- 
Bye, Peter Korsgaard
