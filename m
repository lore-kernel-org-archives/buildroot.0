From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 19 Apr 2017 20:37:50 -0300
Subject: [Buildroot] [PATCH] Restore .git directory in git package
 downloads
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
Message-ID: <58f7f4cee98a1_4789f4cbd048736@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James,

[Either I or my mail client did something stupid and the e-mail did not reach
the mailing list and the patchwork. Resending to the list]

On Wed, Apr 19, 2017 at 01:00 AM, James Balean wrote:
> +++ b/support/download/git
> @@ -85,10 +85,6 @@ if [ ${recurse} -eq 1 ]; then
>      _git submodule update --init --recursive
>  fi
>  
> -# We do not need the .git dir; we keep other .git files, in case they
> -# are the only files in their directory.
> -rm -rf .git

This patch cannot be applied as-is because:

- it would make the tarballs for git packages not reproducible as the contents
  now depend on the state of the remote server (i.e. in some cases a full clone
  is needed; assume a tarball is generated, then a new commit is created in the
  remote server in any branch, a new full clone with the same reference as
  version would include that new commit and therefore the tarball is different);

- it would make the tarballs for git packages much larger (gigabytes for some
  linux trees) as they now include the .git directory;

Of course I am not against the discussion looking for another solution.

Regards,
Ricardo
