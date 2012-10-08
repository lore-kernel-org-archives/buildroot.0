From: Martin Peevski <martin@ronetix.at>
Date: Mon, 08 Oct 2012 14:44:24 +0300
Subject: [Buildroot] ALSA don't work
In-Reply-To: <5071A4C8.9040407@petroprogram.com>
References: <506EF1E6.2090902@ronetix.at> <506EF5DD.4020307@petroprogram.com>
 <506EFDEE.5020307@ronetix.at> <506F18F6.5010506@petroprogram.com>
 <50703E2A.5060702@ronetix.at> <50704D34.2070002@petroprogram.com>
 <50716DA7.4030200@ronetix.at> <50716F47.1@ronetix.at>
 <5071A4C8.9040407@petroprogram.com>
Message-ID: <5072BC98.6070707@ronetix.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/12 18:50, Stefan Fr?berg wrote:
> 7.10.2012 15:02, Martin Peevski kirjoitti:
>>>> Using mdev in your case (because you just want to make things work 
>>>> for that specific device?)
>>>> should not be necessary and using static device nodes should be enough.
>>>>
>>>> So in your case doing the mdev configuration and module autoloading 
>>>> in init-script should not
>>>> be necessary and static /dev nodes *should* work.
>>>>
>>>> I try to help but I need more info:
>>>>
>>>> 1 )
>>>> I would like to know more information about your device.
>>>> Is this the thing you are trying to make that sound work ?
>>>>
>>>> http://www.atmel.com/Images/doc6438.pdf
>>>
>>> Yes, I want to make the sound work on AT91SAM9G45. The additional 
>>> hardware needed for the sound is that base board (BB9G45 from 
>>> Ronetix): 
>>> http://download.ronetix.info/boards/doc/PM9G45/bb9g45_v1.1_sch.pdf 
>>> .  The sound part is on page 3 of the schematic.
>>>>
>
> Ok, now we are getting somewhere.
> According to that doc6438.pdf your AT91SAM9G45 has a AC97 /controller 
> /and your board has WM8731 audio /codec /
> Why it does not have AC97 audio /codec /is beyond me but, hey, im jus 
> a system programmer and not hardware guru :)

The hardware isn't problem, with another rootfs the sound works.

>
> Anyway, what you /at least /need in your linux kernel .config file is 
> the following.
>
> CONFIG_SND_ATMEL_AC97C=y
> CONFIG_BUS_AC97C=y
> CONFIG_SND_SOC_WM8731=y
>
> ('y' means driver has been built directly into kernel and 'm' means 
> that the driver has been built as loadable module)
>
>>>> I found that pdf-file from 
>>>> http://www.atmel.com/devices/SAM9G45.aspx?tab=documents
>>>> under the link /SAM9G45 Complete/.
>>>>
>>>> 2 )
>>>> If the answer to above is yes, then please do the following:
>>>>
>>>> dmesg > linux_boot.txt
>>>>
>>>> and then send that linux_boot.txt for me to inspect.
>>>>
>>>> 3 )
>>>> Also kernel config file would be nice:
>>>>
>>>> cp /usr/src/your_linux_kernel_src_dir/.config linux_config.txt
>>>>
>>>> and then send that linux_config.txt to me also.
>>>>
>>>> Best regards
>>>> Stefan
>>>>
>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>
>>>
>>> Hello. I made the linux_boot.txt and it's attached but in folder 
>>> /usr on the target I have no src/ directory. The command ls -l give 
>>> me the following for /usr:
>>>
>>> # pwd
>>> /usr
>>> #
>>> # ls -l
>>> total 0
>>> drwxr-xr-x    2 root     root             0 Oct  7  2012 bin
>>> drwxr-xr-x    6 root     root             0 Oct  7  2012 lib
>>> drwxr-xr-x    2 root     root             0 Oct  7  2012 sbin
>>> drwxr-xr-x    8 root     root             0 Oct  7  2012 share
>>>
> Oh, sorry.
> My bad. I forgot that in buildroot that hidden linux .config file is 
> located  under the
> buildroot/output/build/linux/-linux_version///directory

Yes, I see now the .config file and have the following configuration the 
things you show me above:

#CONFIG_SND_ATMEL_AC97C is not used
CONFIG_BUS_AC97C=y         is entirely missing but it's missing  and for 
the system which works with another rootfs
CONFIG_SND_AT91_SOC_SAM9G20_WM8731=y
CONFIG_SND_SOC_WM8731=y

How you think, is it possible Buildroot to change my custom Kernel for 
which I'm supplied custom defconfig file?

