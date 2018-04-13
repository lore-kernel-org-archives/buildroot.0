From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 13 Apr 2018 09:45:14 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-11
References: <20180412171132.GB4221@scaer>
Message-ID: <5ad0a65a3149f_1b742afe2b8b9f6c345ae@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 12, 2018 at 02:11 PM, Yann E. MORIN wrote:

> On 2018-04-12 12:02 +0200, Thomas Petazzoni spake thusly:
>> Ah, interesting. I talked (privately) with Yann about the
>> dtv-scan-tables issue early today. We didn't spend much time analyzing
>> the issue, but there is one side thing that I thought could be causing
>> issues in the autobuilders:
>>   https://git.buildroot.org/buildroot-test/commit/scripts/autobuild-run?id=c47d9bf2080e33fa3a87223afd93f46363e36447
> 
> Indeed, I don;t see that ending up nicely in the end.

Agreed.

> 
> Even if we can run some 'git fsck' or the like, at one point we may end
> up removing a file that *is* critical and without which we could not
> even do an fsck...

Indeed, I removed .git/HEAD from a git cache and the download script (or any git
command) fails like this:
fatal: Not a git repository (or any of the parent directories): .git

> 
>> This change from Peter Korsgaard adapts the logic in autobuild-run that
>> removes 5 random tarballs between every build. This exists to force
>> autobuilder instances to regularly re-download stuff, which allows to
>> test our download infrastructure.
>> 
>> Originally, DL_DIR was flat, so we were just picking up 5 random files
>> from that folder. Now that DL_DIR has sub-directories, Peter changed
>> the logic to be recursive, and pick 5 random files recursively....
>> except that DL_DIR/<package>/git/ contains a Git repo, and I'm not sure
>> deleting random files from a Git repo is really recommended.
>> 
>> So I have no idea if the download problems are related to this
>> autobuild-run issue, or if there are actual issues in the git download
>> helper, but we should probably fix autobuild-run anyway.

When a file that was checked out in a git cache is removed, the next 'git
checkout' succeeds but does not checkout that file. The repo remains with
'Changes not staged for commit', the tarball is generated and the hash
mismatches.
So yes, at least the hash mismatches can be caused by this autobuild-run issue.

> 
> Yes, we do need to fix the autobuilder script.

I agree.
I have a patch that I will send after my tests finish.

The fix to autobuilder script will not stop the current build (download)
failures. It will only stop causing new failures.
We will need also either the manual removal of the broken 'dl/package/git' from
the autobuilder instances or a change to the download infra to automatically
recover from a broken git cache.

> 
> But now, I don't think we should try to repare a broken git repository.
> If it is broken, we can just remove it and re-clone from scratch (from
> the current remote).

For a broken git repo, I agree.

But there is another possible scenario: a sane git repo that is not clean (in
the sense of 'git clean'). Maybe we use the same solution for both, maybe not.
I will reply in the series about this.


Regards,
Ricardo
