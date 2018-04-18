From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 18 Apr 2018 00:18:01 -0300
Subject: [Buildroot] [PATCH 4/4] download/git: always do full-clone
References: <62d815cfe104e4d172ca4d51e1d56e577f737b87.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <5ad6b8e98be61_23c23fb7eb3480a4191b4@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We can ask for more opinions if it needs to be split in 2 patches or not, so I
copied the CC from patch 3.
Also some typos and nits.

On Tue, Apr 17, 2018 at 01:48 PM, Yann E. MORIN wrote:

> We currently attempt a shallow clone, as tentative to save bandwidth and
> download time.
> 
> However, now that we keep the git tree as a cache, it may happen that we
> need to checkout an earlier commit, and that would not be present with a
> shallow clone.
> 
> Furthermore, the shallow fetch is already really btroken, and just

s/btroken/broken/

> happens by chance. Consider the following actions, which are basivcally

s/basivcally/basically/

[snip]
> The checkout succeeds just because of the git-fetch in the if-condition,
> which is initially there to fetch the special refs from github MRs, or

Nit: mixed naming
GitHub -> PR
GitLab -> MR
Gerrit -> Change

> gerrit reviews. That fails, but we jsut print a warning. If we were to

s/jsut/just/

> ever remove support for special refs, then the checkout would fail.
> 
> The whole purpose of the git cache is to actually save bandwith and

s/bandwith/bandwidth/

> download time, but in the long run. For one-offs, people would
> preferably use a wget download (e.g. with the github macro) instead of
> a git clone.
> 
> We switch to always doing a full clone. It is nore correct, and pays off

s/nore/more/
Nit: Actually using shallow fetch is not less correct, just more complicated
because it has a lot of corner cases. But the download script becomes more
correct than before by always doing a full clone.

> in the long run...
[snip]
> +printf "Fetching all references\n"

> +_git fetch origin

The line above could even be a separate patch.
It is there to fix the fetch for all refs for git versions older than 1.9.0.
Maybe we add a comment about the git version?
And/or mention the git version + upstream patch on the commit log, as in
http://patchwork.ozlabs.org/patch/897559/ ?

> +_git fetch origin -t


Regards,
Ricardo
