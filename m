From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Oct 2014 20:49:18 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <20141020150209.5f8b45a5@free-electrons.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
Message-ID: <5446AAAE.80604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/10/14 15:02, Thomas Petazzoni wrote:
> Dear Gustavo Zacarias,
> 
> On Mon, 20 Oct 2014 09:28:05 -0300, Gustavo Zacarias wrote:
>> Don't blindly install the /etc/nsswitch.conf file, it's useless for
>> toolchains that aren't (e)glibc-based and misleading.
>> Make the installation conditional on a (e)glibc toolchain.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>> ---
>>  {system/skeleton/etc => package/glibc}/nsswitch.conf |  0
>>  toolchain/toolchain.mk                               | 10 ++++++++++
>>  2 files changed, 10 insertions(+)
>>  rename {system/skeleton/etc => package/glibc}/nsswitch.conf (100%)
>>
>> diff --git a/system/skeleton/etc/nsswitch.conf b/package/glibc/nsswitch.conf
>> similarity index 100%
>> rename from system/skeleton/etc/nsswitch.conf
>> rename to package/glibc/nsswitch.conf
>> diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
>> index 8fe06ff..3f3534a 100644
>> --- a/toolchain/toolchain.mk
>> +++ b/toolchain/toolchain.mk
>> @@ -3,6 +3,16 @@
>>  # TARGET_FINALIZE_HOOKS, to be applied just after all packages
>>  # have been built.
>>  
>> +# Install default nsswitch.conf file if the skeleton doesn't provide it
>> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>> +define GLIBC_COPY_NSSWITCH_FILE
>> +	$(Q)if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
>> +		cp -a package/glibc/nsswitch.conf $(TARGET_DIR)/etc; \
> 
> 		$(INSTALL) -D -m 0644
> 
> maybe ?
> 
>> +	fi
>> +endef
>> +TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
>> +endif
> 
> Also, I believe I'd prefer to see this being done in the glibc package
> and in the toolchain-external package. I know it's a bit redundant to
> have it twice, but I'd like to not have too many files that get
> installed through the finalize hooks.

 After reading the whole thread, I'm with gustavoz on this one.

- If you do it in glibc + toolchain-external, you have duplication.

- We expect a skeleton package to appear. When it exists, this and a few other
finalize things can go there instead. In that case, you have no duplication anymore.

- The patch to move this from a finalize hook to the skeleton package will be a
lot simpler than a patch that moves it out of glibc + toolchain-external. In
addition, it's easier to forget it when it's spread out like that.

- We have this patch now, we don't have a patch that puts it in glibc +
toolchain-external.

 Therefore,

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
