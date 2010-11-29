From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 29 Nov 2010 22:05:29 +0200
Subject: [Buildroot] handling package souce in .zip file
In-Reply-To: <1290814537.14151.55.camel@coalu.atr>
References: <AANLkTinM+8TXLvddMZopiOOV_i-GR2+-z-k8s_6WY_UJ@mail.gmail.com>	
	<1290800123.14151.49.camel@coalu.atr>	
	<AANLkTi==3zifJ5J6eToFRvVTTBvPh0zx2FW=qn_jrXrH@mail.gmail.com>
	<1290814537.14151.55.camel@coalu.atr>
Message-ID: <4CF40789.70905@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/27/2010 01:35 AM, Lionel Landwerlin wrote:
> Le samedi 27 novembre 2010 ? 01:05 +0200, Paulius Zaleckas a ?crit :
>> On Fri, Nov 26, 2010 at 9:35 PM, Lionel Landwerlin
>> <llandwerlin@gmail.com>  wrote:
>>> What's about this :
>>>
>>> unzip file.zip /tmp/plop
>>> mv /tmp/plop/*/* output/build/myzippkg-0.1/
>>
>> Yes, this is almost what I was thinking, but the problem is that there
>> is no way to override "standard" buildroot extraction step or at least
>> I don't know it (using GENTARGET) :)
>>
>
> You just need to define a macro per ".ext", just like what we've got for
> the download macros.
>
> INFLATE.zip would be the 2 lines above, and for the rest it would be the
> "bzcat/zcat/cat | tar -C ...".

Yes, but the problem is here:

# Unpack the archive
$(BUILD_DIR)/%/.stamp_extracted:
	@$(call MESSAGE,"Extracting")
	$(Q)mkdir -p $(@D)
	$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
# some packages have messed up permissions inside
	$(Q)chmod -R ug+rw $(@D)
	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
	$(Q)touch $@

As you can see $(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE)
output is piped to tar...
