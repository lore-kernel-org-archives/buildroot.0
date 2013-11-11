From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 11:39:41 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131111102050.GP4581@tarshish>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate> <52806C1C.7010206@zankel.net>
 <20131111105830.67b0a602@skate> <20131111101053.GO4581@tarshish>
 <20131111111546.2d9d7544@skate> <20131111102050.GP4581@tarshish>
Message-ID: <20131111113941.4247120a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 11 Nov 2013 12:20:50 +0200, Baruch Siach wrote:

> > > Why do we need binutils on target?
> > 
> > $ git grep "select BR2_PACKAGE_BINUTILS"
> > package/dropwatch/Config.in:	select BR2_PACKAGE_BINUTILS
> > package/oprofile/Config.in:	select BR2_PACKAGE_BINUTILS
> > 
> > So we need it for dropwatch and oprofile. In fact, what is needed is
> > not the full binutils (i.e the binutils programs), but the libbfd
> > library which is part of the binutils tarball.
> 
> This is strange. More than half of xtensa autobuilds used to fail on target 
> binutils before Chris' obstack fix. Does this mean that all failing configs 
> had dropwatch or oprofile enabled?

Or that they had BR2_PACKAGE_BINUTILS enabled itself. So I took my poor
SQL knowledge and came up with the following query to answer your
question:

select results.id,status,builddate,identifier,arch,reason,results_config.name,results_config.value
	from results
	inner join results_config on results.id=results_config.resultid
	where
		results.arch='xtensa' and
		results.reason like 'binutils%' and
		results.builddate >= '2013-10-01' and
		(results_config.name='BR2_PACKAGE_BINUTILS' or results_config.name='BR2_PACKAGE_DROPWATCH' or results_config.name='BR2_PACKAGE_OPROFILE');

which gives the list of xtensa build results that failed on binutils,
since October 1st, and for each of those builds, give the value of the
binutils, dropwatch and oprofile options. So in the below table, you
have 3 consecutive lines for a given build, each of those 3 lines
corresponding to dropwatch,oprofile and binutils. As you can see, for
each of those builds, BR2_PACKAGE_BINUTILS was always set to 'y', and
sometimes either or both of oprofile and dropwatch were also enabled.

I kind of like the type of questions I can now answer by having the
full set of config options for each build part of the SQL database :-)

