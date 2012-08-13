From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 13 Aug 2012 18:13:18 +0800
Subject: [Buildroot] [PATCH 3/5] buildroot: patch kernel by kernel
	version
In-Reply-To: <20120811200824.0293829b@skate>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
 <1344330577-25159-3-git-send-email-sonic.adi@gmail.com>
 <20120811200824.0293829b@skate>
Message-ID: <CAJxxZ0PRqC6EHzhg_EcSodgoCWvk8uzYAQDWEnbi=im8VOL9=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Aug 12, 2012 at 2:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 7 Aug 2012 17:09:35 +0800,
> Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>
>> +KERNELVERSION=$(shell cat $(LINUX_SOURCE_DIR)/Makefile | awk 'BEGIN { FS = " *= *" }  NF != 2 { next } $$1 == "VERSION" { maj = $$2} $$1 == "PATCHLEVEL" { mid = $$2 } $$1 == "SUBLEVEL" { mic = $$2 } END {print maj "." mid "." mic}')
>
> This sounds horribly fragile.
>
>>  ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
>>  KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_INTREE_DTS_NAME)
>>  else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
>> @@ -149,7 +151,7 @@ define LINUX_APPLY_PATCHES
>>               if echo $$p | grep -q -E "^ftp://|^http://" ; then \
>>                       support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $(DL_DIR) `basename $$p` ; \
>>               elif test -d $$p ; then \
>> -                     support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $$p linux-\*.patch ; \
>> +                     support/scripts/apply-patches.sh $(LINUX_SOURCE_DIR) $$p linux-$(KERNELVERSION)-\*.patch ; \
>
> Generally, we want to move away from patches having a version number in
> their name. For the packages for which multiple versions are supported,
> the patches should be organized in subdirectories named after the
> version. So instead of this patch, just organize your kernel patches in
> directories named linux-patches-3.2/, linux-patches-3.4/, etc.
>

This fine.


Sonic
