From: Marc Leclerc <marc-leclerc@signaturealpha.com>
Date: Fri, 8 Apr 2011 16:33:55 -0400
Subject: [Buildroot] Device creation
In-Reply-To: <20110407163451.6c00433c@snot.conwin.com>
References: <91E60E2EFEE04B0399DD86344DDEF380@VOSTROSYS>
	<20110407163451.6c00433c@snot.conwin.com>
Message-ID: <62530A4FC0D74901A1AC9D2E6D3ADF17@VOSTROSYS>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for this info, it will prove usefull. I seem to have a problem with 
the kernel hooking up to my pps on ttyS1.

on startup i do see PPS line dicipline registered but the folder 
/sys/stat/pps is empty. we have validated that the pps signal is pulsing at 
9V

Any clue why?

Thanks again

-----Original Message----- 
From: Bill Borton
Sent: Thursday, April 07, 2011 5:34 PM
To: buildroot at busybox.net
Subject: Re: [Buildroot] Device creation

On Thu, 7 Apr 2011 13:23:32 -0400
"Marc Leclerc" <marc-leclerc@signaturealpha.com> wrote:
> Hi, I am trying to get linuxpps working on my board using ntp. there are
> steps described at
> http://wiki.enneenne.com/index.php/LinuxPPS_installation which says to
> use ldattach to assign the pps signal but so it seem I do not have
> ldattach on my buildroot system and tryin to compile util-linux led to
> compilation errors. Just wondering if anyone here has the know how to
> get my /dev/pps0 created and assigned to my /dev/ttyS1. the steps also
> mentions using udev to get the /dev/pps0 created, i have tried installing 
> and
> using it and it just messed up my other links
>
> Best regards

/dev/pps0 is it's own device.  Look in /sysfs/class/pps/pps0/dev (you did 
build
support into your kernel, correct?) for the details and use mknod to create 
it:

mknod -m 0664 /dev/pps0 c 252 0


If you are trying to bring up ntpd with the generic NMEA driver you will
need to make a couple links to your ttyS1 and pps0:

ln -s /dev/ttyS1 /dev/gps0
ln -s /dev/pps0 /dev/gpspps0

/dev/gps0 (ttyS1) has your nmea stream.
/dev/gpspps0 (pps0) has your pps.

-Bill
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
