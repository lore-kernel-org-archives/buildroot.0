From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 19 Apr 2018 12:47:15 -0300
Subject: [Buildroot] [PATCH 1/4] download/git: ensure we always work in
 the expected repository
References: <e9b0b62a20acfcd0641cbfee758982245a19b8fa.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <5ad8ba0337d9a_7cd62ad9dda4536c17646@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Apr 17, 2018 at 01:48 PM, Yann E. MORIN wrote:

> git always look directories up until it finds a repository. In case
> the git cache is broken, it may no longer be identified as a repository,
> and git will look higher in the directories until it finds one.
> 
> In the default conditions, this would be Buildroot's own git tree
> (because DL_DIR is a subdir of Buildroot), but in some situations may
> very well be any repository the user has Buildroot in, like a
> br2-external tree...
> 
> So, we force git to use our git cache and never look elsewhere, as
> Suggested by Ricardo.
> 
> Use GIT_DIR, as it has been there for ages now, while --git-dir was
> only introduced later (even if most distros ship an later version),
> as suggested by Arnout.
> 
> Also fix the one call to git that was not using the wrapper.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[download script bails out for a completely broken git cache, avoiding changes
 to the buildroot repo when the broken git cache is in a subdir (the default)]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Tests performed:

I choose dt-utils as its version is a tag, so it does not trigger the problem
with git<1.9.0 fixed by patch 4.

1) Create an empty dir in the place of git cache and download:
 Using current master 56823d6:
  git 1.7.1: [process hungs and the buildroot repo had its origin url changed]
  git 1.8.3 and 2.11.0: [the buildroot repo had its origin url changed and also
                   the commit from dt-utils is check out in the buildroot repo]
 Current master + this patch:
  git 1.7.1 and 1.8.3 and 2.11.0: [download script bails out as expected,
                                   falling back to backup site]
2) Download with no initial git cache
 Current master + this patch:
  git 1.7.1: [works fine, fetch all refs]
  git 1.8.3 and 2.11.0: [works fine, shallow fetch]

Commands used and outputs:
https://gist.github.com/ricardo-martincoski/ea341b69a4ebeadf38e4ab02ba33adf8


Regards,
Ricardo
