From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Wed, 13 Apr 2011 17:14:45 -0400
Subject: [Buildroot] Device creation
In-Reply-To: <20110408165634.68ca542b@snot.conwin.com>
References: <91E60E2EFEE04B0399DD86344DDEF380@VOSTROSYS>	<20110407163451.6c00433c@snot.conwin.com>	<62530A4FC0D74901A1AC9D2E6D3ADF17@VOSTROSYS>
	<20110408165634.68ca542b@snot.conwin.com>
Message-ID: <4DA61245.40505@signaturealpha.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems I am kind of stuck on the setup instructions where i should try 
ldattach.
buildroot only supports util-linux 2.13pre7 where as ldattach is only 
supplied starting
at 2.14. any chance to have support for the latest in buildroot?

Thanks

On 2011-04-08 17:56, Bill Borton wrote:
> You mean /sys/class/pps is empty?   I would check to make sure
> you have everything you need in your kernel.
>
> sysfs support?
> pps support?
> pps line discipline? (pps is connected to carrier detect. Correct?)
>
> Again, you will not have pps on ttyS1.  It is physically connected to
> DCD of your port but it will be it's own device.
>
> -Bill
>
> p.s.  This is a kernel/linux-pps issue.  There are better forums to
> discuss this and a lot of info on-line...  Pretty much everything you
> need is in the link you provided in your first post.  Read through it
> again and play around a bit.
>
>
>
> On Fri, 8 Apr 2011 16:33:55 -0400
> "Marc Leclerc"<marc-leclerc@signaturealpha.com>  wrote:
>> Hi,
>>
>> Thanks for this info, it will prove usefull. I seem to have a problem with
>> the kernel hooking up to my pps on ttyS1.
>>
>> on startup i do see PPS line dicipline registered but the folder
>> /sys/stat/pps is empty. we have validated that the pps signal is pulsing at
>> 9V
>>
>> Any clue why?
>>
>> Thanks again
>>
>> -----Original Message-----
>> From: Bill Borton
>> Sent: Thursday, April 07, 2011 5:34 PM
>> To: buildroot at busybox.net
>> Subject: Re: [Buildroot] Device creation
>>
>> On Thu, 7 Apr 2011 13:23:32 -0400
>> "Marc Leclerc"<marc-leclerc@signaturealpha.com>  wrote:
>>> Hi, I am trying to get linuxpps working on my board using ntp. there are
>>> steps described at
>>> http://wiki.enneenne.com/index.php/LinuxPPS_installation which says to
>>> use ldattach to assign the pps signal but so it seem I do not have
>>> ldattach on my buildroot system and tryin to compile util-linux led to
>>> compilation errors. Just wondering if anyone here has the know how to
>>> get my /dev/pps0 created and assigned to my /dev/ttyS1. the steps also
>>> mentions using udev to get the /dev/pps0 created, i have tried installing
>>> and
>>> using it and it just messed up my other links
>>>
>>> Best regards
>> /dev/pps0 is it's own device.  Look in /sysfs/class/pps/pps0/dev (you did
>> build
>> support into your kernel, correct?) for the details and use mknod to create
>> it:
>>
>> mknod -m 0664 /dev/pps0 c 252 0
>>
>>
>> If you are trying to bring up ntpd with the generic NMEA driver you will
>> need to make a couple links to your ttyS1 and pps0:
>>
>> ln -s /dev/ttyS1 /dev/gps0
>> ln -s /dev/pps0 /dev/gpspps0
>>
>> /dev/gps0 (ttyS1) has your nmea stream.
>> /dev/gpspps0 (pps0) has your pps.
>>
>> -Bill
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
