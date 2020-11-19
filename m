From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:57 +0100
Subject: [Buildroot] [PATCH next 12/12]
 docs/manual/adding-packages-cargo.txt: rewrite explanation about dependency
 management
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-13-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have vendoring support for Cargo packages, let's rewrite
the dependency management section in a more accurate way.

We drop the part about the local cache of the registry, because
+CARGO_HOME+ in Buildroot points to $(HOST_DIR)/share/cargo, which is
not shared between builds nor preserved accross builds, so its effect
as a cache is limited.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-cargo.txt | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index c65a32f017..fb3e7d0780 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -85,15 +85,13 @@ typical packages will therefore only use a few of them.
 
 ==== About Dependencies Management
 
-A crate can depend on other libraries from crates.io or git repositories, listed
-in its Cargo.toml file. Before starting a build, Cargo usually downloads
-automatically them. This step can also be performed independently, via the
-+cargo fetch+ command.
-
-Cargo maintains a local cache of the registry index and of git checkouts of the
-crates, whose location is given by +$CARGO_HOME+.
-
-This dependency download mechanism is not convenient when performing an offline
-build, as Cargo will fail to fetch the dependencies. In that case, it is advised
-to generate a tarball of the dependencies using the +cargo vendor+ and add it to
-+FOO_EXTRA_DOWNLOADS+.
+A crate can depend on other libraries from crates.io or git
+repositories, listed in its Cargo.toml file. Buildroot automatically
+takes care of downloading such dependencies as part of the download
+step of packages that use the +cargo-package+ infrastructure. Such
+dependencies are then kept together with the package source code in
+the tarball cached in Buildroot's +DL_DIR+, and therefore the hash of
+the package's tarball includes such dependencies.
+
+This mechanism ensures that any change in the dependencies will be
+detected, and allows the build to be performed completely offline.
-- 
2.28.0
