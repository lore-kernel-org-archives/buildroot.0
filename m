From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 16 Nov 2018 21:42:20 +0100
Subject: [Buildroot] Making the Luarocks integration compatible with
 per-package folders
In-Reply-To: <20181116170611.0bad6190@windsurf>
References: <20181116170611.0bad6190@windsurf>
Message-ID: <CAB0FRsveCsQ+Vuk4J4e_LbTRHYQ1prvfQ4+RODP0ZgB9KZYW8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le ven. 16 nov. 2018 ? 17:06, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Fran?ois,
>
> I don't know if you have followed the discussion, but I recently sent a
> new iteration of the per-package folder series [1], which allows to
> support top-level parallel build.
>
> Currently the Luarocks integration in Buildroot doesn't work with this
> per-package folder stuff.
>
> I fixed a first problem in http://patchwork.ozlabs.org/patch/998962/,
> which prevented the host luarocks binary from being available to
> Luarocks packages.
>
> But then the build still doesn't work, with the following error:
>
> >>> dado 1.8.3-1 Building
> >>> dado 1.8.3-1 Installing to target
> cd /home/thomas/projets/buildroot/output/build/dado-1.8.3-1/dado-1.8.3 &&
> LUA_PATH="/home/thomas/projets/buildroot/output/per-package/dado/host/share/lua/5.3/?.lua"
> flock /home/thomas/projets/buildroot/output/per-package/dado/target
> /home/thomas/projets/buildroot/output/per-package/dado/host/bin/lua
> /home/thomas/projets/buildroot/output/per-package/dado/host/bin/luarocks
> make --keep dado-1.8.3-1.rockspec
>
> Error: Failed finding Lua library. You may need to configure LUA_LIBDIR.
> make[1]: *** [package/pkg-generic.mk:337:
> /home/thomas/projets/buildroot/output/build/dado-1.8.3-1/.stamp_target_installed]
> Error 1
> make: *** [Makefile:84: _all] Error 2
>
> (You can reproduce this issue by using
> https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v4
> + http://patchwork.ozlabs.org/patch/998962/, and simply building any
> Luarocks package).
>
> I have not investigated in details, but I believe that the problem
> comes from the /etc/luarocks/config-5.3.lua file in $(HOST_DIR), which
> contains a number of absolute paths to the $(HOST_DIR) and
> $(STAGING_DIR), but at the time of the host-luarocks build. This works
> fine when per-package folder is disabled because there is a single
> HOST_DIR and a single STAGING_DIR, global to all packages. But the
> whole purpose of per-package folders is to have separate HOST_DIR (and
> therefore STAGING_DIR) for each package.
>
> So, we would need to change this config-5.3.lua file, and we have two
> options:
>
>  (1) Either we can use relative paths in this file, or make it use
>      environment variables. In this case, we can keep a single instance
>      of this file, and ensure it behaves properly for each package thanks
>      to the relative path and/or environment variables passed during the
>      build.
>
>
Thomas,

The use of environment variables is doable (I did some experiments in
master branch).
The config file is written in plain Lua, but loaded in a sandbox
environment.
A small patch of luarocks (see attachment) is required for allowing the
getenv function.
After you could generate a config, like this:
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -31,17 +31,20 @@ define HOST_LUAROCKS_INSTALL_CMDS
     rm -f $(LUAROCKS_CONFIG_FILE)
     $(MAKE1) -C $(@D) install
     echo "-- BR cross-compilation"                                  >>
$(LUAROCKS_CONFIG_FILE)
-    echo "variables.LUA_INCDIR = [[$(STAGING_DIR)/usr/include]]"    >>
$(LUAROCKS_CONFIG_FILE)
-    echo "variables.LUA_LIBDIR = [[$(STAGING_DIR)/usr/lib]]"        >>
$(LUAROCKS_CONFIG_FILE)
+    echo "variables.LUA_INCDIR = getenv('STAGING_DIR') ..
[[/usr/include]]"      >> $(LUAROCKS_CONFIG_FILE)
+    echo "variables.LUA_LIBDIR = getenv('STAGING_DIR') ..
[[/usr/lib]]"          >> $(LUAROCKS_CONFIG_FILE)
     echo "variables.CC = [[$(TARGET_CC)]]"                          >>
$(LUAROCKS_CONFIG_FILE)
     echo "variables.LD = [[$(TARGET_CC)]]"                          >>
$(LUAROCKS_CONFIG_FILE)
     echo "variables.CFLAGS = [[$(LUAROCKS_CFLAGS)]]"                >>
$(LUAROCKS_CONFIG_FILE)
     echo "variables.LIBFLAG = [[-shared $(TARGET_LDFLAGS)]]"        >>
$(LUAROCKS_CONFIG_FILE)
-    echo "external_deps_dirs = { [[$(STAGING_DIR)/usr]] }"          >>
$(LUAROCKS_CONFIG_FILE)
+    echo "external_deps_dirs = { getenv('STAGING_DIR') .. [[/usr]]
}"            >> $(LUAROCKS_CONFIG_FILE)
     echo "gcc_rpath = false"                                        >>
$(LUAROCKS_CONFIG_FILE)
-    echo "rocks_trees = { [[$(TARGET_DIR)/usr]] }"                  >>
$(LUAROCKS_CONFIG_FILE)
+    echo "rocks_trees = { getenv('STAGING_DIR') .. [[/usr]] }"      >>
$(LUAROCKS_CONFIG_FILE)
     echo "wrap_bin_scripts = false"                                 >>
$(LUAROCKS_CONFIG_FILE)
     echo "deps_mode = [[none]]"                                     >>
$(LUAROCKS_CONFIG_FILE)
+    echo "-- BR override"                                           >>
$(LUAROCKS_CONFIG_FILE)
+    echo "variables.LUA_DIR = getenv('HOST_DIR')"                   >>
$(LUAROCKS_CONFIG_FILE)
+    echo "variables.LUA_BINDIR = getenv('HOST_DIR') .. [[/bin]]"    >>
$(LUAROCKS_CONFIG_FILE)
 endef

Good test cases are lsqlite3 and luasec which require external libraries
(so, access to staging directory).

Fran?ois

 (2) Or if the first option doesn't work, we have to create a separate
>      version of config-5.3.lua for each package that we build.
>
> Do you know if option (1) is doable ? If not, are you
> interested/available to work on option (2) ? If not, I'm willing to try
> to implement it, but I might need some help since I'm not familiar with
> luarocks.
>
> Thanks for your help!
>
> Thomas
>
> [1] http://patchwork.ozlabs.org/project/buildroot/list/?series=75909
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181116/649f4e3f/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-getenv-in-config.patch
Type: text/x-patch
Size: 826 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181116/649f4e3f/attachment-0001.bin>
