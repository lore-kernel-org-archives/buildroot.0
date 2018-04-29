From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 15:49:48 -0300
Subject: [Buildroot] [PATCH 4/7 v4] download/git: try to recover from
 utterly-broken repositories
References: <00452014a5e11c7f6f594e2e1f14b9ed0f38d92e.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <5ae613cc5cf4b_578e2ac686f651905014e@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Using the previous iteration I tested adding '&& false' after the git checkout
command and the trap worked as expected.

But since this patch is not easy to me to review (my bash scripts use a small
subset of bash features), I decided to do more extensive testing. I think I
found something to be changed. Could you double-check? See at the end.

On Sat, Apr 28, 2018 at 04:34 PM, Yann E. MORIN wrote:

> +++ b/support/download/git
> @@ -16,6 +16,33 @@ set -e
>  # Environment:
>  #   GIT      : the git command to call
>  
> +# Save out path and options in case we need to call ourselves again

s/out/our/ ?

> +myname="${0}"
> +declare -a OPTS=("${@}")

It looks OK to me.
Similar syntax is used in support/scripts/check-bin-arch and no one using old
bash versions complained so far.
I didn't checked the bash version available on RHEL6 neither the bash source
code.

> +
> +# This function is called when an error occurs. Its job is to attempt a
> +# clone from scratch (only once!) in case the git tree is borked, or in
> +# case an unexpected and unsupported situation arises with submodules
> +# or uncomitted stuff (e.g. if the user manually mucked around in the

s/uncomitted/uncommitted/ ?

> +# git cache).
> +_on_error() {
> +    local ret=${?}
> +
> +    printf "Detected a corrupted git cache.\n" >&2
> +    if ${BR_GIT_BACKEND_FIRST_FAULT:-false}; then
> +        printf "This is the second time in a row; bailing out\n" >&2
> +        exit ${ret}
> +    fi
> +    export BR_GIT_BACKEND_FIRST_FAULT=true
> +
> +    printf "Removing it and starting afresh.\n" >&2
> +
> +    popd >/dev/null
> +    rm -rf "${git_cache}"
> +
> +    exec "${myname}" "${OPTS[@]}" || exit ${ret}
> +}
> +
>  verbose=
>  recurse=0
>  while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
> @@ -39,6 +66,9 @@ git_cache="${dl_dir}/git"
>  mkdir -p "${git_cache}"
>  pushd "${git_cache}" >/dev/null
>  
> +# Any error now should try to recover
> +trap _on_error ERR
> +
>  # Caller needs to single-quote its arguments to prevent them from
>  # being expanded a second time (in case there are spaces in them)
>  _git() {

It seems the trap is not executed when a git command fails.

I first created a git cache. I used squashfs because it is small, its server is
fast, and it has hash to check against.
I removed .git/index in the cache so the next git init will create a brand new
one leaving lots of untracked files to be overwritten. Since the -f is not yet
added to git checkout (it belongs to a later patch) it should trigger a
ditch+restart, but it didn't.
I recreated the cache from scratch and replaced .git/HEAD with a directory. This
way the cache is broken and git init does not recovers it, as expected, leading
'git remote' to fail. It also should trigger a ditch+restart, but it didn't.

With the help of [1] I found in the bash manual, not mentioned in the SHELL
BUILTIN COMMANDS/trap section, only in the FUNCTIONS section:
"FUNCTIONS" [...]
"All other aspects of the shell execution environment are identical between a
 function and its caller with these exceptions:" [...]
"the ERR trap is not inherited unless the -o errtrace shell option has been
 enabled."

As a dirty hack I repeated the trap inside _git:
  _git() {
 +    trap _on_error ERR
It fixes the 2 cases I mentioned above.

Maybe the proper fix is to enable errtrace, but I didn't tested it, neither I
know all the implications of using this for all the other cases.
From the manual:
"-E      If set, any trap on ERR is inherited by shell functions, command
 substitutions, and commands executed in a subshell environment. The ERR trap is
 normally not inherited in such cases."

[1] https://unix.stackexchange.com/questions/419017/return-trap-in-bash-not-executing-for-function

Regards,
Ricardo
