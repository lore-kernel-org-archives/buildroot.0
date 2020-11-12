From: Stefan Agner <stefan@agner.ch>
Date: Thu, 12 Nov 2020 21:43:58 +0100
Subject: [Buildroot] [PATCH] package/apparmor: fix permission bits for
 apparmor.service
In-Reply-To: <9647402851f79ad6938580d474e328a6@agner.ch>
References: <46b899ee9f607f3d03a2881b83d355751cc07f64.1605212315.git.stefan@agner.ch>
 <20201112212613.414ad97c@windsurf.home>
 <9647402851f79ad6938580d474e328a6@agner.ch>
Message-ID: <477b84b9d57c587e1103221bee8feb6a@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-11-12 21:42, Stefan Agner wrote:
> On 2020-11-12 21:26, Thomas Petazzoni wrote:
>> Hello Stefan,
>>
>> Thanks for your patch!
>>
>> On Thu, 12 Nov 2020 21:21:34 +0100
>> Stefan Agner <stefan@agner.ch> wrote:
>>
>>> Avoid setting executable bits for apparmor.service. This gets rid of a
>>> corresponding warning during installation:
>>>   Configuration file ../target/usr/lib/systemd/system/apparmor.service
>>>   is marked executable. Please remove executable permission bits.
>>>   Proceeding anyway.
>>>
>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>>> ---
>>>  package/apparmor/apparmor.mk | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
>>> index 4d08b0433b..7ea0fabd91 100644
>>> --- a/package/apparmor/apparmor.mk
>>> +++ b/package/apparmor/apparmor.mk
>>> @@ -88,7 +88,7 @@ endef
>>>  define APPARMOR_INSTALL_INIT_SYSTEMD
>>>  	$(INSTALL) -D -m 0755 $(@D)/parser/apparmor.systemd \
>>>  		$(TARGET_DIR)/lib/apparmor/apparmor.systemd
>>
>> Any reason not to change this one as well ?
> 
> Hm, I somehow thought this is a directory. But it is actually a script
> which afaik only gets included, so I guess we can take away executable
> as well.

No it is actually executed by the systemd service:
apparmor.service:ExecStart=/lib/apparmor/apparmor.systemd reload

So this needs executable bits.

--
Stefan
