From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 23:00:31 +0200
Subject: [Buildroot] [RFC PATCH v5 08/11] core: install relocation
 script and location at the end of the build
In-Reply-To: <7b3f4d28-f024-5dba-6911-dda0aec7db72@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-9-git-send-email-wg@grandegger.com>
 <CAHXCMMKowyzQ091YNu9ewOTcgTXkTohXEfQUBNp=3z+GT1TBjQ@mail.gmail.com>
 <7b3f4d28-f024-5dba-6911-dda0aec7db72@grandegger.com>
Message-ID: <49dbb70b-20d1-a429-6808-2c8a78aad0f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-07-17 21:51, Wolfgang Grandegger wrote:
> 
> 
> Am 01.07.2017 um 16:11 schrieb Samuel Martin:
>> Hi Wolfgang,
>>
>> On Fri, Jun 30, 2017 at 10:37 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>>> The script "relocate-sdk.sh" is installed into the top directory of
>>> the SDK (HOST_DIR) and the SDK location path is stored in the file
>>> "HOST_DIR/usr/share/buildroot/sdk-location"-
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> ---
>>>   Makefile | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index f5ea6a8..a5dfdfd 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -553,6 +553,9 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>>>
>>>   .PHONY: world
>>>   world: target-post-image
>>> +       @$(call MESSAGE,"Rendering the SDK relocatable")
>>> +       install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR) && \
>>
>> I don't think "&& \" is really needed here
> 
> It's important. The "relocate-sdk.sh" will use it do do the relocation (please
> have a look to the script).

 The line below is indeed needed, but the && \ is not. Make will abort as soon
as one command fails. And anyway, the install shouldn't fail.

 By the way, while I'm commenting on this line:

	$(INSTALL) -D -m 0755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)

> 
>>
>>> +       echo $(HOST_DIR) > $(HOST_DIR)/usr/share/buildroot/sdk-location
>>
>> I'm not sure these few commands belong to the world target, maybe a
>> host-finalize target could be added...
>>
>>>
>>>   # Populating the staging with the base directories is handled by the
>>> skeleton package
>>>   $(STAGING_DIR):
> 
> Other opinions?

 Not sure what you're asking here.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
