From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 7 Jun 2016 21:01:17 +0200
Subject: [Buildroot] Resource Limits
In-Reply-To: <CAF_dkJCCZcXdf=G8TJ1HUA1TiCAmbE56oA6KkWMyxcLrkxgo-w@mail.gmail.com>
References: <CAF_dkJCCZcXdf=G8TJ1HUA1TiCAmbE56oA6KkWMyxcLrkxgo-w@mail.gmail.com>
Message-ID: <CAHXCMMLEuPHKHp5uwvxmzJMMwDg4HSVesDe7utRauYpgphzxcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

On Tue, Jun 7, 2016 at 7:44 PM, Patrick Doyle <wpdster@gmail.com> wrote:
> Hi folks...
>
> How are resource limits managed in buildroot generated systems?
>
> Suppose I wanted to allow real-time priorities above zero.  How could
> I enable that for an unprivledged user?
AFAIK, the user running real-time programs needs to belong to the rt group [0].

>
> Would I have to enable pam with pam_limits.so in order to use
> /etc/security/limits.conf?
AFAICS, the pam_limits module is always built.
For the configuration files, Buildroot offers several ways [1], among
these, the recommend ones are :
- fs overlay;
- post-build script.

>
> Can I use sysctl?  Is that a package I can enable?
According to [2] sysctl is provided by procps-ng.
You can check whether this package is available in Buildroot on [3].

>
> Most preferably, could I just compile the resource limits into the
> kernel and not have to bother with any external packages?
I guess you are using a preempt-RT linux kernel.
AFAIK, to run a userspace program with rt priority, you need:
- a preempt-RT kernel [e.g. via buildroot menuconfig]
- /etc/security/limits.conf [e.g. via fs-overlay or post-build script]
- correct user/group settings [e.g. via fs-overlay or post-build script]
- and lastly, calling the right primitive (I don't remember which one)
to get rt priority from the userspace program itself.  [e.g. directly
in your application source code]

There may be other ways to do this (e.g. using chrt), but I don't know
much about them.


[0] https://rt.wiki.kernel.org/index.php/Frequently_Asked_Questions#Do_I_need_root_privileges_to_start_a_realtime_application.3F
[1] http://nightly.buildroot.org/manual.html#rootfs-custom
[2] https://gitlab.com/procps-ng/procps
[3] http://nightly.buildroot.org/manual.html#package-list


Regards,

-- 
Samuel
