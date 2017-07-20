From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Jul 2017 10:52:32 +0200
Subject: [Buildroot] [PATCH v7 4/9] core: sanitize RPATH in target tree
 at the end of target finalization
In-Reply-To: <771a7a36-ab54-461f-34da-d3f459e7b55c@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
 <1499273594-12106-5-git-send-email-wg@grandegger.com>
 <44a9d6b5-3f51-f3b6-94e4-379c459c1b93@mind.be>
 <771a7a36-ab54-461f-34da-d3f459e7b55c@grandegger.com>
Message-ID: <ba2bb0b5-0d7f-3257-a999-5318b417428b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20-07-17 10:25, Wolfgang Grandegger wrote:
> 
> 
> Am 20.07.2017 um 01:34 schrieb Arnout Vandecappelle:
>>
>>
>> On 05-07-17 18:53, Wolfgang Grandegger wrote:
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> ---
>>>   Makefile | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index cdc3a64..1a826fc 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -725,6 +725,8 @@ endif
>>>         @$(call MESSAGE,"Sanitizing RPATH in staging tree")
>>>       $(TOPDIR)/support/scripts/fix-rpath staging
>>> +    @$(call MESSAGE,"Sanitizing RPATH in target tree")
>>> +    $(TOPDIR)/support/scripts/fix-rpath target
>>
>>   I think we should do this *before* copying the overlay and calling the
>> post-build script. Indeed, in my mind, the user is completely responsible for
>> what happens there, and it should never be touched by us.
> 
> Well, the user will usually not care about the rpath. Therefore he might profit
> from the sanitization as well. Actually, the sanitization does usually not harm.
> The only thing I can think of is copying libraries at runtime to a dir set in an
> rpath. How is stripping handled?

 Look at the code :-) Stripping is done before overlay and post-build. Same with
removing locales and documentation etc. And also all package hooks, like
removing *.py files. Really, overlay and post-build are currently the very last
things that are done before making the rootfs.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
