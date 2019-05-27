From: Michael Walle <michael@walle.cc>
Date: Mon, 27 May 2019 14:13:31 +0200
Subject: [Buildroot] [PATCH] boot/uboot: add initial environment support
In-Reply-To: <20190526215030.5c40a899@windsurf>
References: <20190519191635.23814-1-michael@walle.cc>
 <20190526215030.5c40a899@windsurf>
Message-ID: <ce0d97105c82356d4e18f43648864dbc@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am 2019-05-26 21:50, schrieb Thomas Petazzoni:
> Hello Michael,
> 
> Thanks for this patch! See below a number of comments.

Thanks for the review ;)

> On Sun, 19 May 2019 21:16:35 +0200
> Michael Walle <michael@walle.cc> wrote:
> 
>> Since v2019.07 U-Boot supports extracting the compiled-in environment.
>> As a first step, add support to the environment generation in 
>> buildroot.
>> In the future, the text file may also be injected into the target
>> filesystem.
> 
> I'm not sure what you mean by "injected into the target filesystem".
> How would this be useful ? U-Boot would pick the environment from the
> root filesystem ?

Traditionally, both the u-boot and the fw_env tools (uboot-tools) had 
the
same compiled-in environment. That approach falls short, if the u-boot
and its tools are compiled sperately (like with distributions). So
the distribution uboot-tools have just the standard compiled-in
envionment, which doesn't match the one from the bootloader. If the
bootloader didn't find an saved environment (there may be other cases,
too), it will fall back to the compiled-in one. Same does the tools,
but they will fall back to a different one..

See the original commit here:
http://git.denx.de/?p=u-boot.git;a=commit;h=bdaa73a5b3923257add182b4ab8058dbfa33421b

The tools doesn't make use of that at the moment. But I'd imagine having
the text file in the filesystem like the config.gz of the linux kernel.

But as I've already mentioned, the file can already be used to generate 
a
flash image which has the u-boot environment pre-set.


>> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
>> index 33b7e67ff7..92f00bf752 100644
>> --- a/boot/uboot/Config.in
>> +++ b/boot/uboot/Config.in
>> @@ -488,7 +488,19 @@ menuconfig BR2_TARGET_UBOOT_ENVIMAGE
>>  	  The environment image will be called uboot-env.bin.
>> 
>>  if BR2_TARGET_UBOOT_ENVIMAGE
>> +choice
>> +	prompt "Environment image source"
>> +	default BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
>> +
>> +config BR2_TARGET_UBOOT_ENVIMAGE_INITIAL
>> +	bool "Using the initial environment file"
> 
> I'm not a fan of the "initial" terminology, although admittedly it's
> the one apparently chosen upstream. "built-in" would be a lot more
> logical, no ?

Yes, and tbh I'd prefer the build-in, too. But then its harder to match
the terms if someone is familiar with u-boot. Its your choice.

> Also, I think this option needs a help text that describes what it
> does, and the fact that it only works with U-Boot >= 2019.07.

Ok. If we use BUILT_IN above, we could clarify here, that the term in
u-boot is "initial environment file".

>> +config BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM
>> +	bool "Using a custom environment file"
> 
> Ditto, a help text would be good.

Ok.

> Other than that, looks good to me. Could you just fix those minor
> details and send an updated version ?

Sure, I'll send it this evening, given that you choose one of the two
options above until then ;)

-michael
