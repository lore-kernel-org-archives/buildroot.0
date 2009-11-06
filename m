From: Joachim Pihl <jpihl@nevion.com>
Date: Fri, 6 Nov 2009 13:16:10 +0100
Subject: [Buildroot] Upgrading from Buildroot 0.10 to 2009.08 (ARM)
In-Reply-To: <20091106105325.440f0373@surf>
References: <op.u2yqk2doyqa4qb@jap-lappis.nevion.com>
	<20091106100459.2624b645@surf>
	<op.u2yu62ifyqa4qb@jap-lappis.nevion.com>
	<20091106105325.440f0373@surf>
Message-ID: <op.u2y208p6yqa4qb@jap-lappis.nevion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 06 Nov 2009 10:53:25 +0100, Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com> wrote:

> Le Fri, 6 Nov 2009 10:26:52 +0100,
> Joachim Pihl <jpihl@nevion.com> a ?crit :
>
>> All the crashing applications are built _outside_ the buildroot
>> environment, using the toolchain created by buildroot. This worked
>> perfectly before I started messing with it.
>
> You cannot expect the system to work after more or less randomly
> removing libraries, even if they at first sight look useless.


Got the rootfs down to a manageable size now, but the crashing persists.


> How do you compile your applications exactly ? (Compiler flags, etc.).

Application makefiles are unchanged after buildroot 0.10.

typical C++ compile:
arm-linux-g++ -c -O3 -g3 -DVERSION="\"3.2.0-RC3-svn18398-jpihl\""  
-DBUILD="\"18398\"" -Wall -DBOOST_SP_USE_PTHREADS -DBOOST_AC_USE_PTHREADS  
-DBOOST_HAS_THREADS -o arm-linux/UserFactory.o UserFactory.cpp

typical C compile:
arm-linux-gcc -O3 -Wall -DVERSION=\"3.2.0-RC3-svn18398-jpihl\"  
-DBUILD=\"18398\" -DSERVER_HOST=\"127.0.0.1\" -DSERVER_PORT=5000  
-D__XSCALE__=1 -MMD -MF arm-linux/.deps/alarms_changed.d -c  
alarms_changed.c -o arm-linux/alarms_changed.o


create static library:
arm-linux-ar -r arm-linux/libutil.a arm-linux/Alarm.o  
arm-linux/ClientSocket.o arm-linux/CommandSingleton.o arm-linux/ConfData.o  
arm-linux/CrcSingleton.o arm-linux/Debug.o arm-linux/Features.o  
arm-linux/gpio.o arm-linux/gpio_xscale.o arm-linux/Interface.o  
arm-linux/IPAddr.o arm-linux/KeyManager.o arm-linux/module.o  
arm-linux/Multicast.o arm-linux/SerialInterface.o arm-linux/SerialPort.o  
arm-linux/ServerSocket.o arm-linux/snmp.o arm-linux/SnmpLevel.o  
arm-linux/Socket.o arm-linux/SyncFpga.o arm-linux/TcpClientInterface.o  
arm-linux/TcpServerInterface.o arm-linux/TcpServerListener.o  
arm-linux/tinystr.o arm-linux/tinyxml.o arm-linux/tinyxmlerror.o  
arm-linux/tinyxmlparser.o arm-linux/User.o arm-linux/UserFactory.o  
arm-linux/UserGroup.o arm-linux/get_random.o arm-linux/keys.o  
arm-linux/license.o arm-linux/md5.o

link C++:
arm-linux-g++ -o arm-linux/ClientConverter arm-linux/ClientConverter.o  
arm-linux/MrpClientParser.o  -L ../util/arm-linux -lutil -lboost_thread-mt  
-lboost_date_time-mt -lspread -lcrypt -lsqlite3 -ldl


checking for .so dependencies on host for one of the crashing binaries:

jpihl at x:~/mac_tool/arm-linux$arm-linux-ldd mac_tool
checking sub-depends for '/usr/lib/libboost_thread-mt.so'
checking sub-depends for '/usr/lib/libboost_date_time-mt.so'
checking sub-depends for 'not found'
checking sub-depends for 'not found'
checking sub-depends for '/usr/lib/libsqlite3.so.0'
checking sub-depends for '/usr/lib/libstdc++.so.6'
checking sub-depends for 'not found'
checking sub-depends for '/lib/libgcc_s.so.1'
checking sub-depends for '/lib/libc.so.0'
checking sub-depends for '/lib/librt.so.1'
Segmentation fault


Doesn't look good to me, will revert to previous tool chain to have a look  
at what it says then. In the old buildroot, we had the threads library set  
to linuxthreads, but I have changed that to NPTL. Could that be the  
culprit?


-- 
Joachim Pihl
Senior R&D Engineer
Nevion

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

-----------------------------------
The Global Video Transport Leader
-----------------------------------
