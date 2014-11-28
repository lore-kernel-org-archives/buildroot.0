From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 28 Nov 2014 22:45:02 +0100
Subject: [Buildroot] [PATCH v3 2/3] toolchain-helpers: factorise the
 arch sysroot symlink creation
In-Reply-To: <20141127232116.GP3900@free.fr>
References: <1415919806-13005-1-git-send-email-romain.naour@openwide.fr>
 <1415919806-13005-3-git-send-email-romain.naour@openwide.fr>
 <20141127232116.GP3900@free.fr>
Message-ID: <5478ECDE.4090207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 28/11/2014 00:21, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2014-11-14 00:03 +0100, Romain Naour spake thusly:
>> The part of copy_toolchain_sysroot function that create the symlink in the
>> staging directory will be used in two different place in the following patch.
>> So factorize this part in a new function called
>> toolchain_create_arch_sysroot_symlink.
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>>
>> ---
>> v3: no change
>> v2: new	patch
>> ---
>>  toolchain/helpers.mk | 23 +++++++++++++++--------
>>  1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
>> index 3121da4..7d7af5f 100644
>> --- a/toolchain/helpers.mk
>> +++ b/toolchain/helpers.mk
>> @@ -83,6 +83,20 @@ copy_toolchain_lib_root = \
>>  \
>>  	echo -n
>>  
>> +# Calculate the symlink's depth by counting the number of slashs.
>> +# Then create the symlink to arch sysroot.
>> +# $1: arch specific subdirectory in the sysroot
>> +toolchain_create_arch_sysroot_symlink = \
>> +	ARCH_SUBDIR="$(strip $1)"; \
> 
> I think I have some problems parsing that...
> 
>   - $(strip $1) is makefile syntax,
>   - $1 is the first argument to the macro,
>   - $1 is set to literally $${ARCH_SUBDIR} at the time of the call.
> 
> So, you're calling $(strip) which is evaluated by make on a shell
> variable, set in the shell to something that is already $(strip)ed.
> 
> I think this assignement should just go away.
> 
> Unless I'm too tired and I missed something...

No, you're right, the call to strip is useless.

> 
>> +	mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
>> +	relpath="./" ; \
>> +	nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
>> +	for slash in `seq 1 $${nbslashs}` ; do \
>> +		relpath=$${relpath}"../" ; \
>> +	done ; \
>> +	ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
>> +	echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}"
>> +
>>  #
>>  # Copy the full external toolchain sysroot directory to the staging
>>  # dir. The operation of this function is rendered a little bit
>> @@ -148,14 +162,7 @@ copy_toolchain_sysroot = \
>>  		if [ ! -d $${ARCH_SYSROOT_DIR}/usr/include ] ; then \
>>  			cp -a $${SYSROOT_DIR}/usr/include $(STAGING_DIR)/usr ; \
>>  		fi ; \
>> -		mkdir -p `dirname $(STAGING_DIR)/$${ARCH_SUBDIR}` ; \
>> -		relpath="./" ; \
>> -		nbslashs=`echo -n $${ARCH_SUBDIR} | sed 's%[^/]%%g' | wc -c` ; \
>> -		for slash in `seq 1 $${nbslashs}` ; do \
>> -			relpath=$${relpath}"../" ; \
>> -		done ; \
>> -		ln -s $${relpath} $(STAGING_DIR)/$${ARCH_SUBDIR} ; \
>> -		echo "Symlinking $(STAGING_DIR)/$${ARCH_SUBDIR} -> $${relpath}" ; \
>> +		$(call toolchain_create_arch_sysroot_symlink,$${ARCH_SUBDIR}) ; \
> 
> Here you are doing the call with something that is supposed to be
> a shell variable.
> 
> Care to review this part, and provide an explanation of what I missed?

Indeed, ARCH_SUBDIR is already stripped.

> 
> Regards,
> Yann E. MORIN.
> 
>>  	fi ; \
>>  	if test -n "$${SUPPORT_LIB_DIR}" ; then \
>>  		cp -a $${SUPPORT_LIB_DIR}/* $(STAGING_DIR)/lib/ ; \
>> -- 
>> 1.9.3
>>
> 

I'll wait for the review of the last patch before sending v4.

Thanks !

-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
