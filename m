From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 28 Oct 2016 13:26:45 -0700
Subject: [Buildroot] [PATCH 2/2] xen: Remove TARGET_CONFIGURE_OPTS from
	make
In-Reply-To: <CAKmqyKOo+xM5djopNqAAknr5HzGGTh9_vyJj6AyAk_5ipp2m4g@mail.gmail.com>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
 <1473799504-20372-2-git-send-email-alistair.francis@xilinx.com>
 <20161022231827.44cc8d96@free-electrons.com>
 <CAKmqyKOo+xM5djopNqAAknr5HzGGTh9_vyJj6AyAk_5ipp2m4g@mail.gmail.com>
Message-ID: <CAKmqyKPsF-MiNFtj3jRaU4cS0usMs0hYitxvj+FKDAQTUDgnaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 24, 2016 at 12:19 AM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Sat, Oct 22, 2016 at 11:18 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Tue, 13 Sep 2016 13:45:04 -0700, Alistair Francis wrote:
>>> The TARGET_CONFIGURE_OPTS variable resulted in a double definition
>>> error:
>>> <command-line>:0:0: error: "__OBJECT_FILE__" redefined [-Werror]
>>>
>>> Remove the options to avoid the error.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>
>> Yann told me that you found the root cause of the problem during a
>> short investigation session at ELCE.
>
> Hey Thomas,
>
> Yeah, I talked to Yann and we worked out the problem and a hopeful fix.

The hopeful fix did work for this issue, but introduced another problem.

It looks like the Xen 4.7 release just can't handle having the CFLAGS
variable set either in the environment or in the options.

This diff works for me, is this ok? Or should I try to find a Xen
patch to fix it?

diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index e2c797f..90240ec 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -22,8 +22,7 @@ XEN_CONF_OPTS = --disable-ocamltools
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/usr/bin/python2
 XEN_MAKE_ENV = \
        XEN_TARGET_ARCH=$(XEN_ARCH) \
-       CROSS_COMPILE=$(TARGET_CROSS) \
-       $(TARGET_CONFIGURE_OPTS)
+       CROSS_COMPILE=$(TARGET_CROSS)

 ifeq ($(BR2_PACKAGE_XEN_HYPERVISOR),y)
 XEN_MAKE_OPTS += dist-xen
@@ -53,4 +52,8 @@ XEN_INSTALL_TARGET = NO
 XEN_CONF_OPTS += --disable-tools
 endif

+# Remove the CFLAGS setter, otherwise the Xen build system won't append it's
+# own options and will fail to compile.
+XEN_MAKE_OPTS += $(shell echo '$(TARGET_CONFIGURE_OPTS)' | sed
's|CFLAGS=".*"||g')
+
 $(eval $(autotools-package))


Thanks,

Alistair

>
>>
>> Could you share what the conclusion was? When do you expect to submit a
>> patch?
>
> I'm still traveling at the moment, but I should be able to send out
> the new patch this week with an explanation.
>
>>
>> In the mean time, I've marked
>> https://patchwork.ozlabs.org/patch/669641/ as Rejected, since this is
>> clearly not the proper fix for the problem.
>
> Sounds good to me.
>
> Thanks,
>
> Alistair
>
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
