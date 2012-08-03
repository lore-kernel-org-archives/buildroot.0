From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Fri, 03 Aug 2012 14:11:17 +0200
Subject: [Buildroot] [PATCH] cachebench: new package
In-Reply-To: <501BA73C.6010303@free-electrons.com>
References: <1343979807-15024-1-git-send-email-gregory.clement@free-electrons.com>
 <501BA73C.6010303@free-electrons.com>
Message-ID: <501BBFE5.40807@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/03/2012 12:26 PM, Maxime Ripard wrote:
> Hi Gregory,
> 
> Le 03/08/2012 09:43, Gregory CLEMENT a ?crit :
>> This patch adds the cachebench package.
>>
>> Cachebench presents itself as a program to empirically determine some
>> parameters about an architectures memory subsystem. It can be used to
>> have an idea of the performance of the cache support. It has been
>> integrated into LLCbench (Low Level Characterization Benchmarks), but
>> currently only Cachebench is supported by Buildroot. The only
>> difference with mainline is a patch which add a script to be able to
>> generate data ready to bu used by gnuplot without having to use 'make'
> 
> Nitpick of the day: to *be* used.

I thought I was using a speller to avoid this kind of typo...

> 
>> which is usually not present on embedded target.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> ---
>>  package/Config.in                                  |    1 +
>>  package/cachebench/Config.in                       |   13 ++++
>>  ...ipt-rules-of-Makefile-to-run-it-on-target.patch |   65 ++++++++++++++++++++
>>  package/cachebench/cachebench.mk                   |   30 +++++++++
>>  4 files changed, 109 insertions(+)
>>  create mode 100644 package/cachebench/Config.in
>>  create mode 100644 package/cachebench/cachebench-0001-Convert-script-rules-of-Makefile-to-run-it-on-target.patch
>>  create mode 100644 package/cachebench/cachebench.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index f308de7..163f1a7 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -17,6 +17,7 @@ source "package/xz/Config.in"
>>  endmenu
>>  
>>  menu "Debugging, profiling and benchmark"
>> +source "package/cachebench/Config.in"
>>  source "package/bonnie/Config.in"
>>  source "package/dhrystone/Config.in"
>>  source "package/dstat/Config.in"
>> diff --git a/package/cachebench/Config.in b/package/cachebench/Config.in
>> new file mode 100644
>> index 0000000..b97c9ad
>> --- /dev/null
>> +++ b/package/cachebench/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_CACHEBENCH
>> +	bool "cachebench"
>> +	help
>> +
>> +	  Cachebench presents itself as a program to empirically determine
>> +	  some parameters about an architectures memory subsystem. It can
>> +	  be used to have an idea of the performance of the cache
>> +	  support. It has been integrated into LLCbench (Low Level
>> +	  Characterization Benchmarks), but currently only Cachebench is
>> +	  supported by Buildroot.
>> +
>> +	  http://icl.cs.utk.edu/projects/llcbench/cachebench.html
>> +
>> diff --git a/package/cachebench/cachebench-0001-Convert-script-rules-of-Makefile-to-run-it-on-target.patch b/package/cachebench/cachebench-0001-Convert-script-rules-of-Makefile-to-run-it-on-target.patch
>> new file mode 100644
>> index 0000000..505a4fe
>> --- /dev/null
>> +++ b/package/cachebench/cachebench-0001-Convert-script-rules-of-Makefile-to-run-it-on-target.patch
>> @@ -0,0 +1,65 @@
>> +From 6daded62de221ca0d97360523575b1c7230c8800 Mon Sep 17 00:00:00 2001
>> +From: Gregory CLEMENT <gregory.clement@free-electrons.com>
>> +Date: Thu, 2 Aug 2012 22:33:36 +0200
>> +Subject: [PATCH] Convert script rules of Makefile to run it on target
>> +
>> +The benchmark is supposed to be run using the Makefile to be able to
>> +get data ready to be used by gnuplot. On some target we don't have
>> +Makefile available, so this script exctracted from the Makefile can be
> 
> extracted

ok

> 
>> +used directly to run the benchmark, format data and make a tarball of
>> +the result.
> 
> Ok. Since this is not really a patch (you are adding a file that don't
> rely at all on existing source file from the project), why don't you
> just add this file to the package folder, and install it ?
> 
> But if you still want to use a patch, please use your Signed-off-by here.

Indeed using a file should be better.

