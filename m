From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 12 Apr 2018 06:28:54 -0300
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
References: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
Message-ID: <20180412092855.30621-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the case a previous operation in the git cache was abruptly
interrupted the git cache can be in a dirty state (removed files,
untracked files). This can lead to download failures during the
checkout, like this:
 error: The following untracked working tree files would be overwritten by checkout:
and/or this:
 error: The following untracked working tree files would be removed by checkout:

If an untracked file, directory or submodule is present after the
checkout, the tarball will have additional content, leading to a hash
mismatch.

When performing the checkout, use -f to allow it to occur even if there
are untracked files that would be overwritten or removed.

Use git clean to remove any untracked files before generating the
tarball. Use the second -f to ensure the repo is pristine even if
previous checked out ref contained a submodule that is not present in
the ref just checked out.

Fixes:
http://autobuild.buildroot.net/results/b418394f679ad269d587753302c540036793334c
Possibly fixes:
http://autobuild.buildroot.net/results/9b584a624bb08c5ab6d977b93f4b92ed4bd1d40f

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
I did not split this into 2 patches (the first one adding -f to checkout
and the second one adding git reset) because only adding -f to checkout
would make the git checkout command to succeed but the download would
still fails when checking the hash if any untracked file was left. In
this case the git cache also would still be dirty, so it is not really a
fix to a dirty cache.
---
 support/download/git | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 1b09e5c750..68b5d920a1 100755
--- a/support/download/git
+++ b/support/download/git
@@ -92,7 +92,8 @@ fi
 
 # Checkout the required changeset, so that we can update the required
 # submodules.
-_git checkout -q "'${cset}'"
+_git checkout -f -q "'${cset}'"
+_git clean -ffdx
 
 # Get date of commit to generate a reproducible archive.
 # %cD is RFC2822, so it's fully qualified, with TZ and all.
-- 
2.14.1
