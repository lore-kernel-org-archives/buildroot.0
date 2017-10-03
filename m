From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 3 Oct 2017 16:00:08 -0500
Subject: [Buildroot] [PATCH] HOST_DIR/lib: symlink respectively to
	lib32/64
In-Reply-To: <20171003204352.GA21901@scaer>
References: <1507054359-21131-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20171003204352.GA21901@scaer>
Message-ID: <CANQCQpbZcUPMth9sObO8gbNBggdK-yq8wePVK3_cgsVqfHo-tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Oct 3, 2017 at 3:43 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Matthew, All,
>
> On 2017-10-03 13:12 -0500, Matt Weber spake thusly:
>> Modeled after system/system.mk creation of
>> TARGET_DIR equivalent.
>>
>> Discovered the issue on a RHEL7.4 machine where
>> the cmake build dynamically selected HOST_DIR/lib64
>> as the installation path for the lzo2 library.
>>
>> Fixes failures like the following:
>> host-mtd
>> http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/
>>
>> host-squashfs
>> http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/
>>
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  Makefile | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 9b09589..d51f8ce 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -542,7 +542,7 @@ endif
>>
>>  .PHONY: dirs
>>  dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
>> -     $(HOST_DIR) $(HOST_DIR)/usr $(BINARIES_DIR)
>> +     $(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)
>>
>>  $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
>>       $(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
>> @@ -565,6 +565,15 @@ sdk: world
>>  $(HOST_DIR)/usr: $(HOST_DIR)
>>       @ln -snf . $@
>>
>> +$(HOST_DIR)/lib: $(HOST_DIR)
>> +# Make a symlink lib32->lib or lib64->lib as appropriate.
>> +# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
>> +ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
>
> As discussed on IRC, BR2_ARCH_IS_64 and BR2_MIPS_NABI32 are about the
> target, while here we are concerned about the host.
>
> So, the symlink should probably be based on the value of $(HOSTARCH).
>
> Therefore, I've marked this patch as chages requested.


Superseded by:
https://patchwork.ozlabs.org/patch/821016/
