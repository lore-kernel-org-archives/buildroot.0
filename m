From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 18:14:36 +0100
Subject: [Buildroot] [PATCH 1/5] utils/genrandconfig: filter empty lines and
	comments in CSV file
In-Reply-To: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
References: <20171029171440.8095-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171029171440.8095-2-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for the addition of comments in the CSV file listing
toolchain configurations, we filter out such lines when reading the
CSV file in utils/genrandconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a67d46fad9..e963349d70 100755
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
@@ -164,6 +166,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
         with open(configfile) as r:
             config = r.readlines()
         configs.append(config)
+
     return configs
 
 
-- 
2.13.6
