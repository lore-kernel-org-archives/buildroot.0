From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 25 Oct 2011 11:29:24 +0200
Subject: [Buildroot] [RFC] New package: QSerialDevice
In-Reply-To: <4EA67FD8.2040801@visionsystems.de>
References: <4EA663BA.5030700@visionsystems.de> <20111025101709.3851667f@skate>
 <4EA67FD8.2040801@visionsystems.de>
Message-ID: <CAAXf6LUttBAVDvOLWJooFFdjzVzCptuUoo=_KsSDA+nxeAYFyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Tue, Oct 25, 2011 at 11:22 AM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
> Am 25.10.2011 10:17, schrieb Thomas Petazzoni:
>> Le Tue, 25 Oct 2011 09:22:34 +0200,
>> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>>
>>> 1. I fetch it from git branch, how can I specify revision?
>> pkg_VERSION = ...
>>
>> You can specify a git branch, a git commit, whatever commit identifier
>> that is valid for git.
>
> But how can I combine branch name together with commit? I've already specified branch "2.0" as QSERIALDEVICE_VERSION.

The commit uniquely identifies a particular revision, whatever branch
it is on. So once you specify the commit, the branch is automatically
known.

>
>>> 2. how do I handle symlinking for libraries? If I just copy all 4
>>> files, I get 4 same files and not one library and 3 symlinks
>> Either use the "make install" of the package (or implement it), or use
>> ln to create the symlinks.
>
> O.K. I thought there would be some kind of elegant and easy way, like an option that copies only symlink and not it's target if desired :-)

If you want to copy an existing link and not the link target, you can
use 'cp -P' : (from 'man cp')
       -P, --no-dereference
              never follow symbolic links

>
>>> 3. what
>>> about creating some kind of folders/menu (in package/Config.in) for
>>> Qt, python etc. add-ons?
>> I don't know. qserialdevice should go in Libraries -> Hardware
>> handling. I don't see why it would need to end up in a qt-specific
>> submenu.
>
> O.K.
>
>>> +define QSERIALDEVICE_CONFIGURE_CMDS
>>> + ? ?$(QT_QMAKE) $(@D)/serialport.pro
>>> +endef
>> Should be:
>>
>> ? ? ? (cd $(@D); $(QT_QMAKE) serialport.pro)
>
> You won't believe me, but it worked without cd statement. That's why I was puzzled by my local package not willing to create Makefile in output/build/vsguitest. But I fix it for QSerialDevice for conformance sake.
>
>>
>> Does it *absolutely* require udev ? I have never used QSerialDevice,
>> but QExtSerialPort instead, and udev wasn't necessary.
>
> It requires both build-time and run-time udev. This package provides two classes/interfaces:
>
> 1. serial port itself
> 2. informational class containing all installed serial port sin the system and it uses libudev (I'll send a patch that installs udev in staging)
>


Best regards,
Thomas
