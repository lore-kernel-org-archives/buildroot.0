From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 23 Dec 2014 14:57:22 +0100
Subject: [Buildroot] [PATCH] system: run getty on boot console by default
In-Reply-To: <1419337919.2781.6.camel@synopsys.com>
References: <1419336373-30919-1-git-send-email-abrodkin@synopsys.com>
 <CAGm1_ktp7gkprBXNLTvd3gE7LMv_9cyUXyF3eb3r83OGPie0NQ@mail.gmail.com>
 <1419337919.2781.6.camel@synopsys.com>
Message-ID: <CAGm1_ktzvRWMrZHEVfrQnRdACs-N++Kwx5dq3Xp30YPxN-gQHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 23, 2014 at 1:32 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hi Yegor,
>
>
> On Tue, 2014-12-23 at 13:18 +0100, Yegor Yefremov wrote:
>> On Tue, Dec 23, 2014 at 1:06 PM, Alexey Brodkin
>> <Alexey.Brodkin@synopsys.com> wrote:
>> > We used to specify explicitly serial port with all its settings
>> > for init to instantiate getty.
>> >
>> > This limits usecases when the same one rootfs could be used.
>> >
>> > For example following cases won't work well with hardcoded
>> > serial console settings:
>> >  * On the same board other serial port is expected to be used
>> >  * The same rootfs is intended to be used on different boards with
>> >    different serial ports (like ttySx vs ttyAMAx or even ttyx)
>> >
>> > With this change by default we rely on "console" specified in
>> > kernel's boot command line.
>> >
>> > What is important getty will be set on the last console
>> > specified in bootargs.
>> >
>> > For example is a kernel comand line:
>> > --->---
>> > bootargs="... console=tty0 console=ttyS3,115200n8..."
>> > --->---
>> >
>> > This now will instantiate serial console on ttyS3 but not on tty0.
>> >
>> > Tested with both Busybox and SysV init.
>>
>> But can you login as root via /dev/console? AFAIK it was the main
>> problem by this approach. There is also another alternative: cttyhack
>
> Probably I don't quite understand your question.
> What is a problem with "/dev/console"?
>
> I do login as root with these new settings:
> --->---
> # whooami
> root
> --->---
>
> Did I miss something?

It could be this issue: http://www.busybox.net/FAQ.html#job_control

Does it still make problems? When not, then there is no problem.

Yegor
