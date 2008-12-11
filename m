From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Thu, 11 Dec 2008 15:08:18 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
 800k !?
In-Reply-To: <49410D22.1010206@cetrtapot.si>
References: <4940C961.7080602@gin.de> <87ljunkojx.fsf@macbook.be.48ers.dk>
	<4940EDF4.7040400@gin.de> <49410D22.1010206@cetrtapot.si>
Message-ID: <49411ED2.1060601@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hinko Kocevar wrote:
> Andreas Kuehn wrote:
>> Peter Korsgaard wrote:
>>>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
>>>  Andreas> Hi!
>>>
>>>  Andreas> I'm using buildroot revision 23203. After all seems to work
>>>  Andreas> on my at91sam9263 based board, I figured out that scp
>>>  Andreas> transferes not more than 800kByte in one file. This is not
>>>  Andreas> acceptable and I tried openssh instead of dropbear. Still,
>>>  Andreas> the maximum transferable file size is less than 800k.
>>>
>>> Works here:
>>>
>>> scp binutils-2.18.tar.bz2 root at 150.158.210.109:/tmp/
>>> root at 150.158.210.109's password:
>>> binutils-2.18.tar.bz2                         100%   14MB   2.0MB/s   00:07
>>>
> 
> Here too.
> 
>> disappear. Any other ideas?
>>
>> Not knowing the cause is somewhat uncomfortable. (I hate keeping fingers
>> crossed. Last time I dropped my coffee pot!)
> 
> Try running scp and/or dropbear on target under strace or better gdbserver.
> Does it also limit file size if you transfer file from target to host or only other way around?
> 
> Regards,
> Hinko
> 
First, scp (sftp) segfaults in both directions.

  - getting a file from the host to the box ends at 880KB
  - putting a file from the box to the host ends at 992KB


  1. Here is the debug output of "scp user at host:gimp.ps ."
Right in the middle you see a "segmentation fault"

  2. Further down you can find the not very enlighting result from
"strace scp user at host:gimp.ps . "

  3. I tried it the opposite way. Sitting on the host and scp a file 
from the box. The result and -vvv output is even more scary!

Well, summing up all, it looks as there are different aspects 
interfering each other but all of it is around the openssh system. 
Configuration is one part but currently I redo the buildroot system with 
my current configuration to get rid of leftovers from previous 
configurations. (That'll take a while...)
Nevertheless, can someone read tea leaves from the below?

Regards
	akuehn



Output of "scp user at host:gimp.ps ."

Sending file modes: C0644 4146862 gimp.ps
debug2: channel 0: written 42 to efd 6
Sink: C0644 4146862 gimp.ps
gimp.ps                                         0%    0     0.0KB/s 
--:-- ETAdebug2: channel 0: window 65472 sent adjust 65600
debug2: channel 0: window 49152 sent adjust 81920
debug2: channel 0: window 49152 sent adjust 81920
    * akuehn: this message comes multiple times *
debug2: channel 0: window 49152 sent adjust 81920
gimp.ps                                        22%  896KB 896.0KB/s 
00:01    debug2: channel 0: read<=0 rfd 4 len 0
debug2: channel 0: read failed
debug2: channel 0: close_read
debug2: channel 0: input open -> drain
debug2: channel 0: write failed
debug2: channel 0: close_write
debug2: channel 0: output open -> closed
debug2: channel 0: ibuf empty
debug2: channel 0: send eof
debug2: channel 0: input drain -> closed
debug2: channel 0: window 49152 sent adjust 65536
Segmentation fault

debug2: channel 0: window 49152 sent adjust 65536
debug2: channel 0: window 49152 sent adjust 65536
debug2: channel 0: window 49152 sent adjust 65536
    * akuehn: this message comes multiple times *

debug2: channel 0: window 49152 sent adjust 65536
debug2: channel 0: window 49152 sent adjust 65536
debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
debug2: channel 0: rcvd eof
debug2: channel 0: rcvd close
debug3: channel 0: will not send data after close
debug2: channel 0: almost dead
debug2: channel 0: gc: notify user
debug2: channel 0: gc: user detached
debug2: channel 0: send close
debug2: channel 0: is dead
debug2: channel 0: garbage collecting
debug1: channel 0: free: client-session, nchannels 1
debug3: channel 0: status: The following connections are open:
   #0 client-session (t4 r0 i3/0 o3/0 fd -1/-1 cfd -1)

debug3: channel 0: close_fds r -1 w -1 e 6 c -1
debug1: fd 0 clearing O_NONBLOCK
debug1: fd 1 clearing O_NONBLOCK
debug1: Transferred: stdin 0, stdout 0, stderr 0 bytes in 42 seconds
debug1: Bytes per second: stdin 00, stdout 00, stderr 00
debug1: Exit status 1


strace output "strace scp user at host:gimp.ps . "

read(7, "-!s8W-!s8W-!s8W-!s8W-!s8N\'!zz!!*"..., 4096) = 4096
write(3, "-!s8W-!s8W-!s8W-!s8W-!s8N\'!zz!!*"..., 4096) = 4096
read(7, "W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-"..., 4096) = 4096
write(3, "W-!s8W-!s8W-!s8W-!s8W-!s8W-!s8W-"..., 4096) = 4096
read(7, "/\\;FNo=3&s;b3C6/$S=5uJs8W-!s8W-!"..., 4096) = 4096
write(3, "/\\;FNo=3&s;b3C6/$S=5uJs8W-!s8W-!"..., 4096) = 4096
--- SIGALRM (Alarm clock) @ 0 (0) ---
getpgrp()                               = 884
ioctl(1, TIOCGPGRP, [884])              = 0
time(NULL)                              = 6388
gimp.ps                                         8%  324KB 324.0KB/s 
00:01    ) = 80
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++



Doing "scp user at box:openocd ."
   ...

debug3: Ignored env LESSCLOSE
debug3: Ignored env _
debug1: Sending command: scp -v -f openocd
debug2: channel 0: request exec confirm 0
debug2: callback done
debug2: channel 0: open confirm rwindow 0 rmax 32768
debug2: channel 0: rcvd adjust 131072
debug2: channel 0: rcvd eof
debug2: channel 0: output open -> drain
debug2: channel 0: obuf empty
debug2: channel 0: close_write
debug2: channel 0: output drain -> closed
debug1: client_input_channel_req: channel 0 rtype exit-signal reply 0
debug2: channel 0: rcvd close
debug2: channel 0: close_read
debug2: channel 0: input open -> closed
debug3: channel 0: will not send data after close
debug2: channel 0: almost dead
debug2: channel 0: gc: notify user
debug2: channel 0: gc: user detached
debug2: channel 0: send close
debug2: channel 0: is dead
debug2: channel 0: garbage collecting
debug1: channel 0: free: client-session, nchannels 1
debug3: channel 0: status: The following connections are open:
   #0 client-session (t4 r0 i3/0 o3/0 fd -1/-1 cfd -1)

debug3: channel 0: close_fds r -1 w -1 e 7 c -1
debug1: fd 0 clearing O_NONBLOCK
debug1: fd 1 clearing O_NONBLOCK
debug1: Transferred: stdin 0, stdout 0, stderr 0 bytes in 0.0 seconds
debug1: Bytes per second: stdin 0.0, stdout 0.0, stderr 0.0
debug1: Exit status -1
