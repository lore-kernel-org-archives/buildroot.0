From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 8 Sep 2016 17:27:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/mysql: add MYSQL_SOCKET variable
In-Reply-To: <20160908144421.GA5740@free.fr>
References: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
 <20160908144421.GA5740@free.fr>
Message-ID: <1ac57a8d-e8b7-4a0a-8b6c-3951e584b54a@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2016 04:44 PM, Yann E. MORIN wrote:
> Floris, All,
>
> On 2016-09-08 16:33 +0200, Floris Bos spake thusly:
>> Add MYSQL_SOCKET variable with default socket location for other
>> packages to use.
>>
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>> ---
>>   package/mysql/mysql.mk | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
>> index 534bd97..a9e48ad 100644
>> --- a/package/mysql/mysql.mk
>> +++ b/package/mysql/mysql.mk
>> @@ -14,6 +14,9 @@ MYSQL_AUTORECONF = YES
>>   MYSQL_LICENSE = GPLv2
>>   MYSQL_LICENSE_FILES = README COPYING
>>   
>> +# Variable with default socket location for other buildroot packages to use
>> +MYSQL_SOCKET = /tmp/mysql.sock
> Should we also use that location in the sysv startup script and systemd
> unit?
>
> If that is the default of mysql, is there a way to force it during
> configure? I'm a bit uneasy to rely on magic values, in case a future
> version changes this default location...

Yes, could force it to use that value with a --with-unix-socket-path= 
configure option or in the server configuration file.


Do note that while /tmp is the upstream default for all MySQL versions, 
it is naturally not the safest location for multi-user systems.
If an unprivileged user gains access to the system sooner than MySQL is 
up & running, he could create his own /tmp/mysql.sock and intercept 
authentication details and queries of clients connecting.
So normal Linux distributions would override the default to a different 
location, e.g. under /var/run
Something we could also consider, if we want to set the socket path anyway.


OTOH do note that the MySQL branch we currently have has been EOL for 3 
years, and newer versions uses a totally different (cmake based) build 
system.
So personally I am not that keen to spend too much time patching up the 
current package either.
Might be better to create a brand new one for a later MySQL (or MariaDB) 
version, but that would take some time.


Yours sincerely,

Floris Bos
