From: Steve Kenton <skenton@ou.edu>
Date: Mon, 02 Feb 2015 08:59:43 -0600
Subject: [Buildroot] [PATCH 1/2] Cdrtools is a set of command line
 programs that allows to record CD/DVD/BluRay media. This package contains
 the cdrecord & mkisofs programs.
In-Reply-To: <20150202103558.6be64110@free-electrons.com>
References: <1422855653-6338-1-git-send-email-skenton@ou.edu>
 <20150202103558.6be64110@free-electrons.com>
Message-ID: <54CF90DF.9020504@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/2/2015 3:35 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
>
> Have you looked at the 'cdrkit' package? I believe it bundles the same
> tools as cdrtools, but with a sane build system and not this
> brain-damaged build system that cdrtools uses
Yes, I started with cdrkit, but genisofs and wodim did not do everything 
we needed.
We're needing UDF support and while I like xorriso it also does not do 
everything we need.
I don't remember right off what all went wrong but it was with some 
reluctance that I returned to cdrtools
for the reasons you mention.  Jorg Shilly does seem to do things his own 
way....
>
> That being said, here is a review of your patch below.
>
> First, the title should be simply:
>
> 	cdrtools: new package
>
> On Mon,  2 Feb 2015 05:40:52 +0000, Steve Kenton wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index dd011be..1748e88 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -6,6 +6,7 @@ menu "Audio and video applications"
>>   	source "package/alsa-utils/Config.in"
>>   	source "package/aumix/Config.in"
>>   	source "package/bellagio/Config.in"
>> +	source "package/cdrtools/Config.in"
> Since it's really the same sort of tools than cdrkit, I'd rather see
> cdrtools next to cdrkit in the menus.
OK
>
>> diff --git a/package/cdrtools/Config.in b/package/cdrtools/Config.in
>> new file mode 100644
>> index 0000000..8583cec
>> --- /dev/null
>> +++ b/package/cdrtools/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_CDRTOOLS
>> +	bool "cdrtools"
>> +	depends on BR2_USE_WCHAR&&  BR2_LARGEFILE
> We generally put this on two separate lines.
OK
>
>> +	help
>> +	  Cdrtools is a set of command line programs that
>> +	  allows to record CD/DVD/BluRay media. This
>> +	  package contains the cdrecord&  mkisofs programs.
>> +	
>> +	  http://sourceforge.net/projects/cdrtools
>> +
>> +comment "cdrtools needs a toolchain w/ wchar, largefile"
>> +	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE
>> diff --git a/package/cdrtools/cdrtools.mk b/package/cdrtools/cdrtools.mk
>> new file mode 100644
>> index 0000000..a732e69
>> --- /dev/null
>> +++ b/package/cdrtools/cdrtools.mk
>> @@ -0,0 +1,21 @@
>> +#############################################################
>> +#
>> +# cdrtools
>> +#
>> +#############################################################
> You should have 80 # signs for the header. And one empty new line
> between the header and the first variable.
Oops
>
>> +CDRTOOLS_VERSION = 3.00
>> +CDRTOOLS_SITE = http://sourceforge.net/projects/cdrtools/files
>> +CDRTOOLS_LICENSE = Various parts under GPLv2.0, LGPLv2.1, CDDL - see COPYING
> Don't use "see COPYING", this is already encoded by the
> <pkg>_LICENSE_FILES variable below.
OK, it was strange and I was not sure what the heck to do
>
>> +CDRTOOLS_LICENSE_FILES = COPYING
>> +
>> +define CDRTOOLS_BUILD_CMDS
>> +	$(MAKE) -C $(@D)
>> +endef
> This unfortunately doesn't work at all: it builds the tools with the
> host compiler, so always for x86 or x86-64. Is this your intention? If
> it is your intention, then it should be a host package, and not a
> target package.
I'm using an x86 host and target so it's easy to get them confused.
I'll look into this and the note below and try again

Steve
>> +
>> +define CDRTOOLS_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -D $(@D)/cdrecord/OBJ/x86_64-linux-cc/cdrecord $(TARGET_DIR)/usr/bin/cdrecord
>> +	$(INSTALL) -m 0755 -D $(@D)/readcd/OBJ/x86_64-linux-cc/readcd $(TARGET_DIR)/usr/bin/readcd
>> +	$(INSTALL) -m 0755 -D $(@D)/mkisofs/OBJ/x86_64-linux-cc/mkisofs $(TARGET_DIR)/usr/bin/mkisofs
>> +endef
> This cannot work: you enforce "x86_64-linux-cc", but we might be
> building for ARM, PowerPC, MIPS, etc. Also, isn't there a "make
> install" rule to simplify the installation logic?
>
> So basically, try to do a build for ARM, and make sure 1/ it builds
> fine and 2/ the installed binaries are actually built for ARM.
>
> Thanks!
>
> Thomas
