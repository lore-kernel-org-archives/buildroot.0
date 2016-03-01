From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 01 Mar 2016 22:02:59 +0100
Subject: [Buildroot] [PATCH/next v9 01/28] package/freeswitch: new
	package
References: <1456586838-21197-1-git-send-email-bernd.kuhls@t-online.de>
 <1456586838-21197-2-git-send-email-bernd.kuhls@t-online.de>
 <20160229222127.27db4013@free-electrons.com>
 <m1pfqcxu66.ln2@ID-313208.user.individual.net>
 <20160301101858.70ab1ec8@free-electrons.com>
Message-ID: <3lchqcxu66.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 01 Mar 2016 10:18:58 +0100 schrieb Thomas Petazzoni:

> Bernd,
> 
> On Tue, 01 Mar 2016 07:22:14 +0100, Bernd Kuhls wrote:
> 
>> this is weird, using the same defconfig I can compile freeswitch
>> without problems. Could you please pastebin your whole freeswitch
>> configure log so I can compare it with mine?
> 
> Are you testing with all freeswitch patches applied or just patch 01/28
> ? I am testing with just patch 01/28 applied, which can be a difference
> from your testing scenario.

Hi Thomas,

ok, with 01/28 I can reproduce the bug with your defconfig.
Further including only 02/28 and 03/28 (libuuid) fixes the bug, hm.
Using only 01/28 and manually adding libuuid from util-linux also fixes 
the bug, wt*? Libuuid has nothing to do with libzrtp...

Adding this patch to freeswitch fixes the problem here:

--- a/Makefile.am
+++ b/Makefile.am
@@ -238,7 +238,7 @@ ZRTP_LIBS = -lbn -lzrtp
 libfreeswitch_la_LDFLAGS += $(ZRTP_LDFLAGS)
 libfreeswitch_la_LIBADD += $(ZRTP_LIBS)
 CORE_LIBS += libs/libzrtp/libzrtp.a
-LIBS += libs/libzrtp/third_party/bnlib/libbn.a
+LIBS += libs/libzrtp/third_party/bnlib/libbn.a libs/libzrtp/libzrtp.a
 endif
 
 library_includedir      = $(includedir)

I will send v10 of my series in a few minutes. Could you please test with 
v10 whether the bug is fixed for you or not? If it is fixed, I will send 
the patch upstream. 

Regards, Bernd
