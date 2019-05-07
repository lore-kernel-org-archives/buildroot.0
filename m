From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 May 2019 01:32:17 +0200
Subject: [Buildroot] Location of external firmware
In-Reply-To: <19174340.20190507102524@tele2.se>
References: <509774653.20190506161444@tele2.se>
 <37f920d1-be43-800f-4422-7f1217cc4b82@mind.be>
 <19174340.20190507102524@tele2.se>
Message-ID: <979d65fd-8b41-980a-ddd3-efedbbf27310@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2019 10:25, Mats Jansson wrote:
> 
> AV> On 06/05/2019 16:14, Mats Jansson wrote:
>>> Hi,
>>>
>>> I have an external firmware to be loaed by a driver. The normal way is
>>> to put the firmware in /lib/firmware. But since it needs to
>>> be loaded during boot and udev is not intitialised at that point I
>>> have found out that I need to build it into the kernel.
>>>
>>> I want to put this file in my buildroot-external-tree just like I do
>>> with patches. Any idea on how to do it?
>>> I have tried two different approaches.
>>> 1. Creating a patch, but then I get the error message that "git binary diffs are not
>>> supported."
> 
> AV>  That will indeed not be possible, unfortunately.
> 
>>> 2. setting CONFIG_EXTRA_FIRMWARE_DIR to $(BR2_EXTERNAL)/firmware but I
>>> get the error message "BR2_EXTERNAL: command does not exist"
> 
> AV>  Looks like you're trying to do this from the shell; $(...) in shell means
> AV> executing a subcommand, which is not what you want here.
> 
> AV>  In addtion, $(BR2_EXTERNAL) should no longer be used (since 2016.11). Instead,
> AV> each external has a name, and you should use
> AV> $(BR2_EXTERNAL_<name>_PATH). This
> AV> variable is exported, so you can use it in your linux configuration file.
> 
> I am just letting buildroot handle things, by running make in
> buildroot. So I suppose it is running in a shell.
> 
> Setting
> CONFIG_EXTRA_FIRMWARE="htc9271.fw"
> CONFIG_EXTRA_FIRMWARE_DIR="$(BR2_EXTERNAL_e100_PATH)/firmware"
> also gets me the message "command does not exist".

 Yeah, auto.conf gives that message but I don't think it's very relevant, is it?

 If it really is a problem, you can use ${BR2_EXTERNAL_e100_PATH} instead (i.e.
curly braces instead of round brackets). This is used both by shell and make as
a variable name delimiter.

 Regards,
 Arnout

> 
> Setting it to
> CONFIG_EXTRA_FIRMWARE="htc9271.fw"
> CONFIG_EXTRA_FIRMWARE_DIR="$BR2_EXTERNAL_e100_PATH/firmware"
> gives me
> *** No rule to create the target "R2_EXTERNAL_e100_PATH/firmware/htc_9271.fw?, needed by ?firmware/htc_9271.fw.gen.o?.  Stopping.
> 
> The use of $(BR2_EXTERNAL_e100_PATH) works in other parts of the configuration, eg
> for patches. But maybe it is not possible to use the BR2_EXTERNAL_e100_PATH variable
> when building the kernel.config?
> 
> AV>  Regards,
> AV>  Arnout
> 
>>>
>>> Anyone have a good idea on how to solve this?
>>>
>>> Best regards
>>> Mats                          mailto:matsmanhav at tele2.se
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
> AV> _______________________________________________
> AV> buildroot mailing list
> AV> buildroot at busybox.net
> AV> http://lists.busybox.net/mailman/listinfo/buildroot
> 
