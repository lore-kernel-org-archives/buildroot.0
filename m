From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:20:04 +0100
Subject: [Buildroot] [git commit branch/next] utils/genrandconfig: filter
 empty lines and comments in CSV file
Message-ID: <20171127221251.2160F8113D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7abd1ddfbdbd7b4e4e426dce7c9d1c82fde1582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In preparation for the addition of comments in the CSV file listing
toolchain configurations, we filter out such lines when reading the
CSV file in utils/genrandconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a67d46f..8833225 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -126,7 +126,9 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     """
 
     with open(toolchains_csv) as r:
-        toolchains = decode_byte_list(r.readlines())
+        # filter empty lines and comments
+        lines = [ t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#' ]
+        toolchains = decode_byte_list(lines)
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
