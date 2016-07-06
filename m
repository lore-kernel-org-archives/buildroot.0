From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 5 Jul 2016 23:43:52 -0300 (BRT)
Subject: [Buildroot] [PATCH v5] util-linux: rework utilities menu for
 finer control
In-Reply-To: <f4fa0b18-1280-1fa5-908a-d12a0fc621a2@gmail.com>
References: <1464982539-26551-1-git-send-email-casantos@datacom.ind.br>
 <1465266353-5834-1-git-send-email-casantos@datacom.ind.br>
 <f4fa0b18-1280-1fa5-908a-d12a0fc621a2@gmail.com>
Message-ID: <1275872201.8394962.1467773032223.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Romain Naour" <romain.naour@gmail.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "thomas petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Tuesday, July 5, 2016 12:11:33 PM
> Subject: Re: [Buildroot] [PATCH v5] util-linux: rework utilities menu for finer control

> Hi Carlos,
> 
> Le 07/06/2016 ? 04:25, Carlos Santos a ?crit :
>> When even a single extra util-linux utility is enabled, the
>> default build and install will install many more programs,
>> including many that overlap with those offered by busybox.
>> 
>> Fix by reworking the install-utilies menu to take advantage
>> of the new --disable-all-programs config option.  This option
>> make it possible to disable the basic set of apps, and then
>> enable only the desired apps.
>> 
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> ---
>> 
>> Changes v1 -> v2:
>>   - Rework to incorporate ideas and suggestions from Thomas Petazzoni
>>     and Arnout Vandecappelle.  At least, in spirit.
>> 
>> Changes v2 -> v3:
>>   - Change BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES to
>>     BR2_PACKAGE_UTIL_LINUX_BINARIES, to conserve backwards-
>>     compatibility without need for a legacy option.
>>   - Enable 'Basic set' by default to match output of previous
>>     build when binaries were selected.
>> 
>> Changes v3 -> v4:
>>   - Rework to apply on top of master branch
>> 
>> Changes v4 -> v5:
>>   - Add option to control installation of libfdisk.
>>   - Fine-grained selection of libraries in custom selection of
>>     utilities.
>>   - Document that linux32, linux64, uname26, i386 and x86_64 are
>>     setarch aliases.
>>   - Add options to instal cal, ipcrm, ipcs, logger, lslogin and pg.
>>   - Remove options to install findfs and lsblk because there are no
>>     corresponding --enable- and --disable- configure options.
>> ---
>>  package/util-linux/Config.in     | 117 ++++++++++++++++++++++++++++++++++-----
>>  package/util-linux/util-linux.mk |  23 +++++---
>>  2 files changed, 116 insertions(+), 24 deletions(-)
>> 
>> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
>> index 8a36c0a..d002495 100644
>> --- a/package/util-linux/Config.in
>> +++ b/package/util-linux/Config.in
>> @@ -18,6 +18,14 @@ config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>>  	help
>>  	  Install libblkid.
>>  
>> +config BR2_PACKAGE_UTIL_LINUX_LIBFDISK
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>> +	depends on BR2_USE_MMU # fork
>> +	bool "libfdisk"
>> +	help
>> +	  Install libfdisk.
>> +
>>  config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>>  	depends on BR2_USE_MMU # util-linux/libblkid
>> @@ -36,18 +44,62 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
>>  	help
>>  	  Install libuuid.
>>  
>> +choice
>> +	prompt "Install utilities"
>> +	default BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
>> +	bool "none"
>> +	help
>> +	  Disable all util-linux binaries.
>> +
>> +config BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES
>> +	bool "all"
>> +	depends on BR2_USE_MMU # fork()
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
>> +	select BR2_PACKAGE_LINUX_PAM  # login utils
>> +	select BR2_PACKAGE_ZLIB  # cramfs
>> +	select BR2_PACKAGE_NCURSES  # more, setterm, ul
>> +	select BR2_PACKAGE_LIBCAP_NG  # setpriv
>> +	help
>> +	  Install the complete set of util-linux binaries.
>> +
>>  config BR2_PACKAGE_UTIL_LINUX_BINARIES
>> -	bool "install utilities"
>> +	bool "custom"
>>  	depends on BR2_USE_MMU # fork()
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
>> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>>  	help
>> -	  Install the basic set of util-linux binaries.
>> +	  Manually select which util-linux binaries to install.
>> +
>> +endchoice
>>  
>>  if BR2_PACKAGE_UTIL_LINUX_BINARIES
>>  
>> +config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
>> +	bool "Basic set"
> 
> Use "basic set" instead since all other option are lowercase.

Lowercase options correspond to package/utility/library names. I will change the other options to match this criterion.

> 
>> +	default y
> 
> missing depends on BR2_USE_MMU # fork()

OK, I will fine-tune the declaration of these dependencies.

Carlos Santos (Casantos)
DATACOM, P&D
