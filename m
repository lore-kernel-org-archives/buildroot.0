From: Zac Wheeler <zac.wheeler@gmail.com>
Date: Sun, 5 Jul 2009 11:56:42 -0700
Subject: [Buildroot] uClibc, gcc get rebuilt on every make
In-Reply-To: <20090705131212.GB21416@toto>
References: <20090705131212.GB21416@toto>
Message-ID: <206b9e70907051156t727d1a12uc7436668ab474c99@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 5, 2009 at 6:12 AM, <simon.addareyss@online.fr> wrote:

> It would be great if you could submit a little patch...
>
> For now, I keep using the first (not clean) option, no time to dive into
> the second one right now.
>

This is it - just a pipe before the libc.a dependency to make it order-only:

diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 6dff66c..f9eef88 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -482,7 +482,7 @@ uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
        touch -c $(UCLIBC_DIR)/.config


-$(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
+$(STAGING_DIR)/usr/lib/libc.a: | $(UCLIBC_DIR)/lib/libc.a
 ifneq ($(BR2_TOOLCHAIN_SYSROOT),y)
        $(MAKE1) -C $(UCLIBC_DIR) \
                PREFIX= \
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090705/8a34d5e5/attachment.htm>
