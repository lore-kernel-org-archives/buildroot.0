From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 18 Mar 2011 09:53:19 -0500
Subject: [Buildroot] ntpdate takes a long time
In-Reply-To: <AANLkTi=PdnH5wLpD+F1pmWwf0jNc_baRBGbr70RAtVXT@mail.gmail.com>
References: <AANLkTi=PdnH5wLpD+F1pmWwf0jNc_baRBGbr70RAtVXT@mail.gmail.com>
Message-ID: <201103180953.21819.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri March 18 2011, bruce bushby wrote:
> Hi
> 
> I was wondering if any other people have noticed ntpdate takes a long time?
> 
> My embedded board connects to the internet via ethernet through my home adsl
> and can ping the internet at the same speed my linux desktop can.
> 
> Linux desktop pc running 2.6.32.26-175 (Fedora 12) :
> [root at core ~]# time ntpdate ntp2c.mcc.ac.uk
> 18 Mar 13:56:01 ntpdate[1792]: adjust time server 130.88.200.6 offset
> -0.000064 sec
> 
> real    0m0.213s
> user    0m0.001s
> sys     0m0.001s
> 
> 
> 
> Embedded OS running 2.6.38-rc5 kernel:
> [root at vx-200 ~]# time ntpdate ntp.exnet.com
> 18 Mar 14:01:40 ntpdate[983]: adjust time server 79.135.97.79 offset
> -0.001003 sec
>

Different servers?
That 79.135.97.79 appears to be your dsl gateway address, not ntp.exnet.com

Mike 
> real    0m8.227s
> user    0m0.020s
> sys     0m0.030s
> 
> 
> As you can see, there is a massive difference. I used strace to try and see
> what "ntpdate" is doing....this is the part that concerns me. When it starts
> looping through a series of:
> "ERESTART_RESTARTBLOCK (To be restarted)"
> .... basically it does this for 8 seconds and then finally updates the time.
> Also, my desktop pc does not go into the same loop, nor does it deal with
> "ERESTART_RESTARTBLOCK "
> 
> 
> setpriority(PRIO_PROCESS, 0, -12)       = 0
> poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> restarted)
> --- SIGALRM (Alarm clock) @ 0 (0) ---
> sigreturn()                             = ? (mask now [])
> clock_gettime(CLOCK_REALTIME, {1300457105, 692751159}) = 0
> sendto(3,
> "\343\0\3\372\0\1\0\0\0\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
> 48, 0, {sa_family=AF_INET, sin_port=htons(123),
> sin_addr=inet_addr("130.88.200.6")}, 16) = 48
> poll([{fd=3, events=POLLIN}], 1, 60000) = 1 ([{fd=3, revents=POLLIN}])
> poll([{fd=3, events=POLLIN}], 1, 0)     = 1 ([{fd=3, revents=POLLIN}])
> clock_gettime(CLOCK_REALTIME, {1300457105, 721746679}) = 0
> recvfrom(3,
> "$\2\3\354\0\0\0\260\0\0\2\346\301>\26b\321-\343\340z\221\304\377\321-\345\21\261X#\324"...,
> 76, 0, {sa_family=AF_INET, sin_port=htons(123),
> sin_addr=inet_addr("130.88.200.6")}, [16]) = 48
> poll([{fd=3, events=POLLIN}], 1, 0)     = 0 (Timeout)
> poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> restarted)
> --- SIGALRM (Alarm clock) @ 0 (0) ---
> sigreturn()                             = ? (mask now [])
> poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> restarted)
> --- SIGALRM (Alarm clock) @ 0 (0) ---
> sigreturn()                             = ? (mask now [])
> poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> restarted)
> --- SIGALRM (Alarm clock) @ 0 (0) ---
> sigreturn()                             = ? (mask now [])
> poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> restarted)
> --- SIGALRM (Alarm clock) @ 0 (0) ---
> sigreturn()                             = ? (mask now [])
> poll([{fd=3, events=POLLIN}], 1, 60000) = ? ERESTART_RESTARTBLOCK (To be
> restarted
> 
> 
> 
> The embedded board is connecting via 100Mbit ethernet and can ping the ntp
> server with a reponse time of 22ms and zero packet loss.
> 
> I'm guessing this has nothing to do with "buildroot" and is a kernel/ntpdate
> issue but I wanted to add these findings to the list history.
> 
> 
> Bruce
> 
> 
> 
> 
> 
> 
> 
> I
> 
