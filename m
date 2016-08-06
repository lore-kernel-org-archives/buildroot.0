From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 6 Aug 2016 17:49:50 -0400
Subject: [Buildroot] Raspberry Pi OpenGL/Qt5 10x slower than Raspbian
In-Reply-To: <CA+-urNT9xyebymaefVZXbp_A7zDCuEqokimwy9t1yPLjNdHrqA@mail.gmail.com>
References: <CA+-urNTrCwfx4YYZ0S37wyB9ehquKLqacKaOzL6_7yCkt+Q29g@mail.gmail.com>
 <20160804091707.6755bb66@free-electrons.com>
 <CA+-urNQqnUdBvsMERgNxnAKWSGpiUNekvuSZADvyw7_HpYO41A@mail.gmail.com>
 <20160804182825.4c9ff4ff@free-electrons.com>
 <CA+-urNT9xyebymaefVZXbp_A7zDCuEqokimwy9t1yPLjNdHrqA@mail.gmail.com>
Message-ID: <CA+-urNQc9qJbGpAHCFnTJx6wNwhP8wDReNZdihcz0hpHk8b8cQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 4, 2016 at 1:09 PM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Hi Thomas,
>
> On Thu, Aug 4, 2016 at 12:28 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Thu, 4 Aug 2016 08:35:24 -0400, Frank Hunleth wrote:
>>
>>> > Change -Os by -O2 in the Buildroot configuration, by using
>>> > BR2_OPTIMIZE_2. I even believe we should stop using BR2_OPTIMIZE_S by
>>> > default, and switch to BR2_OPTIMIZE_2 instead.
>>>
>>> Done, but no luck for this particular issue. I have another piece of
>>> code that differs in performance from Debian by 5% and is more CPU
>>> bound. I'll try it on that too.
>>
>> Gaah.
>>
>>> > Also, are you sure it's really using OpenGL with the Buildroot build?
>>>
>>> On the Buildroot build, I've tried running the Qt application with
>>> "-platform eglfs", but that seemed to be the default already. I'm not
>>> sure how to check deeper than that.
>>
>> I guess if eglfs support has been built and you're able to use, it
>> means that it's using the GPU.
>>
>>> > Under Raspbian, are you also running the eglfs build of Qt, or is it
>>> > with X.org? I'm not sure Debian has an eglfs capable build of Qt5.
>>>
>>> You're right. On Raspbian, I'm running with X.org. I am naively
>>> assuming that Qt5 w/ eglfs isn't 10x slower than Qt5 w/ X.org. I
>>> really hope that's not the case.
>>
>> I also hope, but using X.org on one side and doing eglfs on the other
>> side is really a very different configuration. I would also assume that
>> there should not be a 10x difference between Qt5/X.org vs Qt5/eglfs,
>> but I have never tested, so I don't know.
>
> I started a Qt5/eglfs-only build on a Raspberry Pi early this morning.
> I have no clue how long it will take to build, but I'll report back
> when it's done.

Just to close off this thread in case anyone else runs into a similar
issue, Buildroot is completely fine.

The issue ended up being that using a QWidget with Qt5 on an eglfs
backend results in Qt software rendering everything to an image and
then copying that image to the display via OpenGL ES. I was under the
mistaken impression that even QWidget apps should start using the
eglfs backend. The use of software rendering is, in fact, documented
in the Qt docs, but I selectively didn't see the important paragraph,
and I had no idea that the penalty would be so large.

As you would expect, the linuxfb backend works fine for apps still
using QWidgets.

Frank
