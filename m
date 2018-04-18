From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 18 Apr 2018 00:13:15 -0300
Subject: [Buildroot] [PATCH 3/4] download/git: ensure we can checkout
 repos with submodule conversions
References: <a45b9ba78d527d29cfd5cc0daf4c767c7feb8643.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <5ad6b7cbf192b_23c22af60ee98304189d9@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Really sorry I did finished the review/tests today to send by tags.

Could you double-check the --force option for git 1.7.1? I am not sure we would
have a workaround for this if it is not supported.
Also a question and some typos.

On Tue, Apr 17, 2018 at 01:48 PM, Yann E. MORIN wrote:

> When a repository has had a sub-dir <-> submodule conversion, checking
> out a working copy from before/after the conversion can leave along a
> few untracked files, expecially the .git files from submodules.

s/expecially/especially/
I think it's a typo, not a US/UK thing.

> 
> Ideally, we'd use "git submodule deinit --all" before the checkout to
> the new ref, but deinit was only introduced in v1.8.3, which is still
> not available in some enterprise-grade distros (RHEEL6 still has 1.7.1

s/RHEEL6/RHEL6/

> AFAIK).
[snip]
> +# We would need to deregister _current_ submodules before we checkout.
> +# git-clean (which is used below) does not get rid of .git files (no
> +# git command, but git-submodule, ever touches .git files or dirs);
> +# Using "git submodule deinit --all" would remove all the files for
> +# all submodules, including the corresponding .git files. However, it
> +# was only introduced with git-1.8.3, which is too recent for some
> +# entreprise-grade distros. So, we fall-back to just removing .git

s/entreprise/enterprise/

> +# files after the checkout.
> +find . -type f -name .git -exec rm {} +

In the unlikely case some user tries to abuse the git cache by first populating
it using the 'git multiple working trees' feature the main
dl/<package>/git/.git would be a file too. After this command all git commands
will fail.
But... well... that is expected! The user should not mess with the git cache,
it is there to be used solely by buildroot.
So we are good IMO.

> +
> +# Restore repository to the new, clean-checkout state.
> +_git clean -ffdx
> +_git checkout -- .

So it is needed to checkout the .git files again? Or did I miss something?

Long time since I developed using submodules, so I now forgot some catches.
Anyway I will play with those commands tomorrow to try to understand.

[snip]
> -    _git submodule update --init --recursive
> +    _git submodule update --init --recursive --force

It seems --force does not exist on git 1.7.1.
It is still possible I did something wrong when creating the docker image.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63519024

It does work for git 1.8.3.
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/63525858


Regards,
Ricardo
