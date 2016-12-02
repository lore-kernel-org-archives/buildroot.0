From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Fri,  2 Dec 2016 13:21:19 -0200
Subject: [Buildroot] [PATCH v2 0/4] support/download/git using git fetch
Message-ID: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

This is the rewrite of the git downloader using git init + git fetch instead of
git clone.

v1 had these patches:
 support/download/git: log checked out sha1
 test/support/download/git: new test
 support/download/git: do not use git clone

Changes v1 -> v2:
 - add DEVELOPERS entry to the series;
 - move the optimized download of sha1 to a separate patch (Arnout);
 - remove log of sha1 and the automated test from this series (they will be
   part of a follow-up series);
 - the diff of the main patch to master is now smaller and hopefully will make
   the review easier;
 - many improvements to the download script, described in the changelog of the
   first patch (most from Arnout);
 - few corner cases documented (dumb http servers) or fixed (optimized download
   of tag using git 1.7.1 from RHEL6);
 - create a new RFC patch at the end of the series adding the fetch of 100
   commits from each branch as a middle ground between a depth 1 shallow fetch
   and a full fetch.

Advantages:
 - any type of ref can be used as a package version (sha1, tag, branch, special
   ref);
 - do a partial fetch when possible (good especially for large repos, like
   linux kernel);
 - a second fetch reuses the objects already downloaded;
 - sha1 use optimized download when available;
Disadvantages:
 - some small repos (really small without active development and with all refs
   packed) can require to transfer more data from the server when compared to a
   normal git clone.

A comparison between the download size for the current master and for each patch
in this series can be found here:
https://gist.github.com/ricardo-martincoski/bab4ca3257ef292c7175df1e4fdc17e4

Ricardo Martincoski (4):
  support/download/git: do not use git clone
  support/download/git: optimized download of sha1
  DEVELOPERS: add entry for support/download/git
  support/download/git: shallow fetch of all branches

 DEVELOPERS           |   7 +--
 support/download/git | 124 ++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 98 insertions(+), 33 deletions(-)

-- 
2.11.0
