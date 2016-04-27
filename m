From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Wed, 27 Apr 2016 12:01:01 -0400
Subject: [Buildroot] Multi-File Kernel Module Build Fails
In-Reply-To: <CAN34foxQfe28AfbaY84vh55B9x3_N8_J7rE=o0U4V1KpJLEa1w@mail.gmail.com>
References: <CAN34fowqUhJX9LZ-7qkzr=20-dKFFX9r8suAuXpVnn-brbacQw@mail.gmail.com>
 <20160426214928.5d518086@free-electrons.com>
 <CAN34foyVVDZTtB06iWVW_g=OrcPy+8g2wiiTPqDwWNqT1cXTAg@mail.gmail.com>
 <20160426222504.66c17f22@free-electrons.com>
 <CAN34foxQfe28AfbaY84vh55B9x3_N8_J7rE=o0U4V1KpJLEa1w@mail.gmail.com>
Message-ID: <CAN34foxSw1ZFZeQfx31Y_pXiVJfY+4pZGrKpmu9wZz+3gzmOmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
   Problem is now solved!  Thank you for your hints, they helped me push
this boulder over the hill.
Regards,
Stephen Beckwith


On Tue, Apr 26, 2016 at 5:00 PM, Stephen Beckwith <embeddedsteve@gmail.com>
wrote:

> Hi Thomas,
>    The MAKE_OPTS and 2 variables are necessary, as the include directory
> does NOT get copied into the output/build directory.  I see what you did,
> using $(src) - but that's not where the includes are.
>    I have ~ 40 modules/drivers/apps that reference these includes, they
> are common across these various software components.
>    Your suggestion failed, due to the includes not being:
> -DCONFIG_NETAPP_HWDD -I/home/sbeckwith/HBE-1/hwdd/
> *output/build/kmod_mem-0.1.0*/./include
> -I/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./include/kernel
>
> Again, IF I have a single source file module, the setup I have works
> perfectly, the include directory outside of the output/build tree gets
> referenced and the build is OK.  Only when I have more than one source file
> involved does build root not seem to pass the MAKE_OPTS through.
>
> Question:
>   -  is it allowed in buildroot to access common include header files
> outside of the build directory?  Or should these be somehow copied (via
> rsync) as a separate config like item?
>
> Regards,
> Stephen
>
> On Tue, Apr 26, 2016 at 4:25 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Hello,
>>
>> (Resending with the Buildroot mailing list in Cc. Please always keep
>> the list in Cc. Thanks!)
>>
>> On Tue, 26 Apr 2016 16:20:17 -0400, Stephen Beckwith wrote:
>>
>> > KMOD_MEM_MODULE_MAKE_OPTS = NETAPP_DIR=$(BR2_EXTERNAL)/netapp
>>
>> Get rid of this.
>>
>> > #inform the kernel that a module needs to be build
>> > obj-m := hwdd_memory.o
>> > hwdd_memory-objs := hwdd_mem.o hwdd_memalgo.o hwdd_cache_algos.o
>> >
>> > # Global Includes here
>> > GBL_INCLUDES = $(NETAPP_DIR)/include
>> > KNL_INCLUDES = $(NETAPP_DIR)/include/kernel
>>
>> And those two variable definitions.
>>
>> > #Add here the CFLAGS to pass in to get the Defined Symbol
>> > CFLAGS_hwdd_memory.o := -DCONFIG_NETAPP_HWDD -I$(GBL_INCLUDES)
>> > -I$(KNL_INCLUDES)
>>
>> And replace this by:
>>
>> ccflags-y := -DCONFIG_NETAPP_HWDD -I$(src)/include -I$(src)/include/kernel
>>
>> Again, I've spent time creating an example that I've tested. Since I
>> can't reproduce your test case, please try my example, which you can
>> test as I'm providing the entire source code :)
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160427/f30844ef/attachment.html>
