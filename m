From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 12 Apr 2018 06:28:52 -0300
Subject: [Buildroot] [RFC PATCH 0/3] fix some corner cases for download/git
 v1
Message-ID: <20180412092855.30621-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series brings 3 patches trying to cover some corner cases when downloading
packages with method git.

The first 2 patches are intended to fix autobuilder failures.
http://autobuild.buildroot.net/?reason=dtv-scan-tables-07b18ecef17493ac0908a2e112eae3fe269da7fa

This occurs only with old versions of git when a full fetch is needed:
 fatal: reference is not a tree: sha1
These occur when the git cache is dirty:
 error: The following untracked working tree files would be overwritten by checkout:
 error: The following untracked working tree files would be removed by checkout:
A dirty cache can also cause hash mismatches for the tarball.

Patch 3 should fix the case of unshallowing the git cache (when a shallow fetch
downloaded a ref, and later a commit behind this ref is needed). This scenario
is relevant both during the buildroot development (a revert of a bump) and when
a build farm is shared by projects that use different versions of buildroot.

Regards,
Ricardo


Ricardo Martincoski (3):
  download/git: fix fetch all refs for old git
  download/git: recover dirty cache
  download/git: unshallow when fetching all refs

 support/download/git | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.14.1
