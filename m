From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 4 Aug 2016 08:35:24 -0400
Subject: [Buildroot] Raspberry Pi OpenGL/Qt5 10x slower than Raspbian
In-Reply-To: <20160804091707.6755bb66@free-electrons.com>
References: <CA+-urNTrCwfx4YYZ0S37wyB9ehquKLqacKaOzL6_7yCkt+Q29g@mail.gmail.com>
 <20160804091707.6755bb66@free-electrons.com>
Message-ID: <CA+-urNQqnUdBvsMERgNxnAKWSGpiUNekvuSZADvyw7_HpYO41A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 4, 2016 at 3:17 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 3 Aug 2016 22:39:31 -0400, Frank Hunleth wrote:
>> I'm trying to debug a 10x slow down with a simple Qt5 app that draws
>> rectangles and a couple lines of text on the screen. I'm comparing the
>> performance between a fresh install of Raspbian and the master branch
>> of Buildroot (but I also saw this with an older BR release). I've
>> narrowed the performance difference down to the rectangle and text
>> drawing calls. Nothing else is running. On the Buildroot side, I'm
>> using the raspberrypi_defconfig with only the following additions and
>> my test app:
>>
>> +BR2_PACKAGE_QT5=y
>> +BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
>> +BR2_PACKAGE_QT5BASE_GUI=y
>> +BR2_PACKAGE_QT5BASE_WIDGETS=y
>> +BR2_PACKAGE_QT5BASE_EGLFS=y
>> +BR2_PACKAGE_RPI_USERLAND=y
>>
>> I haven't modified any of the config files in the boot partition.
>> Changing the config.txt to match the Raspbian version didn't affect
>> performance. I also verified that my test app is using eglfs. The
>> performance degradation is the same on both a Raspberry Pi Zero and
>> Model B.
>>
>> This slowdown seems so big that it feels like I'm forgetting some
>> important piece of configuration, but I can't figure it out.
>>
>> Has anyone else run into this or has any ideas on things to try?
>
> Change -Os by -O2 in the Buildroot configuration, by using
> BR2_OPTIMIZE_2. I even believe we should stop using BR2_OPTIMIZE_S by
> default, and switch to BR2_OPTIMIZE_2 instead.

Done, but no luck for this particular issue. I have another piece of
code that differs in performance from Debian by 5% and is more CPU
bound. I'll try it on that too.

>
> Also, are you sure it's really using OpenGL with the Buildroot build?

On the Buildroot build, I've tried running the Qt application with
"-platform eglfs", but that seemed to be the default already. I'm not
sure how to check deeper than that.

> Under Raspbian, are you also running the eglfs build of Qt, or is it
> with X.org? I'm not sure Debian has an eglfs capable build of Qt5.

You're right. On Raspbian, I'm running with X.org. I am naively
assuming that Qt5 w/ eglfs isn't 10x slower than Qt5 w/ X.org. I
really hope that's not the case.

Thanks,
Frank
