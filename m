From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 30 Nov 2010 18:40:58 +0100
Subject: [Buildroot] handling package souce in .zip file
In-Reply-To: <4CF40789.70905@gmail.com>
References: <AANLkTinM+8TXLvddMZopiOOV_i-GR2+-z-k8s_6WY_UJ@mail.gmail.com>
	<1290800123.14151.49.camel@coalu.atr>
	<AANLkTi==3zifJ5J6eToFRvVTTBvPh0zx2FW=qn_jrXrH@mail.gmail.com>
	<1290814537.14151.55.camel@coalu.atr> <4CF40789.70905@gmail.com>
Message-ID: <AANLkTimynpGiX3XVY1MRpBp3DZpnWr3d_mLPG15V_da4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 29, 2010 at 9:05 PM, Paulius Zaleckas
<paulius.zaleckas@gmail.com> wrote:
> On 11/27/2010 01:35 AM, Lionel Landwerlin wrote:
>>
>> Le samedi 27 novembre 2010 ? 01:05 +0200, Paulius Zaleckas a ?crit :
>>>
>>> On Fri, Nov 26, 2010 at 9:35 PM, Lionel Landwerlin
>>> <llandwerlin@gmail.com> ?wrote:
>>>>
>>>> What's about this :
>>>>
>>>> unzip file.zip /tmp/plop
>>>> mv /tmp/plop/*/* output/build/myzippkg-0.1/
>>>
>>> Yes, this is almost what I was thinking, but the problem is that there
>>> is no way to override "standard" buildroot extraction step or at least
>>> I don't know it (using GENTARGET) :)
>>>
>>
>> You just need to define a macro per ".ext", just like what we've got for
>> the download macros.
>>
>> INFLATE.zip would be the 2 lines above, and for the rest it would be the
>> "bzcat/zcat/cat | tar -C ...".
>
> Yes, but the problem is here:
>
> # Unpack the archive
> $(BUILD_DIR)/%/.stamp_extracted:
> ? ? ? ?@$(call MESSAGE,"Extracting")
> ? ? ? ?$(Q)mkdir -p $(@D)
> ? ? ? ?$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) |
> \
> ? ? ? ?$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
> # some packages have messed up permissions inside
> ? ? ? ?$(Q)chmod -R ug+rw $(@D)
> ? ? ? ?$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
> ? ? ? ?$(Q)touch $@
>
> As you can see $(INFLATE$(suffix $($(PKG)_SOURCE)))
> $(DL_DIR)/$($(PKG)_SOURCE)
> output is piped to tar...
>

I still don't catch your problem.
You can embed this piped bzip/gzip + tar into one macro.
You would then have :

INFLATE_TAR.bz2 = bzcat $(1) | tar -C $(2) xf -
INFLATE_TAR.gz = zcat $(1) | tar -C $(2) xf -
INFLATE.zip = unzip $(1) /tmp/plop && mv /tmp/plop/*/* $(2)/

(altough it might be a little bit complex...)

Regards,

--
Lionel Landwerlin
