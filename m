From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Oct 2016 10:57:42 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: add --reference
 option to git clone.
In-Reply-To: <1464789807-26407-1-git-send-email-julien.rosener@digital-scratch.org>
References: <1464789807-26407-1-git-send-email-julien.rosener@digital-scratch.org>
Message-ID: <20161016085741.GA14007@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, all,

On 2016-06-01 16:03 +0200, Julien Rosener spake thusly:
> In case of big Git repositories stored over very slow network, git clone can
> take hours to be done. The option --reference can be used to specify a local
> cache directory which contains mirrors.
> 
> The cache directory is a bare git repository:
>   git init --bare
> All mirrored repositories are added into this repository:
>   git remote add <repo_name> <repo_url>
> The full cache directory can be periodically updated:
>   git fetch --all
> 
> It does not matter if the cache directory is not fully up to date because Git
> will take the last changes from the real remote repository. If a repository is
> not in the cache, git will do a full remote clone without error.
> 
> A buildroot variable was added to specify the path of the cache directory
> (BR2_GIT_CACHE) at the "Build options >> Commands >> git" menu entry level. The
> value is passed to the Git download helper script as an argument and is used if
> defined (indeed in this case every calls to git clone will be using the cache
> directory).

As we discussed at the Biuldroot meeting, we've marked this patch as
"Changes Rejected" in patchwork.

Waiting back for your respin with what we concluded:

  - When a package is first built, it is cloned in DL_DIR and not removed.
  - If the clone already exists, it is updated with a git fetch. git fetch
    can specify an explicit local ref to make sure we can refer to it later.
  - It's not clear if a tarball still needs to be created. Probably yes,
    otherwise the extract step has to change.
  - Problem for parallel downloads (important in a shared DL_DIR): if
    something is locked, git will just fail. So either we have to do locking
    ourselves, or the download helper has to retry. It is possible to do
    two fetches in parallel as long as they download to two different local
    references. Needs more investigation.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
