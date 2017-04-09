From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Apr 2017 22:51:27 +0200
Subject: [Buildroot] [PATCH/autobuild 7/8] autobuild-run: simplify,
	don't make a dict of config
In-Reply-To: <20170409205128.11560-1-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
Message-ID: <20170409205128.11560-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A toolchain config was defined as a dict with keys url, hostarch,
libc and contents. Of these, only contents and libc were actually
used outside of get_toolchain_configs(). And the use of libc has
been removed in the previous patch.

So there is no reason anymore to make config a dict. Just replace
it with its contents.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 2aa89b4..d17e089 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -252,11 +252,8 @@ class SystemInfo:
 def get_toolchain_configs(**kwargs):
     """Fetch and return the possible toolchain configurations
 
-    This function returns an array of dictionaries, with for each toolchain:
-        - url: the URL of the toolchain defconfig
-        - libc: the C library used by the toolchain
-        - hostarch: the host architecture for which the toolchain is built
-        - contents: an array of lines of the defconfig
+    This function returns an array of toolchain configurations. Each
+    toolchain configuration is itself an array of lines of the defconfig.
     """
     toolchains_url = kwargs['toolchains_url']
 
@@ -271,31 +268,30 @@ def get_toolchain_configs(**kwargs):
 
     for row in csv.reader(l):
         config = {}
-        config["url"] = row[0]
-        config["hostarch"] = row[1]
+        url = row[0]
+        config_hostarch = row[1]
         keep = False
 
         # Keep all toolchain configs that work regardless of the host
         # architecture
-        if config['hostarch'] == "any":
+        if config_hostarch == "any":
             keep = True
 
         # Keep all toolchain configs that can work on the current host
         # architecture
-        if hostarch == config["hostarch"]:
+        if hostarch == config_hostarch:
             keep = True
 
         # Assume that x86 32 bits toolchains work on x86_64 build
         # machines
-        if hostarch == 'x86_64' and config["hostarch"] == "x86":
+        if hostarch == 'x86_64' and config_hostarch == "x86":
             keep = True
 
         if not keep:
             continue
 
-        config["libc"] = row[2]
-        with urlopen_closing(config["url"]) as r:
-            config["contents"] = decode_byte_list(r.readlines())
+        with urlopen_closing(url) as r:
+            config = decode_byte_list(r.readlines())
         configs.append(config)
     return configs
 
@@ -547,7 +543,7 @@ def gen_config(**kwargs):
     i = randint(0, len(configs) - 1)
     config = configs[i]
 
-    configlines = config["contents"]
+    configlines = config
 
     # Amend the configuration with a few things.
     configlines.append("BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y\n")
@@ -574,7 +570,7 @@ def gen_config(**kwargs):
         log_write(log, "ERROR: cannot oldconfig")
         return -1
 
-    if not is_toolchain_usable(config=config["contents"], **kwargs):
+    if not is_toolchain_usable(config=config, **kwargs):
         return -1
 
     # Now, generate the random selection of packages, and fixup
-- 
2.11.0
