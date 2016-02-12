From: Andreas Ehmanns <universeii@gmx.de>
Date: Fri, 12 Feb 2016 10:31:42 +0100
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of
 threads
In-Reply-To: <20160204205004.GB3468@free.fr>
References: <1450381505-3796-1-git-send-email-universeII@gmx.de>
 <20151217200424.GC3653@free.fr> <567317AE.5060006@gmx.de>
 <20151217202555.GE3653@free.fr> <56B30C5E.2020702@gmx.de>
 <20160204205004.GB3468@free.fr>
Message-ID: <56BDA67E.8060404@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
indeed a killall -9 worked. So I reworked the patch. According to 
Thomas' recommendation I added the OK/FAIL output as done in the dropbox 
init script.
Please have a look at the attached patch. If it's o.k., I'll resend it 
using git.

Regards,
Andreas

Am 04.02.2016 um 21:50 schrieb Yann E. MORIN:
> Andreas, All,
>
> On 2016-02-04 09:31 +0100, Andreas Ehmanns spake thusly:
>> Dear Yann,
>> please find below the rework of the nfsd init script.
>> The changes are very small. Please note that a change from
>>
>> kill -9 `pidof nfsd` 2>/dev/null
>>
>> to killall was not possible since killall did not kill the nfsd threads. It
>> simply did not work and I couldn't figure out the root cause.
> What about using something like;
>      rpc.nfsd 0
>      killall -9 nfsd
>
>  From 'man rpc.nfsd':
>      In particular rpc.nfsd 0 will stop all threads and thus close any
>      open connections.
>
> (maybe with a little sleep in-between the two calls to let things settle
> down?)
>
> Care to have a look, please?
>
>> Let me know what you think about. If it's o.k. for you, I re-send the patch
>> using git.
> Well, it's already a nice improvement. ;-)
>
> Please, consider the above suggestion. Adapt the script if required, and
> respin with git, please.
>
> Thanks! :-)
>
> Regards,
> Yann E. MORIN.
>
>>  From 13fa8728220cfe80b7ab3d48837183088f4094d5 Mon Sep 17 00:00:00 2001
>> From: Andreas Ehmanns <universeII@gmx.de>
>> Date: Thu, 4 Feb 2016 09:23:35 +0100
>> Subject: [PATCH 1/1] Reordered kill, echo and pid file remove
>>
>> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
>> ---
>>   package/nfs-utils/S60nfs | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
>> index 5639b8f..0bd5a44 100755
>> --- a/package/nfs-utils/S60nfs
>> +++ b/package/nfs-utils/S60nfs
>> @@ -38,8 +38,8 @@ start() {
>>   
>>   	printf "Starting NFS mountd: "
>>   	rpc.mountd
>> -	echo "done"
>>   	touch /var/lock/subsys/nfs
>> +	echo "done"
>>   }
>>   
>>   stop() {
>> @@ -54,14 +54,15 @@ stop() {
>>   
>>   	printf "Shutting down NFS services: "
>>   	/usr/sbin/exportfs -au
>> -	rm -f /var/lock/subsys/nfs
>>   	killall -q rpc.statd
>> +	rm -f /var/lock/subsys/nfs
>>   	echo "done"
>>   
>>   	printf "Stopping NFS statd: "
>>   	killall -q rpc.statd
>> -	echo "done"
>> +	rm -f /var/run/rpc.statd.pid
>>   	rm -f /var/lock/subsys/nfslock
>> +	echo "done"
>>   }
>>   
>>   # See how we were called.
>> -- 
>> 2.1.4
>>
>

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Remorked-nfsd-init-script-and-added-OK-FAIL-output.patch
Type: text/x-patch
Size: 1815 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160212/b7b7ddef/attachment.bin>
