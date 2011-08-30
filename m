From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Tue, 30 Aug 2011 10:43:28 +0200
Subject: [Buildroot] [PATCH] git fetcher: do not remove the tree after
 initial clone
In-Reply-To: <4E5C9D44.6060704@lucaceresoli.net>
References: <1314538324-24679-1-git-send-email-n-dechesne@ti.com>
 <4E5B445F.5050603@lucaceresoli.net> <20110829142344.2edcfd12@skate>
 <CALB96N=tS1DKyTgLs8WF6Gh_UYPjWUbiRFGx+FkTauCiDw7OmQ@mail.gmail.com>
 <4E5C9D44.6060704@lucaceresoli.net>
Message-ID: <CALB96Nk5D5u5uaK_VaCfmcbXangM74rn5qkNpUAnC3SeA3FdtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 30, 2011 at 10:20 AM, Luca Ceresoli <luca@lucaceresoli.net>wrote:

>    I have a new version of my patch set, which I hope to submit soon, at
>>    least when the 2011.11 development process will open (by the end of the
>>    month, so should be in the next few days).
>>
>>
>> i like the 'local directory' method as well, really much. but i still
>> believe that the 2 things are complementary..
>>
>
> Thomas' local directory mechanism has an advantage: it works also for
> non-git (and even non-versioned) packages.
>
> You could somehow use this method for your needs too: git clone in a
> local directory once, then git pull before each BR rebuild. Not as
> straightforward as you would like, but maybe a good compromise.


ok. i am not planning to use this feature to improve the 'I am a developer'
situation.
in this case the local method is definetly better.

my use case is:
- i am using BR for a large project and all our programs are hosted on many
(internal) git servers
and these servers are far away (multisite company)
- many developers would often need to build a specific release (without
making changes in the code), just
fetch new/updated recipes and rebuild


>
>
>
>> i happen to use BR in a project using large git tree which are not close
>> to me, so I care about git fetch vs git clone.
>> on top of that there are many users that regularly make rebuild.
>>
>> the way i see what i propose is *just* an optimization of how BR will
>> use git, not a new workflow.
>>
>
> Still it has the disadvantage of using a lot of disk space, and it needs
> to connect to the server at every build only to discover if there are
> new commits.
>

agreed on disk space. since we don't remove the clone, we have to store
them.
but on the 2nd point it would connect to server *only* if the recipe has
changed and uses
a new commit. otherwise it wouldn't connect again since after a successful
build the tarball would be
there already (and the extracted source code).

i could make one optimization. run git fetch only if the commit object I am
looking for is not
there already.

>
> This would hurt people not having your needs.
>

> If you would add an option to choose between the always-clone git
> downloader and the clone-once-fetch-many version, your work would become
> more interesting.
> But this is only my opinion.
>

is that true? i could make the update. i would just need to create two
variants of DOWNLOAD_GIT and
choose based on the config option...
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110830/22d0a829/attachment.html>
