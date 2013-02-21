From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 22 Feb 2013 01:07:51 +0200
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <5126A675.2060308@mind.be>
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com> <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
Message-ID: <5126A8C7.2000009@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.2.2013 0:57, Arnout Vandecappelle kirjoitti:
> On 21/02/13 11:32, Stefan Fr?berg wrote:
>>>>> >>>Also kernel .config file should also have CONFIG_DEVTMPFS and
>>>>> DEVTMPFS
>>>>> >>>as 'y'.
>>>> >>Sorry, that should have been CONFIG_DEVTMPFS=y and
>>>> CONFIG_DEVTMPFS_MOUNT=y
>>> >Kernel version 2.6.30 is too old for that.
>>> >
>>> >baruch
>>> >
>> It is ?
>> Damn, then the only options are mdev and udev.
>
>  I'm afraid that mdev and udev no longer work with old kernels that
> don't support the DEVTMPFS option...
>
>  mdev and udev don't create device nodes; they only do something
> configurable when a hotplug event happens.
>

What you mean that mdev or udev does not create device nodes ???
If older kernels don't support devtmpfs like Baruch
said then who does that device node creation if not the mdev or udev 
when event happens ???

>  That said, you can create custom mdev/udev rules to create device
> nodes. But it's all manual - and much simpler to just create the
> device nodes manually.
>

for mdev it's just a single file, /etc/mdev.conf (I can even copy-paste
it here, it's not that long and will cover 99% of needs).

for udev it punch of rules found under /lib/udev/rules.d and yes, it can
get really tedious to play games with those files if some device node is
not created or
is not created with right permissions or whatever.


>  Regards,
>  Arnout
>

Regards
Stefan



/etc/mdev.conf

# null may already exist; therefore ownership has to be changed with command
null        root:root 666 @chmod 666 $MDEV
zero        root:root 666
full        root:root 666
random        root:root 444
urandom        root:root 444
hwrandom    root:root 444
grsec        root:root 660

kmem        root:root 640
mem        root:root 640
port        root:root 640
# console may already exist; therefore ownership has to be changed with
command
console        root:tty 600 @chmod 600 $MDEV
ptmx        root:tty 666
pty.*        root:tty 660

# Typical devices
tty        root:tty 666
tty[0-9]*    root:tty 660
vcsa*[0-9]*    root:tty 660
ttyS[0-9]*    root:root 660

# alsa sound devices
pcm.*        root:audio 660 =snd/
control.*    root:audio 660 =snd/
midi.*        root:audio 660 =snd/
seq        root:audio 660 =snd/
timer        root:audio 660 =snd/

# input stuff
event[0-9]+    root:root 640 =input/
mice        root:root 640 =input/
mouse[0-9]    root:root 640 =input/
ts[0-9]        root:root 600 =input/

#
#sr[0-9]    root:cdrom 660 *ln -sf $MDEV cdrom

sr[0-9]        root:root 660 *ln -sf $MDEV cdrom
