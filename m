From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 18 Nov 2016 05:33:25 -0200
Subject: [Buildroot] [PATCH 3/3] support/download/git: do not use git
 clone
References: <95e1f68c-b162-68b1-8a10-7baa287f088c@mind.be>
Message-ID: <582eaec5b41f3_6dedc5f1985238a@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sat, Nov 05, 2016 at 11:19 PM, Arnout Vandecappelle wrote:

[snip]
>  Excellent commit message!

Thanks.

[snip]
>  I have a bunch of remarks below, but nothing that should stop the acceptance of
> this patch. So:
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I won't carry these for v2 because there will be a bunch of improvements based
on your review ;)

> 
>  This is for next, obviously.
> 
[snip]
>> +# Save the temporary file inside the .git directory that will be deleted after the checkout is done.
> 
>  Don't forget to wrap at 80 columns.

Sorry. This line is way too long.

But just to be clear:
I think you mean to wrap to 80 as a rule of thumb (e.g. comments are easy to do)
and not as a hard requirement.
Right?

I ask this because I think breaking some lines with commands would make it
harder to read, e.g.
if _git fetch ${verbose} "${@}" --depth 1 "'${repo}'" "'${ref}:refs/buildroot/${cset}'" 2>&1; then

[snip]
>> +if grep "\<\(\|\(\|refs/\)\(heads\|tags\)/\)${cset}$" "${tmpf}" >/dev/null 2>&1; then
> 
>  This is where grep -E becomes useful :-)

Thanks. Much nicer:
if grep -E "\<(|(|refs/)(heads|tags)/)${cset}$" "${tmpf}" >/dev/null 2>&1; then

