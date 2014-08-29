From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 29 Aug 2014 16:59:03 +0100
Subject: [Buildroot] [PATCH] libarchive: avoid some tools to build
 statically on shared builds
In-Reply-To: <20140829174237.45f330d0@free-electrons.com>
References: <1409319547-25577-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140829174237.45f330d0@free-electrons.com>
Message-ID: <5400A347.7000708@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/2014 04:42 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Fri, 29 Aug 2014 14:39:07 +0100, Vicente Olivert Riera wrote:
>> Some libarchive tools, like bsdtar, builds statically by default
>> although libarchive itself is being built dynamically. We can force
>> those tools to build the same way as libarchive by using the right
>> configure options.
>>
>> Fixes:
>>    http://autobuild.buildroot.net/results/b8f/b8f7a29787ea1cc5c98e4cbd5f47f257f9b306f2/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/libarchive/libarchive.mk |   24 +++++++++++++++++++++---
>>   1 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
>> index 8c6951d..979e65c 100644
>> --- a/package/libarchive/libarchive.mk
>> +++ b/package/libarchive/libarchive.mk
>> @@ -9,9 +9,27 @@ LIBARCHIVE_SITE = http://www.libarchive.org/downloads
>>   LIBARCHIVE_INSTALL_STAGING = YES
>>   LIBARCHIVE_LICENSE = BSD-2c, BSD-3c
>>   LIBARCHIVE_LICENSE_FILES = COPYING
>> -LIBARCHIVE_CONF_OPT = --without-lzma \
>> -	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
>> -	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
>> +LIBARCHIVE_CONF_OPT = --without-lzma
>> +
>> +ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDTAR),y)
>> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> +LIBARCHIVE_CONF_OPT += --enable-bsdtar=static
>> +else
>> +LIBARCHIVE_CONF_OPT += --enable-bsdtar=shared
>> +endif
>> +else
>> +LIBARCHIVE_CONF_OPT += --disable-bsdtar
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),y)
>> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> +LIBARCHIVE_CONF_OPT += --enable-bsdcpio=static
>> +else
>> +LIBARCHIVE_CONF_OPT += --enable-bsdcpio=shared
>> +endif
>> +else
>> +LIBARCHIVE_CONF_OPT += --disable-bsdcpio
>> +endif
>>
>>   ifeq ($(BR2_PACKAGE_ACL),y)
>>   LIBARCHIVE_DEPENDENCIES += acl
>
> Could you check if it fixes
> http://autobuild.buildroot.org/results/068/068febe05909af15f6620d7925f375c5da154bda/build-end.log ?
>
> Thanks!
>
> Thomas

Confirmed, it also fixes that problem in ARM.

For MIPS, the real problem is this one:
 
http://git.uclibc.org/uClibc/patch/?id=b57e9640db53166c88cdac66b79a046e46b8d728

So we have two options. Apply that patch for uClibc ( another one :-( ), 
or just fix the libarchive package as I did.

For ARM, I don't know what the problem is, because that toolchain (the 
one used in the build log you told me) is not uClibc.

-- 
Vincent
