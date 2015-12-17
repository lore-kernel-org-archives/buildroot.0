From: Andreas Ehmanns <universeii@gmx.de>
Date: Thu, 17 Dec 2015 21:14:38 +0100
Subject: [Buildroot] [PATCH 1/1] Add config to nfsd to set number of
 threads
In-Reply-To: <20151217200424.GC3653@free.fr>
References: <1450381505-3796-1-git-send-email-universeII@gmx.de>
 <20151217200424.GC3653@free.fr>
Message-ID: <567317AE.5060006@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,
Am 17.12.2015 um 21:04 schrieb Yann E. MORIN:
> Andreas, All,
>
> On 2015-12-17 20:45 +0100, Andreas Ehmanns spake thusly:
>> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
> I forgot in my previous reply, but subject should have been:
>
>      package/nfsd: accept config to set number of threads
>
> This can be fixed by a maintainer when he applies, so no need to
> resubmit...
>
> Otherwise:
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Unrelated yto this change, I noticed that this script is completely
> consistent with how it stops services:
>    - sometimes, we killall, sometimes we kill-9
>    - the order in which we kill, echo and rm pid file is not consistent
>
> It would be nice if we stopped all the NFS services in a consistent way,
> like always use killall, then remove the pid file, and eventually echo
> the status. Would you like to send a follow-up patch that does that
> cleanup, please? ;-)
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   package/nfs-utils/S60nfs | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
>> index ec7c909..5639b8f 100755
>> --- a/package/nfs-utils/S60nfs
>> +++ b/package/nfs-utils/S60nfs
>> @@ -13,6 +13,14 @@ mkdir -p /run/nfs/sm
>>   mkdir -p /run/nfs/sm.bak
>>   touch /run/nfs/rmtab
>>   
>> +CFG_FILE=/etc/default/nfsd
>> +
>> +NR_THREADS=2
>> +if [ -f "${CFG_FILE}" ]; then
>> +    . "${CFG_FILE}"
>> +fi
>> +
>> +
>>   start() {
>>   	# Start daemons.
>>   	printf "Starting NFS statd: "
>> @@ -25,7 +33,7 @@ start() {
>>   	echo "done"
>>   
>>   	printf "Starting NFS daemon: "
>> -	rpc.nfsd 2
>> +	rpc.nfsd ${NR_THREADS}
>>   	echo "done"
>>   
>>   	printf "Starting NFS mountd: "
>> @@ -40,7 +48,7 @@ stop() {
>>   	killall -q rpc.mountd
>>   	echo "done"
>>   
>> -	echo "Shutting down NFS daemon: "
>> +	printf "Shutting down NFS daemon: "
>>   	kill -9 `pidof nfsd` 2>/dev/null
>>   	echo "done"
>>   
>> -- 
>> 2.1.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
I can prepare a patch for that but I have no possibility to test the 
changes since today was my last day in office for this year and I don't 
have a target system here at home.

What do you think?

Regards,
Andreas
