From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Tue, 13 Jan 2015 19:53:19 -0600
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
In-Reply-To: <CAFGceHEppQEc-0Yr3qjP-8ozGpCvK7HE7v5f924tROOAVcA7eg@mail.gmail.com>
References: <trinity-e5195b6b-471f-45ae-9fca-dbce2e177b36-1421185295204@3capp-gmx-bs19>
 <CAFGceHEkmNiiv5RpHgixTY+cAjTiDcGE+GdJGnn-a3On=uVUWg@mail.gmail.com>
 <CAFGceHEm3hRt7UHZzRe6x6Rk9OjSr0dviL50nQSmJvBrUgJi2w@mail.gmail.com>
 <CAFGceHEppQEc-0Yr3qjP-8ozGpCvK7HE7v5f924tROOAVcA7eg@mail.gmail.com>
Message-ID: <CAFGceHHyj9XozyKwdH_ihR3AnQMn_sWKZUyO-o25rdURRYtLeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I run evtest, then it shows the available inputs, /dev/input*, then asks me
what one to run [0-2]. In my case it is /dev/input2, so I choose 2. I then
touch the screen and it shows a bunch of info about pressure and a bunch of
random numbers. I now know the touchscreen is working.

On Tue, Jan 13, 2015 at 7:37 PM, Lou Crittenden <loucrittenden63@gmail.com>
wrote:

> I looked at my configuration and in the make config evtest was not
> enabled, so I have to enable it so I can test my touchscreen.
>
> Again, thanks for all the info!
>
> Just curious: How long have you been working in embedded systems and
> linux???
>
> On Tue, Jan 13, 2015 at 7:20 PM, Lou Crittenden <loucrittenden63@gmail.com
> > wrote:
>
>> NEVERMIND NEVERMIND!  Your script works! It turns out I forgot to enable
>> the fbtft_device drivers in make linuxconfig. I ran a "make clean all"
>> beforehand and forgot I had to run make linuxconfig then run make all.
>>
>>
>>
>> On Tue, Jan 13, 2015 at 5:19 PM, Lou Crittenden <
>> loucrittenden63 at gmail.com> wrote:
>>
>>> We're getting closer, but no cigar yet.
>>>
>>> The script runs at boot.
>>>
>>> I ran /etc/init.d/S30fbtft start to start the script and it outputs:
>>>
>>> starting waveshare: OK
>>>
>>> then outputs:
>>>
>>> FATAL: module fbtft_device not found.
>>>
>>> and the screen doesn't initialize.
>>>
>>> The error also shows up while booting up.
>>>
>>>  I can also run modprobe fbtft_device name=waveshare32b and I get the
>>> same error message.
>>>
>>>
>>>
>>>
>>> On Tue, Jan 13, 2015 at 3:41 PM, Peter Seiderer <ps.report@gmx.net>
>>> wrote:
>>>
>>>> Hello Lou,
>>>>
>>>> On Mon, Jan 12, 2015 at 11:58:16PM -0600, Lou Crittenden wrote:
>>>> > As for the drivers starting up @ boot, I followed the advice of this
>>>> page:
>>>> >
>>>> http://unix.stackexchange.com/questions/59018/create-and-control-start-up-scripts-in-busybox
>>>> > (I have busybox enabled) and attempted to make a simple script in the
>>>> > /etc/init.d/ folder called fbtft, but no go.
>>>> >
>>>> > here it is (and I did make sure to run chmod +x on it to make it
>>>> > executable):
>>>> >
>>>> > #!/bin/sh
>>>> >
>>>> > exec insmod
>>>> /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
>>>> > name=waveshare32b rotate=270
>>>> >
>>>> > exec insmod
>>>> /lib/modules/3.12.28/kernel/drivers/input/touchscreen/ads7846.ko
>>>> >
>>>>
>>>> The following script '/etc/init.d/S30fbtft' should work:
>>>> --- begin ----
>>>> #!/bin/sh
>>>> #
>>>> # Start waveshare32b (fbtft_device, ads7846_device)
>>>> #
>>>>
>>>> case "$1" in
>>>>   start)
>>>>         echo -n "Starting waveshare32b: "
>>>>         modprobe fbtft_device name=waveshare32b rotate=270
>>>>         # from https://github.com/notro/fbtft/issues/181
>>>>         modprobe ads7846_device model=7846 cs=1 gpio_pendown=17
>>>> speed=1000000 keep_vref_on=1 swap_xy=0 pressure_max=255 x_plate_ohms=60
>>>> x_min=200 x_max=3900 y_min=200 y_max=3900
>>>>         # from
>>>> http://www.raspberrypi.org/forums/viewtopic.php?f=63&t=95231
>>>>         # modprobe ads7846_device model=7846 cs=1 gpio_pendown=17
>>>> speed=1000000 keep_vref_on=1 swap_xy=0
>>>>         echo "OK"
>>>>         ;;
>>>>   stop)
>>>>         echo -n "Stopping waveshare32b: "
>>>>         rmmod fbtft_device
>>>>         rmmod fb_ili9340
>>>>         rmmod ads7846_device
>>>>         rmmod ads7846
>>>>         echo "OK"
>>>>         ;;
>>>>   restart|reload)
>>>>         ;;
>>>>   *)
>>>>         echo "Usage: $0 {start|stop|restart}"
>>>>         exit 1
>>>> esac
>>>>
>>>> exit $?
>>>> --- end ---
>>>>
>>>> For testing use
>>>> $ /etc/init.d/S30fbtft start
>>>> or
>>>> $ /etc/init.d/S30fbtft stop
>>>>
>>>> On success there should be a second framebuffer device /dev/fb1 and an
>>>> additional
>>>> input device e.g. /dev/input/event3
>>>>
>>>> For testing the the touch I use
>>>> $ cat /dev/input/event3 | hexdump
>>>> or
>>>> $ evtest
>>>> which shows all input event devices with name and gives nice human
>>>> readable output
>>>> (your have to enable the buildroot package first)...
>>>>
>>>> Regards,
>>>> Peter
>>>>
>>>
>>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150113/1ec1ca2e/attachment.html>
