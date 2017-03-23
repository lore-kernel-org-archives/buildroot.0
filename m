From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Mar 2017 09:12:47 +0100
Subject: [Buildroot] [PATCH] uboot-tools: pass empty CFLAGS on
 invocation of libfdt/setup.py
In-Reply-To: <CAMo8Bf+xMaeYqPHZa9RdBwA4qpz8VRTK8eZcBrdTOLkmBMcUYQ@mail.gmail.com>
References: <1489768962-26768-1-git-send-email-jcmvbkbc@gmail.com>
 <20170320225742.054be334@free-electrons.com>
 <CAMo8BfLZzoRF0Q4zMRPcmwT0UErD7pGH_boMKrWQ07h09fiykw@mail.gmail.com>
 <20170322220119.24fc6301@free-electrons.com>
 <CAMo8Bf+xMaeYqPHZa9RdBwA4qpz8VRTK8eZcBrdTOLkmBMcUYQ@mail.gmail.com>
Message-ID: <ec85d960-3840-edd2-8e9c-d385c8ffeda8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-03-17 00:12, Max Filippov wrote:
> Hi Thomas,
> 
> On Wed, Mar 22, 2017 at 2:01 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> On Mon, 20 Mar 2017 16:30:53 -0700, Max Filippov wrote:
>>
>>> I can't reproduce it.
>>> The python script makes the compilation super quiet, can we apply something
>>> like the attached patch to see what happens?
>>
>> Build log is below. The issue is that the library being produced is
>> named _libfdt.cpython-35m-x86_64-linux-gnu.so, but U-Boot build system
>> assumes it's named _libfdt.so.
>>
>> However, let's take a step back: why the heck do we have this Python
>> related stuff being built?
> 
> we probably don't.
> 
>> uboot-tools is only meant to install the
>> basic U-Boot tools like fw_printenv and fw_setenv to the target. Why do
>> we bother about this Python libfdt thing? We're not even installing
>> this stuff to the target:
>>
>> define UBOOT_TOOLS_INSTALL_TARGET_CMDS
>>         $(UBOOT_TOOLS_INSTALL_MKIMAGE)
>>         $(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
>>         $(UBOOT_TOOLS_INSTALL_FWPRINTENV)
>>         $(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
>> endef
>>
>> Looking at tools/Makefile, it indeed automatically builds this Python
>> stuff is swig is available, with no way to disable this stuff. Should
>> we patch this out? 

 I would very much prefer an upstreamable patch that makes it possible to
disable this.

 Regards,
 Arnout


>> Alternatively, changing:
>>
>>         mv _libfdt.so $@
>>
>> to:
>>
>>         mv _libfdt.*so $@
>>
>> does the trick.
> 
> That looks like a nice small fix.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
