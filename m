From: James Byrne <james.byrne@origamienergy.com>
Date: Fri, 6 Apr 2018 11:22:39 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: Correctly take source date
 from commit date
In-Reply-To: <b5fd4075-1939-04c6-2295-69d6f426ac57@mind.be>
References: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
 <b5fd4075-1939-04c6-2295-69d6f426ac57@mind.be>
Message-ID: <8c440018-c6fd-6cce-445e-41df1f267667@origamienergy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 30/03/18 20:28, Arnout Vandecappelle wrote:
> On 28-03-18 14:26, James Byrne wrote:
>> Git repository. There is no need to use TOPDIR, because the current
>> directory will always be TOPDIR, and in any case the Git repository may
>> be at a higher directory level if Buildroot has been imported into a
>> larger build system.
>
>   Hm, but in that case, do you really want SOURCE_DATE_EPOCH to be set to the git
> epoch of the larger build system? I think that depends a lot on the exact
> circumstances.
>
>   Anyway, a much more likely situation is that your "larger build system"
> includes one or more BR2_EXTERNAL directories - and those are typically a lot
> more volatile than the Buildroot directory itself. So maybe the source epoch
> should be set to the git epoch of one of those?
>
>   I think there are just too many different situations here, and that we should
> just rely on the user explicitly setting SOURCE_DATE_EPOCH to whatever is
> appropriate for her/him. That said, using any surrounding git repo sounds like a
> sane default. So in the end I'm not really opposed to your patch.

You are right. I had not understood the significance of
SOURCE_DATE_EPOCH, but do now, thanks. I still think however that taking
the commit date of whatever repository you are in is a better default
than only doing so if the repository is at the same level as the
Buildroot tree.

>> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
>> ---
>>   Makefile | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 9e2402d..59af554 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -253,8 +253,10 @@ export TZ = UTC
>>   export LANG = C
>>   export LC_ALL = C
>>   export GZIP = -n
>> -BR2_VERSION_GIT_EPOCH = $(shell GIT_DIR=$(TOPDIR)/.git $(GIT) log -1 --format=%at)
>> -export SOURCE_DATE_EPOCH ?= $(if $(wildcard $(TOPDIR)/.git),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
>> +GIT := $(call qstrip,$(BR2_GIT))
>
>   This is in fact defined in package/pkg-download.mk. I guess the problem is that
> that that file doesn't get included on an unconfigured system. However, in that
> case, how does your BR2_REPRODUCIBLE get set? Can you specify under which
> circumstances this variable is not defined?

I have to apologise here because I confused myself by adding debugging
to the Makefile that caused SOURCE_DATE_EPOCH to get evaluated
immediately (before Makefile.in was included), and hence I got an error
instead of the correct date. In normal usage however this would never
happen, so this change is unnecessary.

It did make me realise though that the 'git log' command is executed
every time SOURCE_DATE_EPOCH is referenced (over 400 times in the build
I tested), which is not very efficient given that the answer cannot
change, so I will submit a revised patch that addresses this.

>> +BR2_IN_WORK_TREE = $(if $(subst false,,$(shell $(GIT) rev-parse --is-inside-work-tree 2> /dev/null || echo false)),Y,)
>
>   This would be much simpler:
>
> BR2_IN_WORK_TREE = $(shell $(GIT) rev-parse --is-inside-work-tree 2> /dev/null)
>
>   This will be empty in case it is not in a work tree, and 'true' if it is.
>
>> +BR2_VERSION_GIT_EPOCH = $(shell $(GIT) log -1 --format=%at)
>> +export SOURCE_DATE_EPOCH ?= $(if $(BR2_IN_WORK_TREE),$(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
>   But actually, it could be made a whole lot simpler:
>
> BR2_VERSION_GIT_EPOCH = $(shell $(GIT) log -1 --format=%at 2> /dev/null)
> export SOURCE_DATE_EPOCH ?= $(or $(BR2_VERSION_GIT_EPOCH),$(BR2_VERSION_EPOCH))
>
> BR2_VERSION_GIT_EPOCH will be empty if it's not in a worktree.

Good point, that's much neater. I will use this in my revised patch.

Regards,

James
The contents of this email and any attachment are confidential to the intended recipient(s). If you are not an intended recipient: (i) do not use, disclose, distribute, copy or publish this email or its contents; (ii) please contact the sender immediately; and (iii) delete this email. Origami Energy Limited (company number 8619644); Origami Storage Limited (company number 10436515) and OSSPV001 Limited (company number 10933403), each registered in England and each with a registered office at: Ashcombe Court, Woolsack Way, Godalming, GU7 1LQ.
