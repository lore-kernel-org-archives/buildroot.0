From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 15 Dec 2020 16:55:06 -0000 (UTC)
Subject: [Buildroot] Slow SNMP daemon startup
References: <rram42$17q6$1@ciao.gmane.io> <rramin$k2f$1@ciao.gmane.io>
Message-ID: <rrappa$9o9$1@ciao.gmane.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-12-15, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> On 2020-12-15, Grant Edwards <grant.b.edwards@gmail.com> wrote:

>> After upgrading from an older version of net-snmp (5.7.3 -> 5.8) it
>> now takes the snmp daemon anywhere from 5s to a minute to start up.

If there's no network traffic, it can take _several_minutes_ for snmpd
to start. This makes one suspect a lack of entropy, and strace
confirms that:

 00:00:09 gettimeofday({9, 266859}, NULL) = 0
 00:00:09 futex(0x4044bc3c, FUTEX_WAKE_PRIVATE, 2147483647) = 0
 00:00:09 getrandom(0x3f830, 32, 0)      = -1 ENOSYS (Function not implemented)
 00:00:09 shmget(0x72, 1, 000)           = -1 ENOENT (No such file or directory)
 00:00:09 uname({sysname="Linux", nodename="grant-eip-4", ...}) = 0
 00:00:09 open("/dev/random", O_RDONLY|O_LARGEFILE) = 9
 00:00:09 _newselect(10, [9], NULL, NULL, NULL) = 1 (in [9])
 00:01:23 close(9)                       = 0
 00:01:23 shmget(0x72, 1, IPC_CREAT|0444) = 0
 00:01:23 shmat(0, NULL, SHM_RDONLY)     = 0x4000a000
 00:01:23 open("/dev/urandom", O_RDONLY|O_LARGEFILE) = 9
 00:01:23 fstat64(9, {st_mode=S_IFCHR|0660, st_rdev=makedev(1, 9), ...}) = 0
 00:01:23 read(9, "\330\3311\376\346\213\362\5Ib\365\347*BS\354\351\375\t<\346\310\24C\254\365h\330-.\372\230", 32) = 32
 00:01:23 gettimeofday({83, 792926}, NULL) = 0

Why do application developers consider this acceptable behavior?

--
Grant
