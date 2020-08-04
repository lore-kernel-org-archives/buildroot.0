From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 Aug 2020 21:52:45 +0200
Subject: [Buildroot] [PATCH v2 0/3] Use aiohttp in pkg-stats
Message-ID: <20200804195248.1238754-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I started investigating why pkg-stats was sometimes stuck on the
server running it on a daily basis to populate
autobuild.buildroot.org/stats/ and send the autobuilder e-mails. The
subprocesses started by "multiprocessing" to retrieve the latest
upstream version from release-monitoring.org were stuck holding a
lock. Without providing a definitive conclusion, some preliminary
research showed that multiprocessing can be tricky and cause some
issues with locks.

Discussing this with Titouan, he suggested to use aiohttp instead of
multiprocessing. And indeed, it makes a lot of sense to use this
popular asynchronous HTTP library.

This patch series switches the latest version retrieval and the
upstream URL checking to aiohttp, and as a bonus adds some logging to
show the progress of the retrieval, as it can be quite long.

Changes since v1:

 - Pass trust_env=True when creating the aiohttp.ClientSession() so
   that HTTP proxy environment variables are taken into
   account. Suggested by Matt Weber.

 - Fix bogus indentation that was breaking the logic of the latest
   version retrieval.

Thanks,

Thomas

Thomas Petazzoni (3):
  support/scripts/pkg-stats: use aiohttp for latest version retrieval
  support/scripts/pkg-stats: use aiohttp for upstream URL checking
  support/scripts/pkg-stats: show progress of upstream URL and latest
    version

 support/scripts/pkg-stats | 206 ++++++++++++++++++++++----------------
 1 file changed, 122 insertions(+), 84 deletions(-)

-- 
2.26.2
