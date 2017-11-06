From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Nov 2017 16:16:40 -0600
Subject: [Buildroot] [PATCH 1/1] refpolicy: bump to 2.20170805
In-Reply-To: <d60a5544-08f0-ea73-1c40-c8409f3b4106@mind.be>
References: <20171103125856.16518-1-aduskett@gmail.com>
 <20171103185619.3de8abde@windsurf>
 <CAFSsvmqDWvMtg5hYYugd6VKSO3YUNFWB8dKp6t1M73SOwPWm2Q@mail.gmail.com>
 <CANQCQpZEdK7rMrNF_Xw-icCcAEExjZm2zJBKNVd-giXp+fpGLQ@mail.gmail.com>
 <d60a5544-08f0-ea73-1c40-c8409f3b4106@mind.be>
Message-ID: <CANQCQpaFqGEXwbPpWRwBr4uz76vCufY8pAMs4yO67Rn0vGQzbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Nov 6, 2017 at 4:11 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 06-11-17 14:51, Matthew Weber wrote:
>> Adam,

>>> We talked on IRC. :)  The contrib module is included in the tarball as
>>> Arnout has said.
>>>
>>>
>>
>> Sorry took a bit to get back to this email.  I've figured out what
>> happened.  Nothing has changed in how refpolicy and refpolicy-contrib
>> are released.  This patch series changes the package to use a released
>> archive vs the git repo.  In the upstream git repo it still uses the
>> submodule for retrieving the contrib repository.  I don't have a good
>> reason to go either way, but my development approach for refpolicy
>> leverage's the fact it's a GIT clone (less lines of change in a patch
>> I maintain on top of buildroot providing selectable GIT repo for this
>> package).  I could propose this patch if there is interest and that
>> would clear up which way to go....  we found it was hard to do
>> refpolicy development purely via patches.
>
>  In that case I think the way to go is to make a custom clone of refpolicy
> (including submodules) and using OVERRIDE_SRCDIR to build it. I usually have the
> following in my external:
>
> OVERRIDE_BASE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
> AUTO_OVERRIDES = $(notdir $(wildcard $(OVERRIDE_BASE_DIR)src/*))
> do_override = $(1)_OVERRIDE_SRCDIR = $(OVERRIDE_BASE_DIR)src/$(2)
> $(foreach override,$(AUTO_OVERRIDES),\
>         $(eval $(call do_override,$(call UPPERCASE,$(override)),$(override))))
>
>
> and then I put anything that needs a custom version as a git submodule under
> src/. I usually also put custom packages there, i.e. I don't use any versioning
> for them other than git itself.
>

Yep, I think we're headed the path of a out-of-tree build of refpolicy
using the SDK instead.  So no issue on my end.  Thanks for the update
Adam!

Matt
