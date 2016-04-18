From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 18 Apr 2016 13:51:41 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <20160418133701.58f46491@free-electrons.com>
References: <1460929546-11966-1-git-send-email-luca@lucaceresoli.net>
 <20160418133701.58f46491@free-electrons.com>
Message-ID: <5714CA4D.1080502@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 18/04/2016 13:37, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 17 Apr 2016 23:45:46 +0200, Luca Ceresoli wrote:
>> The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
>> instantiate a console on tty1, which appears on HDMI. Add a console on
>> the serial port (ttyAMA0) to be more consistent with other defconfigs
>> and provide a better out-of-the-box experience to users used to have a
>> serial console from Buildroot defconfigs.
>>
>> This requires three changes:
>>  1. have two 'console=' entries in the kernel command line: tty1,
>>     then ttyAMA0;
>>  2. change BR2_TARGET_GENERIC_GETTY_PORT to "console", so it starts
>>     a getty on the last console= passed to the kernel, ttyAMA0;
>>  3. add a new getty on tty1 to the generated inittab.
>>
>> Step 2 is actually obtained by removing BR2_TARGET_GENERIC_GETTY_PORT
>> entirely from the defconfigs, since "console" is the default value.
>>
>> Step 3 requires a post-build script since the Buildroot makefiles can
>> configure only one console.
>>
>> Note: instead of simply adding a new getty on ttyAMA0 (which would
>> work) this patch actually changes BR2_TARGET_GENERIC_GETTY_PORT to
>> instantiate a console on UART, then adds back tty1 via
>> post-build.sh. This is done only to avoid the "GENERIC_SERIAL" comment
>> where we instantiate an HDMI console, then instantiate a really-serial
>> console on another line.
>>
>> The result is these two inittab lines:
>>
>>   console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
>>   tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console
>>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>>
>> ---
> 
> Applied to master, thanks. Maybe this calls for an update of the
> RaspberryPi readme.txt file, to explicitly indicate that a getty will
> be running on both the HDMI/composite output *and* the serial port?

Indeed a good suggestion! I'll have a look.

Thanks,
-- 
Luca