+-------+--------+---------------------+------------------------------------------+--------+-----------------+-----------------------+-------+
| id    | status | builddate           | identifier                               | arch   | reason          | name                  | value |
+-------+--------+---------------------+------------------------------------------+--------+-----------------+-----------------------+-------+
| 71059 |      1 | 2013-10-01 20:48:10 | 0cd166469449b2fa224277a1be6997af8ff2488d | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH |       |
| 71059 |      1 | 2013-10-01 20:48:10 | 0cd166469449b2fa224277a1be6997af8ff2488d | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  | y     |
| 71059 |      1 | 2013-10-01 20:48:10 | 0cd166469449b2fa224277a1be6997af8ff2488d | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71076 |      1 | 2013-10-01 23:09:35 | 2cfd80795aa9c7556e572f8d344c4f512c80f232 | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH |       |
| 71076 |      1 | 2013-10-01 23:09:35 | 2cfd80795aa9c7556e572f8d344c4f512c80f232 | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  | y     |
| 71076 |      1 | 2013-10-01 23:09:35 | 2cfd80795aa9c7556e572f8d344c4f512c80f232 | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71161 |      1 | 2013-10-02 19:13:40 | 8244788b518211947cd850e97ab80c43426a07a3 | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH |       |
| 71161 |      1 | 2013-10-02 19:13:40 | 8244788b518211947cd850e97ab80c43426a07a3 | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  | y     |
| 71161 |      1 | 2013-10-02 19:13:40 | 8244788b518211947cd850e97ab80c43426a07a3 | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71218 |      1 | 2013-10-03 03:40:15 | 6c0cb311739fb0ea3b835c946090296bf3c8eb5f | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH |       |
| 71218 |      1 | 2013-10-03 03:40:15 | 6c0cb311739fb0ea3b835c946090296bf3c8eb5f | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  | y     |
| 71218 |      1 | 2013-10-03 03:40:15 | 6c0cb311739fb0ea3b835c946090296bf3c8eb5f | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71494 |      1 | 2013-10-05 02:37:45 | cdd334ae490646c6367315668fff68feee03a4a2 | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH | y     |
| 71494 |      1 | 2013-10-05 02:37:45 | cdd334ae490646c6367315668fff68feee03a4a2 | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  |       |
| 71494 |      1 | 2013-10-05 02:37:45 | cdd334ae490646c6367315668fff68feee03a4a2 | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71534 |      1 | 2013-10-05 10:12:54 | 9d6f624cd22fcf2cf113dfd3a3097c88f5e77612 | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH |       |
| 71534 |      1 | 2013-10-05 10:12:54 | 9d6f624cd22fcf2cf113dfd3a3097c88f5e77612 | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  | y     |
| 71534 |      1 | 2013-10-05 10:12:54 | 9d6f624cd22fcf2cf113dfd3a3097c88f5e77612 | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71606 |      1 | 2013-10-05 20:32:09 | 436f1f897efb09bfc910b88b7396deaa9c67e158 | xtensa | binutils-2.21.1 | BR2_PACKAGE_DROPWATCH | y     |
| 71606 |      1 | 2013-10-05 20:32:09 | 436f1f897efb09bfc910b88b7396deaa9c67e158 | xtensa | binutils-2.21.1 | BR2_PACKAGE_OPROFILE  |       |
| 71606 |      1 | 2013-10-05 20:32:09 | 436f1f897efb09bfc910b88b7396deaa9c67e158 | xtensa | binutils-2.21.1 | BR2_PACKAGE_BINUTILS  | y     |
| 71831 |      1 | 2013-10-07 16:06:10 | a6f8c67f60b13bab89c8bd2ca88d3407eead2b61 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 71831 |      1 | 2013-10-07 16:06:10 | a6f8c67f60b13bab89c8bd2ca88d3407eead2b61 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 71831 |      1 | 2013-10-07 16:06:10 | a6f8c67f60b13bab89c8bd2ca88d3407eead2b61 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 71926 |      1 | 2013-10-08 09:12:43 | b46524626cab681167253d68c45f0eed091a347c | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 71926 |      1 | 2013-10-08 09:12:43 | b46524626cab681167253d68c45f0eed091a347c | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 71926 |      1 | 2013-10-08 09:12:43 | b46524626cab681167253d68c45f0eed091a347c | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72116 |      1 | 2013-10-09 14:52:26 | 98f65001a4a1dc1382630c232ffb43514f7482c5 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72116 |      1 | 2013-10-09 14:52:26 | 98f65001a4a1dc1382630c232ffb43514f7482c5 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 72116 |      1 | 2013-10-09 14:52:26 | 98f65001a4a1dc1382630c232ffb43514f7482c5 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72123 |      1 | 2013-10-09 15:40:15 | 45d1546b5dab74dc9e9a52d6c9ad1f3f2957eae4 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72123 |      1 | 2013-10-09 15:40:15 | 45d1546b5dab74dc9e9a52d6c9ad1f3f2957eae4 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 72123 |      1 | 2013-10-09 15:40:15 | 45d1546b5dab74dc9e9a52d6c9ad1f3f2957eae4 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72140 |      1 | 2013-10-09 18:32:06 | d90aa26a8ac309694f5dbf3fc546f6d6c9af434c | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72140 |      1 | 2013-10-09 18:32:06 | d90aa26a8ac309694f5dbf3fc546f6d6c9af434c | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 72140 |      1 | 2013-10-09 18:32:06 | d90aa26a8ac309694f5dbf3fc546f6d6c9af434c | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72148 |      1 | 2013-10-09 19:15:32 | f31b2093399685498ee92873517bfa65ea366860 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 72148 |      1 | 2013-10-09 19:15:32 | f31b2093399685498ee92873517bfa65ea366860 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 72148 |      1 | 2013-10-09 19:15:32 | f31b2093399685498ee92873517bfa65ea366860 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72295 |      1 | 2013-10-10 21:50:50 | 38a1dea49373fd4f4da95621f716f8c9324e0d0c | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72295 |      1 | 2013-10-10 21:50:50 | 38a1dea49373fd4f4da95621f716f8c9324e0d0c | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 72295 |      1 | 2013-10-10 21:50:50 | 38a1dea49373fd4f4da95621f716f8c9324e0d0c | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72404 |      1 | 2013-10-11 18:52:26 | 6d5754d10af24d8e9528878548be1d4f25a1f730 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72404 |      1 | 2013-10-11 18:52:26 | 6d5754d10af24d8e9528878548be1d4f25a1f730 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 72404 |      1 | 2013-10-11 18:52:26 | 6d5754d10af24d8e9528878548be1d4f25a1f730 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72540 |      1 | 2013-10-12 18:07:08 | bf8614dbfd930f0fd1678cf97da8cd125b0502c6 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72540 |      1 | 2013-10-12 18:07:08 | bf8614dbfd930f0fd1678cf97da8cd125b0502c6 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 72540 |      1 | 2013-10-12 18:07:08 | bf8614dbfd930f0fd1678cf97da8cd125b0502c6 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72691 |      1 | 2013-10-13 19:50:44 | d3ce520b2ee273c7dde62ec8527ba9ac9ed11a9e | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 72691 |      1 | 2013-10-13 19:50:44 | d3ce520b2ee273c7dde62ec8527ba9ac9ed11a9e | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 72691 |      1 | 2013-10-13 19:50:44 | d3ce520b2ee273c7dde62ec8527ba9ac9ed11a9e | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72889 |      1 | 2013-10-15 00:03:02 | 02c9b14ab7cd784fb09b9bc02ade6238b3761588 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 72889 |      1 | 2013-10-15 00:03:02 | 02c9b14ab7cd784fb09b9bc02ade6238b3761588 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 72889 |      1 | 2013-10-15 00:03:02 | 02c9b14ab7cd784fb09b9bc02ade6238b3761588 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72944 |      1 | 2013-10-15 12:30:11 | 8c20156bb4d8be909ae1367e1e8e043867d477ae | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 72944 |      1 | 2013-10-15 12:30:11 | 8c20156bb4d8be909ae1367e1e8e043867d477ae | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 72944 |      1 | 2013-10-15 12:30:11 | 8c20156bb4d8be909ae1367e1e8e043867d477ae | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 72990 |      1 | 2013-10-15 18:36:49 | 1fa265c9cdda8c79cf3ccf9fa9ca6cfaff160bd8 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 72990 |      1 | 2013-10-15 18:36:49 | 1fa265c9cdda8c79cf3ccf9fa9ca6cfaff160bd8 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 72990 |      1 | 2013-10-15 18:36:49 | 1fa265c9cdda8c79cf3ccf9fa9ca6cfaff160bd8 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73068 |      1 | 2013-10-16 11:21:00 | 52b30beeec9af53dcaee98c1e6ab430b8328f7a3 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 73068 |      1 | 2013-10-16 11:21:00 | 52b30beeec9af53dcaee98c1e6ab430b8328f7a3 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 73068 |      1 | 2013-10-16 11:21:00 | 52b30beeec9af53dcaee98c1e6ab430b8328f7a3 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73157 |      1 | 2013-10-16 21:39:23 | 3af486e2291d5f18ce6c22404a1f7e1e6d8546a1 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 73157 |      1 | 2013-10-16 21:39:23 | 3af486e2291d5f18ce6c22404a1f7e1e6d8546a1 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 73157 |      1 | 2013-10-16 21:39:23 | 3af486e2291d5f18ce6c22404a1f7e1e6d8546a1 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73248 |      1 | 2013-10-17 10:41:08 | cfbbae2f39385582fcd4dcf3d7a6f8d065208ff3 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 73248 |      1 | 2013-10-17 10:41:08 | cfbbae2f39385582fcd4dcf3d7a6f8d065208ff3 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 73248 |      1 | 2013-10-17 10:41:08 | cfbbae2f39385582fcd4dcf3d7a6f8d065208ff3 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73490 |      1 | 2013-10-18 20:35:00 | 63a8f4d34ef97a7ac1ec0fce4d6425827f4de5fd | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 73490 |      1 | 2013-10-18 20:35:00 | 63a8f4d34ef97a7ac1ec0fce4d6425827f4de5fd | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 73490 |      1 | 2013-10-18 20:35:00 | 63a8f4d34ef97a7ac1ec0fce4d6425827f4de5fd | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73566 |      1 | 2013-10-19 06:34:07 | df47ef18beab5ea00d880ef25922e688fe93ca88 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 73566 |      1 | 2013-10-19 06:34:07 | df47ef18beab5ea00d880ef25922e688fe93ca88 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 73566 |      1 | 2013-10-19 06:34:07 | df47ef18beab5ea00d880ef25922e688fe93ca88 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73697 |      1 | 2013-10-20 03:52:11 | 615495c9a3d55e2c3f46d3cc86678453ecd95ec6 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 73697 |      1 | 2013-10-20 03:52:11 | 615495c9a3d55e2c3f46d3cc86678453ecd95ec6 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 73697 |      1 | 2013-10-20 03:52:11 | 615495c9a3d55e2c3f46d3cc86678453ecd95ec6 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73732 |      1 | 2013-10-20 09:11:20 | 4a73f7380d493359ca1593a5c6a5cc8d11fb7cf7 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 73732 |      1 | 2013-10-20 09:11:20 | 4a73f7380d493359ca1593a5c6a5cc8d11fb7cf7 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 73732 |      1 | 2013-10-20 09:11:20 | 4a73f7380d493359ca1593a5c6a5cc8d11fb7cf7 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73812 |      1 | 2013-10-20 21:59:28 | 1fefa8b4fc1dc22e3667b25b0d93d3f30424629f | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 73812 |      1 | 2013-10-20 21:59:28 | 1fefa8b4fc1dc22e3667b25b0d93d3f30424629f | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 73812 |      1 | 2013-10-20 21:59:28 | 1fefa8b4fc1dc22e3667b25b0d93d3f30424629f | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 73979 |      1 | 2013-10-22 01:58:24 | 3318ee1e074b9e9fca9e2815e220313cc9a00021 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 73979 |      1 | 2013-10-22 01:58:24 | 3318ee1e074b9e9fca9e2815e220313cc9a00021 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 73979 |      1 | 2013-10-22 01:58:24 | 3318ee1e074b9e9fca9e2815e220313cc9a00021 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74121 |      1 | 2013-10-22 23:34:05 | c9581efea42eb4a6d14952d616ae2cf049c3ed47 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 74121 |      1 | 2013-10-22 23:34:05 | c9581efea42eb4a6d14952d616ae2cf049c3ed47 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 74121 |      1 | 2013-10-22 23:34:05 | c9581efea42eb4a6d14952d616ae2cf049c3ed47 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74141 |      1 | 2013-10-23 04:03:55 | fdc5d439987d988cb14f58726443f2bb41d0b1cb | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 74141 |      1 | 2013-10-23 04:03:55 | fdc5d439987d988cb14f58726443f2bb41d0b1cb | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 74141 |      1 | 2013-10-23 04:03:55 | fdc5d439987d988cb14f58726443f2bb41d0b1cb | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74322 |      1 | 2013-10-24 13:02:54 | 7b0798f139e81b054e72c08cc16ff337bbe36a2b | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 74322 |      1 | 2013-10-24 13:02:54 | 7b0798f139e81b054e72c08cc16ff337bbe36a2b | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 74322 |      1 | 2013-10-24 13:02:54 | 7b0798f139e81b054e72c08cc16ff337bbe36a2b | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74386 |      1 | 2013-10-24 22:30:39 | 7806239e9e9161f03d3e658dcf18090b21eb8e65 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 74386 |      1 | 2013-10-24 22:30:39 | 7806239e9e9161f03d3e658dcf18090b21eb8e65 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 74386 |      1 | 2013-10-24 22:30:39 | 7806239e9e9161f03d3e658dcf18090b21eb8e65 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74420 |      1 | 2013-10-25 06:19:41 | f3f9fedfc92b125fa2dbe10c5e3f72db3fdfb7a9 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 74420 |      1 | 2013-10-25 06:19:41 | f3f9fedfc92b125fa2dbe10c5e3f72db3fdfb7a9 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 74420 |      1 | 2013-10-25 06:19:41 | f3f9fedfc92b125fa2dbe10c5e3f72db3fdfb7a9 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74424 |      1 | 2013-10-25 07:05:26 | 687a233c574de8c95ddb9187b8fdd72be0d07902 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 74424 |      1 | 2013-10-25 07:05:26 | 687a233c574de8c95ddb9187b8fdd72be0d07902 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 74424 |      1 | 2013-10-25 07:05:26 | 687a233c574de8c95ddb9187b8fdd72be0d07902 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74469 |      1 | 2013-10-25 15:38:14 | d232d06b5ab9a7b1c5a4d76a79b3794cde8e2274 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 74469 |      1 | 2013-10-25 15:38:14 | d232d06b5ab9a7b1c5a4d76a79b3794cde8e2274 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 74469 |      1 | 2013-10-25 15:38:14 | d232d06b5ab9a7b1c5a4d76a79b3794cde8e2274 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74625 |      1 | 2013-10-26 21:12:23 | 9782922ab3fbda9471043d08efb88da1fcb1024a | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 74625 |      1 | 2013-10-26 21:12:23 | 9782922ab3fbda9471043d08efb88da1fcb1024a | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 74625 |      1 | 2013-10-26 21:12:23 | 9782922ab3fbda9471043d08efb88da1fcb1024a | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 74984 |      1 | 2013-10-30 01:22:40 | 39ac33c0e325d5e8009337f0cfc83dc364e9c463 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 74984 |      1 | 2013-10-30 01:22:40 | 39ac33c0e325d5e8009337f0cfc83dc364e9c463 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 74984 |      1 | 2013-10-30 01:22:40 | 39ac33c0e325d5e8009337f0cfc83dc364e9c463 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75346 |      1 | 2013-11-01 19:16:34 | 6f209b4e3e6eade884eb37c5c761b42e83e3da74 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 75346 |      1 | 2013-11-01 19:16:34 | 6f209b4e3e6eade884eb37c5c761b42e83e3da74 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 75346 |      1 | 2013-11-01 19:16:34 | 6f209b4e3e6eade884eb37c5c761b42e83e3da74 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75411 |      1 | 2013-11-02 04:36:54 | d16d73a716ca0f3e6c16fe23ef748707495eb787 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 75411 |      1 | 2013-11-02 04:36:54 | d16d73a716ca0f3e6c16fe23ef748707495eb787 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 75411 |      1 | 2013-11-02 04:36:54 | d16d73a716ca0f3e6c16fe23ef748707495eb787 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75489 |      1 | 2013-11-02 19:51:45 | 32b011100f96d3462d98b365591bf2422f4d3ec3 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 75489 |      1 | 2013-11-02 19:51:45 | 32b011100f96d3462d98b365591bf2422f4d3ec3 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 75489 |      1 | 2013-11-02 19:51:45 | 32b011100f96d3462d98b365591bf2422f4d3ec3 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75497 |      1 | 2013-11-02 21:18:31 | 3939930a693ab7f244ed81d295898fad15f60700 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 75497 |      1 | 2013-11-02 21:18:31 | 3939930a693ab7f244ed81d295898fad15f60700 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 75497 |      1 | 2013-11-02 21:18:31 | 3939930a693ab7f244ed81d295898fad15f60700 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75660 |      1 | 2013-11-03 23:41:57 | e514a5122b2524453dff8d5617be4b8de65c544c | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 75660 |      1 | 2013-11-03 23:41:57 | e514a5122b2524453dff8d5617be4b8de65c544c | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 75660 |      1 | 2013-11-03 23:41:57 | e514a5122b2524453dff8d5617be4b8de65c544c | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75689 |      1 | 2013-11-04 04:04:59 | 02796a47a03fc36ce1dfa476a6145be47f283a18 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 75689 |      1 | 2013-11-04 04:04:59 | 02796a47a03fc36ce1dfa476a6145be47f283a18 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 75689 |      1 | 2013-11-04 04:04:59 | 02796a47a03fc36ce1dfa476a6145be47f283a18 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75704 |      1 | 2013-11-04 06:42:55 | f30943e20af19b5c7eba642febc8018c2a60a9fe | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 75704 |      1 | 2013-11-04 06:42:55 | f30943e20af19b5c7eba642febc8018c2a60a9fe | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 75704 |      1 | 2013-11-04 06:42:55 | f30943e20af19b5c7eba642febc8018c2a60a9fe | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 75758 |      1 | 2013-11-04 16:29:13 | 7dafb56700cb86bd4c20e397cd6e6d568229be2d | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 75758 |      1 | 2013-11-04 16:29:13 | 7dafb56700cb86bd4c20e397cd6e6d568229be2d | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 75758 |      1 | 2013-11-04 16:29:13 | 7dafb56700cb86bd4c20e397cd6e6d568229be2d | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 76035 |      1 | 2013-11-07 01:02:15 | 1bb18ff3037e5b73e7b504e14bfd396d42917c5b | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 76035 |      1 | 2013-11-07 01:02:15 | 1bb18ff3037e5b73e7b504e14bfd396d42917c5b | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 76035 |      1 | 2013-11-07 01:02:15 | 1bb18ff3037e5b73e7b504e14bfd396d42917c5b | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 76084 |      1 | 2013-11-07 13:35:59 | 6a5f5cbf6e3f59f7563b6f7d0f59a56a2fdbe8dc | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 76084 |      1 | 2013-11-07 13:35:59 | 6a5f5cbf6e3f59f7563b6f7d0f59a56a2fdbe8dc | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 76084 |      1 | 2013-11-07 13:35:59 | 6a5f5cbf6e3f59f7563b6f7d0f59a56a2fdbe8dc | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 76200 |      1 | 2013-11-08 13:43:54 | 2d3d255b2d3ae1456a377dbc03f695b7adf010e8 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH | y     |
| 76200 |      1 | 2013-11-08 13:43:54 | 2d3d255b2d3ae1456a377dbc03f695b7adf010e8 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 76200 |      1 | 2013-11-08 13:43:54 | 2d3d255b2d3ae1456a377dbc03f695b7adf010e8 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 76219 |      1 | 2013-11-08 16:54:15 | 11de6f161585c12148c1b2b4fc8ab830183edfe9 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 76219 |      1 | 2013-11-08 16:54:15 | 11de6f161585c12148c1b2b4fc8ab830183edfe9 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  | y     |
| 76219 |      1 | 2013-11-08 16:54:15 | 11de6f161585c12148c1b2b4fc8ab830183edfe9 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 76361 |      1 | 2013-11-09 18:53:59 | a476260a0fff7ae7502e858b30943d9067fb1214 | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 76361 |      1 | 2013-11-09 18:53:59 | a476260a0fff7ae7502e858b30943d9067fb1214 | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 76361 |      1 | 2013-11-09 18:53:59 | a476260a0fff7ae7502e858b30943d9067fb1214 | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
| 76463 |      1 | 2013-11-10 14:13:26 | 4f6f05293c61906b169ddfcd9a239cc9393b626e | xtensa | binutils-2.22   | BR2_PACKAGE_DROPWATCH |       |
| 76463 |      1 | 2013-11-10 14:13:26 | 4f6f05293c61906b169ddfcd9a239cc9393b626e | xtensa | binutils-2.22   | BR2_PACKAGE_OPROFILE  |       |
| 76463 |      1 | 2013-11-10 14:13:26 | 4f6f05293c61906b169ddfcd9a239cc9393b626e | xtensa | binutils-2.22   | BR2_PACKAGE_BINUTILS  | y     |
+-------+--------+---------------------+------------------------------------------+--------+-----------------+-----------------------+-------+

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
