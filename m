From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Sat, 17 Jan 2015 21:51:46 -0600
Subject: [Buildroot] Setting up audio/video playback backends on
	raspberry pi
In-Reply-To: <CAFGceHEGoETk8SAF4smQ2KeJrBbjbeKzftB+Z0A53mZNz4wHZQ@mail.gmail.com>
References: <CAFGceHE53EiS632nzCV68LDWzupYYU0akKpHwKphVrDTaw93Yg@mail.gmail.com>
 <1458315217.30391437.1421397706886.JavaMail.root@openwide.fr>
 <CAFGceHFuBKkkJwObuCt_P=sLW8zGCmR7i_rqy4-Cv_bLR50Qbg@mail.gmail.com>
 <CAFGceHEGoETk8SAF4smQ2KeJrBbjbeKzftB+Z0A53mZNz4wHZQ@mail.gmail.com>
Message-ID: <CAFGceHFhse+Wb9ZfVUEj2yOGDQteFZ6uYJ6phymnJkk5bxCMkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I messed up on the posting of the script here. I forgot the modprobe
snd-bcm2385 part. For anyone wanting to use it, here it is:

#!/bin/sh
#
# Start bcm2385 audio driver
#

case "$1" in
  start)
        echo -n "Starting bcm2385 audio driver: "
        modprobe snd-bcm2385
        echo "OK"
        ;;
  stop)
        echo -n "Stopping bcm2385 audio driver: "
        rmmod snd-bcm2385
        echo "OK"
        ;;
  restart|reload)
        ;;
  *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
esac

exit $?

On Sat, Jan 17, 2015 at 9:18 PM, Lou Crittenden <loucrittenden63@gmail.com>
wrote:

> > Do you know how to get this module to load up on boot so I don't have to
> load it by hand every time?
>
> Never mind on this question. I answered my own question by making an
> /etc/init.d script that loads the driver at boot titled S50snd-bcm2835 with
> the following contents:
>
> #!/bin/sh
> #
> # Start audio driver
>
> case "$1" in
>   start)
>         echo -n "Starting audio driver snd-bcm2835: "
>         echo "OK"
>         ;;
>   stop)
>         echo -n "Stopping snd-bcm2835: "
>         rmmod snd-bcm2835
>         echo "OK"
>         ;;
>   restart|reload)
>         ;;
>   *)
>         echo "Usage: $0 {start|stop|restart}"
>         exit 1
> esac
>
> exit $?
>
> I had to take the text from the fbtft (display) init.d and change the
> references to the display to the snd-bcm2835 driver.
>
> Tried it, and it worked.
>
> Thank you Jeremy for giving me a clue on where to start by letting me know
> what driver to load.
>
>
>
>
>
> On Sat, Jan 17, 2015 at 8:02 PM, Lou Crittenden <loucrittenden63@gmail.com
> > wrote:
>
>> You're right, it is the snd-bcm2835.ko kernel module. After doing some
>> digging I was able to find it at
>> /lib/modules/3.12.28/kernel/sound/arm/snd-bcm2835.ko
>>
>> I had to load it with
>>
>> insmod /lib/modules/3.12.28/kernel/sound/arm/snd-bcm2835.ko
>>
>> (I had to do insmod initially with my display to test it).
>>
>> I am now listening to my music as I type with buildroot on my pi.
>>
>> Do you know how to get this module to load up on boot so I don't have to
>> load it by hand every time?
>>
>> Thanks in advance.
>>
>> On Fri, Jan 16, 2015 at 2:41 AM, Jeremy Rosen <jeremy.rosen@openwide.fr>
>> wrote:
>>
>>> I think you need to manually load the kernel module to get the rpi to
>>> play sounds
>>>
>>> IIRC it's call bcm2835_snd (I don't have my rpi with me right now, so
>>> Ican't check)
>>>
>>> Cordialement
>>>
>>> J?r?my Rosen
>>> +33 (0)1 42 68 28 04
>>>
>>> fight key loggers : write some perl using vim
>>>
>>>
>>> Open Wide Ingenierie
>>>
>>> 23, rue Daviel
>>> 75013 Paris - France
>>> www.openwide.fr
>>>
>>>
>>>
>>>
>>>
>>> ------------------------------
>>>
>>> Hello all, I am in the process of setting up a minimalist buildroot
>>> based touchscreen multimedia player and was wondering how to get the audio
>>> and video backends working properly. I can play a file with mplayer (no
>>> arguments) from the console and there is no sound. I also have alsautils
>>> and pulseaudio installed, as well as the gstreamer framework, but still no
>>> go. I would like to get some info on how to configure it, please. For the
>>> display, I have one of those waveshare32b displays I got working thanks to
>>> Peter Seiderer's help (thanks Peter!). I'm now on the audio and video
>>> playback backend configuration stages.
>>>
>>> Included in the attachment is my buildroot configuration.
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>>>
>>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150117/74d9995d/attachment.html>
