From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Mar 2012 23:46:26 +0100
Subject: [Buildroot] core file
In-Reply-To: <20120315141929.1b885c74@skate>
References: <DC8F7388218A402C9FEADA4D9CC577B3@JohanW7>
 <B20373C250564070827FBAAEA65AE6B6@JohanW7> <20120315141929.1b885c74@skate>
Message-ID: <201203152346.27014.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 15 March 2012 14:19:29 Thomas Petazzoni wrote:
> And you have built it with debugging symbols it seems, so its size is
> way too big to load on your target. Either use cross-gdb+gdbserver, or
> don't compile the uClibc with debugging symbols.

 cross-gdb with or without gdbserver is really the way to go.  Then you
don't need to compile with debug symbols.  But I guess Johan would like 
to get some explanation how to do that.

 Without gdbserver:

 On the target, enable core files with 'ulimit -c 0' and run curl.
You should get a core file in the current directory.

 Copy the core file to the build host.

 Go to the source directory of curl. Run 
../../host/usr/bin/arm*gdb src/curl <corefile> 

 Now you can look at the backtrace in the debugger, it shows the
source as well.


 With gdbserver:

 On the target, run
gdbserver any:8888 curl

 On the host, run gdb in the curl source directory like above.
../../host/usr/bin/arm*gdb src/curl
gdb> set target <ipaddr>:8888
gdb> continue

 Now the program runs up to the segmentation fault.


 
 Regards,
 Arnout

 
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
