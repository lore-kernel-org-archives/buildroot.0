From: Ivan Sergeev <vsergeev@gmail.com>
Date: Sun, 1 Feb 2015 20:44:34 -0800
Subject: [Buildroot] LuaRocks package infrastructure oddities
Message-ID: <CAAMhL_STu2FpiW86rn_Tzi1jkqrBVQL3qHOmtW+vtYWuU_HPtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems that the LuaRocks package infrastructure expects to find the
LUAFOO_ROCKSPEC file inside the LUAFOO_SUBDIR sources directory of the
package to build it. This is a bit odd, as the rockspec is already
downloaded or extracted from the source rock in the parent directory
containing LUAFOO_SUBDIR, but the infrastructure relies on packages
including that rockspec in their sources.

A condensed version of what the build appears to be doing is:

wget http://rocks.moonscript.org/lua-periphery-1.0.4-1.src.rock -O
/path/to/buildroot/dl/ua-periphery-1.0.4-1.src.rock

cd /path/to/buildroot/output/build/ && luarocks unpack --force
/path/to/dl/lua-periphery-1.0.4-1.src.rock

at which point is has:
    output/build/lua-periphery-1.0.4-1/lua-periphery/  (the sources)
    output/build/lua-periphery-1.0.4-1/lua-periphery-1.0.4-1.rockspec (the
rockspec)

but then it descends into the sources and expects to find and build the
rockspec file there:

cd /path/to/buildroot/output/build/lua-periphery-1.0.4-1/lua-periphery &&
luarocks make --keep lua-periphery-1.0.4-1.rockspec

This works for me and the other LuaRocks packages currently in buildroot,
because they happen to version the rockspec with the rest of the sources,
but in general it seems unusual. I've attached a full log of the build.

I've also noticed that legal-info licenses are stored one extra
subdirectory deep, at output/legal-info/licenses/luafoo/$LUAFOO_SUBDIR/,
e.g. lua-periphery below:

$ make legal-info
$ tree output/legal-info/licenses
output/legal-info/licenses
??? am33x-cm3
?   ??? License.txt
??? busybox
?   ??? LICENSE
??? linux
?   ??? COPYING
??? lua
?   ??? COPYRIGHT
??? lua-periphery
?   ??? lua-periphery
?       ??? LICENSE
??? uboot
?   ??? Licenses
?       ??? gpl-2.0.txt
??? uclibc
    ??? COPYING.LIB
$

Thanks,
~vsergeev
Ivan Sergeev
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150201/9881f09d/attachment.html>
-------------- next part --------------
$ rm -rf output/build/lua-periphery-1.0.4-1/
$ rm -rf dl/lua-periphery*
$ make lua-periphery-rebuild
rm -f /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/.stamp_built
rm -f /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/.stamp_staging_installed
rm -f /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/.stamp_target_installed
rm -f /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/.stamp_images_installed
rm -f /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/.stamp_host_installed
>>> lua-periphery 1.0.4-1 Downloading
--2015-02-01 20:03:56--  http://rocks.moonscript.org/lua-periphery-1.0.4-1.src.rock
Resolving rocks.moonscript.org (rocks.moonscript.org)... 54.204.57.69
Connecting to rocks.moonscript.org (rocks.moonscript.org)|54.204.57.69|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 45277 (44K) [application/x-rock]
Saving to: ?/home/anteater/sandbox/buildroot/output/build/.lua-periphery-1.0.4-1.src.rock.v1EsSJ/output?

/home/anteater/sandbox/buildroot/output/bu 100%[========================================================================================>]  44.22K   242KB/s   in 0.2s   

2015-02-01 20:03:57 (242 KB/s) - ?/home/anteater/sandbox/buildroot/output/build/.lua-periphery-1.0.4-1.src.rock.v1EsSJ/output? saved [45277/45277]

>>> lua-periphery 1.0.4-1 Extracting
cd /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/.. && LUA_PATH="/home/anteater/sandbox/buildroot/output/host/usr/share/lua/5.1/?.lua" /home/anteater/sandbox/buildroot/output/host/usr/bin/lua /home/anteater/sandbox/buildroot/output/host/usr/bin/luarocks unpack --force /home/anteater/sandbox/buildroot/dl/lua-periphery-1.0.4-1.src.rock

Done. You may now enter directory 
lua-periphery-1.0.4-1/lua-periphery
and type 'luarocks make' to build.
>>> lua-periphery 1.0.4-1 Patching
>>> lua-periphery 1.0.4-1 Configuring
>>> lua-periphery 1.0.4-1 Building
>>> lua-periphery 1.0.4-1 Installing to target
cd /home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/lua-periphery && LUA_PATH="/home/anteater/sandbox/buildroot/output/host/usr/share/lua/5.1/?.lua" /home/anteater/sandbox/buildroot/output/host/usr/bin/lua /home/anteater/sandbox/buildroot/output/host/usr/bin/luarocks make --keep lua-periphery-1.0.4-1.rockspec 
make[1]: Entering directory '/home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/lua-periphery'
...
make[1]: Leaving directory '/home/anteater/sandbox/buildroot/output/build/lua-periphery-1.0.4-1/lua-periphery'
Updating manifest for /home/anteater/sandbox/buildroot/output/target/usr/lib/luarocks/rocks
lua-periphery 1.0.4-1 is now built and installed in /home/anteater/sandbox/buildroot/output/target/usr (license: MIT/X11)
