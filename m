From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Dec 2016 20:59:47 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
Message-ID: <3fae2ec3-3be6-e839-f854-210b223b65af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-12-16 18:39, Tal Shorer wrote:
> On Sun, Dec 11, 2016 at 3:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Tal, Thomas, All,
>>
>> On 2016-12-09 10:37 +0200, Tal Shorer spake thusly:
[snip]
>>> diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
>>> new file mode 100644
>>> index 0000000..e6bd7f7
>>> --- /dev/null
>>> +++ b/package/usbip/usbip.mk
>>> @@ -0,0 +1,18 @@
>>> +################################################################################
>>> +#
>>> +# usbib
>>> +#
>>> +################################################################################
>>> +
>>> +USBIP_SITE = $(LINUX_DIR)/tools/usb/usbip

 There's one little problem with this approach: it breaks 'make source-check' on
a clean tree. 'make source-check' doesn't extract the source, so "test -d
$$($(2)_OVERRIDE_SRCDIR)" will fail.

>>
>> This location is only valid since linux-3.17. Before that, it was in
>> drivers/staging/usbip/userspace/ so maybe you want to allow for the two
>> cases.
>> In Config.in:
>>
>>     if BR2_PACKAGE_USBIP
>>
>>     config BR2_PACKAGE_USBIP_3_17_OR_LATER
>>         bool "Linux kernel >= 3.17"
> I did this, but the other way around. The option is whether or not to
> use the _old_ path, so the unsuspecting user will get the new path for
> compatibility. Is this ok?
>>
>>     endif
>>
>> And then in usb.mk:
>>
>>     ifeq ($(BR2_PACKAGE_USBIP_3_17_OR_LATER),y)
>>     USBIP_BASE_DIR = tools/usb/usbip
>>     else
>>     USBIP_BASE_DIR = drivers/staging/usbip/userspace/
>>     endif
>>     USBIP_SITE = $(LINUX_DIR)/$(USBIP_BASE_DIR)
>>
>>     define USBIP_CHECK_SRC
>>         if [ ! -d $(USBIP_SITE) ]; then \
>>             echo "Your kernel does not have usbip in $(USBIP_BASE_DIR)" >&2; \
>>             exit 1; \
>>         fi
>>     endef
>>     USBIP_PRE_EXTRACT_HOOKS += USBIP_CHECK_SRC

 I really don't like this approach where the user has to specify it is Linux >=
3.17. If we start introducing version symbols, we should do it for all possible
versions and at the level of the BR2_KERNEL_LINUX symbol itself, similar like
for the external toolchain kernel headers symbol.

 However, doesn't something like this work? Or is it considered too much of a hack?

# Before v3.17 it was in staging.
# USBIP_SITE is only used inside rules, after linux has already been extracted.
USBIP_SITE = $(wildcard \
	$(LINUX_DIR)/tools/usb/usbip \
	$(LINUX_DIR)/drivers/staging/usbip/userspace)



 Regards,
 Arnout

>>
> I tried getting this hook to run, but since the site method is "local",
> the package just gets rsynced. However, trying to add this to
> USBIP_PRE_RSYNC_HOOKS doesn't help either because the rsync rule checks
> for the source directory before calling the PRE_RSYNC_HOOKS. The error
> this outputs to the user is as follows:
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
