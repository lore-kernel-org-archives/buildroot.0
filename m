From: Massimo Callegari <massimocallegari@yahoo.it>
Date: Tue, 10 Jun 2014 11:44:39 +0100 (BST)
Subject: [Buildroot] ICU 51.2 bus error
In-Reply-To: <1402391334.96225.YahooMailNeo@web172303.mail.ir2.yahoo.com>
References: <1402328606.59886.YahooMailNeo@web172305.mail.ir2.yahoo.com>
 <20140609184755.54864d4b@free-electrons.com>
 <1402391334.96225.YahooMailNeo@web172303.mail.ir2.yahoo.com>
Message-ID: <1402397079.50647.YahooMailNeo@web172306.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, this is getting more complicated than I thought.

First things first. The ulimit problem was that it is included in the ash shell, so running the 'busybox' command didn't display it.
I had to type 'ash' and then 'ulimit -c unlimited'. Hitting 'TAB' when into ash doesn't display ulimit either.

So finally I obtained the core file. I analyzed it with gdb and got no relevant information cause it says "no debugging symbols found", even though I built ICU with "--enable-debug --disable-release"
So I though to enable it also on the host-icu and got a build error:

/opt/target/output/host/usr/bin/ccache /usr/bin/g++ -O2 -I/opt/target/output/host/usr/include -pedantic -Wpointer-arith -Wwrite-strings -Wno-long-long -std=c++11 ?-L/opt/target/output/host/lib -L/opt/target/output/host/usr/lib -Wl,-rpath,/opt/target/output/host/usr/lib ?-o ../../bin/makeconv makeconv.o ucnvstat.o genmbcs.o gencnvex.o -L../../lib -licutu -L../../lib -licui18n -L../../lib -licuuc -L../../stubdata -licudata -lpthread -ldl -lm ?
makeconv.o: in function "readFile.part.1":
makeconv.c:(.text+0x35b): undefined reference to "uprv_checkValidMemory"
makeconv.c:(.text+0x607): undefined reference to "uprv_checkValidMemory"
makeconv.o: in function "main":
makeconv.c:(.text.startup+0x3e): undefined reference to "uprv_checkValidMemory"
makeconv.c:(.text.startup+0xb26): undefined reference to "uprv_checkValidMemory"
gencnvex.o: in function "getFromUBytesValue.isra.2.part.3":
gencnvex.c:(.text+0xcef): undefined reference to "uprv_checkValidMemory"
collect2: error: ld returned 1 exit status
make[3]: *** [../../bin/makeconv] Error 1
make[3]: uscita dalla directory "/opt/target/output/build/host-icu-51.2/source/tools/makeconv"
make[2]: *** [all-recursive] Error 2
make[2]: uscita dalla directory "/opt/target/output/build/host-icu-51.2/source/tools"
make[1]: *** [all-recursive] Error 2
make[1]: uscita dalla directory "/opt/target/output/build/host-icu-51.2/source"
make: *** [/opt/target/output/build/host-icu-51.2/.stamp_built] Error 2

Basically I'm stuck again.
I hated ICU before and I hate it even more now.

Massimo


>________________________________
> Da: Massimo Callegari <massimocallegari@yahoo.it>
>A: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
>Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
>Inviato: Marted? 10 Giugno 2014 11:08
>Oggetto: Re: [Buildroot] ICU 51.2 bus error
> 
>
>
>Hi Thomas,
>thanks for the prompt reply !
>
>
>Feeling very ignorant here....but how do I enable the ulimit command ?
>I use busybox 1.22 and it doesn't seem to have it.
>I checked I have "ELF core dump" enabled in my kernel. I tried to enable CONFIG_FEATURE_INIT_COREDUMPS on busybox but still no luck.
>I tried to see if I can build another shell interpreter in my image but busybox is blocking everyone else.
>
>
>Is there any trick directed to /proc that can substitute the ulimit -c command ?
>
>
>Thanks and sorry for the complication...
>Massimo
>
>
>
>>________________________________
>> Da: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>A: Massimo Callegari <massimocallegari@yahoo.it> 
>>Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
>>Inviato: Luned? 9 Giugno 2014 18:47
>>Oggetto: Re: [Buildroot] ICU 51.2 bus error
>> 
>>
>>Dear Massimo Callegari,
>>
>>On Mon, 9 Jun 2014 16:43:26 +0100 (BST), Massimo Callegari wrote:
>>
>>> I'm having a serious issue with ICU 51.2 on a MIPS platform.
>>> Everything builds fine but anyone using ICU at runtime gets a misterious "bus error" fault.
>>> At first I thought it was my Qt 5.3.0 build, but then I realized even the simple "icuinfo" tool fails with the same error.
>>> The root filesystem is mounted on NFS but I hope that's not the cause.
>>> 
>>> 
>>> I enclose a strace run of the icuinfo command at the end of this email.
>>> From the trace it seems the lookup of file "/usr/lib/icu/icuplugins51.txt" is the cause of all the evil, but I tried to manually create it and nothing changes.
>>> I double checked on my PC and it doesn't even exist, even though the icuinfo command works properly.
>>> 
>>> I'm afraid this is a cross-compilation thing, but I can't figure out myself what it might be.
>>> Does anyone have any idea or is able to find the issue from the trace below ?
>>
>>First of all, thanks for your report!
>>
>>Could you run "ulimit -c unlimited" on your target, and then your
>>command? It will generate a "core" file that you can transfer on your
>>development machine, and then do:
>>
>>??? ./host/usr/mips-<blabla>-gdb -c core target/usr/bin/icuinfo
>>
>>and then run the "backtrace" command in gdb, to see where the crash
>>occurred.
>>
>>
>>Thanks!
>>
>>Thomas
>>-- 
>>Thomas
 Petazzoni, CTO, Free Electrons
>>Embedded Linux, Kernel and Android engineering
>>http://free-electrons.com
>>
>>
>>
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140610/af4bf51b/attachment.html>
