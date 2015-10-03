From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 16:14:40 +0100
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <560FEF35.5060508@lucaceresoli.net>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
 <20150930124554.4a7abec2@free-electrons.com> <560FC397.2050404@mind.be>
 <560FEF35.5060508@lucaceresoli.net>
Message-ID: <560FF0E0.6010703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-10-15 16:07, Luca Ceresoli wrote:
> Hi Arnout, Thomas,
> 
> Arnout Vandecappelle wrote:
> [...]
>>
>>>
>>> I am wondering if there are indeed no places left where a final / could
>>> sneak in. For example, when you specify a custom tarball location for
>>> packages like U-Boot, the Linux kernel and so on.
>>>
>>> For Linux and U-Boot, it is taken care of:
>>>
>>> UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
>>>
>>> LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
>>>
>>> But for example, for the external toolchain site:
>>>
>>> TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>>>
>>> I believe this means that the TOOLCHAIN_EXTERNAL_SITE variable will
>>> contain a final /. But that's indeed the only case I could find from a
>>> quick inspection.
>>
>>   Well, to be consistent, the removal should not be done for U-Boot or Linux
>> either, and instead the user should get this error message when he builds.
> 
> But FOO_SITE is generated internally when the user chooses to fetch from
> a custom URL. The user has no access to FOO_SITE in these cases, so
> Buildroot should strip them.

 You're completely right, sorry!


> So I guess I'll add a patsubst to toolchain-external too, and hunt for
> other places where it might be needed.

 I can't think of an easy grep for that :-(


 Regards,
 Arnout


-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
