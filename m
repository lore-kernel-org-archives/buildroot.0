From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 07 Nov 2011 12:48:09 +0100
Subject: [Buildroot] [PATCH] add support for virtual terminal
In-Reply-To: <20111107103213.GD26606@sapphire.tkos.co.il>
References: <4EB7B129.9030608@visionsystems.de>
 <20111107103213.GD26606@sapphire.tkos.co.il>
Message-ID: <4EB7C579.4090801@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> On Mon, Nov 07, 2011 at 11:21:29AM +0100, Yegor Yefremov wrote:
>> introduces new option "Enable virtual console on tty1"
>> to enable virtual terminal on tty1
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
> [snip]
>
>> +# Put a getty on a virtual terminal
>> +#tty1::respawn:/sbin/getty tty1 38400
> You should probably add '# GENERIC_VT' in this line. See below.
>
>> +
>>  # Put a getty on the serial port
>>  #ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
> [snip]
>
>> Index: b/target/generic/Makefile.in
>> ===================================================================
>> --- a/target/generic/Makefile.in
>> +++ b/target/generic/Makefile.in
>> @@ -23,6 +23,14 @@
>>  	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
>>  		$(TARGET_DIR)/etc/inittab
>>  
>> +# Put a getty on virtual terminal
>> +target-generic-do-getty-tty1:
>> +	$(SED) 's/#tty1/tty1/' $(TARGET_DIR)/etc/inittab
>> +
>> +# Don't put a getty on virtual terminal
>> +target-generic-dont-getty-tty1:
>> +	$(SED) 's/tty1/#tty1/' $(TARGET_DIR)/etc/inittab
> This might cause unintended changes in /etc/inittab, since the 'tty1' string 
> appears in more places. Add '# GENERIC_VT' as above, and only change matching 
> lines. See how GENERIC_SERIAL is being used

Thanks. Changes implemented.

Yegor
