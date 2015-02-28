From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Feb 2015 19:15:06 +0100
Subject: [Buildroot] [PATCH 0/7] Improvements to the download logic
Message-ID: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of 7 patches is some preparation work needed to fully bring
into the package infrastructure the responsability of features such as
"make source", "make external-deps" or "make legal-info".

In order to make this possible, we need to make sure that the package
infrastructure is aware of all downloads made by packages: calling the
"DOWNLOAD" macro directly is bypassing this. Currently, the linux and
perl packages are doing this, which means the package infrastructure
is not aware of certain things that the linux and perl packages are
downloading.

This series therefore:

 * Fixes the 'linux' package to use the package infra to download
   patches. No changes to the package infra are needed to make this
   possible.

 * Fixup the handling of the "Downloading" message.

 * Allow full URLs in <pkg>_EXTRA_DOWNLOADS, and not just a file name
   relative to <pkg>_SITE.

 * Fix the 'perl' package to use <pkg>_EXTRA_DOWNLOADS to download
   perl-cross.

I would like to see this small series merged, so that I can then
submit some additional patches later in the development cycle.

Thanks,

Thomas

Thomas Petazzoni (7):
  linux: use the package infrastructure to download patches
  pkg-generic: fix the logic showing the "Downloading" message
  pkg-generic: take into account <pkg>_EXTRA_DOWNLOADS to display
    "Downloading" message
  pkg-generic: refactor the "Downloading" message logic
  pkg-generic: allow full URLs for <pkg>_EXTRA_DOWNLOADS
  docs/manual: update documentation about <pkg>_SOURCE, <pkg>_PATCH and
    <pkg>_EXTRA_DOWNLOADS
  perl: use <pkg>_EXTRA_DOWNLOADS

 docs/manual/adding-packages-generic.txt | 32 ++++++++++++++++++--------------
 linux/linux.mk                          | 25 +++++++++----------------
 package/perl/perl.mk                    | 15 ++++++---------
 package/pkg-generic.mk                  | 23 ++++++++++++-----------
 4 files changed, 45 insertions(+), 50 deletions(-)

-- 
2.1.0
