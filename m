From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Apr 2018 16:58:19 +0200
Subject: [Buildroot] [v3 13/13] download: git: introduce cache feature
In-Reply-To: <20180401125757.GD2613@scaer>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-13-maxime.hadjinlian@gmail.com>
 <20180401125757.GD2613@scaer>
Message-ID: <c64b0f87-ce14-5825-2404-d27cfd1d423c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-04-18 14:57, Yann E. MORIN wrote:
> Maxime, All,
> 
> On 2018-03-31 16:24 +0200, Maxime Hadjinlian spake thusly:
>> Now we keep the git clone that we download and generates our tarball
>> from there.
>> The main goal here is that if you change the version of a package (say
>> Linux), instead of cloning all over again, you will simply 'git fetch'
>> from the repo the missing objects, then generates the tarball again.
>>
>> This should speed the 'source' part of the build significantly.
>>
>> The drawback is that the DL_DIR will grow much larger; but time is more
>> important than disk space nowadays.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>> v1 -> v2:
>>    - Fix bad regex in the 'transform' option of tar (found by Peter
>>    Seiderer)
>> v2 -> v3:
>>    - Change git fetch origin to use the uri of the package instead of
>>    the name of the default remote 'origin' (Thomas Petazzoni)
>> ---
>>  support/download/git | 70 ++++++++++++++++++++++++++++++----------------------
>>  1 file changed, 40 insertions(+), 30 deletions(-)
>>
>> diff --git a/support/download/git b/support/download/git
>> index 58a2c6ad9d..301f7e792a 100755
>> --- a/support/download/git
>> +++ b/support/download/git
>> @@ -39,28 +39,34 @@ _git() {
>>      eval ${GIT} "${@}"
>>  }
>>  
>> -# Try a shallow clone, since it is faster than a full clone - but that only
>> -# works if the version is a ref (tag or branch). Before trying to do a shallow
>> -# clone we check if ${cset} is in the list provided by git ls-remote. If not
>> -# we fall back on a full clone.
>> -#
>> -# Messages for the type of clone used are provided to ease debugging in case of
>> -# problems
>> -git_done=0
>> -if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
>> -    printf "Doing shallow clone\n"
>> -    if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${basename}'"; then
>> -        git_done=1
>> -    else
>> -        printf "Shallow clone failed, falling back to doing a full clone\n"
>> +# We want to check if a cache of the git clone of this repo already exists.
>> +git_cache="${BR2_DL_DIR}/${basename%%-*}/git"
>> +
>> +# If the cache directory already exists, don't try to clone.
>> +if [ ! -d "${git_cache}" ]; then
>> +    # Try a shallow clone, since it is faster than a full clone - but that
>> +    # only works if the versionis a ref (tag or branch). Before trying to do a
>> +    # shallow clone we check if ${cset} is in the list provided by git
>> +    # ls-remote. If not we fall back on a full clone.
>> +    #
>> +    # Messages for the type of clone used are provided to ease debugging in
>> +    # case of problems
>> +    git_done=0
>> +    if [ -n "$(_git ls-remote "'${uri}'" "'${cset}'" 2>&1)" ]; then
>> +        printf "Doing shallow clone\n"
>> +        if _git clone ${verbose} "${@}" --depth 1 -b "'${cset}'" "'${uri}'" "'${git_cache}'"; then
>> +            git_done=1
>> +        else
>> +            printf "Shallow clone failed, falling back to doing a full clone\n"
>> +        fi
>> +    fi
>> +    if [ ${git_done} -eq 0 ]; then
>> +        printf "Doing full clone\n"
>> +        _git clone ${verbose} "${@}" "'${uri}'" "'${git_cache}'"

 Can't we get rid of all the code above, and instead initialize an empty repository:

_git init "'${git_cache}'"
cd "'${git_cache}'"
_git remote set-url origin "'${uri}'"

 then do a fetch, and make it support shallow as well:

if [ -n "$(_git ls-remote origin "'${cset}'" 2>&1)" ]; then
  if _git fetch "${@}" --depth 1 origin "'${cset}'";
    git_done=1
  fi
fi
if [ ${git_done} -eq 0 ]; then
 _git fetch origin -t
fi

 Would this work?

