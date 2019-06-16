From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 16 Jun 2019 14:31:45 +0200
Subject: [Buildroot] uboot tools: fw_setenv can break environment/cause
 bricks
In-Reply-To: <20190616085940.56230607@windsurf>
References: <CAFr9PXmhFW_8QLF8noyyNxJkLe-UzAR9Sq9dkkPpReFN3jzaSQ@mail.gmail.com>
 <20190616085940.56230607@windsurf>
Message-ID: <04225a72-aed1-7ac5-d80d-2022f05c2370@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Hi Daniel,

Le 16/06/2019 ? 08:59, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sat, 15 Jun 2019 20:43:44 +0900
> Daniel Palmer <daniel@0x0f.com> wrote:
> 
>> I just noticed this and couldn't find any other reports of it.
>>
>> If you enable BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV you get fw_printenv
>> and fw_setenv built for the target but they are built with a u-boot
>> configuration that isn't for the target as it uses it's own copy of
>> the source and not the one configured in the bootloader section.
>>
>> That works in most cases but if you have uninitialised or broken
>> environment fw_setenv will write what it thinks is the default
>> environment with a bootcmd that tries to boot via bootp with an NFS
>> root which will probably brick many targets.
>>
>> I'm think if u-boot is enabled in the bootloader section there should
>> probably be an option there to install those tools configured for the
>> target that blocks the uboot tools package.
> 
> I'm adding Pierre-Jean in Cc, as he has been posting patches related
> exactly to this not long ago, if I remember correctly.

Thanks Thomas.

Indeed, the need to synchronize the U-Boot and u-boot-tools package has 
always been a problem because the fw_printenv/fw_setenv tools from 
U-Boot must be always be built for exactly the same default environment.

That is why there is now a new project to remove this 'hard link' 
(libubootenv). Libubootenv [1][2] is fully hardware independent, and it 
also provides fw_setenv & fw_printenv tools (+ a library). So there is 
no need for synchronization between U-Boot and libubootenv.

The other advantage with 'libubootenv' is, if you have uninitialized or 
broken environment on the persistent storage.
You have the ability to use a default environment (a file to be passed 
as a parameter with fw_* tools in fact).

FYI, there is a patch [3] to generate this default environment with 
Buildroot.
After that, you are able to put this last one in /etc for libubootenv [4].

For sure, you can read more information at the different links.

Best Regards,

[1] - 
https://groups.google.com/forum/#!searchin/swupdate/libubootenv%7Csort:date/swupdate/2wcIyfexOro/iADiuQRtBQAJ
[2] - https://github.com/sbabic/libubootenv
[3] - http://patchwork.ozlabs.org/patch/1105926/
[4] - 
https://github.com/sbabic/libubootenv/commit/edb580a42e46f76543edd0d6fd603881c6294eca

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
