From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Feb 2019 16:43:01 +0100
Subject: [Buildroot] [next/testing Lua modules 01/11] luarocks: add
 generation of test
Message-ID: <20190219154311.22173-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/buildroot.lua | 60 ++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 4be5fbd7c..61e44a867 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -49,6 +49,27 @@ local function wrap (txt, max)
    return lines
 end
 
+local function has_c_files (rockspec)
+   for _, mod in pairs(rockspec.build.modules or {}) do
+      if type(mod) == 'string' then
+         if mod:match'%.c$' then
+            return true
+         end
+      elseif type(mod) == 'table' then
+         local sources = mod.sources
+         if type(sources) == 'string' and sources:match'%.c$' then
+            return true
+         end
+         for _, src in ipairs(sources or mod) do
+            if src:match'%.c$' then
+               return true
+            end
+         end
+      end
+   end
+   return false
+end
+
 local function get_external_dependencies (rockspec)
    local t = {}
    for k in pairs(rockspec.external_dependencies or {}) do
@@ -228,6 +249,42 @@ local function generate_hash (rockspec, lcname, rock_file, licenses, digest)
    f:close()
 end
 
+local function generate_test (rockspec, lcname)
+   local ucname = brname(lcname)
+   local modname = rockspec.package:gsub('%-', '')
+   local classname = modname:gsub('%.', '')
+   classname = classname:sub(1, 1):upper() .. classname:sub(2)
+   local fname = 'support/testing/tests/package/test_' .. ucname:lower() .. '.py'
+   local f = assert(io.open(fname, 'w'))
+   util.printout('write ' .. fname)
+   f:write('from tests.package.test_lua import TestLuaBase\n')
+   f:write('\n')
+   f:write('\n')
+   f:write('class TestLua' .. classname .. '(TestLuaBase):\n')
+   f:write('    config = TestLuaBase.config + \\\n')
+   f:write('        """\n')
+   f:write('        BR2_PACKAGE_LUA=y\n')
+   f:write('        BR2_PACKAGE_' .. ucname .. '=y\n')
+   f:write('        """\n')
+   f:write('\n')
+   f:write('    def test_run(self):\n')
+   f:write('        self.login()\n')
+   f:write('        self.module_test("' .. modname .. '")\n')
+   f:write('\n')
+   f:write('\n')
+   f:write('class TestLuajit' .. classname .. '(TestLuaBase):\n')
+   f:write('    config = TestLuaBase.config + \\\n')
+   f:write('        """\n')
+   f:write('        BR2_PACKAGE_LUAJIT=y\n')
+   f:write('        BR2_PACKAGE_' .. ucname .. '=y\n')
+   f:write('        """\n')
+   f:write('\n')
+   f:write('    def test_run(self):\n')
+   f:write('        self.login()\n')
+   f:write('        self.module_test("' .. modname .. '")\n')
+   f:close()
+end
+
 --- Driver function for the "buildroot" command.
 -- @param rockname string: the name of a rock to be fetched and unpacked.
 -- @param brname string: the name used by Buildroot (optional)
@@ -319,6 +376,9 @@ function buildroot.command(flags, rockname, fsname)
    generate_config(rockspec, fsname:lower())
    generate_mk(rockspec, fsname:lower(), licenses)
    generate_hash(rockspec, fsname:lower(), rock_file, licenses, digest)
+   if has_c_files(rockspec) then
+      generate_test(rockspec, fsname:lower())
+   end
 
    return true
 end
-- 
2.17.1
