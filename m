From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 10:40:21 +0200
Subject: [Buildroot] [PATCH 0/4] support/download: make the git backend
 more robust
In-Reply-To: <cover.1523983687.git.yann.morin.1998@free.fr>
References: <cover.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <20180418104021.14be6fe9@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 18:48:19 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (4):
>       download/git: ensure we always work in the expected repository
>       download/git: ensure we have a sane repository
>       download/git: ensure we can checkout repos with submodule conversions
>       download/git: always do full-clone

I have not yet tested with this patch series applied, but with the
current master, I see a difference in behavior between what happens on
my machine (recent Fedora system) and my build server (ancient Debian).

Note: on both cases, the DL_DIR/squashfs folder was entirely removed,
so we start from a situation where there is no Git cache.

On my machine, fetching squashfs works fine:

thomas at windsurf:~/projets/buildroot (master)$ make host-squashfs-extract
/usr/bin/make -j1 O=/home/thomas/projets/buildroot/output HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" silentoldconfig
>>> host-squashfs e38956b92f738518c29734399629e7cdb33072d3 Downloading
Initialized empty Git repository in /home/thomas/dl/squashfs/git/.git/
Fetching all references
remote: Counting objects: 8972, done.
remote: Total 8972 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (8972/8972), 1.56 MiB | 1.66 MiB/s, done.
Resolving deltas: 100% (6544/6544), done.
From https://git.kernel.org/pub/scm/fs/squashfs/squashfs-tools
 * [new branch]      lz4        -> origin/lz4
 * [new branch]      master     -> origin/master
 * [new branch]      stable     -> origin/stable
warning: refname 'e38956b92f738518c29734399629e7cdb33072d3' is ambiguous.
Git normally never creates a ref that ends with 40 hex characters
because it will be ignored when you just specify 40-hex. These refs
may be created by mistake. For example,

  git checkout -b $br $(git rev-parse ...)

where "$br" is somehow empty and a 40-hex ref is created. Please
examine these refs and maybe delete them. Turn this message off by
running "git config advice.objectNameWarning false"
squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz: OK (sha256: bd0aa3011320b8ebee68aa406060de277bef16daf81bad5b9f70cbea6db1a779)
>>> host-squashfs e38956b92f738518c29734399629e7cdb33072d3 Extracting
gzip -d -c /home/thomas/dl/squashfs/squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/host-squashfs-e38956b92f738518c29734399629e7cdb33072d3   -xf -

On my build server however, it fails badly:

test at build:~/buildroot$ make host-squashfs-extract
>>> host-squashfs e38956b92f738518c29734399629e7cdb33072d3 Downloading
Initialized empty Git repository in /home/test/dl/squashfs/git/.git/
Fetching all references
Could not fetch special ref 'e38956b92f738518c29734399629e7cdb33072d3'; assuming it is not special.
fatal: reference is not a tree: e38956b92f738518c29734399629e7cdb33072d3
--2018-04-18 07:28:31--  http://sources.buildroot.net/squashfs/squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.166.48, 104.27.167.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-04-18 07:28:31 ERROR 404: Not Found.

--2018-04-18 07:28:31--  http://sources.buildroot.net/squashfs-e38956b92f738518c29734399629e7cdb33072d3.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.166.48, 104.27.167.48, 2400:cb00:2048:1::681b:a630, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.27.166.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-04-18 07:28:31 ERROR 404: Not Found.

make: *** [/home/test/buildroot/output/build/host-squashfs-e38956b92f738518c29734399629e7cdb33072d3/.stamp_downloaded] Error 1

My machine has Git 2.14.3, the build server has Git 1.7.10.4. I've
tested with another git-fetched package, "ubus", and I have the same
behavior.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
