From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Oct 2013 10:45:39 +0200
Subject: [Buildroot] [PATCH v8 RESEND 1/8] package: add base dependency
 to every package
In-Reply-To: <526A27FA.10602@mind.be>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
 <52683BBC.7070506@mind.be>
 <CAHkwnC_3oA+DKkUxVweB0Xt5wqWt11epFujXvmStEu25hGQNOA@mail.gmail.com>
 <5268F861.6050803@mind.be>
 <CAHkwnC9s0ZqVoE-5pZFwxb4adFw0hD3+SxrF4ri7jStbxypjTA@mail.gmail.com>
 <526A27FA.10602@mind.be>
Message-ID: <CAHkwnC9z_ySjX_dW3cfj-zDS1rz2_NDeh43n7YTk_JLgrAGJ=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 25, 2013 at 10:12 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 25/10/13 10:07, Fabio Porcedda wrote:
>>
>> On Thu, Oct 24, 2013 at 12:37 PM, Arnout Vandecappelle<arnout@mind.be>
>> wrote:
>>>
>>> >On 24/10/13 09:41, Fabio Porcedda wrote:
>>>>
>>>> >>
>
> [snip]
>
>>>> >>I've found a work around:
>>>> >>
>>>> >>$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
>>>> >>
>>>> >># to prevent circular dependency
>>>> >>ifneq ($(1),$(DEPENDENCIES_HOST_PREREQ))
>>>> >>$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>>>> >>endif
>>>> >>
>>>> >>What do you think about that?
>>>
>>> >
>>> >
>>> >  Looks good except that it's incorrect:-)  If HOST_PREREQ contains both
>>> >ccache and sstrip (not to mention tar or xz), the condition won't match.
>>> > You
>>> >can try something like:
>>> >
>>> >ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
>>
>> Ok good, I've updated the patch according.
>>
>
>  Have you tested it with various combinations of dependencies?

I've tested enabling "BR2_CCACHE" and "BR2_STRIP_sstrip" with
qemu_x86_defconfig and seems works fine.
The circular dependencies are gone.
I think the patch now does not introduce any regression.

I'm testing the whole patch set with top-level parallel make and
enabling "BR2_CCACHE" and "BR2_STRIP_sstrip".

Thanks and regards
-- 
Fabio Porcedda
