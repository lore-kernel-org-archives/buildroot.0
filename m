From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 22 Oct 2014 16:26:07 +0200
Subject: [Buildroot] [PATCH] Complain loudly if BR2_GLOBAL_PATCH_DIR
 does not exit
In-Reply-To: <87oat4jj95.fsf@steelpick.2x.cz>
References: <1413880974-30138-1-git-send-email-sojka@merica.cz>
 <20141021165817.GI3912@free.fr>
 <CAGduivxejVSE-p42u+WRBbYqc-oMNSKdd6cEqBw4ROtuKUU5sA@mail.gmail.com>
 <87tx2wjpob.fsf@steelpick.2x.cz>
 <CAGduivy5cXHFqEj-ZV16XSUU8y+fEaDS2cOZu-OAJ16q=XkmTQ@mail.gmail.com>
 <87oat4jj95.fsf@steelpick.2x.cz>
Message-ID: <CAGduivysSGuxWrZOaW8ayMYwqjrkHC1F+XCxjVg7XmDyXQ0Q7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 22, 2014 at 4:01 PM, Michal Sojka <sojka@merica.cz> wrote:
> On Wed, Oct 22 2014, Maxime Hadjinlian wrote:
>> On Wed, Oct 22, 2014 at 1:43 PM, Michal Sojka <sojka@merica.cz> wrote:
>>> On Wed, Oct 22 2014, Maxime Hadjinlian wrote:
>>>> Hi Michal, Yann, all
>>>>
>>>> On Tue, Oct 21, 2014 at 6:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>>> Michal, All,
>>>>>
>>>>> On 2014-10-21 10:42 +0200, Michal Sojka spake thusly:
>>>>>> If the BR2_GLOBAL_PATCH_DIR is misspelled in the .config or if somebody
>>>>>> renamed the existing directory with patches, buildroot happily builds
>>>>>> everything but without the patches. As this can lead to surprising
>>>>>> results,
>>>>>> ---
>>>>>>  package/pkg-generic.mk | 5 +++++
>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>>>>> index 259ee02..46d92aa 100644
>>>>>> --- a/package/pkg-generic.mk
>>>>>> +++ b/package/pkg-generic.mk
>>>>>> @@ -162,6 +162,11 @@ $(BUILD_DIR)/%/.stamp_patched:
>>>>>>       $(Q)touch $@
>>>>>>       @$(call step_end,patch)
>>>>>>
>>>>>> +# Check that all directories specified in BR2_GLOBAL_PATCH_DIR exist.
>>>>>> +$(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>>>>>> +     $(if $(wildcard $(dir)),,\
>>>>>> +             $(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
>>>>>> +
>>>> On a small note, since we already do a '[...] test -d $${D} [...]',
>>>> why don't you simply add an else condition with the error message ?
>>>
>>> Because $(D) is in fact $(BR2_GLOBAL_PATCH_DIR)/$(RAWNAME), which is not
>>> required to exist for every package.
>> Ah yes indeed. Sorry.
>> Other question, why don't put that bit of code at the beginning of the
>> target stamp_patched ? Or at least in the target stamp_patched ?
>
> Because the same check would be performed many times for every package.
> This way, things are checked only once, while the Makefile is read.
Well. As you may have seen, we already execute the stamp-patched
target for every package, we do some action, even call a script. So...
I don't think it would matter much to add this check for every
package. And IMHO, it would be better suited in that block of code.
But I don't know what would be preferred in this case.
>
> -Michal
