From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Dec 2020 18:39:36 +0100
Subject: [Buildroot] [PATCH 0/3] package/ti-stgx: tentative bump (branch
 yem/ti-sgx-stuff)
In-Reply-To: <20201212100634.GA3281876@scaer>
References: <cover.1607633239.git.yann.morin.1998@free.fr>
 <CAFSsvmrRihGW-iXKkYyTfyCKGU7Nhtt5bhUxES-pLmW8ngQ5Ew@mail.gmail.com>
 <20201212100634.GA3281876@scaer>
Message-ID: <20201212173936.GB3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-12-12 11:06 +0100, Yann E. MORIN spake thusly:
> On 2020-12-11 12:19 -0800, Adam Duskett spake thusly:
[--SNIP--]
> > Yann, you will have to either include Markus' patch or find a
> > different solution.
[--SNIP--]
> However, I suspect this patch is very incorrect for anything else that
> does have the eglGetPlatformDisplayEXT extension, like most other GL
> implmentations such as mesa...

OK, so after another day hacking around this issue, I think I eventually
nailed the reason why the upstream patch does not work. It is trying to
cast the nativeDisplay (an int) into a quintptr (an unsigned int). And
of course, this causes quite some grief to the compiler.

So, I have now two options:

 1. tweak the upstream patch to use a qintptr (not a quintptr) so that it
    now reads something like:

    -        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
    +        qintptr nativeDisplayPtr = reinterpret_cast<qintptr>(nativeDisplay);
    +        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, reinterpret_cast<void *>(nativeDisplayPtr), nullptr);

 2. take an even more direct and expeditious solution, to siply cast
    into a void*, like:

    -        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
    +        display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, reinterpret_cast<void *>(nativeDisplay), nullptr);

After all, nativeDisplay is just an opaque type; getPlatformDisplay() is
just expected to pass that value to the lower-level layers that actually
talk to the GL implementation. nativeDisplay is thus either a pointer
already (which can be cast to a void* as the existing code already
does), or it is an integer of some sort, which is supposed to also fit
into a pointer.

Yeah, I know this is probably not true for some ABis, like x32, where
pointers are 32-bit but ints are 64-bit. But Buildroot does not support
x32 or the likes. Furthermore, getPlatformDisplay() anyway expects a
void*, so it would never be able to accomodate such situations.

So, I would be highly tempted to go for solution 2: it is easy, works
always, and it is no much more "meh" than the alternative...

Unless again I still missed something...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
