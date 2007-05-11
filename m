From: David Claffey <david.claffey@rcn.com>
Date: Fri, 11 May 2007 12:29:53 -0400
Subject: [Buildroot] kernel patch not applied
In-Reply-To: <20070511154059.GA4710@aon.at>
References: <46432A7D.6050808@rcn.com> <46433B79.50101@rcn.com>
	<1178893909.11554.75.camel@localhost.localdomain>
	<20070511154059.GA4710@aon.at>
Message-ID: <46449A01.6010701@rcn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The braces expansion issue is different.

kernel-headers-new.makefile and linux26.mk .patched targets overlap.

$(LINUX_HEADERS_UNPACK_DIR)/.patched:
$(LINUX26_DIR)/.patched:

The kernel-headers target pulls in linux-$(LINUX_HEADERS_VERSION)-* patches,
while the linux26.mk is explicitly pulling in any patches placed in the
$(BR2_BOARD_PATH)/kernel-patches directory.

The latter does not occur because the kernel-headers rule satisfies the
dependency early on.

Bernhard Fischer wrote:
> On Fri, May 11, 2007 at 04:31:49PM +0200, Hans-Christian Egtvedt wrote:
>>> This actually causes an override of the .patched target in
>>> toolchain/kernel-headers/kernel-headers-new.makefile.
>>>
>>> Suggestions?
>> I just bumped into the same issue myself.
>>
>> in toolchain/kernel-headers/kernel-headers-new.makefile
>>
>> I had to change
>>
>> $(LINUX_HEADERS_UNPACK_DIR)/.patched:
>> $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
>>        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
>> toolchain/kernel-headers \
>>                linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
>> ifeq ($(BR2_PACKAGE_OPENSWAN),y)
>>        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
>>                linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
>> endif
>>        touch $@
>>
>>
>> to
>>
>> $(LINUX_HEADERS_UNPACK_DIR)/.patched:
>> $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
>>        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR)
>> toolchain/kernel-headers \
>>                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
>> ifeq ($(BR2_PACKAGE_OPENSWAN),y)
>>        toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
>>                linux-$(LINUX_HEADERS_VERSION)-\*.patch.\*
> 
> which means that your shell just doesn't expand ba{r,z}
> 
> We use patterns also to specify targets we intend to strip, so either
> use a different shell or fix all occurances, i'd say.
> 
