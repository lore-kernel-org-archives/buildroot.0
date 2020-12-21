From: Qais Yousef <qais.yousef@arm.com>
Date: Mon, 21 Dec 2020 16:42:24 +0000
Subject: [Buildroot] [PATCHv6 5/5] package/bcc: add optional luajit
 dependency
In-Reply-To: <20201221143056.lwutjzww3wxk2fr6@e107158-lin>
References: <20201220151203.2206747-1-romain.naour@gmail.com>
 <20201220151203.2206747-5-romain.naour@gmail.com>
 <20201221143056.lwutjzww3wxk2fr6@e107158-lin>
Message-ID: <20201221164224.oasccletgxynmid2@e107158-lin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/21/20 14:30, Qais Yousef wrote:
> On 12/20/20 16:12, Romain Naour wrote:
> > The luajit dependency was explicitely disabled when bcc has
> > been added to Buildroot.
> > Even if the python binding is probably more used, enable
> > luajit binding if luajit package is enabled in the defconfig.
> > 
> > Fix the luajit command line used to build bcc.o, otherwise
> > bcc.o is build for the host.
> > 
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: Qais Yousef <qais.yousef@arm.com>
> > ---
> 
> This compiles fine for me. And the patch looks good to me too. But when I tried
> to test it by following the example from the website
> 
> 	$ sudo src/lua/bcc-probe examples/lua/task_switch.lua
> 
> I noticed there's no bcc-probe in the target. When I copied it manually and
> tried to run the above command I ended up with the below error.
> 
> 	# /root/bcc-probe examples/lua/task_switch.lua
> 	luajit: /root/bcc-probe:20: module 'bcc.run' not found:
> 		no field package.preload['bcc.run']
> 		no file '/root//bcc/run.lua'
> 		no file './bcc/run.lua'
> 		no file '/usr/share/luajit-2.1.2/bcc/run.lua'
> 		no file '/usr/local/share/lua/5.1/bcc/run.lua'
> 		no file '/usr/local/share/lua/5.1/bcc/run/init.lua'
> 		no file '/usr/share/lua/5.1/bcc/run.lua'
> 		no file '/usr/share/lua/5.1/bcc/run/init.lua'
> 		no file './bcc/run.so'
> 		no file '/usr/local/lib/lua/5.1/bcc/run.so'
> 		no file '/usr/lib/lua/5.1/bcc/run.so'
> 		no file '/usr/local/lib/lua/5.1/loadall.so'
> 		no file './bcc.so'
> 		no file '/usr/local/lib/lua/5.1/bcc.so'
> 		no file '/usr/lib/lua/5.1/bcc.so'
> 		no file '/usr/local/lib/lua/5.1/loadall.so'
> 	stack traceback:
> 		[C]: in function 'require'
> 		/root/bcc-probe:20: in main chunk
> 		[C]: at 0x00402414
> 
> I admit I enabled luajit after initially building bcc without it. Although
> I deleted output/build/bcc* to ensure it gets rebuilt against the new
> dependency.
> 
> I'll try again with a full clean build to see if this fixes it.

Same thing with a new clean build. I just enabled BR2_PACKAGE_LUAJIT. Is there
a dependency on lua 5.1 too?

Thanks

--
Qais Yousef
