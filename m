From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Mon, 11 May 2015 10:43:27 +1000
Subject: [Buildroot] [PATCH 2/2] powerpc-utils: remove --without-librtas
In-Reply-To: <20150508045758.GH2183@tarshish>
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
 <05714bb15869de4bead83eec7df5e9c9b0bd8fa7.1431059241.git.sam.bobroff@au1.ibm.com>
 <20150508045758.GH2183@tarshish>
Message-ID: <554FFB2F.2010102@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/05/15 14:57, Baruch Siach wrote:
> Hi Sam,
> 
> On Fri, May 08, 2015 at 02:27:49PM +1000, Sam Bobroff wrote:
>> Now that librtas is available, remove --without-librtas and make the
>> rtas-dependant functions available.
>>
>> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
>> ---
>>  package/powerpc-utils/Config.in        |    1 +
>>  package/powerpc-utils/powerpc-utils.mk |    3 +--
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
>> index eded41e..a754899 100644
>> --- a/package/powerpc-utils/Config.in
>> +++ b/package/powerpc-utils/Config.in
>> @@ -2,6 +2,7 @@ config BR2_PACKAGE_POWERPC_UTILS
>>  	bool "powerpc-utils"
>>  	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
>>  	select BR2_PACKAGE_ZLIB
>> +	select BR2_PACKAGE_LIBRTAS
>>  	help
>>  	  System utilities for PowerPC machines.
>>  
>> diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
>> index 3b30458..3fb9e24 100644
>> --- a/package/powerpc-utils/powerpc-utils.mk
>> +++ b/package/powerpc-utils/powerpc-utils.mk
>> @@ -6,11 +6,10 @@
>>  
>>  POWERPC_UTILS_VERSION = 1.2.24
>>  POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
>> -POWERPC_UTILS_DEPENDENCIES = zlib
>> +POWERPC_UTILS_DEPENDENCIES = zlib librtas
> 
> Why not make librtas an optional dependency? Something like:
> 
> ifeq ($(BR2_PACKAGE_LIBRTAS),y)
> POWERPC_UTILS_DEPENDENCIES += librtas
> POWERPC_UTILS_CONF_OPTS = --with-librtas
> else
> POWERPC_UTILS_CONF_OPTS = --without-librtas
> endif
> 
>>  POWERPC_UTILS_LICENSE = Common Public License Version 1.0
>>  POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
>>  
>> -POWERPC_UTILS_CONF_OPTS = --without-librtas
>>  POWERPC_UTILS_CONF_ENV = \
>>  	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
> 
> baruch
> 

Hi Baruch,

I thought about making it optional, but there seemed to be two reasons
to always include it:

* librtas is a small library and it provides a lot of functionality to
powerpc-utils. Why leave it out?

* Distros (AFAIK) always include librtas when providing powerpc-utils,
so it would surprise users to provide a powerpc-utils without it by
default. So if I did make it optional, I think it should be using some
method that caused librtas to be included by default or at least
provided some indication in the menu that they may want to go and enable
librtas. Then I thought this was a bit complicated for a use case that I
couldn't find a reason for.

That said, if you have a reason to make it optional I'll be happy to
make it so. Maybe using a sub-option to add the dependency, and that
could default to yes?

e.g.

[*] powerpc-utils
	[*] RTAS functionality

Cheers,
Sam.
