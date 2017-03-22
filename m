From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 22 Mar 2017 16:12:03 -0700
Subject: [Buildroot] [PATCH] uboot-tools: pass empty CFLAGS on
 invocation of libfdt/setup.py
In-Reply-To: <20170322220119.24fc6301@free-electrons.com>
References: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
 <20170320225742.054be334@free-electrons.com>
 <CAMo8BfLZzoRF0Q4zMRPcmwT0UErD7pGH_boMKrWQ07h09fiykw@mail.gmail.com>
 <20170322220119.24fc6301@free-electrons.com>
Message-ID: <CAMo8Bf+xMaeYqPHZa9RdBwA4qpz8VRTK8eZcBrdTOLkmBMcUYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 22, 2017 at 2:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 20 Mar 2017 16:30:53 -0700, Max Filippov wrote:
>
>> I can't reproduce it.
>> The python script makes the compilation super quiet, can we apply something
>> like the attached patch to see what happens?
>
> Build log is below. The issue is that the library being produced is
> named _libfdt.cpython-35m-x86_64-linux-gnu.so, but U-Boot build system
> assumes it's named _libfdt.so.
>
> However, let's take a step back: why the heck do we have this Python
> related stuff being built?

we probably don't.

> uboot-tools is only meant to install the
> basic U-Boot tools like fw_printenv and fw_setenv to the target. Why do
> we bother about this Python libfdt thing? We're not even installing
> this stuff to the target:
>
> define UBOOT_TOOLS_INSTALL_TARGET_CMDS
>         $(UBOOT_TOOLS_INSTALL_MKIMAGE)
>         $(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
>         $(UBOOT_TOOLS_INSTALL_FWPRINTENV)
>         $(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
> endef
>
> Looking at tools/Makefile, it indeed automatically builds this Python
> stuff is swig is available, with no way to disable this stuff. Should
> we patch this out? Alternatively, changing:
>
>         mv _libfdt.so $@
>
> to:
>
>         mv _libfdt.*so $@
>
> does the trick.

That looks like a nice small fix.

-- 
Thanks.
-- Max
