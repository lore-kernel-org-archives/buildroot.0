From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 3 Oct 2015 17:07:33 +0200
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <560FC397.2050404@mind.be>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
 <20150930124554.4a7abec2@free-electrons.com> <560FC397.2050404@mind.be>
Message-ID: <560FEF35.5060508@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas,

Arnout Vandecappelle wrote:
[...]
>
>>
>> I am wondering if there are indeed no places left where a final / could
>> sneak in. For example, when you specify a custom tarball location for
>> packages like U-Boot, the Linux kernel and so on.
>>
>> For Linux and U-Boot, it is taken care of:
>>
>> UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
>>
>> LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
>>
>> But for example, for the external toolchain site:
>>
>> TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>>
>> I believe this means that the TOOLCHAIN_EXTERNAL_SITE variable will
>> contain a final /. But that's indeed the only case I could find from a
>> quick inspection.
>
>   Well, to be consistent, the removal should not be done for U-Boot or Linux
> either, and instead the user should get this error message when he builds.

But FOO_SITE is generated internally when the user chooses to fetch from
a custom URL. The user has no access to FOO_SITE in these cases, so
Buildroot should strip them.

So I guess I'll add a patsubst to toolchain-external too, and hunt for
other places where it might be needed.

-- 
Luca
