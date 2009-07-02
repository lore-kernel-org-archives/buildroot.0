From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 2 Jul 2009 23:07:47 +0200
Subject: [Buildroot] uClibc, gcc get rebuilt on every make
In-Reply-To: <206b9e70907021338s137bdb6fw35e4f35bf38581e4@mail.gmail.com>
References: <0E8C14EA-CCA7-4F45-8E17-14321FFB4407@phidgets.com>
	<206b9e70907021338s137bdb6fw35e4f35bf38581e4@mail.gmail.com>
Message-ID: <20090702210747.GE14135@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 02, 2009 at 01:38:23PM -0700, Zac Wheeler wrote:
>On Tue, Dec 9, 2008 at 10:23 AM, Patrick McNeil <patrick@phidgets.com>wrote:
>
>> I'm using svn24232, arm920t, with gcc and headers on the target. Every time
>> I run make, even if I haven't made any changes, the cross compiler
>> toolchain, as well as the target gcc, and uClibc gets rebuilt, taking about
>> half an hour. Any ideas what this is depending on? I know that buildroot
>> from a few months ago did not do this.
>>
>
>Just in case the issue is still there, this is what I did to resolve it:
>
>diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
>index c8da464..6dff66c 100644
>--- a/toolchain/uClibc/uclibc.mk
>+++ b/toolchain/uClibc/uclibc.mk
>@@ -481,7 +482,7 @@ uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
>        touch -c $(UCLIBC_DIR)/.config
>
>
>-$(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
>+$(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial)

This doesn't sounds clean to me. My current working theory:
http://repo.or.cz/w/buildroot.git?a=blob;f=toolchain/uClibc/uclibc.mk;h=5b4e0c6a02daff5a5c498a2d277eb628ca15aad5;hb=HEAD#l509
http://repo.or.cz/w/buildroot.git?a=blob;f=toolchain/uClibc/uclibc.mk;h=5b4e0c6a02daff5a5c498a2d277eb628ca15aad5;hb=HEAD#l550

Again, i invite people to port improvements from my tree to the repo..

HTH,
>$(LIBFLOAT_TARGET)
> ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
>        $(MAKE1) -C $(UCLIBC_DIR) \
>                PREFIX= \
>
>This also fixes the issue you sent in another mail where libc.a would get
>modified after the initial build and so simply typing "make" again was
>enough to break symbols in libc.a (e.g. python's division).
>
>The better way would probably to figure out what is touching
>$(UCLIBC_DIR)/lib/libc.a after the initial build and fix that so that make
>doesn't see a dependency that is newer than the
>$(STAGING_DIR)/usr/lib/libc.a target, but I'm not sure that is easily
>possible given the build sequence.
>
>Zac

>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
