From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 9 Nov 2015 15:52:24 +0100
Subject: [Buildroot] [PATCHv4] core/pkg-generic: check proper package
 installation
In-Reply-To: <56409D97.20002@lucaceresoli.net>
References: <1446837330-31048-1-git-send-email-yann.morin.1998@free.fr>
 <563D2FFA.5010403@mind.be> <20151106230701.GC3746@free.fr>
 <56409D97.20002@lucaceresoli.net>
Message-ID: <5640B328.6030408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-11-15 14:20, Luca Ceresoli wrote:
> Dear Yann,
> 
> Yann E. MORIN wrote:
>> Arnout, All,
>>
>> On 2015-11-06 23:55 +0100, Arnout Vandecappelle spake thusly:
>>> On 06-11-15 20:15, Yann E. MORIN wrote:
>>>> Some packages misbehave, and install files in either of;
>>>>    - $(STAGING_DIR)/$(O) or $(TARGET_DIR)/$(O),
>>>>    - $(STAGING_DIR)/$(HOST_DIR) or $(TARGET_DIR)/$(HOST_DIR).
>>>>
>>>> One common reason for that is that pkgconf now prepends the sysroot path
>>>> to all the paths it returns. Other reasons vary, but are mostly due to
>>>> poorly writen generic-packages.
>>>>
>>>> Add a check for those locations, as part of the command blocks for the
>>>> target and staging installs.
>>>>
>>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>>> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
>>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>>> Cc: Peter Seiderer <ps.report@gmx.net>
>>>> Cc: Romain Naour <romain.naour@openwide.fr>
>>>>
> [...]
>>>> +        exit 1; \
>>>> +    fi
>>>
>>>   I think it's better without this duplication so with a second parameter and
>>> calling the function twice.
>>
>> Well, it's either duplication of the if-block, or duplication of the
>> call sites. And I think it is better to have duplication of the
>> if-blocks, in cas we need to check for mor eloactions, otherwise we'd
>> have to duplicate even more the call sites...
> 
> Is it possible to make check-install-dirs (note the plural) just call
> multiple times check-install-dir (singular), passing a different path
> each time?

 That actually increases complexity and decreases readability compared to the
current duplication of the if-block, because you (as a reader) have to parse
both macros and keep them in your head simultaneously to understand what's going
on. In such a case, I do prefer a bit of duplication.

 Regards,
 Arnout


> 
> I'm sure you know all problems in computer science (except one) can be
> solved by adding another level of indirection! :-)
> 
> Obviously this can be a future improvement, especially useful in case
> the list of paths to check grew longer.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