[snip]
>> +elif grep "^${cset}" "${tmpf}" >/dev/null 2>&1; then
>> +    printf "The desired version is a sha1\n"
>> +    if [ ${#cset} -lt 40 -a "1" != "$(awk "/^${cset}/{print \$1|\"sort -u | wc -l\"}" "${tmpf}")" ]; then
> 
>  I think the check for -lt 40 is redundant.

You are right.
But this line will be removed in v2 because it is not needed and not wanted.
It is not needed because unambiguous partial sha1 (of any commit) can be
checked out after the full fetch (but without optimized download, of course).
It is not wanted because, as I realized after your comment, the output of
ls-remote is a subset of all sha1s and can't be used to test a sha1 is not
ambiguous. We could end up checking out a wrong sha1 when we really need to let
git checkout fail.
BTW, an example of partial sha1 is in the current master, see commit 956fcc2.

> 
>  I think all the logic here could be made a bit simpler by saving to a temporary
> file again:
> 
> elif grep "^${cset}" "${tmpf}" > .git/matching_refs 2>/dev/null; then
>     printf ...
>     if "$(cut -f 1 .git/matching_refs | sort -u | wc -l) != 2; then
>         ...

Yes. Much simpler.
Actually this 'if' is removed in v2 (see above) but I will use temporary file
and cut instead of awk in v2 (see below).

> 
> 
>> +        printf "Ambiguous partial sha1\n"
>> +        awk "/^${cset}/{print \$1|\"sort -u | wc -l\"}" "${tmpf}"
> 
>  Here we should print the full lines, so without sort -u and wc. Sort is still
> useful though.

Indeed. But will be removed in v2.
If the partial sha1 is ambiguous, let git checkout fail. Git checkout fails even
when the sha1 of the commit is ambiguous to a sha1 of a tree.
BTW, the best real example I have so far between 2 refs is b3766 from
https://github.com/vim/vim.git .

> 
>> +        exit 1
>> +    fi
>> +    # Accept full or unambiguous partial sha1. A sha1 can be referenced by many names.
>> +    # Prefer sha1 of commit pointed by a tag or sha1 of the tag itself,
>> +    # then sha1 pointed by any ref/*, and only then sha1 pointed by *HEAD.
> 
>  I don't understand why this bit is needed. Any of the refs will do, right? It's
> true that there is a risk that the ref gets updated between the ls-remote and
> the fetch, and that for tags the chance that it gets updated is smaller than for
> e.g. HEAD. But still, this is very much a corner case, and if it _does_ happen,
> we still fall back to full clone. So the only important thing is to avoid HEAD.
> Since ls-remotes already seems to sort the refs, which typically puts tags near
> the end, just take the last one and we're done:
> 
>     ref="$(cut -f 2 .git/matching_refs | tail -1)"

Yes. It is simpler.

I just noticed I missed to explain the awk -F'[\t^]' in the comments (or in the
commit log) :/ .
Its is needed because annotated tags have their own sha1 and the commit pointed
by a tag has ^{} at the end of the ref name in the ls-remote output.
9395452b4aab7bc2475ef8935b4a4fb99d778d70        refs/tags/v4.8-rc6^{}

But after 'cut' I can use bash's 'Pattern substitution'
ref=${ref/%"^{}"}
and, of course, add a nice comment for it.

[snip]
>> +if [ ${do_a_shallow_fetch} -eq 1 ]; then
> 
>  Actually, if [ "$ref" ] would be sufficient.

OK.

[snip]
>> -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
>> -    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
>> +git_checkout_done=0
>> +if [ ${git_fetch_done} -eq 1 ]; then
>> +    if _git checkout -q "'refs/buildroot/${cset}'" 2>&1; then
> 
>  I'm not sure if I like this split. git_fetch_done gets set in only one place,
> so we could just do the checkout directly there. That would also make it more
> explicit that this is a checkout specifically for shallow fetches, while the
> checkout below is specifically for full fetches.

OK.

[snip]
>> +    _git remote add origin "'${repo}'"
>> +    _git fetch ${verbose} "${@}" origin
> 
>  Why do we need to create a remote here?

Actually, we don't.
I missed your comment in http://patchwork.ozlabs.org/patch/681841/
"just use $repo everywhere"
I will do this in v2.

I think I can do this too:
"Do it in two patches: first convert the current situation to fetches, then add
the shallow download of tag SHAs."

> 
>> +    _git checkout -q "'${cset}'"
>> +fi
> 
>  At a later stage, we could update the fetch with --submodules=yes/no depending
> on -r option.

In theory, OK. But because of a bug in git maybe it's better to keep the
current 'git submodule update --init --recursive'.

git fetch --help # git 2.10.2
BUGS
       Using --recurse-submodules can only fetch new commits in already
       checked out submodules right now. When e.g. upstream added a new
       submodule in the just fetched commits of the superproject the submodule
       itself can not be fetched, making it impossible to check out that
       submodule later without having to do a fetch again. This is expected to
       be fixed in a future Git version.

> 
>  Another interesting feature would be to first try a shallow fetch of all tags
> and branches with a depth of, say, 100. That is still way less than a full clone
> for large repositories, and has a good chance to still capture a sha1 that is
> not at a branch or tag head. So it would provide a nice middle ground for the
> cases for which we fail to do a shallow clone now. And if it does fail, nothing
> is wasted because the full clone can start from the part that was already
> downloaded.

Yes. It should be useful especially for hardware-specific kernel repos when
using sha1 as custom repo version.
The buildroot policy is to use preferably a tag, and if a tag cannot be used,
use the sha1 in a branch, right?
So I think we will have the best gain by fetching only from branches in this
case.

A quick test shows good results: make warp7_defconfig ; make linux-source
without this feature:       1.69 GiB
                            5148191
with this feature (100):    945.59 MiB + 73.89 KiB
                            1997387 + 138 = 1997525
with this feature (10+100): 402.04 MiB + 470.10 MiB
                            347225 + 32 + 1650245 = 1997502
(I didn't dig to understand why the sum is not exactly the same)

Notice there is some extra processing in the server side ('Compressing objects')
that takes some more seconds but I guess the bandwidth saved worth this.

I can add this patch (depth 100) at the end of the series as a RFC.
This way people can comment/test/argue a different depth to use.

1) without this feature
Doing full clone
Cloning into 'linux-efaf36531fe7b1fc15a48033e5972825c91f9fc6'...
remote: Counting objects: 5148191, done.
remote: Compressing objects: 100% (395/395), done.
remote: Total 5148191 (delta 377), reused 183 (delta 183), pack-reused 5147613
Receiving objects: 100% (5148191/5148191), 1.69 GiB | 1.73 MiB/s, done.

2) with this feature, only for branches, depth 100
Doing shallow fetch of all branches
remote: Counting objects: 1997387, done.
remote: Compressing objects: 100% (453860/453860), done.
remote: Total 1997387 (delta 1605759), reused 1902796 (delta 1529294), pack-reused 0
Receiving objects: 100% (1997387/1997387), 945.59 MiB | 1.74 MiB/s, done.
...
remote: Counting objects: 138, done.
remote: Compressing objects: 100% (138/138), done.
remote: Total 138 (delta 0), reused 138 (delta 0), pack-reused 0
Receiving objects: 100% (138/138), 73.89 KiB | 0 bytes/s, done.

3) with this feature, only for branches, 1st step depth 10, 2nd step depth 100
Doing shallow fetch of all branches (10)
remote: Counting objects: 347225, done.
remote: Compressing objects: 100% (177196/177196), done.
remote: Total 347225 (delta 239120), reused 251422 (delta 167173), pack-reused 0
Receiving objects: 100% (347225/347225), 402.04 MiB | 1.56 MiB/s, done.
...
remote: Counting objects: 32, done.
remote: Compressing objects: 100% (32/32), done.
remote: Total 32 (delta 0), reused 32 (delta 0), pack-reused 0
Unpacking objects: 100% (32/32), done.
...
fatal: reference is not a tree: efaf36531fe7b1fc15a48033e5972825c91f9fc6
Doing shallow fetch of all branches (100)
remote: Counting objects: 1650245, done.
remote: Compressing objects: 100% (459302/459302), done.
remote: Total 1650245 (delta 1364443), reused 1452442 (delta 1179566), pack-reused 0
Receiving objects: 100% (1650245/1650245), 470.10 MiB | 1.68 MiB/s, done.
Resolving deltas: 100% (1364443/1364443), completed with 38986 local objects.
Checked out 'efaf36531fe7b1fc15a48033e5972825c91f9fc6'.

Regards,
Ricardo
