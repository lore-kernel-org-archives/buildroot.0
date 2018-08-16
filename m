From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 15 Aug 2018 22:04:38 -0300
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
References: <20180813160657.GD7915@scaer>
Message-ID: <5b74cda659f07_64da2abc4a138cc0754d@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Aug 13, 2018 at 01:06 PM, Yann E. MORIN wrote:

> On 2018-08-13 11:13 -0300, ricardo.martincoski at gmail.com spake thusly:
>> On Sun, Aug 12, 2018 at 05:48 PM, Yann E. MORIN wrote:
[snip]
>> >     git fetch origin "${cset}:${cset}"
>> 
>> But only removing this code will not make 'git show-ref' to work as expected.
>> There are git caches out there with the mentioned branch.
>> If for any reason the tarball is not there (like we do test in autobuilder) the
>> download will fail for the wrong reason, and it would require a manual fix.
> 
> Rightfully right.
> 
> So, we don't care about the ref being a local branch. Instead, we must
> check whether it is a branch on the remote. I.e.:
> 
>     git show-ref "origin/${cset}" |grep -qv refs/tags
> 
> Thoughts?

I didn't tested it, but it looks promising.

> 
>> And IMO we should not start removing all refs from the git caches otherwise we
>> can decrease the cache hit ratio (due to git gc), specially for linux trees.
> 
> Well, we can still remove local branches.

OK.

> 
>> So the best approach IMO is to ask "given we want a named ref, is that ref a
>> branch in the remote?". That obviously lead to using git ls-remote and check
>> the second column:
> 
> I would prefer to avoid another round-trip to the remote, when we have
> the necessary information locally. What about the git-show-ref snippet I
> pasted above instead?

In the other hand with ls-remote we could fail faster, before downloading any
refs.

Regards,
Ricardo
