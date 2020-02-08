From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  8 Feb 2020 15:27:06 +0100
Subject: [Buildroot] [PATCH] package/luarocks: fix buildroot addon vs 3.3.x
Message-ID: <20200208142706.6097-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

an internal API change introduced by version 3.3.0 causes the following failure:
```
Error: LuaRocks 3.3.1 bug (please report at https://github.com/luarocks/luarocks/issues).
Arch.: linux-x86_64
.../user/build/qarm/host/share/lua/5.3/luarocks/queries.lua:55: assertion failed!
stack traceback:
	[C]: in function 'assert'
	.../user/build/qarm/host/share/lua/5.3/luarocks/queries.lua:55: in function 'luarocks.queries.new'
	...m/host/share/lua/5.3/luarocks/cmd/external/buildroot.lua:322: in function 'luarocks.cmd.external.buildroot.command'
	(...tail calls...)
	[C]: in function 'xpcall'
	/home/user/build/qarm/host/share/lua/5.3/luarocks/cmd.lua:620: in function 'luarocks.cmd.run_command'
	/home/user/build/qarm/host/bin/luarocks:38: in main chunk
	[C]: in ?
```

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/buildroot.lua | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index e829b6db0..67dac33aa 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -319,7 +319,7 @@ function buildroot.command(args)
    local rockname = assert(args.rockname)
    local fsname = args.brname or rockname
 
-   local query = queries.new(rockname:lower(), nil, false, 'src')
+   local query = queries.new(rockname:lower(), nil, nil, false, 'src')
    local url, err = search.find_suitable_rock(query)
    if not url then
       return nil, "Could not find a result named " .. tostring(query) .. ": " .. err
-- 
2.20.1
