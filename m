From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 18 Feb 2020 15:06:47 +0100
Subject: [Buildroot] [PATCH 2/4] package/volume_key: add new package
In-Reply-To: <20bd5175-2e2c-a2b8-0ff0-350d58e01a9b@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-3-giulio.benetti@benettiengineering.com>
 <20200217195114.7336e67e@windsurf>
 <20bd5175-2e2c-a2b8-0ff0-350d58e01a9b@benettiengineering.com>
Message-ID: <7785b80a-8198-23ed-5bed-9485c0a31075@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/18/20 2:46 PM, Giulio Benetti wrote:
> Hi Thomas,
> 
> On 2/17/20 7:51 PM, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 17 Feb 2020 15:30:28 +0100
>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>
>>> diff --git a/DEVELOPERS b/DEVELOPERS
>>> index 6f2dbbb11a..5276c09384 100644
>>> --- a/DEVELOPERS
>>> +++ b/DEVELOPERS
>>> @@ -1016,6 +1016,7 @@ F:	package/minicom/
>>>    F:	package/nfs-utils/
>>>    F:	package/sunxi-mali-mainline/
>>>    F:	package/sunxi-mali-mainline-driver/
>>> +F:	package/volume_key/
>>
>> Would you mind naming the package volume-key instead of volume_key ?
> 
> Sure
> 
>>> diff --git a/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch b/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
>>> new file mode 100644
>>> index 0000000000..44d6ee0d4b
>>> --- /dev/null
>>> +++ b/package/volume_key/0001-configure.ac-remove-po-Makefile.in-entry-from-AC_CON.patch
>>> @@ -0,0 +1,28 @@
>>> +From d1142e667f4f2f2fcd2d36a006919325c1a4377e Mon Sep 17 00:00:00 2001
>>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> +Date: Sat, 25 Jan 2020 17:24:38 +0100
>>> +Subject: [PATCH] configure.ac: remove po/Makefile.in entry from
>>> + AC_CONFIG_FILES
>>> +
>>> +AC_CONFIG_FILES should not contain po/Makefile.in file because
>>> +gettextize will re-add it again causing build failure.
>>> +
>>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Was this reported upstream?
> 
> Not this patch, because the issue happens only when gettextizing, and if
> instead you build without getextizing it fails. So I don't think
> upstream will be interested about it, what do you think?
> This was a doubt I had while dealing with this.
> 
>>> diff --git a/package/volume_key/Config.in b/package/volume_key/Config.in
>>> new file mode 100644
>>> index 0000000000..0c0827253d
>>> --- /dev/null
>>> +++ b/package/volume_key/Config.in
>>> @@ -0,0 +1,19 @@
>>> +config BR2_PACKAGE_VOLUME_KEY
>>> +	bool "volume_key"
>>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # cryptsetup, libassuan, libglib2, libgpgme, libnss
>>> +	depends on BR2_USE_MMU # cryptsetup, libassuan, libglib2, libgpgme
>>> +	depends on !BR2_STATIC_LIBS # cryptsetup, libnss
>>> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup
>>> +	depends on BR2_USE_WCHAR # libglib2
>>> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpgme, libassuan
>>> +	select BR2_PACKAGE_CRYPTSETUP
>>> +	select BR2_PACKAGE_LIBASSUAN
>>> +	select BR2_PACKAGE_LIBGLIB2
>>> +	select BR2_PACKAGE_LIBGPGME
>>> +	select BR2_PACKAGE_LIBNSS
>>> +	help
>>> +	  The volume_key project provides a libvolume_key, a library for manipulating
>>> +	  storage volume encryption keys and storing them separately from volumes, and an
>>> +	  associated command-line tool, named volume_key.
>>> +
>>> +	  https://pagure.io/volume_key
>>
>> You need a Config.in comment about the (numerous) dependencies.
> 
> Oh yes,completely forgotten!
> 
>>> diff --git a/package/volume_key/volume_key.mk b/package/volume_key/volume_key.mk
>>> new file mode 100644
>>> index 0000000000..8d5bff6d8e
>>> --- /dev/null
>>> +++ b/package/volume_key/volume_key.mk
>>> @@ -0,0 +1,22 @@
>>> +################################################################################
>>> +#
>>> +# volume_key
>>> +#
>>> +################################################################################
>>> +
>>> +VOLUME_KEY_VERSION = f56614199726ba1897d8687f0927535693b6603f
>>
>> Why not use the 0.3.12 release ?
> 
> Right
> 
>>> +VOLUME_KEY_SITE = https://pagure.io/volume_key.git
>>> +VOLUME_KEY_SITE_METHOD = git
>>> +VOLUME_KEY_LICENSE = GPL-2.0+
>>
>> I don't see the "or later" option in any of the source files, so shouldn't this be GPL-2.0 ?
> 
> Right
> 
>>> +VOLUME_KEY_LICENSE_FILES = COPYING
>>> +VOLUME_KEY_DEPENDENCIES = cryptsetup libglib2 libgpgme libnss $(TARGET_NLS_DEPENDENCIES)
>>> +VOLUME_KEY_INSTALL_STAGING = YES
>>> +VOLUME_KEY_AUTORECONF = YES
>>> +VOLUME_KEY_GETTEXTIZE = YES
>>> +
>>> +VOLUME_KEY_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
>>
>> The --with-sysroot option always looks weird. What is this needed for ?
> 
> This is a mistake, it's been left there after several tries. Sorry.
> 
>>> +		       --with-gpgme-prefix=$(STAGING_DIR)/usr \
>>> +		       --without-python \
>>> +		       --without-python3
>>> +
>>> +$(eval $(autotools-package))
>>
>> In the configure.ac file, I see:
>>
>> AC_PATH_PROG([GPG], [gpg2])
>> AC_ARG_VAR([GPG])
>> AC_DEFINE_UNQUOTED([GPG_PATH], "$GPG", [Path to the gpg2 executable])
>>
>> So don't we need gnupg on the host for this to work ?
> 
> Yes, host-gnupg2, I've missed it since my distro provides it.

I've retried building, gnupg2 only is supported but it's not mandatory 
to build. So as I can understand we can avoid adding host-gnupg2.

>> I see:
>>
>> PKG_CHECK_MODULES(blkid, [blkid])
>>
>> don't we need the blkid library from util-linux ? I see it is selected
>> by cryptsetup, which is why it works.
> 
> Yes, but if cryptsetup already selects it, do I need to repeat it in
> volume-key dependencies?
> 
> Best regards
> 

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
