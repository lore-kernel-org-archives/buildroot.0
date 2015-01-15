From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Wed, 14 Jan 2015 20:16:26 -0600
Subject: [Buildroot] building fbtft framebuffer drivers into buildroot.
In-Reply-To: <CAFGceHEkkKaSCQzarHbZx34h7ndirva-Y__Cot8Wo28zJ8rTpA@mail.gmail.com>
References: <CAFGceHGR2k7ARYDZqK0pskkNbd6wiguLkMdZ07zpPENW+NAZxw@mail.gmail.com>
 <20141226102028.GA3982@free.fr>
 <CAFGceHEkkKaSCQzarHbZx34h7ndirva-Y__Cot8Wo28zJ8rTpA@mail.gmail.com>
Message-ID: <CAFGceHFNgMS5W77VUj6yGPxq6S8RgX2aiWBMKcx3mJCoShR6dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to get my display to work nicely in buildroot thanks to peter
seidler's knowledge of this stuff.

On Sat, Dec 27, 2014 at 7:43 PM, thebestofall007 . <
loucrittenden63@gmail.com> wrote:

> I just talked to the author of the fbtft drivers, notro, and he states
> that it is indeed possible to build those drivers out of tree as you state,
> because that is actually how it is made for their use for the beaglebone
> black board. I have opened an issue with the use of the drivers with
> buildroot and it is located here:
> https://github.com/notro/fbtft/issues/209
>
> They illustrate how to build the modules out of tree here:
> https://github.com/notro/fbtft/wiki/Out-of-tree-build
>
>
> I'll admit, I still don't quite have a grasp on how to do this, as I've
> never done compiling like this, as while I use linux (Ubuntu) as my main
> OS, I still have a little to learn on how to set this up (but I'm having
> fun doing it). The main issue for me now is still where to start. Do I do
> this with menuconfig (do I put in their custom git repository or
> something?), or within the target system? I have a pre-compiled
> raspbian-based image with the drivers on it that came with the screen (and
> it also uses those fbtft drivers). I have the drivers, but it's where to do
> the compiling, as I do realize that buildroot does not support compiling
> within the target system, and how I compile on my Ubuntu host system so
> that the output goes onto the target buildroot system and not on the main
> system (I don't want to booger up my system after all. Should I do this in
> a live cd perhaps?).
>
>
>
>
>
>
>
>
> On Fri, Dec 26, 2014 at 4:20 AM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
>
>> All,
>>
>> On 2014-12-25 14:09 -0600, thebestofall007 . spake thusly:
>> > Hello, I am new to buildroot and have been feeling my way around it,
>> but I
>> > currently have a very fast bootable buildroot system for my raspberry pi
>> > system set up following various rpi setup tutorials, and I was wondering
>> > where I can start on building a package for the fbtft drivers from their
>> > source code located in the git repository located here:
>> > https://github.com/notro/fbtft/ that are used for driving small lcd
>> > displays, or has this already been done before?
>>
>> I've had a look at this package, and unfortunately, it will be hard to
>> get it packaged in Buildroot.
>>
>> The problem is that this kernel module does not compile as an
>> out-of-tree module, and their buildsystem is made so that it requires
>> the kernel be patched.
>>
>> This is not posible with Buildroot.
>>
>> However, it should be pretty easy (I hope) to adapt their Makefile so
>> that it behaves like an out-of-tree modules, as explained in the Linux
>> documentation:
>>     Documentation/kbuild/modules.txt
>>
>> > I have went through the manual, and while it has a lot of info, this is
>> an
>> > area that seems to be a little less self explanatory. I also gave info
>> from
>> > this site a try, but I'm stuck at the making of the .mk file:
>> > http://free-electrons.com/~thomas/buildroot/manual/html/ch11.html
>>
>> So, I would suggest you take this route:
>>
>>   - first, build a Buildroot system with a Linux kernel (that's what you
>>     did so far, I guess);
>>
>>   - second, adapt their Makefile as explained above, building manually
>>     with the Buildroot toolchain; see the Buildroot manual, chapter
>>     8.11.1. Using the generated toolchain outside Buildroot:
>>         http://nightly.buildroot.org/#_advanced_usage
>>
>>   - once you made it build as an out-of-tree module, you can have a look
>>     at existing packages in Buildroot that also build kernel modules,
>>     like:
>>         package/lttng-modules/  (the simplest, I think)
>>         package/linux-fusion/   (a bit more complexe, with some ooptions)
>>
>> Regards,
>> Yann E. MORIN.
>>
>> --
>>
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>        |
>> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
>> is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>  conspiracy.  |
>>
>> '------------------------------^-------^------------------^--------------------'
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150114/6874a4c2/attachment.html>
