From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 27 Jul 2015 09:54:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: journald should use
 volatile storage
In-Reply-To: <B1E851A7-271C-4943-9183-24D5A908A690@gmail.com>
References: <1425201058-3946-1-git-send-email-nroach44@gmail.com>
 <87h9u4xxb1.fsf@dell.be.48ers.dk>
 <CANPyyuN093C11GRiFUC+kTqq2T-XtSe4Adh3P+vSTBXJELGo6A@mail.gmail.com>
 <CAGduivxi4cEmFgVHJ9O30=XXKGdtdk3m5P-m__o4XZFkt4Ee6g@mail.gmail.com>
 <B1E851A7-271C-4943-9183-24D5A908A690@gmail.com>
Message-ID: <CAGduivzQ-bVd2a9sjFvjN1bU0H39+LUX=LFCydtOav5ntVQqPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nathaniel,

On Mon, Jul 27, 2015 at 4:27 AM, Nathaniel Roach <nroach44@gmail.com> wrote:
> On 27 July 2015 6:19:00 am AWST, Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote:
>>
>> Hi Nathaniel, Mike, all
>>
>> On Mon, Mar 2, 2015 at 6:13 PM, Mike Williams <mike@mikebwilliams.com>
>> wrote:
>>>
>>>  On Sun, Mar 1, 2015 at 3:44 PM, Peter Korsgaard <peter@korsgaard.com>
>>> wrote:
>>>>>>>>>
>>>>>>>>>  "Nathaniel" == Nathaniel Roach <nroach44@gmail.com> writes:
>>>>
>>>>
>>>>>  (By default)
>>>>>  This fixes https://bugs.busybox.net/show_bug.cgi?id=7892
>>>>
>>>>
>>>>>  Journald was attempting to write the logs to file before the
>>>>>  underlying file system was up. A proposed solution was to bring
>>>>>  /tmp up beforehand, but that did not always solve the issue.
>>
>> This should never happens, the service that starts journald depends on
>> earlier services that mount the related filesystem. And even if they
>> are not
>> present, it should be able to deal with it (I have a setup
>> where journald is started before the mountpoint where it should write
>> is mounted and I never had any problem with it).
>>>>
>>>>
>>>>>  In addition, since the logging directory was a tmpfs to begin with
>>>>>  (/var/log -> /tmp) this should save some cycles.
>>>>
>>>>
>>>>>  Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
>>>>
>>>>
>>>>  Sorry, cannot reproduce this here. How do you see it exactly?
>>>>
>>>>  See bugtracker for
>>>> details about my tests with
>>>>  qemu_arm_versatile_defconfig.
>>>
>>>
>>>
>>>  I recently started having this issue on my SAMA5 system and this patch
>>>  fixed it. It seems to be some sort of race condition; before this
>>>  patch it would occur about 1 out of 3 boots. I've since booted a dozen
>>>  times without an issue.
>>
>> I would really think the issue is elsewhere since you both have the
>> same board and Peter could not reproduce and neither can I with 4
>> different platform (3 are ARM based but so is the SAMA5).
>>>
>>>
>>>  Mike
>>> ________________________________
>>>
>>>  buildroot mailing list
>>>  buildroot at busybox.net
>>>  http://lists.busybox.net/mailman/listinfo/buildroot
>>
>> ________________________________
>>
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> As noted in the bug I filed for this (on mobile so I can't link), this issue
> is caused by having "rw" in the kernel parameters. This causes journald to
> think it has persistent storage (because it is set to auto) and thus tries
> to write to a file system that isn't up.
Then the real issues beneath this, is to change /etc/fstab instead of
doing hocus pocus in inittab, I'll cook up a patch regarding that
which should fix your issue too.
