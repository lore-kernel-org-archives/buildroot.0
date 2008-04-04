From: Ma Andrew <andrewma83@hotmail.com>
Date: Thu, 3 Apr 2008 19:03:20 -0700
Subject: [Buildroot] Error when compiling Buildroot to create .iso
 (cannot stat /.../i386-linux-2.6.24-20
In-Reply-To: <326f33790804031722y751e20fbp90953425cc54b247@mail.gmail.com>
References: <326f33790804031358n63fd21bs5ee753b194d3a89b@mail.gmail.com>
	<BLU136-W8787D45D6697B1F3539C3C3F70@phx.gbl>
	<326f33790804031513n230462e5hb65b1705dafabace@mail.gmail.com>
	<BLU136-W3608C3619B673FB8C4FC10C3F70@phx.gbl>
	<326f33790804031646w6a11671fgba1f50aba995f450@mail.gmail.com>
	<BLU136-W408F3BBAFC783BCAF49646C3F70@phx.gbl> 
	<326f33790804031722y751e20fbp90953425cc54b247@mail.gmail.com>
Message-ID: <BLU136-W23D741198BD0E52C39F5A9C3F60@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


ok this is what I get after I remove the link (and my project named zero)

cp /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404 /mnt/lab/buildroot/build_i686/iso9660/kernel
cp: cannot stat `/mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404': No such file or directory

You may want to see what is /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404.  It turns out to be /mnt/lab/buildroot/binaries/zero/i686-linux-2.6.24-20080404 -> ../../x86/boot/bzImage

With ../../ , it will move you back to the buildroot .  In this case, I remove my symlink in the buildroot directory, the build process cannot complete due to broken link.

Now I put the link x86 in my buildroot directory, I am using/running the command (with the only change on the project name from uclibc to zero) that I show you on the buildroot directory.

I run the command that I gave you and I see the problem too. :(  It seems like there is a cut and paste typo in the command.
It should be 'ln -s project_build_i386/uclibc/linux-2.6.24/arch/x86 x86'  Fixing that 2.6-24 to 2.6.24

To double check, you can "ls -l x86" it should show you some directory content instead of a x86.


P.S. final product:
Size of boot image is 4 sectors -> No emulation
 12.29% done, estimate finish Thu Apr  3 19:02:20 2008
 24.54% done, estimate finish Thu Apr  3 19:02:20 2008
 36.82% done, estimate finish Thu Apr  3 19:02:22 2008
 49.07% done, estimate finish Thu Apr  3 19:02:26 2008
 61.36% done, estimate finish Thu Apr  3 19:02:24 2008
 73.60% done, estimate finish Thu Apr  3 19:02:24 2008
 85.89% done, estimate finish Thu Apr  3 19:02:25 2008
 98.14% done, estimate finish Thu Apr  3 19:02:26 2008
Total translation table size: 2048
Total rockridge attributes bytes: 996
Total directory bytes: 4096
Path table size(bytes): 34
Max brk space used 0
40762 extents written (79 MB)
echo /mnt/lab/buildroot/binaries/zero/rootfs.i686.iso
/mnt/lab/buildroot/binaries/zero/rootfs.i686.iso
-rw-rw-r-- 1 andrewma andrewma 83480576 4?  3 19:02 /mnt/lab/buildroot/binaries/zero/rootfs.i686.iso

Hope this help.
--Andrew


________________________________
> Date: Thu, 3 Apr 2008 17:22:29 -0700
> From: reddyac at gmail.com
> To: andrewma83 at hotmail.com
> Subject: Re: [Buildroot] Error when compiling Buildroot to create .iso (cannot stat /.../i386-linux-2.6.24-20
> CC: buildroot at uclibc.org
> 
> Hi Andrew,
> 
> I just made the symbolic link by typing in
> 
> 'ln -s project_build_i386/uclibc/linux-2.6-24/arch/x86 x86'
> 
> in the buildroot directory. I then compiled again and I was still presented with the same error. I should point out that in the error.log, I am also seeing:
> 
> + echo '/root/buildroot/build_i386/genext2fs-1.4/genext2fs -b 67936 ' ' -N 1621 -d /root/buildroot/project_build_i386/uclibc/root ' ' -U -m 0 /root/buildroot/binaries/uclibc/rootfs.i386.ext2
> 
> right before the error displays that i386-linux-2.6.24-20080403 cannot be found. (This has now changed to i386-linux-2.6.24-20080404 since it's April 4th in the time that buildroot is using).
> 
> Does this mean that I need to delete my rootfs.i386.ext2 and compile again from scratch with .iso selected in order to get the .iso? I hope this isn't the case since it took me a while to do the build. Thanks!
> 
> 2008/4/3 Ma Andrew <andrewma83@hotmail.com>:
> 
> ok hope this one would help.
> 
> 'ln -s project_build_i386/uclibc/linux-2.6-24/arch/x86 x86' in your buildroot.  It should at least let you pass through the error that you post on the email.
> 
> --Andrew
> ________________________________
>> Date: Thu, 3 Apr 2008 16:46:03 -0700
>> From: reddyac at gmail.com
>> To: andrewma83 at hotmail.com
>> Subject: Re: [Buildroot] Error when compiling Buildroot to create .iso (cannot stat /.../i386-linux-2.6.24-20
>> CC: buildroot at uclibc.org
>>
>> Hi Andrew,
>>
>> I found the actual bzImage (not the symbolic links) at:
>>
>> /buildroot/project_build_i386/uclibc/linux-2.6-24/arch/x86/boot/bzImage
>>
>> So I made a symbolic link to that bzImage and I can see it within /buildroot/binaries/$PROJECT.
>>
>> Unfortunately the .iso file is no where to be found after I compile. Hopefully someone can give some feedback on this. Thanks again for your suggestions Andrew!
>>
>> 2008/4/3 Ma Andrew>:
>>
>> Sorry I want to send the command but somehow hotmail doens't let me.  There is a missing part on the command that I suggest.  You can do a "find . -name bzImage -print" on "/root/buildroot" will show all the path that contain bzImage.  Only one contains the real file, all of them are just symbolic links.  I believe the script is trying to look for bzImage but it is a sym link point to somewhere it doesn't exists.
>>
>> Perhaps, there may be a better way to solve it in "make menuconfig" instead of hacking it through sym link.
>>
>> --Andrew
>> ________________________________
>>> Date: Thu, 3 Apr 2008 15:13:41 -0700
>>> From: reddyac at gmail.com
>>> To: andrewma83 at hotmail.com
>>> Subject: Re: [Buildroot] Error when compiling Buildroot to create .iso (cannot stat /.../i386-linux-2.6.24-20
>>> CC: buildroot at uclibc.org
>>>
>>> Thanks a lot for your suggestion. I made a symbolic link to the x86 directory but I still don't find my rootfs.i386.iso file within buildroot/binaries/$PROJECT.
>>>
>>> I also didn't see any errors this time, but I piped the errors to error.log and checked it, and still get the message that reads i386-linux-2.6.24-20080403 cannot be found.
>>>
>>> On Thu, Apr 3, 2008 at 2:33 PM, Ma Andrew> wrote:
>>>
>>> I think you can make a sym link like this on your /root/buildroot directory.
>>> "ln -s ./project_build_i686//linux-2.6.24/arch/x86 x86" and see if it works for you.
>>>
>>>
>>>
>>> ________________________________
>>>> Date: Thu, 3 Apr 2008 13:58:28 -0700
>>>> From: reddyac at gmail.com
>>>> To: buildroot at uclibc.org
>>>> Subject: [Buildroot] Error when compiling Buildroot to create .iso (cannot stat /.../i386-linux-2.6.24-20080403)
>>>>
>>>> Hi everyone.
>>>>
>>>> I am able to successfully compile Buildroot and I end up with a resulting file system image rootfs.i386.ext2 and a bzImage for the kernel. I want to boot up my newly created kernel in VirtualBox, and I will need an .iso to do that. So modified menuconfig to give me an .iso and typed make again. Unfortunately I run into an error that states:
>>>>
>>>> cp: cannot stat '/root/buildroot/binaries/uclibc/i386-linux-2.6.24-20080403': No such file or directory
>>>> make: *** [/root/buildroot/binaries/uclibc/rootfs.i386.iso] Error 1
>>>>
>>>> I checked that folder and I see file named i386-linux-2.6.24-20080403, and cannot understand why it is giving me this error. Can someone give me a clearer indication to what this error is referring and how I can go about fixing it?
>>>>
>>>> Thank you in advance for your response!
>>>
>>> _________________________________________________________________
>>> ??????????????? ? MSN ?????
>>> http://toolbar.live.com/
>>
>> _________________________________________________________________
>> ?? Windows Live Messenger 8.5 ??????????????????????????? ????
>> http://get.live.com/zh-cht-tw/betas/messenger_betas
> 
> _________________________________________________________________
> ??? Windows Live Messenger ? Hotmail????????????? ? Windows Live for Mobile
> http://www.msn.com.tw/msnmobile/

_________________________________________________________________
5 GB ???? ????????????????? ? ???? Windows Live Hotmail
http://mail.live.com 
