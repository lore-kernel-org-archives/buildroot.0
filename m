From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Apr 2018 19:48:46 +0200
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <20180412092855.30621-3-ricardo.martincoski@gmail.com>
References: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
 <20180412092855.30621-3-ricardo.martincoski@gmail.com>
Message-ID: <20180412174846.GF4221@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-12 06:28 -0300, Ricardo Martincoski spake thusly:
> In the case a previous operation in the git cache was abruptly
> interrupted the git cache can be in a dirty state (removed files,
> untracked files). This can lead to download failures during the
> checkout, like this:
>  error: The following untracked working tree files would be overwritten by checkout:
> and/or this:
>  error: The following untracked working tree files would be removed by checkout:
> 
> If an untracked file, directory or submodule is present after the
> checkout, the tarball will have additional content, leading to a hash
> mismatch.
> 
> When performing the checkout, use -f to allow it to occur even if there
> are untracked files that would be overwritten or removed.
> 
> Use git clean to remove any untracked files before generating the
> tarball. Use the second -f to ensure the repo is pristine even if
> previous checked out ref contained a submodule that is not present in
> the ref just checked out.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b418394f679ad269d587753302c540036793334c
> Possibly fixes:
> http://autobuild.buildroot.net/results/9b584a624bb08c5ab6d977b93f4b92ed4bd1d40f

I'm not very happy of those tricks... If the repos is broken, it may be
in a state that repairing it is not even possible at all, in case a
critical git data is missing/damaged.

If the repo is broken, either:

  - we ditch the repository and restart frm scratch,

  - or we just bail out and tell the user what hapened, so they can take
    action (e.g. remove the broken repo manually).

Regards,
Yann E. MORIN.

> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> I did not split this into 2 patches (the first one adding -f to checkout
> and the second one adding git reset) because only adding -f to checkout
> would make the git checkout command to succeed but the download would
> still fails when checking the hash if any untracked file was left. In
> this case the git cache also would still be dirty, so it is not really a
> fix to a dirty cache.
> ---
>  support/download/git | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/git b/support/download/git
> index 1b09e5c750..68b5d920a1 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -92,7 +92,8 @@ fi
>  
>  # Checkout the required changeset, so that we can update the required
>  # submodules.
> -_git checkout -q "'${cset}'"
> +_git checkout -f -q "'${cset}'"
> +_git clean -ffdx
>  
>  # Get date of commit to generate a reproducible archive.
>  # %cD is RFC2822, so it's fully qualified, with TZ and all.
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
