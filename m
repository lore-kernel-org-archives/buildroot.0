From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 22:54:29 +0200
Subject: [Buildroot] [PATCH 0/2] Add support for more rust platforms
Message-ID: <20210518205432.133118-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This (small) patch series started from the patch from Nathaniel Husted
enabling support for musl-based platforms in our Rust packaging.

Unfortunately, the patch from Nathaniel was not entirely correct:
indeed, not all CPU architectures have musl support in Rust, so simply
replacing "depends on glibc" by "depends on glibc || musl" was not
sufficient.

Instead, Rust has a classification of platforms by how well they are
supported: Tier 1 platforms, Tier 2 platforms with host tools, Tier 2
platforms without host tools, Tier 3 platforms.

In order to make it easier to keep track of which platforms are
supported, this patch series rewrites how package/rustc/Config.in.host
declares which platforms are supported, to map directly with the Tier
1, Tier 2 with host tools and Tier 2 without host tools platforms.

For the sake of simplicity, Tier 3 platforms are not supported at this
point.

With this patch series, 3 new glibc-based platforms are supported, and
13 new musl-based platforms are supported.

The series is also available at:

  https://github.com/tpetazzoni/buildroot/commits/rustc-arches

Thanks!

Thomas

Nathaniel Husted (1):
  package/rustc: prepare for musl-based platforms support

Thomas Petazzoni (1):
  package/rustc: add support for Tier 1 and Tier 2 platforms

 package/rust-bin/rust-bin.hash |  48 +++++++++++++++
 package/rustc/Config.in.host   | 104 +++++++++++++++++++++++++++++----
 package/rustc/rustc.mk         |   2 +-
 3 files changed, 141 insertions(+), 13 deletions(-)

-- 
2.31.1
