From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Wed, 10 Jan 2018 17:30:35 +0100
Subject: [Buildroot] [PATCH v3 2/8] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <CANQCQpbuXLuFBGkWEr6PGX7zRVRGUc+yXvZMaCL8=NwB68M93g@mail.gmail.com>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1515557739-6027-2-git-send-email-matthew.weber@rockwellcollins.com>
 <466a98fe-c60f-8ac6-181e-9dba54215cd9@green-communications.fr>
 <CANQCQpbuXLuFBGkWEr6PGX7zRVRGUc+yXvZMaCL8=NwB68M93g@mail.gmail.com>
Message-ID: <4c4b397b-7c88-eed0-4435-92f0cd115fd1@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/2018 13:25, Matthew Weber wrote:
> Nicolas,
> 
> On Wed, Jan 10, 2018 at 3:41 AM, Nicolas Cavallari
> <Nicolas.Cavallari@green-communications.fr> wrote:
>> On 10/01/2018 05:15, Matt Weber wrote:
>>> +ifneq ($(BR2_OPTIMIZE_S)$(BR2_OPTIMIZE_0)$(BR2_OPTIMIZE_1)$(BR2_OPTIMIZE_2)$(BR2_OPTIMIZE_G),)
>>> +ifeq ($(BR2_FORTIFY_SOURCE_1),y)
>>> +TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=1
>>> +else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
>>> +TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=2
>>> +endif
>>> +else
>>> +$(error BR2_FORTIFY_SOURCE_# requires optimization level s/1/2/3/g)
>>> +endif
>>
>> This seems to test if the optimization level is s/0/1/2/g instead of
>> s/1/2/3/g
> 
> Good catch, will update in v4
> 
>>
>> Shouldn't this actually be expressed as a dependency in Config.in
>> instead ? (i.e. make BR2_FORTIFY_SOURCE_{1,2} depends on !BR2_OPTIMIZE_0)
> 
> I looked at a few ways of doing this and since those optimize
> variables are from a choice, I couldn't depend on them in Kconfig.

It should work fine.  What issue do you have ?

just adding "depends on !BR2_OPTIMIZE_0"
on the BR2_FORTIFY_SOURCE_1 and BR2_FORTIFY_SOURCE_2 definitions
should work.

if BR2_OPTIMIZE_0 is selected, then the choice will only have one
possible value.
