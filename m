From: Andreas Ehmanns <universeii@gmx.de>
Date: Wed, 6 Jul 2016 18:53:59 +0200
Subject: [Buildroot] [PATCH 1/2] Package nfs-utils: Start/stop daemons
 consistently
In-Reply-To: <20160703185343.5a0f7911@free-electrons.com>
References: <1467564419-21313-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20160703185343.5a0f7911@free-electrons.com>
Message-ID: <577D37A7.8080105@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,
thanks for revising the patch series. As requested I will use the 
present instead of the past in the future :-)

Regards,
Andreas

Am 03.07.2016 um 18:53 schrieb Thomas Petazzoni:
> Hello,
>
> Title should be:
>
> 	package/nfs-utils: start/stop daemons consistently
>
> On Sun,  3 Jul 2016 18:46:58 +0200, Maxime Hadjinlian wrote:
>> From: universe II <universeii@gmx.de>
> Please fix this "From" to be consistent with the Signed-off-by. I
> forgot about it when applying the previous patches from Andreas.
>
>> Changed init script to start and stop all nfs daemons
> Please use the present "Change" and not the past "Changed". I don't
> understand why people use the past tense in commit logs.
>
>> in a consistent way. Using the same kill command,
>> start/stop the daemon, printout OK or FAIL and touch
>> or deleted necessary files.
>>
>> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
>> [Maxime:
>>     - Make it really consistent to stop the daemons as pointed out by Yann E. Morin
> Line too long, no? :)
>
>>     - Remove the -9]
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>   package/nfs-utils/S60nfs | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
>> index 7a49c79..2d4e082 100755
>> --- a/package/nfs-utils/S60nfs
>> +++ b/package/nfs-utils/S60nfs
>> @@ -45,22 +45,22 @@ start() {
>>   stop() {
>>   	# Stop daemons.
>>   	printf "Shutting down NFS mountd: "
>> -	killall -q rpc.mountd
>> +	killall -q rpc.mountd 2>/dev/null
>>   	[ $? = 0 ] && echo "OK" || echo "FAIL"
>>   
>>   	printf "Shutting down NFS daemon: "
>> -	kill -9 `pidof nfsd` 2>/dev/null
>> +	killall -q nfsd 2>/dev/null
>>   	[ $? = 0 ] && echo "OK" || echo "FAIL"
>>   
>>   	printf "Shutting down NFS services: "
>>   	/usr/sbin/exportfs -au
>> -	rm -f /var/lock/subsys/nfs
>> -	killall -q rpc.statd
>>   	[ $? = 0 ] && echo "OK" || echo "FAIL"
>>   
>>   	printf "Stopping NFS statd: "
>> -	killall -q rpc.statd
>> +	killall -q rpc.statd 2>/dev/null
>>   	[ $? = 0 ] && echo "OK" || echo "FAIL"
>> +	rm -f /var/lock/subsys/nfs
>> +	rm -f /var/run/rpc.statd.pid
>>   	rm -f /var/lock/subsys/nfslock
>>   }
>>   
>> @@ -81,7 +81,7 @@ case "$1" in
>>   	touch /var/lock/subsys/nfs
>>   	;;
>>     *)
>> -	echo "Usage: nfs {start|stop|reload}"
>> +	echo "Usage: $0 {start|stop|restart|reload}"
>>   	exit 1
>>   esac
>>   
> Thomas
