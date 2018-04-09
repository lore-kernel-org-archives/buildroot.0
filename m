From: James Byrne <james.byrne@origamienergy.com>
Date: Mon, 9 Apr 2018 16:50:31 +0100
Subject: [Buildroot] [PATCH v2] Makefile: Avoid executing 'git log' each
 time SOURCE_DATE_EPOCH is used
In-Reply-To: <20180407143358.GA2341@scaer>
References: <1522239999-15582-1-git-send-email-james.byrne@origamienergy.com>
 <1523010383-27024-1-git-send-email-james.byrne@origamienergy.com>
 <20180407143358.GA2341@scaer>
Message-ID: <4cda6a08-dab5-0901-802c-4ea2d7818cea@origamienergy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 07/04/18 15:33, Yann E. MORIN wrote:
> On 2018-04-06 11:26 +0100, James Byrne spake thusly:
>> If SOURCE_DATE_EPOCH is not defined it was given a definition that
>> caused 'git log' to be executed each time the variable is referenced,
>> which is not very efficient given that the answer cannot change.
>>
>> This commit moves the definition of BR2_VERSION_GIT_EPOCH after the
>> inclusion of Makefile.in (so that GIT is defined) and makes it a simply
>> expanded variable so that it is only evaluated once.
>>
>> In addition, the git directory is no longer explicitly set to be TOPDIR
>> meaning that the default date will come from the commit date of whatever
>> repository the code is commited within instead of only doing so if the
>> repository is at the same level as the Buildroot tree.
>
> Since your are saying "in addition", it smells like this should have
> been two seaparate commits:
>
>    - one to change the variable to being simply expanded
>
>    - a second one to not enforce the git directory.
>
> I am totally OK with the first change, while I am still not convinced by
> the second. As I already said, if Buildroot is used from a higher-level
> buildsystem, it is the responsibility of that higher-level buildsystem
> to appropriately set SOURCE_DATE_EPOCH in the environment.

Understood, I will resubmit this patch without the second change.

> Also, bear in mind that, even without a higher-level buildsystem, it is
> possible to call Buildroot without actualy being in Buildroot's tree,
> e.g.:
>
>      $ make -C /path/to/buildroot O=/path/to/build-dir
>
> Or even:
>
>      $ cd /path/to/build-dir
>      $ make -C /path/to/buildroot O=$(pwd) foo_defconfig
>      $ make
>
> And then you would lose the git info that is present in the Buildroot
> tree in /path/to/buildroot. I actually use either forms quite a lot,
> especially the second one. In fact, I even never build in the Buildroot
> tree, except when people report it is broken and I need to investigate.
>
> So, I am still opposed to the second change.

In both of your examples it will still work as expected since the
buildroot makefile is always invoked with "-C /path/to/buildroot", which
means that when the 'git log' command is executed the current directory
is always '/path/to/buildroot' and so the commit date will be the date
of the tree that the Buildroot makefile is in.

If you think you might change your mind I will submit that change as a
new patch, as I still think it makes a better default, but if you don't
agree then I won't bother as it's a very minor thing, and as you say it
can easily be overridden by setting SOURCE_DATE_EPOCH in the environment.

James
The contents of this email and any attachment are confidential to the intended recipient(s). If you are not an intended recipient: (i) do not use, disclose, distribute, copy or publish this email or its contents; (ii) please contact the sender immediately; and (iii) delete this email. Origami Energy Limited (company number 8619644); Origami Storage Limited (company number 10436515) and OSSPV001 Limited (company number 10933403), each registered in England and each with a registered office at: Ashcombe Court, Woolsack Way, Godalming, GU7 1LQ.
