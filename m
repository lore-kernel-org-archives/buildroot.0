From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:05:28 +0100
Subject: [Buildroot] [PATCH] package/luvi: add upstream patch to fix
 runtime issue with CMake 3.12+
In-Reply-To: <20181214063607.8372-1-joerg.krause@embedded.rocks>
References: <20181214063607.8372-1-joerg.krause@embedded.rocks>
Message-ID: <20181214220528.010f1c4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Dec 2018 07:36:07 +0100, J?rg Krause wrote:
> luvi fails to run when it was build with CMake 3.12+:
> 
> ```
> [string "return require('init')(...)"]:1: module 'init' not found:
> 	no field package.preload['init']
> 	no file './init.lua'
> 	no file '/usr/share/luajit-2.0.5/init.lua'
> 	no file '/usr/local/share/lua/5.1/init.lua'
> 	no file '/usr/local/share/lua/5.1/init/init.lua'
> 	no file '/usr/share/lua/5.1/init.lua'
> 	no file '/usr/share/lua/5.1/init/init.lua'
> 	no file './init.so'
> 	no file '/usr/local/lib/lua/5.1/init.so'
> 	no file '/usr/lib/lua/5.1/init.so'
> 	no file '/usr/local/lib/lua/5.1/loadall.so'
> ```
> 
> Looking at link.txt for the luvi executable shows that `-rdynamic` is
> not set anymore in CMake 3.12. This has the effect, that symbols are
> missing in the `.dynsym` section in the binary.
> 
> The patch, sets `ENABLE_EXPORTS` to true in CMakeLists.txt to force setting
> `-rdynamic` explicitly.
> 
> Upstream status: b8781653dcb8815a3019a77baf4f3b7f7a255ebe
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...i-executable-needs-to-export-symbols.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/luvi/0002-luvi-executable-needs-to-export-symbols.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
