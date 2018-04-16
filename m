From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Apr 2018 23:54:17 -0300
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
References: <20180415120230.GA21958@scaer>
Message-ID: <5ad41059af3a7_5cd73ffcbd32b2bc9895d@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Apr 15, 2018 at 09:02 AM, Yann E. MORIN wrote:

> On 2018-04-13 15:28 -0300, Ricardo Martincoski spake thusly:
>> On Thu, Apr 12, 2018 at 02:48 PM, Yann E. MORIN wrote:
>> > On 2018-04-12 06:28 -0300, Ricardo Martincoski spake thusly:
>> A way to avoid this, once the script entered the directory, is to force the
>> git-dir:
>> $ git --git-dir=.git <command>
>> This command would fail for a too-much-broken repo.
> 
> We recently reverted use of -C becasue it was not supported by old git
> versions. What is the oldest git version to support --git-dir? It seems
> it was introduced in v.1.4.2, dated 2006-08-12. Is that old enough that
> all the distros we care about have that version or later?

I think so. I added Thomas to the thread.
In the past some similar decisions were taken based on the oldest supported
RHEL version.
RHEL 6 has EOL on November 30, 2020. It included git 1.7.1 last time I checked
(one year ago!).

Concerning the code, an alternative is: 
GIT_DIR=.git git <command>
It works with fsck. Hopefully it always worked, but I did not checked the
git/.git history.

I think it is important to use this with fsck, otherwise for a too-much-broken
repo (say, .git/HEAD is missing) git would search the parent directory, then
the parent of the parent, and so on, and in the case it is a subdir of
buildroot (or any other git repo) the fsck would return OK for the wrong repo.

>> In order to detect broken repos (and trigger the ditch) we could start the
>> script by running fsck. Right?
> 
> So, basically, we would do something along those lines:
> 
>     _git() {
>         eval ${GIT} --git-dir=.git "${@}"
>     }
> 
>     _git fsck || { rm -rf ${git_cache}; exec "${0}" "${@}"; exit 1; }
>     _git fetch
>     _git fetch -t
>     _git checkout ${ref}
>     _git clean -dX
>     _git checkout -- .
>     _git submodules update

In the overall I agree with this sequence. Below some nits:

I would run fsck using GIT_DIR before the script enters {git_cache}, this way it
is easy to remove the broken git cache and run init again, and the script
continues without the need to call itself.
GIT_DIR works with git 1.8.3, I did not tested with 1.7.1

When we have -f in checkout (I see in your WIP series that you considered to add
it) do we need the '_git checkout -- .'?

I was initially thinking in: first run fsck forcing the GIT_DIR and then trust
the repo is sane, but your approach of adding it to _git() seems even more
robust, it covers even the case someone (not buildroot) messes with the git
cache in the wrong moment.
Maybe it would be possible to even remove pushd/popd altogether. Of course it
would cause changes to find and tar command lines again, so I don't think it's
worth the risk of finding more corner cases with tool versions than the ones
already solved.

> 
> Of course, that would require using appropriate options to fsck to bail
> out.

Yes. Some interesting ones I listed below:
--no-dangling: AFAIK they cause no harm;
--no-reflogs: not sure;
--full: this is for the case someone is abusing the git cache with alternates,
        should we care?

I find out that different git versions also use different sets of errors to
return non-zero code. Not so different, don't worry.
Old versions return 0 for few errors (but the error: message is printed) 
git 1.8.3: return code 0 for a missing sha1 object pointed by a tag, printing:
 error: refs/tags/tag_b does not point to a valid object!
git 2.14.1: return code 2 in the same case
 error: refs/tags/tag_b: invalid sha1 pointer 1f95d47cc18a9ed4e1eab9b71fe2009c9555448d
BUT, as we always do a fetch before checkout, the fetch fixes it!
So again, we are good. I don't think it needs extra code.

> 
> But what to do if any if the following actions fails? Should we simply
> exit, or should we clean up and clone again?
> 
> I can see shere that could go wrong: the ref does not exist, so the
> first checkout fails, so we ditch the repository, clone again, and
> checkout again fails...
> 
> My opinion, for what it's worth, is to clan only on the fsck. Any other
> failure should be left to the user to handle. Maybe with just a little
> message saying something like:
> 
>     If you are not sure how to solve this, remove ${cache_dir}.
> 
> Thoughts?

I agree, to clean only on the fsck is better.

The user-friendly message is not *needed* IMO.
But if you find an easy way to do that, it would be nice to have.
Maybe in _git() but not in the fsck case.
Maybe a trap? Not sure.

Regards,
Ricardo
