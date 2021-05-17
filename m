From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 May 2021 19:39:36 +0200
Subject: [Buildroot] sudo: error while loading shared libraries
In-Reply-To: <20210512191730.0a16ca32@gmx.net>
References: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <20210504214306.378dbbaf@windsurf>
 <AM0PR06MB5923BCE07863B47DBF9AAC02C0599@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <AM0PR06MB5923358E8BAADC4FAA9F5542C0589@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <20210506213744.3c03ca12@gmx.net>
 <AM0PR06MB5923BBCDE75371734EDAA309C0549@AM0PR06MB5923.eurprd06.prod.outlook.com>
 <20210512191730.0a16ca32@gmx.net>
Message-ID: <6a22e972-554f-a50e-9878-603a2e3efedb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/05/2021 19:17, Peter Seiderer wrote:
> Hello Uwe,
> 
> On Mon, 10 May 2021 13:10:31 +0000, Uwe Fechner <uwe.fechner@nl.abb.com> wrote:
> 
>> Dear Peter,
>>
>> I executed the steps that you suggested. My results:
>>
>> ufechner at builder:~/repos/armxl-buildroot$ cat build_rootfs.log | grep rpath | grep libtool | tail -1
>> libtool: link: /mnt/data/repos/armxl-buildroot/output_imx6_rootfs/host/bin/arm-buildroot-linux-gnueabihf-gcc -o sudo conversation.o copy_file.o edit_open.o env_hooks.o exec.o exec_common.o exec_monitor.o exec_nopty.o exec_pty.o get_pty.o hooks.o limits.o load_plugins.o net_ifs.o parse_args.o preserve_fds.o signal.o sudo.o sudo_edit.o tcsetpgrp_nobg.o tgetpass.o ttyname.o utmp.o -Wl,--enable-new-dtags -Wl,-z -Wl,relro -fstack-protector-strong  -lutil ../lib/util/.libs/libsudo_util.so -lpthread -ldl -Wl,-rpath -Wl,/mnt/data/repos/armxl-buildroot/output_imx6_rootfs/build/sudo-1.9.5p2/lib/util/.libs -Wl,-rpath -Wl,/usr/libexec/sudo
> 
> This one looks good...
> 
>>
>> ufechner at builder:~/repos/armxl-buildroot/output_imx6_rootfs$ readelf -d ./target/usr/bin/sudo | grep RUNPATH
>>  0x0000001d (RUNPATH)                    Library runpath: [libexec/sudo]
> 
> This one is definitely wrong/unexpected...

That is very weird... I don't think our patchelf could have that effect... To be
sure, you could first build only the sudo package with `make sudo`, then check
the runpath, then do the full build with `make`.

 You could also take a look at the binary in the build directory
(/mnt/data/repos/armxl-buildroot/output_imx6_rootfs/build/sudo-1.9.5p2/src/sudo)
- that one doesn't get processed by patchelf.


>> ufechner at builder:~/repos/armxl-buildroot/output_imx6_rootfs$ make > /dev/null 2>&1
>> ufechner at builder:~/repos/armxl-buildroot/output_imx6_rootfs$ readelf -d ./target/usr/bin/sudo | grep RUNPATH
>>  0x0000001d (RUNPATH)                    Library runpath: []
> 
> Follow-up failure, only the correct/absolute path '/usr/libexec/sudo' would be kept...
> 
>>
>> So the runpath is wrong after the first build and empty after the second build.
>>
>> Any idea why this can happen?
> 
> Can you try to execute the link step on command line?
> 
> 	$ cd build/sudo-1.9.5p2/src
> 	$ /mnt/data/repos/armxl-buildroot/output_imx6_rootfs/host/bin/arm-buildroot-linux-gnueabihf-gcc -o sudo ...
> 	$ readelf -d sudo
> 
> Do you have ccache enabled (in case try to build without)?

 ccache doesn't do anything with linking, it only caches object files.

 Regards,
 Arnout


[snip]
