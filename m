From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 3 Dec 2015 18:11:59 +0100
Subject: [Buildroot] [PATCH 06/51] package/perl: include perl-cross in
 the legal-info output
In-Reply-To: <20151123212352.GK3857@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <f360919da5180e26ce4f96eefed14c29b526b428.1448289515.git.yann.morin.1998@free.fr>
 <20151123212400.1ae778c8@free-electrons.com> <20151123212352.GK3857@free.fr>
Message-ID: <566077DF.5000709@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann, Thomas,

Yann E. MORIN wrote:
> Thomas, All,
>
> On 2015-11-23 21:24 +0100, Thomas Petazzoni spake thusly:
>> On Mon, 23 Nov 2015 15:47:36 +0100, Yann E. MORIN wrote:
>>> The perl-cross sources are combined with the perl sources, so they must
>>> be redistributed for proper compliance.
>>>
>>> Add a post-legal-info hook that also installs them in the legal-info
>>> output.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
>>> Cc: Francois Perrad <fperrad@gmail.com>
>>> ---
>>>   package/perl/perl.mk | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
>>> index f3b7b2b..25294e6 100644
>>> --- a/package/perl/perl.mk
>>> +++ b/package/perl/perl.mk
>>> @@ -32,6 +32,13 @@ define PERL_CROSS_EXTRACT
>>>   endef
>>>   PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
>>>
>>> +# ... and as such should be part of the legal-info redistribution
>>> +define PERL_CROSS_LEGAL_INFO
>>> +	$(Q)$(call hardlink-copy,$(DL_DIR)/$(PERL_CROSS_SOURCE),\
>>> +				 $(PERL_REDIST_SOURCES_DIR))
>>> +endef
>>> +PERL_POST_LEGAL_INFO_HOOKS += PERL_CROSS_LEGAL_INFO
>>> +
>>>   define PERL_CROSS_SET_POD
>>>   	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
>>>   endef
>>
>> I think this is not the proper way of solving the problem. perl-cross
>> is downloaded through <pkg>_EXTRA_DOWNLOADS, and <pkg>_EXTRA_DOWNLOADS
>> files should be saved in legal-info, without requiring some special
>> handling from each package using <pkg>_EXTRA_DOWNLOADS.
>
> Well, that's what I thought initially.
>
> However, I don't think that _EXTRA_DOWNLOADS should be saved to the
> legal-info. A reason I already explained is that _EXTRA_DOWNLOADS are
> used by the Blackfin external toolchains to download extra parts of
> there sysroots, and that should not be part of legal-info.
>
> Furthermore, what if a FLOSS package has an EXTRA_DOWNLOAD to download
> non-redistributable stuff. An example that is easy to understand, would
> be a Doom package, where the engine is FLOSS (GPL), and where the WAD
> files are downlaodable from an internal server. Such a package could use
> _EXTRA_DOWNLOADS to fetch the WAD files. The distributor may have an
> agreement to provide the WAD files in the product, but not reditribute
> them otherwise.

I think Thomas' position is correct. Generally speaking, there's no
specific reason an _EXTRA_DOWNLOAD should be non-redistributable. All we
know is it's a file. Arguing on what potential packages might do is a
bit arbitrary IMO.

I think the best thing to do in legal-info is to save both _SORUCE and 
_EXTRA_DOWNLOADS by default, and to save neither when _REDISTRIBUTE =
NO. Packages that need to save some files but not all of them should
set _REDISTRIBUTE = NO and save manually everything needed.

The manual handling we'd need is anyway pretty limited with current
Buildroot, as _EXTRA_DOWNLOADS is only user by two packages: the
Blackfin external toolchain and perl.

-- 
Luca
