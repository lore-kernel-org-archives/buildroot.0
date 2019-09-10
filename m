From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 10 Sep 2019 05:30:09 +0200
Subject: [Buildroot] [LuaRocks 3/3] package/luarocks: refactor our BR addon
 with new API
In-Reply-To: <20190910033009.4252-1-francois.perrad@gadz.org>
References: <20190910033009.4252-1-francois.perrad@gadz.org>
Message-ID: <20190910033009.4252-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the wellknown module `argparse` is now used by LuaRocks 3.2.0,
instead of a homemade parsing argurment.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/buildroot.lua | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 35223c119..e829b6db0 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -10,15 +10,20 @@ local search = require("luarocks.search")
 local download = require("luarocks.download")
 local fetch = require("luarocks.fetch")
 
-buildroot.help_summary = "generate buildroot package files of a rock."
-buildroot.help_arguments = "rockname [brname]"
-buildroot.help = [[
+function buildroot.add_to_parser(parser)
+   local cmd = parser:command("buildroot", [[
 This addon generates Buildroot package files of a rock.
 First argument is the name of a rock, the second argument is optional
 and needed when Buildroot uses another name (usually prefixed by lua-).
 Files are generated with the source content of the rock and more
 especially the rockspec. So, the rock is downloaded and unpacked.
-]]
+]], util.see_also())
+      :summary("generate buildroot package files of a rock.")
+
+   cmd:argument("rockname", "the name of a rock to be fetched and unpacked.")
+   cmd:argument("brname", "the name used by Buildroot.")
+      :args("?")
+end
 
 local function brname (name)
    return name:upper():gsub('-', '_')
@@ -309,15 +314,10 @@ local function generate_test (rockspec, lcname)
 end
 
 --- Driver function for the "buildroot" command.
--- @param rockname string: the name of a rock to be fetched and unpacked.
--- @param brname string: the name used by Buildroot (optional)
 -- @return boolean: true if successful
-function buildroot.command(flags, rockname, fsname)
-   if type(rockname) ~= 'string' then
-      return nil, "Argument missing. "..util.see_help('buildroot')
-   end
-   fsname = fsname or rockname
-   assert(type(fsname) == 'string')
+function buildroot.command(args)
+   local rockname = assert(args.rockname)
+   local fsname = args.brname or rockname
 
    local query = queries.new(rockname:lower(), nil, false, 'src')
    local url, err = search.find_suitable_rock(query)
-- 
2.20.1
