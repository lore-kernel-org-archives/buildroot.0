From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 16 Oct 2016 03:20:52 -0200
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
References: <f0edac3b-a4bb-002b-0046-f50d4474595b@mind.be>
Message-ID: <58030e343fcdf_26773ff56a1c02b050024@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 15, 2016 at 06:32 AM, Arnout Vandecappelle wrote:

> On 15-10-16 00:50, Arnout Vandecappelle wrote:
>> 
>> On 13-10-16 17:50, Bryce Ferguson wrote:
[snip]
> 
>  Another thing: with --heads --tags, it will not capture "special refs" like
> gerrit's refs/changes/42/242/1, which is a pity. Actually for these special refs
> it shouldn't be needed to use a sha1 because gerrit makes sure they really are
> immutable (if you update the change the last number will increment, and AFAIK

Indeed. The last number is the Revision of the Change and serves the same
purpose as the -v in git format-patch, but it is calculated by the server.

> there is no way to delete it); still it would be nice to support sha1's wherever

Actually in some cases there is.
The developer can upload a change in the draft mode and later on publish it
using the web interface. Once published, AFAIK the change or revision cannot be
deleted. Changes and revisions in the state Draft can be deleted using the web
interface. Both draft and published changes have special refs. But the ref is
removed when the change or revision is deleted.

Out of curiosity I tried to create a draft revision,
6b7bb6a8e547f2edc247b88ec2b8e74d6115baa5        refs/changes/02/2/4
delete it, and create a new revision
0880cece5e05e56d4242487f1207a5e0f3362312        refs/changes/02/2/4
so when in Draft state, a revision of a change is not immutable.

> they come from.
> 
>  Cc'ing Ricardo who was concerned about this.

Thank you very much, Arnout.

But in this specific case I think --heads --tags makes sense.
This is because 'git clone -b' seems to operate only for those types of refs.
I didn't check de code from git.git, but I did some tests.
- branches are allowed, but only without the prefix refs/heads
- tags are allowed, but only without the prefix refs/tags
- HEAD is not allowed
- changes (special refs) are not allowed

The same does not apply to 'git fetch'.
- branches are allowed, in any form: refs/heads/master = heads/master = master
- tags are allowed, in any form: refs/tags/v1 = tags/v1 = v1
- HEAD is allowed
- changes (special refs) are allowed in the forms: refs/changes/01/1/2 =
changes/01/1/2
- other special refs are allowed too: refs/meta/config

Regards,
Ricardo
