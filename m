From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 12:09:11 +0200
Subject: [Buildroot] [git commit] package/luarocks: better choice of modules
 in generated test
Message-ID: <20190331101131.C5A47812EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2206299031f3bb3e71a105deec6d2d0d8f472b9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the name derived from package name is not suitable,
so, we search in the built modules.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luarocks/buildroot.lua | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 61e44a8679..39f0fe759e 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -70,6 +70,25 @@ local function has_c_files (rockspec)
    return false
 end
 
+local function get_main_modules (rockspec)
+   local t = {}
+   for name in pairs(rockspec.build.modules or {}) do
+      if not name:match('%.') then
+         t[#t+1] = name
+      end
+   end
+   if #t == 0 then
+      for name in pairs(rockspec.build.modules or {}) do
+         t[#t+1] = name
+      end
+   end
+   if #t == 0 then
+      t[#t+1] = rockspec.package:gsub('%-', '')
+   end
+   table.sort(t)
+   return t
+end
+
 local function get_external_dependencies (rockspec)
    local t = {}
    for k in pairs(rockspec.external_dependencies or {}) do
@@ -251,9 +270,9 @@ end
 
 local function generate_test (rockspec, lcname)
    local ucname = brname(lcname)
-   local modname = rockspec.package:gsub('%-', '')
-   local classname = modname:gsub('%.', '')
+   local classname = rockspec.package:gsub('%-', ''):gsub('%.', '')
    classname = classname:sub(1, 1):upper() .. classname:sub(2)
+   local modnames = get_main_modules(rockspec)
    local fname = 'support/testing/tests/package/test_' .. ucname:lower() .. '.py'
    local f = assert(io.open(fname, 'w'))
    util.printout('write ' .. fname)
@@ -269,7 +288,9 @@ local function generate_test (rockspec, lcname)
    f:write('\n')
    f:write('    def test_run(self):\n')
    f:write('        self.login()\n')
-   f:write('        self.module_test("' .. modname .. '")\n')
+   for i = 1, #modnames do
+      f:write('        self.module_test("' .. modnames[i] .. '")\n')
+   end
    f:write('\n')
    f:write('\n')
    f:write('class TestLuajit' .. classname .. '(TestLuaBase):\n')
@@ -281,7 +302,9 @@ local function generate_test (rockspec, lcname)
    f:write('\n')
    f:write('    def test_run(self):\n')
    f:write('        self.login()\n')
-   f:write('        self.module_test("' .. modname .. '")\n')
+   for i = 1, #modnames do
+      f:write('        self.module_test("' .. modnames[i] .. '")\n')
+   end
    f:close()
 end
 
