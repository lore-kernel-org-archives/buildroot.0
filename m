From: saurav barik <saurav.barik@gmail.com>
Date: Tue, 12 Feb 2008 12:34:56 +0530
Subject: [Buildroot] segmentation fault running kismet
In-Reply-To: <26b26d180802080051y6deac767vcd184096bc294c5e@mail.gmail.com>
References: <26b26d180802072251w7c06a39es337ee76936182b96@mail.gmail.com>
	<47AC0E09.7030800@gmail.com>
	<26b26d180802080051y6deac767vcd184096bc294c5e@mail.gmail.com>
Message-ID: <26b26d180802112304o15305320ycd4c24ab53c83406@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The strange thing I noticed is that if I run the help menu then also I
get segmentation fault. I am not sure where things are going wrong.
Anybody using Kismet-2007-10-R1 with buildroot?
Please let me know.

Thanks & Regards,
Saurav

********************************************************************
[root at saurav mnt]# ./kismet_server --help
Usage: ./kismet_server [OPTION]
Most (or all) of these options can (and should) be configured via the
kismet.conf global config file, but can be overridden here.
  -I, --initial-channel <n:c>  Initial channel to monitor on (default: 6)
                                Format capname:channel
  -x, --force-channel-hop      Forcibly enable the channel hopper
  -X, --force-no-channel-hop   Forcibly disable the channel hopper
  -t, --log-title <title>      Custom log file title
  -n, --no-logging             No logging (only process packets)
  -f, --config-file <file>     Use alternate config file
  -c, --capture-source <src>   Packet capture source line (type,interface,name)
  -C, --enable-capture-sources Comma separated list of named packet
sources to use.
  -l, --log-types <types>      Comma separated list of types to log,
                                (ie, dump,cisco,weak,network,gps)
  -d, --dump-type <type>       Dumpfile type (wiretap)
  -m, --max-packets <num>      Maximum number of packets before
starting new dump
  -q, --quiet                  Don't play sounds
  -g, --gps <host:port>        GPS server (host:port or off)
  -p, --port <port>            TCPIP server port for GUI connections
  -a, --allowed-hosts <hosts>  Comma separated list of hosts allowed to connect
  -b, --bind-address <address>    Bind to this address. Default INADDR_ANY
  -r, --retain-monitor         Leave card in monitor mode on exit
  -s, --silent                 Don't send any output to console.
  -N, --server-name            Server name
      --daemonize              Background server in daemon mode
  -v, --version                Kismet version
  -h, --help                   What do you think you're reading?
Segmentation fault
[root at saurav mnt]#
**************************************************************************


