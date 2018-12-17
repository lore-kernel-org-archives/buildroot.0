From: Chris Lesiak <chris.lesiak@licor.com>
Date: Mon, 17 Dec 2018 23:37:31 +0000
Subject: [Buildroot] [PATCH] package/openssh: Set /var/empty permissions
In-Reply-To: <5a82d54f-a308-bd2f-f3f9-49b583196333@mind.be>
References: <20181217222522.13499-1-chris.lesiak@licor.com>
 <5a82d54f-a308-bd2f-f3f9-49b583196333@mind.be>
Message-ID: <10b66c1b-f710-cee3-d646-973ab9ed4003@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/17/18 5:07 PM, Arnout Vandecappelle wrote:

>
> On 17/12/2018 23:25, Chris Lesiak wrote:
>> The openssh privilege separation feature, enabled by default,
>> requires that the path /var/empty exist and have certain permission.
>> See README.privsep included as part of the openssh distribution.
>   It's not clear to me from reading this file if /var/empty should actually be
> writable or not. If it does have to be writable, then this won't work in the
> readonly rootfs case.


It should not be writable, even by? sshd.? The name "empty" is a clue 
that it is and forever shall remain empty.


>
>   Also, README.privsep says that the sshd user should have /var/empty as its home
> directory, so perhaps we should set that as well?


I can certainly submit a new version that adds the following change:

 ?define OPENSSH_USERS
-?????? sshd -1 sshd -1 * - - - SSH drop priv user
+?????? sshd -1 sshd -1 * /var/empty /bin/false - SSH drop priv user
 ?endef


Is everyone happy with using /var/empty as the home directory? It isn't 
obvious that /var/empty should belong to sshd.? In fact it doesn't and 
could be shared with other services wanting to use if for the same 
purpose.? /var/empty is traditional, but can be changed using 
--with-privsep-path=xxx.? Using /var/run/sshd might be more "modern" but 
I don't know if any other distributions are using it.? Oddly, Fedora 
uses /var/empty/sshd -- /var/empty isn't empty at all.


Sincerely,

Chris


>
>   Regards,
>   Arnout
>
>> Use OPENSSH_PERMISSIONS to ensure this is done correctly.
>>
>> Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
>> ---
>>   package/openssh/openssh.mk | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
>> index 07f3e0d663..9175f9589d 100644
>> --- a/package/openssh/openssh.mk
>> +++ b/package/openssh/openssh.mk
>> @@ -22,6 +22,10 @@ define OPENSSH_USERS
>>   	sshd -1 sshd -1 * - - - SSH drop priv user
>>   endef
>>   
>> +define OPENSSH_PERMISSIONS
>> +	/var/empty d 755 root root - - - - -
>> +endef
>> +
>>   ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
>>   OPENSSH_CONF_OPTS += --without-pie
>>   endif
>>
-- 
Chris Lesiak
Principal Design Engineer, Software
LI-COR Biosciences
4647 Superior Street
Lincoln, NE 68504 USA
chris.lesiak at licor.com
