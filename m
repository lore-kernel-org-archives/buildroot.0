From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Nov 2015 00:12:48 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
	installation
In-Reply-To: <20151106230701.GC3746@free.fr>
References: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
 <563D2FFA.5010403@mind.be> <20151106230701.GC3746@free.fr>
Message-ID: <563D33F0.5040300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-11-15 00:07, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-11-06 23:55 +0100, Arnout Vandecappelle spake thusly:
>> On 06-11-15 20:15, Yann E. MORIN wrote:
>>> Some packages misbehave, and install files in either of;
>>>   - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
>>>   - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).
>>>
>>> One common reason for that is that pkgconf now prepends the sysroot path
>>> to all the paths it returns. Other reasons vary, but are mostly due to
>>> poorly writen generic-packages.
>>>
>>> Add a check for those locations, as part of the command blocks for the
>>> target and staging installs.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>> Cc: Peter Seiderer <ps.report@gmx.net>
>>> Cc: Romain Naour <romain.naour@openwide.fr>

 All my comments answered OK, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

>>>
>>> ---
> [--SNIP--]
>>>  ################################################################################
>>> +# check-install-dirs -- check that packages do not incorrectly install files
>>> +# into incorrect locations
>>> +#
>>> +# argument 2 is the base directory to check for
>>> +################################################################################
>>> +define check-install-dirs
>>> +	$(Q)if [ -d $(1)/$(HOST_DIR) ]; then \
>>> +		printf "ERROR: package %s installs files in %s\n" $($(PKG)_NAME) $(1)$(HOST_DIR); \
>>
>>  Missing / between $(1) and $(HOST_DIR).
> 
> Normally not needed, because $(HOST_DIR) and $(O) are absolute paths, so
> there is already a leading '/' .
> 
> So:
>   - I kept a separating '/' in the tests to be extra-ultra sure (but it
>     arguably could be dropped),
>   - I did not add that extra '/' in the message so it is nicer when
>     presented to the user.
> 
>>> +		exit 1; \
>>> +	fi
>>> +	$(Q)if [ -d $(1)/$(O) ]; then \
>>> +		printf "ERROR: package %s installs files in %s\n" $($(PKG)_NAME) $(1)$(O); \
>>
>>  Ditto.
> 
> Ditto. ;-)
> 
>>> +		exit 1; \
>>> +	fi
>>
>>  I think it's better without this duplication so with a second parameter and
>> calling the function twice.
> 
> Well, it's either duplication of the if-block, or duplication of the
> call sites. And I think it is better to have duplication of the
> if-blocks, in cas we need to check for mor eloactions, otherwise we'd
> have to duplicate even more the call sites...
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
