From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 12:21:21 -0400
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <550B432C.9060100@mind.be>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
 <CAKbGBLj66AmB6kxrp1utLmZ+AhWN+-0aDERdD=4FtAi=UHT_ig@mail.gmail.com>
 <CANPyyuO9hfyObgWWPjh7m=oghSs=qWWvsG28q+P=7F8W4NQnYg@mail.gmail.com>
 <CAKbGBLhc8Wftu8pSVM8jNvRRpoSV=e0p5eomh4=+u8wg1VxVxA@mail.gmail.com>
 <550B432C.9060100@mind.be>
Message-ID: <CANPyyuMaisU0v1m1LUkoOnd+o2oYzG1aen9RBWyvVhU0n8x32A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Mar 19, 2015 at 5:44 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/03/15 20:50, Steven Noonan wrote:
>> On Thu, Mar 19, 2015 at 12:43 PM, Mike Williams <mike@mikebwilliams.com> wrote:
>>>> I come from the Arch Linux world, so I made a new skeleton that
>>>> matches the Arch base filesystem layout: with /bin, /sbin, /usr/bin,
>>>> and /usr/sbin all unified (likewise with /lib and /usr/lib). I haven't
>>>> convinced myself to post the series because I can't think of a
>>>> particularly good justification for it in the Buildroot context.
>>>
>>> I'm working that way myself, I don't know what use cases in Buildroot
>>> still require the split.
>>
>> We could consider offering it as an experimental alternative to the
>> default skeleton (just add another "choice" in kconfig, as I did in my
>> patch series). And open a discussion about unifying the directory
>> structure. It's certainly possible to support both use cases, though
>> it does require more testing.
>
>  I've also started using a unified /bin /sbin /usr/bin /usr/sbin and unified
> /lib /usr/lib /lib64 /usr/lib64, and it really simplifies things a lot. I yet
> have to find a disadvantage.

Working through this systemd cleanup, I'm now finding that some
packages install udev rules to /lib/udev/rules.d by default. The udev
documentation states that:

"The udev rules are read from the files located in the system rules
directory /usr/lib/udev/rules.d, the volatile runtime directory
/run/udev/rules.d and the local administration directory
/etc/udev/rules.d." I can verify that systemd's udev does not check
/lib/udev/rules.d, even with --enable-split-usr (our current setup).
I'm not sure what eudev does.

https://www.kernel.org/pub/linux/utils/kernel/hotplug/udev/udev.html

It makes me wonder how many upstream developers are already using a
merged /usr system, and are not noticing the technically wrong
defaults for split systems. Likewise, apparently many of buildroot's
systemd users have merged /usr already, they won't notice this
breakage in their testing either.

Mike
