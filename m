From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 09:27:54 +0100
Subject: [Buildroot] [PATCH] package/systemd: needs glibc
In-Reply-To: <20181122174417.7e101a15@windsurf>
References: <20181121210556.18619-1-yann.morin.1998@free.fr>
 <87y39lm6e8.fsf@dell.be.48ers.dk>
 <20181122174417.7e101a15@windsurf>
Message-ID: <20181123092754.4dd189cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 17:44:17 +0100, Thomas Petazzoni wrote:

> Yes, this is really weird. Even with the issue fixed
> https://git.buildroot.org/buildroot/commit/utils/genrandconfig?id=3eb49f59d6804c452e784759d9b3869215a8098f,
> we should have had some systemd/uclibc configurations. I'll try to do
> some research in the DB, but my SQL is rusty and gives requests that
> are very slow to execute :/

No uclibc/systemd configuration tested apparently, at least since
September 1st:

mysql> select * from (select * from results where builddate > '2018-09-01') as foo inner join symbol_per_result on symbol_per_result.result_id=foo.id where symbol_per_result.symbol_id=(select id from config_symbol where name="BR2_INIT_SYSTEMD" and value="y");
+--------+--------+---------------------+---------------------------------------------+------------------------------------------+------------------------------------------+-------------+-------------------------------+-------+--------+------------+----------+-----------+----------+-----------+-----------+
| id     | status | builddate           | submitter                                   | commitid                                 | identifier                               | arch        | reason                        | libc  | static | subarch    | duration | branch    | id       | result_id | symbol_id |
+--------+--------+---------------------+---------------------------------------------+------------------------------------------+------------------------------------------+-------------+-------------------------------+-------+--------+------------+----------+-----------+----------+-----------+-----------+
|  87855 |      1 | 2018-09-19 01:03:03 | Romain Naour (Smile)                        | 0760e6ba8cae4fb9c646bd1be54857f48319df76 | 5b4a7a9ae7d4918ba7caab42ae9a3699e2509246 | mipsel      | Makefile:708: target-finalize | glibc |      0 | mips32r6   |    13255 | master    | 45730830 |     87855 |     26766 |
|  89347 |      0 | 2018-09-23 08:05:20 | Giulio Benetti (Micronova srl Server)       | f8f8ff33472641f9192a5e1ca65ebc614821665a | 1222d15f3fd623948cb464a50b38b4eee253f8bd | arm         | none                          | glibc |      0 | cortex-a8  |     2230 | master    | 46553162 |     89347 |     26766 |
|  92804 |      0 | 2018-10-03 22:57:02 | Romain Naour (Smile)                        | 5daeca2d5379a1c4a3d87d7f20bea743ad8388f9 | eb0928e364d426f84db10fa3d1672e8165ae7813 | arm         | none                          | glibc |      0 | cortex-a8  |     7766 | 2018.05.x | 48442941 |     92804 |     26766 |
|  93003 |      1 | 2018-10-04 18:33:10 | Romain Naour (Smile)                        | 51e17496cc403c49bc20d3a81f9c71a8a20edd0f | 93b28a2397e30ea4c2f7b4b29419f9e71eaa25a3 | arm         | dt-utils-v2018.05.0           | glibc |      0 | arm926ej-s |     2630 | master    | 48557905 |     93003 |     26766 |
|  94915 |      1 | 2018-10-11 10:38:44 | Peter Korsgaard (gcc20)                     | 45e5d2ce68650b075468c02f5c9c43b40c1ab81d | c71a16b33e42fef2995c3b6fab69497b9d8fa953 | x86_64      | samba4-4.8.4                  | glibc |      0 | bdver3     |     8714 | 2018.02.x | 49609560 |     94915 |     26766 |
|  95539 |      0 | 2018-10-13 17:33:49 | Peter Korsgaard (gcc112/ppc64le)            | 0d1a6f152f3185e128fd122f05b81f8d0fb9e6fe | c2b820940f2cdbf6572c638834e9c4d7bc7b07ef | arm         | none                          | glibc |      0 | cortex-a8  |     6439 | master    | 49951359 |     95539 |     26766 |
|  97631 |      0 | 2018-10-21 23:37:27 | Giulio Benetti (Micronova srl House Server) | bef30a9f4b58194e02ff5b2b6b78a3095c72c72c | 593899dc629e1e4b23fbc07ff2c6f1a36959698d | powerpc64   | none                          | glibc |      0 | power7     |    25716 | master    | 51128306 |     97631 |     26766 |
| 103550 |      0 | 2018-11-14 13:25:34 | Giulio Benetti (Micronova srl Server)       | ebffca8ba483610478f33cdc52a24a165e4da87e | d1901f74833c9dfa025e9f85043002cafc1e8341 | powerpc64   | none                          | glibc |      0 | power7     |     6060 | master    | 54498910 |    103550 |     26766 |
| 105139 |      0 | 2018-11-20 06:09:07 | Julien Boibessot (Armadeus systems server)  | 00d63a153decb668d67547600ca9032de7205c8b | ae5284383ded4e264991f5c3d6f724c0ca4688c0 | powerpc64   | none                          | glibc |      0 | power7     |    21588 | master    | 55402960 |    105139 |     26766 |
| 105151 |      0 | 2018-11-20 06:48:21 | Matt Weber (U14.04 Sandboxed)               | 00d63a153decb668d67547600ca9032de7205c8b | 1cf7e10ced759d02f052cc697e1b8773e3f10630 | arm         | none                          | glibc |      0 | arm926ej-s |     4507 | master    | 55409615 |    105151 |     26766 |
| 105239 |      1 | 2018-11-20 09:34:25 | Matt Weber (U16.04 THOR)                    | 5682ba9363d262a67567ed9b0531a414e6aae1bb | fc6435282630e60927f88bf5954805ebbaa60cb3 | aarch64     | libostree-2018.9              | glibc |      0 | cortex-a53 |     3040 | master    | 55464556 |    105239 |     26766 |
| 105268 |      0 | 2018-11-20 16:52:42 | Giulio Benetti (Micronova srl Server)       | 5682ba9363d262a67567ed9b0531a414e6aae1bb | 85b585eb9c8b9c4aeb9fe0346ce2d7aed6abfb6b | powerpc64le | none                          | glibc |      0 | power8     |     5651 | master    | 55480443 |    105268 |     26766 |
| 105325 |      0 | 2018-11-20 22:41:52 | Peter Korsgaard (gcc68/Debian 9/gcc 6.3.0)  | 5682ba9363d262a67567ed9b0531a414e6aae1bb | 278fc24b91305cbc7d219c027f625087a67b7e63 | powerpc64   | none                          | glibc |      0 | power7     |     4463 | master    | 55511692 |    105325 |     26766 |
| 105593 |      0 | 2018-11-21 20:38:34 | Julien Boibessot (Armadeus systems server)  | bc89c1a834cd8a1a74e71522029ec827bf0aec92 | 2d0cfff8a3632bca096f933552d126b923d2a3a1 | aarch64     | none                          | glibc |      0 | cortex-a53 |     3665 | master    | 55663453 |    105593 |     26766 |
| 105696 |      0 | 2018-11-22 05:50:26 | Julien Boibessot (Armadeus systems server)  | bc89c1a834cd8a1a74e71522029ec827bf0aec92 | 22afb0278b8443cfbce3425e93d0fa0bfc55dfc3 | arm         | none                          | glibc |      0 | arm926ej-s |    35777 | master    | 55722233 |    105696 |     26766 |
| 106023 |      0 | 2018-11-23 07:52:17 | Julien Boibessot (Armadeus systems server)  | 2ffdcbe0a5304a865e4486e7de0a7e6d983e2ce2 | ef4bf75f1429790f49a1b632faa8b00ffafcd459 | aarch64     | none                          | glibc |      0 | cortex-a53 |    31948 | next      | 55909269 |    106023 |     26766 |
+--------+--------+---------------------+---------------------------------------------+------------------------------------------+------------------------------------------+-------------+-------------------------------+-------+--------+------------+----------+-----------+----------+-----------+-----------+
16 rows in set (1 min 51.23 sec)

If anybody knows how to speed up this SQL query and/or adjust the SQL
database schema to make it faster, it would be nice. I can provide a
dump of the SQL database.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
