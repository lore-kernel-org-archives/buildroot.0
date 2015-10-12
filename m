From: Martin Bark <martin@barkynet.com>
Date: Mon, 12 Oct 2015 09:48:54 +0100
Subject: [Buildroot] [v4 1/4] package/nodejs: Add node.js v0.12.5 and
 set as the default version
In-Reply-To: <20151011192546.GA24916@free.fr>
References: <1435830207-16664-1-git-send-email-martin@barkynet.com>
 <20151011192546.GA24916@free.fr>
Message-ID: <CAFGQKxd9DJUmqHrCUHRD+VMvYfG5fC-87xJZhb3PG-1HFpOHeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On 11 October 2015 at 20:25, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Martin, All,
>
> On 2015-07-02 10:43 +0100, Martin Bark spake thusly:
>> The version of the V8 JavaScript engine used by node.js v0.12.5 requires
>> at least an ARMv6 architecture with VFPv2.
>
> I'm trying to bump to node.js 4.1.2 and was wondering if that limitation
> still exists in that version.

Yes I've been thinking about this too.  As far as i can tell v0.10.x
was the last release to support ARMv5 due to changes in the V8
JavaScript engine.  One thing i have been wondering is if we need to
support multiple versions of node.js or just 4.1.x?  The node.js LTS
working group here https://github.com/nodejs/LTS/ seems to say that
0.10.x and 0.12.x are still being maintained but supporting only the
latest version would be simpler.  What do you think?

>
> I was able to sucessfully build for an arm926t (armv5) with a VFPv2 FPU.
>
> So:
>   - is the failure a runtime failure or a build time one?

From memory it only show up at runtime as an illegal instruction.  I
think i tested using qemu_arm_versatile_defconfig and a simple test
like

    node -e 'console.log("hello world");'

>   - is armv6 really required, or can we just require VFPv2?

I went off this announcement for V8
https://groups.google.com/forum/#!topic/v8-users/aSOFbaAQvMk where it
states the minimum is now ARMv6 with VFPv2.  It was the no-VFPv2 port
that was removed but i don't know if it also requires any ARMv6 or
higher instructions.  The node.js configure script only seems to check
form ARMv6 or ARMv7, see
https://github.com/nodejs/node/blob/master/configure#L616.  So i
assume node.js and V8 need a minimum ARMv6 instruction set.

Thanks

Martin

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
