From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Feb 2019 10:01:31 +0100
Subject: [Buildroot] [PATCH v5 09/10] testing/tests/download: test git
 special ref
In-Reply-To: <5c6a1c8d830d8_778d3fe400187698100087@ultri5.mail>
References: <cf2f9717-48a8-8616-b8ec-3d30bfbd9ab1@mind.be>
 <5c6a1c8d830d8_778d3fe400187698100087@ultri5.mail>
Message-ID: <33cac50f-5203-03fa-4231-183863741c18@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/02/2019 03:46, Ricardo Martincoski wrote:
> Hello,
> 
> On Wed, Feb 06, 2019 at 08:05 AM, Arnout Vandecappelle wrote:
> 
>> On 12/05/2018 04:58, Ricardo Martincoski wrote:
>>> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>>>
>>> Add a special ref to the static repo and check on the git refs test case
>>> the download of a git package:
>>>  - with the name of a special ref as version;
>>
>>  We might remove support for getting special refs by name, but keep on
>> supporting getting special refs by sha1. So I've changed the test into getting
>> it by sha1 instead.
> 
> OK... but it depends on a recent git version to work.

 Ah, darn, I forgot that...

> The same does not occur when getting special refs by name.
> 
> When using recent versions of git the download of the sha1 of a special ref
> works because of this line in support/download/git:
>   _git fetch origin "'${cset}:${cset}'"

 So, IIRC, Yann had an idea for how to rewrite this in a way that we would (1)
no longer support branch names and (2) we would support hashes that refer to
special refs or ancestors of special refs. But I don't remember what it was.
Maybe it was

_git fetch origin '+refs/*:refs/remotes/origin/*' '+refs/tags/*:refs/tags/*'

That way (I think) a branch name would no longer be usable (because when doing
the checkout the origin/ bit would be missing), but a tag name still would be
usable.

> I tested using:
> git version 2.17.1
> 
> The git version installed in our docker image does not support it.
> 
> I am not sure what is the best fix for the TestGitRefs failure in GitLab CI.
> I would change the test to use special ref by name, and *when* we change the
> behavior, we change the test in the same commit to expect it to fail.

 Or maybe just remove the test for now.


 Regards,
 Arnout

> 
>>
>>  Ideally there should also be a check for getting the parent of the special ref
>> by sha1, but I think that actually does *not* work now.
> 
> I expect it to not work. But I didn't tested recently.
> 
> Regards,
> Ricardo
> 
