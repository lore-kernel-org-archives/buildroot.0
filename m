From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 13:01:27 +0100
Subject: [Buildroot] [PATCH v3 2/4] pkg-generic: prevent _SITE URLs with
 a trailing slash
In-Reply-To: <20150930124554.4a7abec2@free-electrons.com>
References: <1443456634-21484-1-git-send-email-luca@lucaceresoli.net>
 <1443456634-21484-3-git-send-email-luca@lucaceresoli.net>
 <20150930124554.4a7abec2@free-electrons.com>
Message-ID: <560FC397.2050404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-09-15 11:45, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
> 
> On Mon, 28 Sep 2015 18:10:32 +0200, Luca Ceresoli wrote:
> 
>>  # Retrieve the archive
>>  $(BUILD_DIR)/%/.stamp_downloaded:
>> +	@(echo "$($(PKG)_SITE)" | grep -Eq "[^/]$$" || \
>> +		(echo "$(PKG)_SITE ($($(PKG)_SITE)) cannot have a trailing slash" && false))
> 
> You could use $(error ...) instead:
> 
>> +	@(echo "$($(PKG)_SITE)" | grep -Eq "[^/]$$" || \
>> +		$(error "$(PKG)_SITE ($($(PKG)_SITE)) cannot have a trailing slash"))

 That's not going to work AFAIK. The whole thing would have to be converted to a
make condition.

 BTW, Luca, you should indicate in your commit message why this has to be part
of .stamp_downloaded and not a static check in inner-generic-package.

> 
> I am wondering if there are indeed no places left where a final / could
> sneak in. For example, when you specify a custom tarball location for
> packages like U-Boot, the Linux kernel and so on.
> 
> For Linux and U-Boot, it is taken care of:
> 
> UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
> 
> LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
> 
> But for example, for the external toolchain site:
> 
> TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
> 
> I believe this means that the TOOLCHAIN_EXTERNAL_SITE variable will
> contain a final /. But that's indeed the only case I could find from a
> quick inspection.

 Well, to be consistent, the removal should not be done for U-Boot or Linux
either, and instead the user should get this error message when he builds.

 Regards,
 Arnout

> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