>>      fi
>> -fi
>> -if [ ${git_done} -eq 0 ]; then
>> -    printf "Doing full clone\n"
>> -    _git clone ${verbose} "${@}" "'${uri}'" "'${basename}'"
>>  fi
>>  
>> -pushd "${basename}" >/dev/null
>> +pushd "${git_cache}" >/dev/null
>>  
>>  # Try to get the special refs exposed by some forges (pull-requests for
>>  # github, changes for gerrit...). There is no easy way to know whether
>> @@ -69,7 +75,7 @@ pushd "${basename}" >/dev/null
>>  # below, if there is an issue anyway. Since most of the cset we're gonna
>>  # have to clone are not such special refs, consign the output to oblivion
>>  # so as not to alarm unsuspecting users, but still trace it as a warning.
>> -if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
>> +if ! _git fetch "'${uri}'" "'${cset}:${cset}'" >/dev/null 2>&1; then
> 
> This does not work with some servers which refuse to directly serve
> sha1s. I.e. github, when passed a sha1 as cset, will return:
> 
>     error: Server does not allow request for unadvertised object [SHA1]
> 
> It means we can not explicitly request a sha1 from such severs.
> 
> The solution to that, is to add, a little above this if-block, an
> explicit fetch to the new remote.
> 
> Now, if we try to fetch from that remote, we don't get the new refs
> either:
> 
>     $ git fetch https://some-server/some/repo
>     $ git show [SHA1]
>     fatal: bad object [SHA1]
> 
> The further tweak that we need is to redirect the original 'origin' to
> the new remote first:
> 
>     $ git remote set-url origin https://some-server/some/repo

 I don't particularly like how the git cache will have the last used URL as its
'origin', but I can't find a better approach.

 Regards,
 Arnout

>     $ git fetch -t
>     $ git show [SHA1]
>     [changeset is displayed]
> 
> So, here's the further patch I applied:
> 
>     diff --git a/support/download/git b/support/download/git
>     index 301f7e792a..db74d67536 100755
>     --- a/support/download/git
>     +++ b/support/download/git
>     @@ -68,6 +68,13 @@ fi
>      
>      pushd "${git_cache}" >/dev/null
>      
>     +printf "Fetching new and additional references...\n"
>     +
>     +# Redirect the tree to the current remote, so that we can fetch
>     +# the required reference, whatever it is (tag, branch, sha1...)
>     +_git remote set-url origin "'${uri}'"
>     +_git fetch origin -t
>     +
>      # Try to get the special refs exposed by some forges (pull-requests for
>      # github, changes for gerrit...). There is no easy way to know whether
>      # the cset the user passed us is such a special ref or a tag or a sha1
>     @@ -75,7 +82,7 @@ pushd "${git_cache}" >/dev/null
>      # below, if there is an issue anyway. Since most of the cset we're gonna
>      # have to clone are not such special refs, consign the output to oblivion
>      # so as not to alarm unsuspecting users, but still trace it as a warning.
>     -if ! _git fetch "'${uri}'" "'${cset}:${cset}'" >/dev/null 2>&1; then
>     +if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
>          printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
>      fi
>      
> 
> Let's see tomorrow if you grab it in your tree, or if I respin an
> updated series from my own tree.
> 
> Otherwise: happy, much faster! :-)
> 
> Regards,
> Yann E. MORIN.
> 
>>      printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
>>  fi
>>  
>> @@ -86,20 +92,24 @@ if [ ${recurse} -eq 1 ]; then
>>      _git submodule update --init --recursive
>>  fi
>>  
>> -# We do not want the .git dir; we keep other .git files, in case they
>> -# are the only files in their directory.
>> +# Generate the archive, sort with the C locale so that it is reproducible
>> +# We do not want the .git dir; we keep other .git
>> +# files, in case they are the only files in their directory.
>>  # The .git dir would generate non reproducible tarballs as it depends on
>>  # the state of the remote server. It also would generate large tarballs
>>  # (gigabytes for some linux trees) when a full clone took place.
>> -rm -rf .git
>> +find . -not -type d \
>> +	-and -not -path "./.git/*" >"${BR2_DL_DIR}/${basename}.list"
>> +LC_ALL=C sort <"${BR2_DL_DIR}/${basename}.list" >"${BR2_DL_DIR}/${basename}.list.sorted"
>>  
>> -popd >/dev/null
>> -
>> -# Generate the archive, sort with the C locale so that it is reproducible
>> -find "${basename}" -not -type d >"${basename}.list"
>> -LC_ALL=C sort <"${basename}.list" >"${basename}.list.sorted"
>>  # Create GNU-format tarballs, since that's the format of the tarballs on
>>  # sources.buildroot.org and used in the *.hash files
>> -tar cf - --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
>> -         -T "${basename}.list.sorted" >"${output}.tar"
>> +tar cf - --transform="s/^\.$/${basename}/" \
>> +	--numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
>> +         -T "${BR2_DL_DIR}/${basename}.list.sorted" >"${output}.tar"
>>  gzip -6 -n <"${output}.tar" >"${output}"
>> +
>> +rm -f "${BR2_DL_DIR}/${basename}.list"
>> +rm -f "${BR2_DL_DIR}/${basename}.list.sorted"
>> +
>> +popd >/dev/null
>> -- 
>> 2.16.2
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
