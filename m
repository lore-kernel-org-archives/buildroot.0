From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 2 Feb 2012 08:41:28 +0100
Subject: [Buildroot] [RFC 02/15] legal-info: produce a manifest file
 with licensing info
In-Reply-To: <4F29AED3.4050306@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
 <1327849908-15588-3-git-send-email-luca@lucaceresoli.net>
 <201201311825.03489.arnout@mind.be>
 <4F29AED3.4050306@lucaceresoli.net>
Message-ID: <CAAXf6LXfd8_jXxEWiFimpPf6reZoapeZu0Z24pB=-+G-4TkdnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 1, 2012 at 10:29 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Arnout Vandecappelle wrote:
>>
>> On Sunday 29 January 2012 16:11:35 Luca Ceresoli wrote:
>>>
>>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>>
>> [snip]
>>>
>>> ?dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR)
>>> $(TARGET_DIR) \
>>> - ? ? ? $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
>>> + ? ? ? $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR) $(LEGAL_INFO_DIR)
>>
>> ?Since legal-info-prepare-manifest already depends on LEGAL_INFO_DIR, this
>> ?is redundant.
>
>
> I used to think some Buildroot user might want to 'make dirs'. I
> understand this is pretty useless, so I'll remove it.

For $(LEGAL_INFO_DIR), there isn't a real problem since you indeed put
it as a dependency elsewhere, which means that the directory will be
created anyway.
In other cases, like downloading packages, there is no such explicit
dependency on $(DL_DIR), and there may be certain scenarios that you
need to do 'make dirs' explicitly. One such scenario is when the first
downloaded package is not handled by wget (which creates the DL_DIR
automatically) but with e.g. git download.

>
>
>>
>> [snip]
>>>
>>> +legal-info-prepare-manifest: $(LEGAL_INFO_DIR)
>>> + ? ? ? @rm -f $(LEGAL_MANIFEST_CSV)
>>> + ? ? ? @echo "package,version,license">$(LEGAL_MANIFEST_CSV)
>>> +
>>
>> ?I might be wrong, but I think this won't rebuild the manifest if the
>> directory already exists. ?You'd need a dependency on FORCE (and add the
>> phony FORCE target).
>
>
> It is rebuilt because legal-info-prepare-manifest is PHONY.
>
>
>>
>> ?Again a minor comment: the clean target is missing here (but it's added
>> in the next patch). ?But for me, the first three patches can be rolled
>> into one.
>
>
> I could move the clean target to the 2nd patch, but actually this
> maintenance burden is quite annoying, and is going to be even more since
> this patchset will definitely have further changes.
>
> Anybody has something against squashing the first 3 or 4 patches as
> Arnout suggests?
>

No problem for me.

>
>>
>>> +legal-info: legal-info-prepare-manifest $(TARGETS_LEGAL_INFO)
>>>
>>> ?show-targets:
>>> ? ? ? ?@echo $(TARGETS)
>>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>>> index 8e73f34..e117223 100644
>>> --- a/package/Makefile.package.in
>>> +++ b/package/Makefile.package.in
>>> @@ -653,8 +653,10 @@ $(1)-rsync: ? ? ? ? ? ? ? ?$$($(2)_TARGET_RSYNC)
>>> ?$(1)-source: ? ? ? ? ?$$($(2)_TARGET_RSYNC_SOURCE)
>>> ?endif
>>>
>>> -$(1)-legal-info: ? ? ? $(1)-source
>>> +$(1)-legal-info: ? ? ? $(1)-source $(LEGAL_INFO_DIR)
>>> ? ? ? ? ? ? ? ? ? ? ? ?@echo -e
>>> "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
>>> + ? ? ? ? ? ? ? ? ? ? ? @echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
>>> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? >>$(LEGAL_MANIFEST_CSV)
>>
>> ?Same here: will the manifest be rebuilt if the directory already exists?
>
>
> It is rebuilt as well because $(1)-info-prepare-manifest is PHONY.
>
> Luca
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
