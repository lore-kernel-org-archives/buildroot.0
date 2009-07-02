From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Thu, 2 Jul 2009 13:38:23 -0700
Subject: [Buildroot] uClibc, gcc get rebuilt on every make
In-Reply-To: <0E8C14EA-CCA7-4F45-8E17-14321FFB4407@phidgets.com>
References: <0E8C14EA-CCA7-4F45-8E17-14321FFB4407@phidgets.com>
Message-ID: <206b9e70907021338s137bdb6fw35e4f35bf38581e4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 9, 2008 at 10:23 AM, Patrick McNeil <patrick@phidgets.com>wrote:

> I'm using svn24232, arm920t, with gcc and headers on the target. Every time
> I run make, even if I haven't made any changes, the cross compiler
> toolchain, as well as the target gcc, and uClibc gets rebuilt, taking about
> half an hour. Any ideas what this is depending on? I know that buildroot
> from a few months ago did not do this.
>

Just in case the issue is still there, this is what I did to resolve it:

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index c8da464..6dff66c 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -481,7 +482,7 @@ uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
        touch -c $(UCLIBC_DIR)/.config


-$(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
+$(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial)
$(LIBFLOAT_TARGET)
 ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
        $(MAKE1) -C $(UCLIBC_DIR) \
                PREFIX= \

This also fixes the issue you sent in another mail where libc.a would get
modified after the initial build and so simply typing "make" again was
enough to break symbols in libc.a (e.g. python's division).

The better way would probably to figure out what is touching
$(UCLIBC_DIR)/lib/libc.a after the initial build and fix that so that make
doesn't see a dependency that is newer than the
$(STAGING_DIR)/usr/lib/libc.a target, but I'm not sure that is easily
possible given the build sequence.

Zac
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090702/ede55513/attachment.htm>
