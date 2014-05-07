From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 07 May 2014 21:37:13 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
	instead of 'undefined'
In-Reply-To: <CAAXf6LUKatxzDZOWC4tWq28rS3m_BcYT7Zg80Ea5HDz-C0O=nQ@mail.gmail.com>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
 <3dba42f3-d595-4415-bd38-3220738fe4b6@email.android.com>
 <CAAXf6LUKatxzDZOWC4tWq28rS3m_BcYT7Zg80Ea5HDz-C0O=nQ@mail.gmail.com>
Message-ID: <d2a5d78d-c512-4fad-ae86-fbb5bcc42d8f@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> schreef:
>Hi,
>
>On Tue, May 6, 2014 at 10:05 PM, Thomas De Schampheleire
><patrickdepinguin@gmail.com> wrote:
>> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
>>>Dear Thomas De Schampheleire,
>>>
>>>On Tue, 06 May 2014 12:51:19 +0200, Thomas De Schampheleire wrote:
>>>> This patch causes the log messages to change from:
>>>>
>>>> >>> toolchain-external undefined Downloading
>>>> >>> toolchain-external undefined Extracting
>>>> ...
>>>>
>>>> to
>>>>
>>>> >>> toolchain-external virtual Downloading
>>>> >>> toolchain-external virtual Extracting
>>>> ...
>>>>
>>>> and similar for 'toolchain' and 'toolchain-buildroot', simply because it
>>>> looks nicer.
>>>> At the same time, the directory names also become toolchain-virtual,
>>>> toolchain-buildroot-virtual, toolchain-external-virtual instead of the
>>>> corresponding 'undefined' variants.
>>>>
>>>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>>
>>>Shouldn't we instead migrate these to use the virtual package
>>>infrastructure, and make this infrastructure define this magic 'virtual'
>>>version?
>>
>> I tried using virtual-package in toolchain/toolchain/toolchain.mk, but TOOLCHAIN_VERSION becomes empty, while HOST_TOOLCHAIN_VERSION is virtual.
>>
>
>Quick update:
>
>- Yann mentioned on IRC a comment he wrote in a mail when the virtual
>string was introduced. I think the below is the comment Yann refers
>to:
>
>http://lists.busybox.net/pipermail/buildroot/2014-April/093670.html
>" - the version string is strange. This does not work:
>        $(2)_VERSION = virtual
>    so I had to come up with the solution in patch 20.
>"
>
>that solution in patch 20 is:
>
>+# Fake a version string, so it looks nicer in the build log
>+$(3)_VERSION = virtual
>+HOST_$(3)_VERSION = virtual
>+
>
>
>The code I was using originally is:
>
>diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
>--- a/toolchain/toolchain/toolchain.mk
>+++ b/toolchain/toolchain/toolchain.mk
>@@ -4,8 +4,6 @@
> #
> ################################################################################
>
>-TOOLCHAIN_SOURCE =
>-
> ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> TOOLCHAIN_DEPENDENCIES += toolchain-buildroot
> else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
>@@ -14,6 +12,10 @@ endif
>
> TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
>
>-$(eval $(generic-package))
>+$(eval $(virtual-package))
>
> toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
>+
>+foo:
>+       @echo TOOLCHAIN_VERSION = $(TOOLCHAIN_VERSION)
>+       @echo HOST_TOOLCHAIN_VERSION = $(HOST_TOOLCHAIN_VERSION)
>
>
>
>In this case of using virtual-package, the output of 'make foo' is:
>TOOLCHAIN_VERSION =
>HOST_TOOLCHAIN_VERSION = virtual
>
>
>And if I change the code to use host-virtual-package iso
>virtual-package, the output is (surprisingly):
>TOOLCHAIN_VERSION = virtual
>HOST_TOOLCHAIN_VERSION =
>
>So there is definitely something odd going on here.
>
>If I print the parameters to the infra: (for virtual and host-virtual
>respectively):
>1=toolchain 2=TOOLCHAIN 3=TOOLCHAIN 4=target
>1=host-toolchain 2=HOST_TOOLCHAIN 3=TOOLCHAIN 4=host
>
>so the code
>$(3)_VERSION = virtual
>HOST_$(3)_VERSION = virtual
>
>is supposed to work fine in either case, as would the original
>$(2)_VERSION
>by the way.
>
>Looking at printvars doesn't tell much more:
>virtual-package:
>HOST_TOOLCHAIN_VERSION=virtual (virtual)
>TOOLCHAIN_BASE_NAME=toolchain- (toolchain-$(TOOLCHAIN_VERSION))
>TOOLCHAIN_VERSION= ()
>
>host-virtual-package:
>HOST_TOOLCHAIN_BASE_NAME=host-toolchain-
>(host-toolchain-$(HOST_TOOLCHAIN_VERSION))
>HOST_TOOLCHAIN_VERSION= ()
>TOOLCHAIN_VERSION=virtual (virtual)
>
>
>I'm a little puzzled at the moment on how to proceed...

My current assumption is that there is some interference between the virtual and generic infra wrt the version variables...
