From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 26 Jan 2014 22:43:11 +0100
Subject: [Buildroot] [PATCH] uboot-tools: Allow users to use uboot's
	sources
In-Reply-To: <CAGduivwtd5SeEOSi6NNCegk7L7oem0+dF9eqkvoGtYk1_xODVw@mail.gmail.com>
References: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>
 <52E530D5.20405@lucaceresoli.net>
 <CAGduivwtd5SeEOSi6NNCegk7L7oem0+dF9eqkvoGtYk1_xODVw@mail.gmail.com>
Message-ID: <52E5816F.9080102@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

Maxime Hadjinlian wrote:
> On Sun, Jan 26, 2014 at 4:59 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>> Hi Maxime,
> Hi Luca
>>
>>
>> Maxime Hadjinlian wrote:
>>>
>>> If the user has specified a custom U-Boot repository, he may also want
>>> to use it for U-Boot tools.
>>>
>>> This could be usefull in two identified use case:
>>>     - User want the same version for U-Boot tools and U-Boot
>>>     - User has modified U-Boot tools in his U-Boot repository
>>>
>>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>
>>
>> I ACK the idea, but there are a few changes I would make to your patch,
>> see below.

...

>>> b/package/uboot-tools/uboot-tools.mk
>>> index 398ce8b..367d067 100644
>>> --- a/package/uboot-tools/uboot-tools.mk
>>> +++ b/package/uboot-tools/uboot-tools.mk
>>> @@ -10,6 +10,15 @@ UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
>>>    UBOOT_TOOLS_LICENSE = GPLv2+
>>>    UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
>>>
>>> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE),y)
>>> +       UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
>>> +       UBOOT_TOOLS_SOURCE  = $(UBOOT_SOURCE)
>>> +       UBOOT_TOOLS_SITE    = $(UBOOT_SITE)
>>
>>
>> You are overriding the previously-defined options. I find an
>> if/then/else construct much cleaner:
>>
>> ifneq ($(BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE),y)
>> ...use upstream sources... (current code)
>> else
>> ...use sources for the uboot package...
>> endif
>>
> I'd like to have a few more opinions on that, after seeing the code in
> the form if/then/else, I find it awkward as it would be (as far as I
> know) the only package, where you don't find the SOURCE/SITE variable
> defined at the top of the file.
> So I am not sure about this.

Very few packages define their SOURCE/SITE variables conditionally:
linux, boot/ubot, boot/barebox, maybe a few more. These all are key
components for every embedded Linux system and are often used in a
modified form on real products, so they deserve this additional
flexibility.

All of them have an ifeq / else ifeq / [else ifeq /...] else / endif
construct in their .mk files to handle the various possibilities.
I suggest you take one of them as an example.

Going a step ahead, to be more uniform with these packages, you may use
a choice construct to allow choosing between two alternatives.
Example (modified version of the code in barebox.mk):

choice
         prompt "version"
         help
           Select the specific uboot-tools version you want to use

config BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
         bool "Use a recent upstream version"

config BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION
         bool "Use the same sources of the uboot package"

endchoice

This has the advantage that adding a third possibility would be
simply a matter of adding another choice, without having to rework
the whole thing and having to take care of backward compatibility.

But this may be overengineering for the relatively simple uboot-tools
package.

-- 
Luca
