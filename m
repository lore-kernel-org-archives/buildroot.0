From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 9 May 2012 10:02:03 +0200
Subject: [Buildroot] [PATCH v3 02/22] gettext: warn that legal-info is
	not implemented
In-Reply-To: <4FAA1CFF.5090300@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-2-git-send-email-luca@lucaceresoli.net>
 <CAAXf6LW4v94Z8U8wtfCkdRQZ85qEM4p2GQNvAsDgijSW_ZSvYw@mail.gmail.com>
 <4FAA1CFF.5090300@lucaceresoli.net>
Message-ID: <CAAXf6LXBCRDnVNNQ2CbYqKpsD3zgnA99=FtTaPx0F1xsfZb8KQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 9, 2012 at 9:30 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Thomas De Schampheleire wrote:
>>
>> On Mon, May 7, 2012 at 10:12 PM, Luca Ceresoli<luca@lucaceresoli.net>
>> ?wrote:
>>>
>>> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>>> ---
>>> ?package/gettext/gettext.mk | ? ?3 +++
>>> ?1 files changed, 3 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
>>> index f3605da..1d9d84d 100644
>>> --- a/package/gettext/gettext.mk
>>> +++ b/package/gettext/gettext.mk
>>> @@ -113,6 +113,9 @@ $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY):
>>> $(GETTEXT_DIR)/$(GETTEXT_BINARY)
>>> ? ? ? ? ? ? ? ?autopoint envsubst gettext.sh gettextize msg* ?gettext)
>>> ? ? ? ?touch -c $@
>>>
>>> +gettext-legal-info:
>>> + ? ? ? @$(call legal-warning-pkg,gettext,cannot produce any legal info)
>>> +
>>
>> I don't think this statement is not entirely correct. It's not that we
>> 'cannot' produce the info. It's just that currently, we did not add
>> the necessary license definitions, right?
>> What about something like 'legal-info not yet implemented' or 'no
>> legal info saved yet' or ...?
>
> Yes, 'legal-info not yet implemented' is more understandable.
> I'll change that.
>
>
>
>> Moreover, will this be added to each package for which no legal info
>> is provided? What about making this message the default by putting it
>> in pkg-gentargets.mk, if no suitable variables were defined?
>
>
> Gentargets packages without _LICENSE / _LICENSE_FILES defined are handled
> automatically by gentargets. They get listed in the manifest this way:
>
> $ cat legal-info/manifest.csv
> package,version,license,license files,source archive
> ...
> freetype,2.4.8,unknown,not saved,freetype-2.4.8.tar.bz2
>
> The problem with non-gentargets packages is that they do not get listed
> automatically in the manifest, because the manifest is produced by the
> gentargets infrastrucure.
>
> Hence we should:
> ?- convert these packages to gentargets, or
> ?- manually implement a<PKG>-legal-info for these packages, or
> ?- make the user aware that these packages are not handled by the legal-info
> ? stuff: no manifest entry, no tarball, no license files.
>
> The first option is the best thing to do, but it's out of the scope of this
> patchset. The number of manual packages is consistently approaching zero
> anyway.
>
> I don't like the second option: this is work that would mostly be wasted
> when
> converting to gentargets. I would rather spend my time converting to
> gentargets.
> ?The third option is the warning you see.
>

Ok, thanks Thomas and Luca for the clarification.