> 
>> +---
>> + cachebench/do_bench.sh |   40 ++++++++++++++++++++++++++++++++++++++++
>> + 1 file changed, 40 insertions(+)
>> + create mode 100644 cachebench/do_bench.sh
>> +
>> +diff --git a/cachebench/do_bench.sh b/cachebench/do_bench.sh
>> +new file mode 100644
>> +index 0000000..a80dcde
>> +--- /dev/null
>> ++++ b/cachebench/do_bench.sh
>> +@@ -0,0 +1,40 @@
>> ++#!/bin/sh
>> ++# Prefix of the output files produced by each benchmark
>> ++
>> ++# if this fails, replace it with a regular name!
>> ++Result_Prefix=$(hostname)-$(uname -m)
>> ++# Datatype used for each memory reference. 
>> ++# Legal values are DOUBLE, CHAR, INT, FLOAT
>> ++CB_Datatype=DOUBLE
>> ++
>> ++# The number of seconds each test runs.
>> ++CB_SecondsPerIteration=5
>> ++
>> ++# The number of times each test is run.
>> ++CB_RepeatCount=1
>> ++
>> ++# Log base 2 of the maximum problem size tested in bytes
>> ++CB_Memsize=29
>> ++
>> ++# The number of test sizes measured between powers of two
>> ++CB_Resolution=2
>> ++
>> ++CBOPTS="-m $CB_Memsize -e $CB_RepeatCount -x $CB_Resolution -d $CB_SecondsPerIteration
>> ++DATA=$CB_Datatype"
>> ++mkdir -p results
>> ++
>> ++cachebench  $CBOPTS -r > results/${Result_Prefix}_cache_read.dat
>> ++cachebench  $CBOPTS -w > results/${Result_Prefix}_cache_write.dat
>> ++cachebench  $CBOPTS -b > results/${Result_Prefix}_cache_rmw.dat
>> ++cachebench  $CBOPTS -tr > results/${Result_Prefix}_cache_handread.dat
>> ++cachebench  $CBOPTS -tw > results/${Result_Prefix}_cache_handwrite.dat
>> ++cachebench  $CBOPTS -tb > results/${Result_Prefix}_cache_handrmw.dat
>> ++cachebench  $CBOPTS -s > results/${Result_Prefix}_cache_memset.dat
>> ++cachebench  $CBOPTS -p > results/${Result_Prefix}_cache_memcpy.dat
>> ++
>> ++sed -e "s|TITLE|Memory Hierarchy Performance of ${Result_Prefix}|g" < /usr/share/cachebench/cachegraph.gp > results/${Result_Prefix}_cache.gp; echo "plot \"${Result_Prefix}_cache_read\" title 'read' with linespoints \\" >> results/${Result_Prefix}_cache.gp; for i in write rmw handread handwrite handrmw memset memcpy; do echo ", \"${Result_Prefix}_cache_$i.dat\" title '$i' with linespoints \\" >> results/${Result_Prefix}_cache.gp; done;
>> ++
>> ++cd results; tar cf ${Result_Prefix}-cachebench-datafiles.tar ${Result_Prefix}_cache*.dat ${Result_Prefix}_cache.gp
>> ++echo ""
>> ++echo "Datafiles and GNUplot scripts are located in the results directory."
>> ++echo ""
>> +\ No newline at end of file
>> +-- 
>> +1.7.9.5
>> +
>> diff --git a/package/cachebench/cachebench.mk b/package/cachebench/cachebench.mk
>> new file mode 100644
>> index 0000000..efe95d9
>> --- /dev/null
>> +++ b/package/cachebench/cachebench.mk
>> @@ -0,0 +1,30 @@
>> +#############################################################
>> +#
>> +# cachebench
>> +#
>> +#############################################################
>> +CACHEBENCH_VERSION = 1.11
>> +CACHEBENCH_SOURCE = llcbench.tar.gz
>> +CACHEBENCH_SITE = http://icl.cs.utk.edu/projects/llcbench/
> 
> Hmmm, here I would call the package llcbench. But you were saying that
> you were building only the cachebench package, so I'm not quite sure
> about what to do, except build the whole tool set and not just
> cachebench (if it is possible?)

The 3 programs included in LLCBench share a kind of common configuration file, but
each one have to be compiled separately.
I think we could create a LLCBench and inside this menu select the benchmark we
want. Why not. But I won't be bale to tell it the binaries (other than cachebench)
built will run as expected


> 
> Maxime
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