On 2/8/08, saurav barik <saurav.barik@gmail.com> wrote:
> On 2/8/08, Joe <zentrale.at.work@gmail.com> wrote:
> > GMail is fine, i see :-)
> >
> > saurav barik schrieb:
> > > My setup is .
> > > Gateworks BSP 0.7
> > > Buildroot
> > > Linux-2.6.21.4
> > > kismet-2007-10-R1
> >
> > You might also want to name your architecture, for it is also relevant
> > for memory issues.
> > I'm not a kismet user myself, but i've had a lot of segfault trouble
> > when experimenting with EABI an my ARM platform.
> >
> > Greetz Joe
>
> I am using Gateworks  GW2348 on my IXP board. My architecture is
> armv5teb. The target ABI is set to OABI.
> I ran gdb on the kimset_server and have copied some of the relevant
> info below. It seems it crashes in the C++ STL libraries.
>
> Thanks & Regards,
> Saurav
>
> *******************************************************************
> GNU gdb 6.7.1
> Copyright (C) 2007 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
> and "show warranty" for details.
> This GDB was configured as "armeb-linux-uclibc"...
> (gdb)
> (gdb) r
> Starting program: /mnt/kismet_2007/kismet_server
> Will drop privs to saurav (1001) gid 1001
> No specific sources given to be enabled, all will be enabled.
> Enabling channel hopping.
> Enabling channel splitting.
> Dropped privs to saurav (1001) gid 1001
> WARNING:  Disabling GPS logging.
> Logging networks to Kismet.network
> Logging networks in CSV format to Kismet.csv
> Logging networks in XML format to Kismet.xml
> Logging cryptographically weak packets to Kismet.weak
> Logging cisco product information to Kismet.cisco
> Tracking probe responses and associating probe networks.
> Reading AP manufacturer data and defaults from /home/saurav/ap_manuf
> Reading client manufacturer data and defaults from /home/saurav/client_manuf
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x00035be8 in Packetsourcetracker::SetTypeParms (this=0xeb07c,
>     in_types=@0xbef08dac, in_parm=<value optimized out>)
>     at packetsourcetracker.cc:759
> 759	packetsourcetracker.cc: No such file or directory.
> 	in packetsourcetracker.cc
>
>
> (gdb) bt
> #0  0x00035be8 in Packetsourcetracker::SetTypeParms (this=0xeb07c,
>     in_types=@0xbef08dac, in_parm=<value optimized out>)
>     at packetsourcetracker.cc:759
> #1  0x0008b428 in ProcessBulkConf (conf=Cannot access memory at
> address 0xffffff38
> ) at kismet_server.cc:2098
> #2  0x000a76ac in main (argc=-335704437, argv=0xcc814) at
> kismet_server.cc:2650
>
>
> (gdb) info frame 0
> Stack frame at 0xbef06f54:
>  pc = 0x35be8 in Packetsourcetracker::SetTypeParms(std::string, packet_parm)
>     (packetsourcetracker.cc:759); saved pc 0x8b428
>  called by frame at 0xbef09458
>  source language c++.
>  Arglist at 0xbef06f50, args: this=0xeb07c, in_types=@0xbef08dac,
>     in_parm=<value optimized out>
>  Locals at 0xbef06f50, Previous frame's sp at 0xbef06f48
>  Saved registers:
>   r4 at 0xbef06f28, r5 at 0xbef06f2c, r6 at 0xbef06f30, r7 at 0xbef06f34,
>   r8 at 0xbef06f38, r9 at 0xbef06f3c, r10 at 0xbef06f40, r11 at 0xbef06f44,
>   lr at 0xbef06f4c, pc at 0xbef06f4c, f4 at 0xbef06ef8, f5 at 0xbef06f04,
>   f6 at 0xbef06f10, f7 at 0xbef06f1c
>
> (gdb) info frame 1
> Stack frame at 0xbef09458:
>  pc = 0x8b428 in ProcessBulkConf(ConfigFile*) (kismet_server.cc:2098);
>     saved pc 0xa76ac
>  called by frame at 0xbef0faf0, caller of frame at 0xbef06f54
>  source language c++.
>  Arglist at 0xbef09454, args: conf=Cannot access memory at address
> 0xffffff38
>
>
> (gdb) info frame 2
> Stack frame at 0xbef0faf0:
>  pc = 0xa76ac in main (kismet_server.cc:2650); saved pc 0x4014b380
>  caller of frame at 0xbef09458
>  source language c++.
>  Arglist at 0xbef0faec, args: argc=-335704437, argv=0xcc814
>  Locals at 0xbef0faec, Previous frame's sp at 0xbef0fae4
>  Saved registers:
>   r4 at 0xbef0fac4, r5 at 0xbef0fac8, r6 at 0xbef0facc, r7 at 0xbef0fad0,
>   r8 at 0xbef0fad4, r9 at 0xbef0fad8, r10 at 0xbef0fadc, r11 at 0xbef0fae0,
>   lr at 0xbef0fae8, pc at 0xbef0fae8, f4 at 0xbef0fa94, f5 at 0xbef0faa0,
>   f6 at 0xbef0faac, f7 at 0xbef0fab8
>
>
> (gdb)
> (gdb) bt
> #0  0x00035be8 in Packetsourcetracker::SetTypeParms (this=0xeb07c,
>     in_types=@0xbef08dac, in_parm=<value optimized out>)
>     at packetsourcetracker.cc:759
> #1  0x0008b428 in ProcessBulkConf (conf=Cannot access memory at
> address 0xffffff38
> ) at kismet_server.cc:2098
> #2  0x000a76ac in main (argc=-335704437, argv=0xcc814) at
> kismet_server.cc:2650
> **************************************************************************
>
