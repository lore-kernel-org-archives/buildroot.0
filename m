From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 12 Mar 2016 10:22:41 +0100
Subject: [Buildroot] [PATCH v7 05/18] core: make staging *-config
	scripts relocatable
In-Reply-To: <56E0BAB6.1030707@mind.be>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-6-git-send-email-s.martin49@gmail.com>
 <20160309232438.GG5634@free.fr> <56E0BAB6.1030707@mind.be>
Message-ID: <CAHXCMMJtnh1XPznOArSHrbANLHAbiE3uXwJJDy5DxJ7iHeLQ1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Arnout, all,

On Thu, Mar 10, 2016 at 1:07 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/10/16 00:24, Yann E. MORIN wrote:
>>
>> Samuel, All,
>>
>> On 2016-03-09 23:58 +0100, Samuel Martin spake thusly:
>>>
>>> This change adjusts the _CONFIG_SCRIPTS hook to set add {exec_,}prefix
>>> computed
>>> relatively to the script location.
>>>
>>> This patch hook only fixes *-config scripts located in the staging area,
>>> the target ones are already removed. A follow-up change will fix those
>>> from the HOST_DIR location.
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>>
>>> ---
>>> changes v6->v7:
>>> - none
>>>
>>> changes v5->v6:
>>> - new patch
>>> ---
>>>   package/pkg-generic.mk | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> index 3904c09..ffa21ee 100644
>>> --- a/package/pkg-generic.mk
>>> +++ b/package/pkg-generic.mk
>>> @@ -240,7 +240,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
>>>                 $(call MESSAGE,"Fixing package configuration files") ;\
>>>                         $(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
>>>                                 -e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
>>> -                               -e
>>> "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
>>> +                               -e
>>> "s,^\(exec_\)\?prefix=.*,\1prefix=\`dirname \$$0\`/../../usr,g" \
>>
>>
>> I'd prefer we use the $() form when calling subshells:
So am I ;-)

>>
>>      -e "s,^\(exec_\)\?prefix=.*,\1prefix=$$(dirname \$$0)/../../usr,g"
>
>                                             ^ missing \ here
>
>>
>> I know we switched to using `` in some locations, but that was because
>> those locations may be called with various levels of $(eval), and that
>> would cause $$() to be evaluated too early in some situations.
>
I don't remember the exact reason of this choice... either consistency
WRT the `` use, and/or to make the line easier to read avoiding
duplicating $$(...) and \... :-)

>
>  But we like things to be consistent, so I'd stick to `.
>
>  OTOH, this particular bit is not going to be expanded by the shell, but is
> actually inserted into the script. So perhaps we don't _want_ to be
> consistent here.

I don't have strong opinion about this, I'll check what we usually do
in other wrappers.

>
>  But like Yann says, it's not so important.
>
>  Regards,
>  Arnout
>
>
>>
>> However, here we are in a real rule, so there's no such ambiguity.
>>
>> But I won't block it just for that. I you agree with my proposed change,
>> that's OK; if you don't, that's OK too:
>>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Thx.

Regards,


-- 
Samuel
