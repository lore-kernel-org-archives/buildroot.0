From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 Mar 2016 18:43:34 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain-external: extract
 installation of gdbserver to separate define
In-Reply-To: <56F1C177.1060007@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <1455304826-10557-4-git-send-email-patrickdepinguin@gmail.com>
 <56F1C177.1060007@gmail.com>
Message-ID: <56F80DB6.7030303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/22/16 23:04, Romain Naour wrote:
> Hi Thomas, all,
>
> Le 12/02/2016 20:20, Thomas De Schampheleire a ?crit :
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> The installation of the gdbserver binary has no relation to the installation
>> of the target libraries. Moving it to a separate define improves the
>> understandability of the code and makes later refactoring easier.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> ---
>>   toolchain/toolchain-external/toolchain-external.mk | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>> index 9d88158..d5445e5 100644
>> --- a/toolchain/toolchain-external/toolchain-external.mk
>> +++ b/toolchain/toolchain-external/toolchain-external.mk
>> @@ -604,7 +604,12 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
>>   		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
>>   			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
>>   		done ; \
>> -	fi ; \
>> +	fi
>> +endef
>> +
>
> It's a good idea but can we instead define TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER
> only when BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is set to y ?
>
> ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
> define TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER
> ...

  While you do that: I think it would be better to have TARGET in the name, so 
TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER.


>
>> +define TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER
>> +	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>> +	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
>>   	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
>
> This allow to remove this line ^^^
>
> Best regards,
> Romain
>
>>   		$(call MESSAGE,"Copying gdbserver") ; \
>>   		gdbserver_found=0 ; \
>> @@ -774,6 +779,7 @@ endef
>>   define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
>>   	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
>>   	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
>> +	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBSERVER)
>>   	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
>>   	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)

  These two should ideally also have TARGET in their name, but that's a separate 
change of course.


  Regards,
  Arnout


>>   	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
