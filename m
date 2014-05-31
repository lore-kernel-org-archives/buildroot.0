From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Sat, 31 May 2014 18:38:13 +0200
Subject: [Buildroot] new TI  kernel version for beaglebone black
In-Reply-To: <5389F864.80909@ethertek.ca>
References: <5388F5A2.1080008@ethertek.ca> <5389CDB9.3080209@gmail.com>
 <5389F864.80909@ethertek.ca>
Message-ID: <538A0575.8000303@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dan,

On Sat, 31 May 2014 08:42:28 -0700, Dan Pattison wrote:
> On 5/31/2014 5:40 AM, Hadrien Boutteville wrote:
>> Hello Dan,
>>
>> On Fri, 30 May 2014 14:18:26 -0700, Dan Pattison wrote:
>>> I have a question that is probably not 100% buildroot related, but was
>>> hoping to get some help. I am using buildroot to build a kernel and
>>> rootFS for a beaglebone black. Buildroot is awesome and builds
>>> everything fine. The board boots up and all packages work properly.
>>> Unfortunately, USB seems to be badly broken. In the kernel I have USB
>>> driver enabled and USB Announce New Devices turned on. Googling around I
>>> find several people with the same problem, hotplug does not work at all,
>>> and no device I have tried shows up in dmesg or lsusb on cold or warm
>>> boot. A band aid is to use a powered USB hub (have not tried that). Some
>>> guys on the beagleboard.org IRC say to try a newer kernel version (3.14
>>> or >) because beaglebone USB is fixed in newer kernel versions. Current
>>> buildroot beaglebone black kernel version is 3.12.10
>>>
>>> In buildroot I used make beaglebone_defconfig.
>>> Under the Kernel menu, Custom Git repository is selected.
>>> The git URL is https://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
>>> The custom repository version is 7f280334068b7c875ade51f8f3921ab311f0c824
>>> The def config is board/beaglebone/linux-3.12.config
>> I'm using the default beaglebone_defconfig on BBB and USB hotplug works
>> fine. In the default kernel config the options are selected as modules,
>> so you have to load them:
>>
>>    $ modprobe musb_am335x
>>    $ modprobe musb_dsps
>>
>> After that, outputs in dmesg will tell you that the USB port is found
>> (short version) and USB hotplug will work (I just tested).
>>
>> Regards,
>>
>> Hadrien
>>
> Hello Hadrien,
> 
> Thanks for the help. I had the drivers compiled into he kernel not as 
> modules. When I reverted my changes back to module and added depmod to 
> busybox, then things started to happen. Again, thanks for the help.

From what you said I understood that you were using the default kernel
config in beaglebone_defconfig almost unchanged ;-).

Well, I'm using the drivers compiled into the kernel and it works fine
too. Make sure you selected those options in your kernel config:

  USB_MUSB_DUAL_ROLE=y
  USB_MUSB_HDRC=y
  USB_MUSB_DSPS=y
  USB_MUSB_AM335X_CHILD=y

Regards,

Hadrien
