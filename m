From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 15 Dec 2019 13:39:59 -0800
Subject: [Buildroot] [PATCH 1/1] package/mariadb: bump version to 10.4.10
In-Reply-To: <20191215131347.5084106f@windsurf.home>
References: <20191202192214.2906-1-bluemrp9@gmail.com>
 <20191215131347.5084106f@windsurf.home>
Message-ID: <6f16f4a0-fcd4-6dd1-4a1e-8c99b3a769d9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 12/15/19 4:13 AM, Thomas Petazzoni wrote:
> Hello Ryan,
>
> Thanks a lot for the patch. However, I have a few comments/questions.
>
> On Mon,  2 Dec 2019 11:22:14 -0800
> Ryan Coe <bluemrp9@gmail.com> wrote:
>
>> Patch 0002-fix-build-error-with-newer-cmake.patch has been removed as it
>> has been applied upstream.
>>
>> Patch 0002-add-check-for-pam-tool-directory.patch has been added to avoid
>> an error occurring in the mysql_install_db script.
>>
>> The startup scripts have been changed to log to /var/log/mysql.
> This change to /var/log/mysql seems completely unrelated from the
> version bump, so it should be a separate patch.
>
>> diff --git a/package/mariadb/0002-add-check-for-pam-tool-directory.patch b/package/mariadb/0002-add-check-for-pam-tool-directory.patch
>> new file mode 100644
>> index 0000000000..d7636eda55
>> --- /dev/null
>> +++ b/package/mariadb/0002-add-check-for-pam-tool-directory.patch
>> @@ -0,0 +1,40 @@
>> +From 70276eca42890820e36c66876c4a7768c68a271f Mon Sep 17 00:00:00 2001
>> +From: Ryan Coe <bluemrp9@gmail.com>
>> +Date: Sat, 28 Sep 2019 11:07:56 -0700
>> +Subject: [PATCH] add check for pam tool directory in mysql_install_db
>> +
>> +Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
>> +---
>> + scripts/mysql_install_db.sh | 15 +++++++++------
>> + 1 file changed, 9 insertions(+), 6 deletions(-)
>> +
>> +diff --git a/scripts/mysql_install_db.sh b/scripts/mysql_install_db.sh
>> +index 253cad72e0bcb69dfddf60576fe8d96bf1ab8a92..08f11b707f73ea500aa65f24a11ccf53d18bb7a2 100644
>> +--- a/scripts/mysql_install_db.sh
>> ++++ b/scripts/mysql_install_db.sh
>> +@@ -480,13 +480,16 @@ done
>> +
>> + if test -n "$user"
> There is already a condition on "$user" being empty or not empty. Isn't
> there a way to have $user empty so that the below logic doesn't trigger?
>
>> diff --git a/package/mariadb/S97mysqld b/package/mariadb/S97mysqld
>> index 62357fa8c4..0cfde76bcd 100644
>> --- a/package/mariadb/S97mysqld
>> +++ b/package/mariadb/S97mysqld
>> @@ -5,7 +5,9 @@
>>   
>>   MYSQL_LIB="/var/lib/mysql"
>>   MYSQL_RUN="/run/mysql"
>> -MYSQL_PID="$MYSQL_RUN/mysqld.pid"
>> +MYSQL_PIDFILE="$MYSQL_RUN/mysqld.pid"
> Renaming MYSQL_PID to MYSQL_PIDFILE is unrelated to the version bump,
> it should be a separate patch.
>
>> +MYSQL_LOG="/var/log/mysql"
>> +MYSQL_LOGFILE="$MYSQL_LOG/mysqld.log"
> As mentioned above, changing to /var/log/mysql seems unrelated to the
> version bump, it should be a separate patch.
>
>>   MYSQL_BIN="/usr/bin"
>>   
>>   wait_for_ready() {
>> @@ -21,7 +23,7 @@ wait_for_ready() {
>>   }
>>   
>>   start() {
>> -	if [ `ls -1 $MYSQL_LIB | wc -l` = 0 ] ; then
>> +	if [ "`ls -1 $MYSQL_LIB 2> /dev/null | wc -l`" = "0" ] ; then
> Why is this change needed? Is it related to the version bump ?
This is to prevent an error message from being shown if the directory 
does not exist.
>
>>   		printf "Creating mysql system tables ... "
>>   		$MYSQL_BIN/mysql_install_db --basedir=/usr --user=mysql \
>>   			--datadir=$MYSQL_LIB > /dev/null 2>&1
>> @@ -36,19 +38,22 @@ start() {
>>   	# so create a subdirectory for mysql.
>>   	install -d -o mysql -g root -m 0755 $MYSQL_RUN
>>   
>> +	# Also create logging directory as user mysql.
>> +	install -d -o mysql -g root -m 0755 $MYSQL_LOG
> This should go with the move to the logs in /var/log/syslog, in a
> separate patch.
>
>> +
>>   	# We don't use start-stop-daemon because mysqld has its own
>>   	# wrapper script.
>>   	printf "Starting mysql ... "
>> -	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PID --user=mysql \
>> -		> /dev/null 2>&1 &
>> +	$MYSQL_BIN/mysqld_safe --pid-file=$MYSQL_PIDFILE --user=mysql \
>> +		--log-error=$MYSQL_LOGFILE > /dev/null 2>&1 &
> Ditto.
>
>>   	wait_for_ready
>>   	[ $? = 0 ] && echo "OK" || echo "FAIL"
>>   }
>>   
>>   stop() {
>>   	printf "Stopping mysql ... "
>> -	if [ -f $MYSQL_PID ]; then
>> -		kill `cat $MYSQL_PID` > /dev/null 2>&1
>> +	if [ -f "$MYSQL_PIDFILE" ]; then
>> +		kill `cat $MYSQL_PIDFILE` > /dev/null 2>&1
> This should go in the patch renaming the PID file, separately from the
> version bump.
>
>>   [Service]
>>   ExecStartPre=/bin/sh -c 'test "`ls -1 /var/lib/mysql | wc -l`" != "0" || mysql_install_db --basedir=/usr --datadir=/var/lib/mysql'
>> -ExecStart=/usr/bin/mysqld_safe
>> +ExecStartPre=install -d -o mysql -g root -m 0755 /var/log/mysql
>> +ExecStart=/usr/bin/mysqld_safe --pid-file=/var/run/mysql/mysqld.pid --log-error=/var/log/mysql/mysqld.log
> This should go in the patch moving the logs to /var/log/mysql.
>
> Could you rework your patch by splitting it up? And also investigate if
> the $user variable can be made empty so that patch
> 0002-add-check-for-pam-tool-directory.patch would not be needed?
>
> Thanks!
>
> Thomas

Sent a v2 for the series.? Thanks.