>
> Please see the attached linux_config.png file.
> That also shows how to check if you have the right drivers compiled.
>
> If you want to know how to check your drivers from actual /running/ 
> rootfs then
> please check attached file checking_linux_config_from_running_system.png
>
> Also, I have a very rudimentary linux config file for your board 
> (at91sam9g45_config file)
>
> To use it just do the following:
> 1 ) Go to your buildroot directory
>
>  cd 
> /home/martin/Desktop/pm9g45-test/Development/rootFS/buildRoot/buildRoot/buildroot
>
> 2 ) Clean everything
> make clean
>
> 3) Make a minimal buildroot config, just uClibc, busybox  and kernel
> make menuconfig
>
> From the buildroot Kernel section check the following (see 
> buildroot_config.png):
> - Kernel configuration (Using a custom config file)
> - /your_directory_where_you_saved_my_custom_linux_config/at91sam945_config
>
> Keep the device management still static, /dev/management (Static using 
> device table) under
> System configuration section. No need to use mdev (or udev) yet unless 
> this won't work.
>
> 4) Double-check that kernel options are good before starting building 
> (check especially the Sound section under Device Drivers):
>
> make linux-menuconfig
>
> 5 ) If buildroot config and linux kernel config looks good then build 
> and pray
>
> make
>
>
> If that rootfs still does not have sound working then maybe it's time 
> to try mdev (or udev).
>
>
>
>>> Still no sound for me. Can't run alsamixer. The attached file is 
>>> with the edited device_table.txt which include and the audio nodes 
>>> in /dev.
>>> I want to ask you some more questions:
>>>
>>> 1. Shall I do make clean when I made some addition to the System 
>>> configuration or just make is fine?
>>>
>>> 2. Someone told me that he's doing such a task - making ALSA works 
>>> with Dynamic /dev population and udev, using built-in drivers not 
>>> modules for the Kernel. I try it out in Buildroot but was impossible 
>>> to bild the system because error. However, please tell me, will such 
>>> a System configuration makes my sound works? During that time i will 
>>> configure the system in that way and will send you later the error 
>>> message from Buildroot.
>>>
> mdev (or udev) will just handle the device population automatically 
> under /dev.
> If your kernel does not have the right settings and drivers compiled 
> either directly into to the kernel or alternatively
> as runtime loadable modules then mdev won't help either.
>
> In another words: *If the **drivers are not there *then using static 
> device tables, mdev, or udev will be useless.
>
> Also, if you have not used your own custom kernel config file for your 
> board, but the default config file, then it's
> a very high change that it does not have the needed drivers built-in.
>
>>> Thanks for the help! Martin.
>>>
>>>
>>>
>>>
>> Sorry, hit the Send button too early! :) Only to notice that at the 
>> moment I haven't  server to supply my custom Kernel version and now 
>> I'm building only the rootfs without the Kernel. However, I build the 
>> system with the same toolchain which was used for the Kernel building 
>> begore. I hope that this isn't problem, is that true?
>>
>>
> No, it's not a problem to use the same toolchain but I still suspect 
> that your kernel is missing something and that is a problem.
> (Can't check that because I didn't get your dmesg output or your linux 
> config file.)
>
>> Sorry once again and hava a nice day!
>> Martin
>
> No prob.
> Stefan


Thanks for the great help, Stefan, but I try it with mdev because I have 
no time to spent on that problem. Afer some cofiguration of the target 
roots manually, and rebuild, it works! :) Now is possible to start 
alsactl init, alsamixer , a play, asound. But:

    1. Configure the ALSA with the fololwing commands:

# alsactl init
Found hardware: "WM8731" "" "" "" ""
Hardware is initialized using a generic method
#
# aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: AT91SAMG20EK [AT91SAMG20-EK], device 0: WM8731 PCM WM8731-0 []
   Subdevices: 1/1
   Subdevice #0: subdevice #0
#

Attached are the configurations for the Playback and Capture devices 
made with alsamixer program.


    2. start arecord  with the command:
        arecord -d 10 -t wav test68.wav
        but when I try to hear the created file with aplay nothing was 
heared. Next copy the test68.wav to my PC and try there aplay also 
nothing. Note that when I start aplay with another wav file on my 
target, aplay not release the console and nothing is heared again. Then 
I use ctrl + c to release it.


Can you, please check the result from the commands and the attachments 
and help me turn at least aplay with ready wav files in the rootfs?

Thanks again, Martin!








-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121008/72cf0486/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ALSA mixer.png
Type: image/png
Size: 60020 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121008/72cf0486/attachment-0002.png>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ALSA mixer - capture.png
Type: image/png
Size: 52683 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121008/72cf0486/attachment-0003.png>
