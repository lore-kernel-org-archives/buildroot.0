From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 10 Jan 2018 06:25:09 -0600
Subject: [Buildroot] [PATCH v3 2/8] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <466a98fe-c60f-8ac6-181e-9dba54215cd9@green-communications.fr>
References: <1515557739-6027-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1515557739-6027-2-git-send-email-matthew.weber@rockwellcollins.com>
 <466a98fe-c60f-8ac6-181e-9dba54215cd9@green-communications.fr>
Message-ID: <CANQCQpbuXLuFBGkWEr6PGX7zRVRGUc+yXvZMaCL8=NwB68M93g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas,

On Wed, Jan 10, 2018 at 3:41 AM, Nicolas Cavallari
<Nicolas.Cavallari@green-communications.fr> wrote:
> On 10/01/2018 05:15, Matt Weber wrote:
>> +ifneq ($(BR2_OPTIMIZE_S)$(BR2_OPTIMIZE_0)$(BR2_OPTIMIZE_1)$(BR2_OPTIMIZE_2)$(BR2_OPTIMIZE_G),)
>> +ifeq ($(BR2_FORTIFY_SOURCE_1),y)
>> +TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=1
>> +else ifeq ($(BR2_FORTIFY_SOURCE_2),y)
>> +TARGET_CPPFLAGS += -D_FORTIFY_SOURCE=2
>> +endif
>> +else
>> +$(error BR2_FORTIFY_SOURCE_# requires optimization level s/1/2/3/g)
>> +endif
>
> This seems to test if the optimization level is s/0/1/2/g instead of
> s/1/2/3/g

Good catch, will update in v4

>
> Shouldn't this actually be expressed as a dependency in Config.in
> instead ? (i.e. make BR2_FORTIFY_SOURCE_{1,2} depends on !BR2_OPTIMIZE_0)

I looked at a few ways of doing this and since those optimize
variables are from a choice, I couldn't depend on them in Kconfig.  I
think I could change how that choice works to evaluate a value which
is set to the choice, however that seemed more complex then just
documenting and errorring.  I'm definitely open to ideas on this.

Matt
